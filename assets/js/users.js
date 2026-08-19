/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Users View Controller: Staff Account Creation & Role Permissions (Founder Only)
   ========================================================================== */

const Users = {
  usersList: [],

  async render(container) {
    if (App.currentUser.role !== 'founder') {
      container.innerHTML = `<div class="card" style="color:var(--danger);">Forbidden. Access restricted to Founder (Super Admin).</div>`;
      return;
    }

    container.innerHTML = `
      <div class="fade-in">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px;">
          <h3>Staff Accounts & Role Permissions</h3>
          <button class="btn btn-primary" id="add-user-btn"><i data-lucide="user-plus"></i> Create User Account</button>
        </div>

        <div class="card">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Full Name</th>
                  <th>Username</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Role</th>
                  <th>Status</th>
                  <th>Last Login</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody id="users-table-body">
                <tr><td colspan="8" style="text-align:center; color:var(--text-muted);"><i data-lucide="loader" class="spin"></i> Loading users...</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Add/Edit User Modal -->
      <div class="modal-backdrop" id="user-modal">
        <div class="modal" style="max-width:500px;">
          <div class="modal-header">
            <h3 id="user-modal-title">Create User Account</h3>
            <button class="action-icon-btn" onclick="document.getElementById('user-modal').classList.remove('active')"><i data-lucide="x"></i></button>
          </div>
          <form id="user-form">
            <div class="modal-body">
              <input type="hidden" id="user-id" value="">
              
              <div class="form-group">
                <label class="form-label">Full Name *</label>
                <input type="text" id="user-fullname" class="form-control" placeholder="e.g. Sarah Jenkins" required>
              </div>

              <div class="form-group">
                <label class="form-label">Username *</label>
                <input type="text" id="user-username" class="form-control" placeholder="e.g. sarah" required>
              </div>

              <div class="form-group">
                <label class="form-label">Password <small id="pwd-help" style="color:var(--text-muted);">(Leave blank to keep existing)</small></label>
                <input type="password" id="user-password" class="form-control" placeholder="Enter secure password">
              </div>

              <div style="display:grid; grid-template-columns:1fr 1fr; gap:12px;">
                <div class="form-group">
                  <label class="form-label">Email Address</label>
                  <input type="email" id="user-email" class="form-control" placeholder="sarah@mcare.com">
                </div>

                <div class="form-group">
                  <label class="form-label">Phone Number</label>
                  <input type="text" id="user-phone" class="form-control" placeholder="+1 555-0199">
                </div>
              </div>

              <div style="display:grid; grid-template-columns:1fr 1fr; gap:12px;">
                <div class="form-group">
                  <label class="form-label">System Role *</label>
                  <select id="user-role" class="form-control" required>
                    <option value="staff">Staff User (Pharmacist)</option>
                    <option value="founder">Founder (Super Admin)</option>
                  </select>
                </div>

                <div class="form-group">
                  <label class="form-label">Account Status</label>
                  <select id="user-status" class="form-control" required>
                    <option value="active">Active</option>
                    <option value="inactive">Inactive / Deactivated</option>
                  </select>
                </div>
              </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-outline" onclick="document.getElementById('user-modal').classList.remove('active')">Cancel</button>
              <button type="submit" class="btn btn-primary"><i data-lucide="check"></i> Save User Account</button>
            </div>
          </form>
        </div>
      </div>
    `;

    if (window.lucide) lucide.createIcons();

    await this.loadUsers();

    document.getElementById('add-user-btn').addEventListener('click', () => this.openAddModal());
    document.getElementById('user-form').addEventListener('submit', (e) => this.handleSave(e));
  },

  async loadUsers() {
    try {
      const res = await fetch('api/users.php');
      const data = await res.json();
      if (data.status === 'success') {
        this.usersList = data.data;
        this.renderTable(this.usersList);
      }
    } catch (e) {}
  },

  renderTable(items) {
    const tbody = document.getElementById('users-table-body');
    tbody.innerHTML = items.map(u => `
      <tr>
        <td><strong>${u.full_name}</strong></td>
        <td><code>${u.username}</code></td>
        <td>${u.email || 'N/A'}</td>
        <td>${u.phone || 'N/A'}</td>
        <td><span class="badge ${u.role === 'founder' ? 'badge-danger' : 'badge-info'}">${u.role.toUpperCase()}</span></td>
        <td><span class="badge ${u.status === 'active' ? 'badge-success' : 'badge-warning'}">${u.status.toUpperCase()}</span></td>
        <td>${Utils.formatDateTime(u.last_login)}</td>
        <td>
          <div style="display:flex; gap:6px;">
            <button class="action-icon-btn" onclick="Users.openEditModal(${u.id})" title="Edit Account"><i data-lucide="edit-3"></i></button>
            <button class="action-icon-btn" style="color:var(--danger);" onclick="Users.deleteUser(${u.id}, '${u.full_name.replace(/'/g, "\\'")}')" title="Delete Account"><i data-lucide="trash-2"></i></button>
          </div>
        </td>
      </tr>
    `).join('');

    if (window.lucide) lucide.createIcons();
  },

  openAddModal() {
    document.getElementById('user-modal-title').innerText = 'Create Staff Account';
    document.getElementById('user-id').value = '';
    document.getElementById('user-form').reset();
    document.getElementById('user-username').disabled = false;
    document.getElementById('user-password').required = true;
    document.getElementById('user-modal').classList.add('active');
  },

  openEditModal(id) {
    const u = this.usersList.find(item => parseInt(item.id) === id);
    if (!u) return;

    document.getElementById('user-modal-title').innerText = 'Edit User Account';
    document.getElementById('user-id').value = u.id;
    document.getElementById('user-fullname').value = u.full_name;
    document.getElementById('user-username').value = u.username;
    document.getElementById('user-username').disabled = true;
    document.getElementById('user-email').value = u.email || '';
    document.getElementById('user-phone').value = u.phone || '';
    document.getElementById('user-role').value = u.role;
    document.getElementById('user-status').value = u.status;
    document.getElementById('user-password').required = false;

    document.getElementById('user-modal').classList.add('active');
  },

  async handleSave(e) {
    e.preventDefault();
    const id = document.getElementById('user-id').value;
    const action = id ? 'edit' : 'add';

    const payload = {
      id: id ? parseInt(id) : undefined,
      username: document.getElementById('user-username').value,
      password: document.getElementById('user-password').value,
      full_name: document.getElementById('user-fullname').value,
      email: document.getElementById('user-email').value,
      phone: document.getElementById('user-phone').value,
      role: document.getElementById('user-role').value,
      status: document.getElementById('user-status').value
    };

    try {
      const res = await fetch(`api/users.php?action=${action}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();

      if (data.status === 'success') {
        Utils.showToast(data.message, 'success');
        document.getElementById('user-modal').classList.remove('active');
        await this.loadUsers();
      } else {
        Utils.showToast(data.message, 'error');
      }
    } catch (err) {
      Utils.showToast('Error saving user account.', 'error');
    }
  },

  async deleteUser(id, name) {
    if (!confirm(`Are you sure you want to delete user account '${name}'?`)) return;

    try {
      const res = await fetch(`api/users.php?id=${id}`, { method: 'DELETE' });
      const data = await res.json();

      if (data.status === 'success') {
        Utils.showToast(data.message, 'success');
        await this.loadUsers();
      } else {
        Utils.showToast(data.message, 'error');
      }
    } catch (err) {
      Utils.showToast('Error deleting user account.', 'error');
    }
  }
};
