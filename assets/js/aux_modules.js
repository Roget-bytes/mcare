/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Auxiliary Controllers: Categories, Suppliers, Stock Purchases, Customers, Logs
   ========================================================================== */

// 1. Categories Controller
const Categories = {
  allData: [],

  async render(container) {
    container.innerHTML = `
      <div class="fade-in">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; flex-wrap:wrap; gap:12px;">
          <input type="text" id="cat-search-input" class="form-control" style="max-width:360px;" placeholder="Search category name or description...">
          ${App.currentUser.role === 'founder' ? `<button class="btn btn-primary" onclick="Categories.openModal()"><i data-lucide="plus-circle"></i> Add Category</button>` : ''}
        </div>
        <div class="card">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Category Name</th>
                  <th>Description</th>
                  <th>Total Medicines</th>
                  <th>Created Date</th>
                  ${App.currentUser.role === 'founder' ? '<th>Actions</th>' : ''}
                </tr>
              </thead>
              <tbody id="cat-table-body">
                <tr><td colspan="${App.currentUser.role === 'founder' ? 5 : 4}" style="text-align:center; color:var(--text-muted);"><i data-lucide="loader" class="spin"></i> Loading...</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="modal-backdrop" id="cat-modal">
        <div class="modal" style="max-width:440px;">
          <div class="modal-header">
            <h3 id="cat-modal-title">Add Category</h3>
            <button class="action-icon-btn" onclick="document.getElementById('cat-modal').classList.remove('active')"><i data-lucide="x"></i></button>
          </div>
          <form id="cat-form">
            <div class="modal-body">
              <input type="hidden" id="cat-id" value="">
              <div class="form-group">
                <label class="form-label">Category Name *</label>
                <input type="text" id="cat-name" class="form-control" required placeholder="e.g. Antibiotics">
              </div>
              <div class="form-group">
                <label class="form-label">Description</label>
                <textarea id="cat-desc" class="form-control" rows="2" placeholder="Brief description..."></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Save Category</button>
            </div>
          </form>
        </div>
      </div>
    `;
    if (window.lucide) lucide.createIcons();
    await this.loadData();
    document.getElementById('cat-form').addEventListener('submit', (e) => this.handleSave(e));
    document.getElementById('cat-search-input').addEventListener('input', (e) => this.filterData(e.target.value.trim()));
  },

  async loadData() {
    try {
      const res = await fetch('api/categories.php');
      const data = await res.json();
      if (data.status === 'success') {
        this.allData = data.data;
        this.renderRows(this.allData);
      }
    } catch (e) { }
  },

  renderRows(items) {
    const isFounder = App.currentUser.role === 'founder';
    const tbody = document.getElementById('cat-table-body');
    if (!tbody) return;
    if (!items || items.length === 0) {
      tbody.innerHTML = `<tr><td colspan="${isFounder ? 5 : 4}" style="text-align:center; color:var(--text-muted); padding:24px;">No categories match your search.</td></tr>`;
      return;
    }
    tbody.innerHTML = items.map(c => `
      <tr>
        <td><strong>${c.name}</strong></td>
        <td>${c.description || '<span style="color:var(--text-muted);">—</span>'}</td>
        <td><span class="badge badge-info">${c.item_count} items</span></td>
        <td>${Utils.formatDate(c.created_at)}</td>
        ${isFounder ? `
        <td>
          <div style="display:flex; gap:6px;">
            <button class="action-icon-btn" onclick="Categories.openModal(${c.id}, '${c.name.replace(/'/g, "\\'")}',' ${(c.description || '').replace(/'/g, "\\'")}')"><i data-lucide="edit-3"></i></button>
            <button class="action-icon-btn" style="color:var(--danger);" onclick="Categories.delete(${c.id})"><i data-lucide="trash-2"></i></button>
          </div>
        </td>
        ` : ''}
      </tr>
    `).join('');
    if (window.lucide) lucide.createIcons();
  },

  filterData(query) {
    if (!query) {
      this.renderRows(this.allData);
      return;
    }
    const q = query.toLowerCase();
    const filtered = this.allData.filter(c =>
      c.name.toLowerCase().includes(q) ||
      (c.description && c.description.toLowerCase().includes(q))
    );
    this.renderRows(filtered);
  },

  openModal(id = null, name = '', desc = '') {
    document.getElementById('cat-modal-title').innerText = id ? 'Edit Category' : 'Add Category';
    document.getElementById('cat-id').value = id || '';
    document.getElementById('cat-name').value = name;
    document.getElementById('cat-desc').value = desc;
    document.getElementById('cat-modal').classList.add('active');
  },

  async handleSave(e) {
    e.preventDefault();
    const id = document.getElementById('cat-id').value;
    const action = id ? 'edit' : 'add';
    const name = document.getElementById('cat-name').value;
    const description = document.getElementById('cat-desc').value;

    try {
      const res = await fetch(`api/categories.php?action=${action}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: id ? parseInt(id) : undefined, name, description })
      });
      const data = await res.json();
      if (data.status === 'success') {
        Utils.showToast(data.message, 'success');
        document.getElementById('cat-modal').classList.remove('active');
        await this.loadData();
      } else Utils.showToast(data.message, 'error');
    } catch (err) { }
  },

  async delete(id) {
    if (!confirm('Delete category?')) return;
    try {
      const res = await fetch(`api/categories.php?id=${id}`, { method: 'DELETE' });
      const data = await res.json();
      if (data.status === 'success') { Utils.showToast(data.message, 'success'); await this.loadData(); }
    } catch (e) { }
  }
};


// 2. Suppliers Controller
const Suppliers = {
  async render(container) {
    container.innerHTML = `
      <div class="fade-in">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px;">
          <h3>Pharmaceutical Suppliers</h3>
          <button class="btn btn-primary" onclick="Suppliers.openModal()"><i data-lucide="plus-circle"></i> Add Supplier</button>
        </div>
        <div class="card">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Contact Person</th>
                  <th>Company / Brand</th>
                  <th>Phone Number</th>
                  <th>Email</th>
                  <th>Address</th>
                  <th>Total Purchases</th>
                  ${App.currentUser.role === 'founder' ? '<th>Actions</th>' : ''}
                </tr>
              </thead>
              <tbody id="sup-table-body">
                <tr><td colspan="${App.currentUser.role === 'founder' ? 7 : 6}" style="text-align:center; color:var(--text-muted);"><i data-lucide="loader" class="spin"></i> Loading suppliers...</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="modal-backdrop" id="sup-modal">
        <div class="modal" style="max-width:500px;">
          <div class="modal-header">
            <h3 id="sup-modal-title">Add Supplier</h3>
            <button class="action-icon-btn" onclick="document.getElementById('sup-modal').classList.remove('active')"><i data-lucide="x"></i></button>
          </div>
          <form id="sup-form">
            <div class="modal-body">
              <input type="hidden" id="sup-id" value="">
              <div class="form-group">
                <label class="form-label">Contact Person Name *</label>
                <input type="text" id="sup-name" class="form-control" required placeholder="e.g. Alex Rivera">
              </div>
              <div class="form-group">
                <label class="form-label">Company Name *</label>
                <input type="text" id="sup-company" class="form-control" required placeholder="e.g. Novartis Pharma">
              </div>
              <div style="display:grid; grid-template-columns:1fr 1fr; gap:12px;">
                <div class="form-group">
                  <label class="form-label">Phone *</label>
                  <input type="text" id="sup-phone" class="form-control" required placeholder="+1 800-555-0144">
                </div>
                <div class="form-group">
                  <label class="form-label">Email</label>
                  <input type="email" id="sup-email" class="form-control" placeholder="orders@company.com">
                </div>
              </div>
              <div class="form-group">
                <label class="form-label">Address</label>
                <input type="text" id="sup-address" class="form-control" placeholder="Office location...">
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Save Supplier</button>
            </div>
          </form>
        </div>
      </div>
    `;
    if (window.lucide) lucide.createIcons();
    await this.loadData();
    document.getElementById('sup-form').addEventListener('submit', (e) => this.handleSave(e));
  },

  async loadData() {
    try {
      const res = await fetch('api/suppliers.php');
      const data = await res.json();
      if (data.status === 'success') {
        const isFounder = App.currentUser.role === 'founder';
        const tbody = document.getElementById('sup-table-body');
        tbody.innerHTML = data.data.map(s => `
          <tr>
            <td><strong>${s.name}</strong></td>
            <td>${s.company_name}</td>
            <td>${s.phone}</td>
            <td>${s.email || 'N/A'}</td>
            <td>${s.address || 'N/A'}</td>
            <td><span class="badge badge-info">${s.total_purchases} orders</span></td>
            ${isFounder ? `
            <td>
              <div style="display:flex; gap:6px;">
                <button class="action-icon-btn" onclick="Suppliers.openModal(${s.id}, '${s.name.replace(/'/g, "\\'")}', '${s.company_name.replace(/'/g, "\\'")}', '${s.phone}', '${s.email || ''}', '${(s.address || '').replace(/'/g, "\\'")}')"><i data-lucide="edit-3"></i></button>
                <button class="action-icon-btn" style="color:var(--danger);" onclick="Suppliers.delete(${s.id})"><i data-lucide="trash-2"></i></button>
              </div>
            </td>
            ` : ''}
          </tr>
        `).join('');
        if (window.lucide) lucide.createIcons();
      }
    } catch (e) { }
  },

  openModal(id = null, name = '', company = '', phone = '', email = '', address = '') {
    document.getElementById('sup-modal-title').innerText = id ? 'Edit Supplier' : 'Add Supplier';
    document.getElementById('sup-id').value = id || '';
    document.getElementById('sup-name').value = name;
    document.getElementById('sup-company').value = company;
    document.getElementById('sup-phone').value = phone;
    document.getElementById('sup-email').value = email;
    document.getElementById('sup-address').value = address;
    document.getElementById('sup-modal').classList.add('active');
  },

  async handleSave(e) {
    e.preventDefault();
    const id = document.getElementById('sup-id').value;
    const action = id ? 'edit' : 'add';

    const payload = {
      id: id ? parseInt(id) : undefined,
      name: document.getElementById('sup-name').value,
      company_name: document.getElementById('sup-company').value,
      phone: document.getElementById('sup-phone').value,
      email: document.getElementById('sup-email').value,
      address: document.getElementById('sup-address').value
    };

    try {
      const res = await fetch(`api/suppliers.php?action=${action}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();
      if (data.status === 'success') {
        Utils.showToast(data.message, 'success');
        document.getElementById('sup-modal').classList.remove('active');
        await this.loadData();
      } else Utils.showToast(data.message, 'error');
    } catch (err) { }
  },

  async delete(id) {
    if (!confirm('Delete supplier?')) return;
    try {
      const res = await fetch(`api/suppliers.php?id=${id}`, { method: 'DELETE' });
      const data = await res.json();
      if (data.status === 'success') { Utils.showToast(data.message, 'success'); await this.loadData(); }
    } catch (e) { }
  }
};

// 3. Purchases & Stock Adjustment Controller
const Purchases = {
  suppliers: [],
  medicines: [],

  async render(container) {
    container.innerHTML = `
      <div class="fade-in">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px;">
          <h3>Stock Purchase History & Supplier Inflow</h3>
          <button class="btn btn-primary" onclick="Purchases.openModal()"><i data-lucide="package-plus"></i> Record New Stock Purchase</button>
        </div>
        <div class="card">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>PO #</th>
                  <th>Supplier</th>
                  <th>Purchase Date</th>
                  <th>Total Cost</th>
                  <th>Paid Amount</th>
                  <th>Status</th>
                  <th>Recorded By</th>
                </tr>
              </thead>
              <tbody id="po-table-body">
                <tr><td colspan="7" style="text-align:center; color:var(--text-muted);"><i data-lucide="loader" class="spin"></i> Loading purchase history...</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="modal-backdrop" id="po-modal">
        <div class="modal" style="max-width:650px;">
          <div class="modal-header">
            <h3>Record New Stock Purchase</h3>
            <button class="action-icon-btn" onclick="document.getElementById('po-modal').classList.remove('active')"><i data-lucide="x"></i></button>
          </div>
          <form id="po-form">
            <div class="modal-body">
              <div style="display:grid; grid-template-columns:1fr 1fr; gap:16px;">
                <div class="form-group">
                  <label class="form-label">Supplier *</label>
                  <select id="po-supplier" class="form-control" required></select>
                </div>
                <div class="form-group">
                  <label class="form-label">Purchase Date *</label>
                  <input type="date" id="po-date" class="form-control" required value="${new Date().toISOString().split('T')[0]}">
                </div>
              </div>

              <div style="margin:20px 0; border-top:1px solid var(--border-color); padding-top:16px;">
                <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:12px;">
                  <h4 style="font-size:14px;">Stock Purchased Items</h4>
                  <button type="button" class="btn btn-sm btn-outline" onclick="Purchases.addItemRow()"><i data-lucide="plus"></i> Add Item</button>
                </div>
                <div id="po-items-container" style="display:flex; flex-direction:column; gap:10px;"></div>
              </div>

              <div style="display:grid; grid-template-columns:1fr 1fr; gap:16px;">
                <div class="form-group">
                  <label class="form-label">Amount Paid (₦) *</label>
                  <input type="number" step="0.01" id="po-paid" class="form-control" required value="0.00">
                </div>
                <div class="form-group">
                  <label class="form-label">Notes</label>
                  <input type="text" id="po-notes" class="form-control" placeholder="Invoice reference #...">
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary"><i data-lucide="check"></i> Record & Increase Stock Inventory</button>
            </div>
          </form>
        </div>
      </div>
    `;
    if (window.lucide) lucide.createIcons();
    await this.loadDependencies();
    await this.loadData();
    document.getElementById('po-form').addEventListener('submit', (e) => this.handleSave(e));
  },

  async loadDependencies() {
    try {
      const sRes = await fetch('api/suppliers.php');
      const sData = await sRes.json();
      this.suppliers = sData.data;

      const mRes = await fetch('api/medicines.php');
      const mData = await mRes.json();
      this.medicines = mData.data;
    } catch (e) { }
  },

  async loadData() {
    try {
      const res = await fetch('api/purchases.php');
      const data = await res.json();
      if (data.status === 'success') {
        const tbody = document.getElementById('po-table-body');
        tbody.innerHTML = data.data.map(p => `
          <tr>
            <td><code>${p.purchase_no}</code></td>
            <td><strong>${p.supplier_name}</strong> (${p.company_name})</td>
            <td>${Utils.formatDate(p.purchase_date)}</td>
            <td><strong>${Utils.formatCurrency(p.total_amount)}</strong></td>
            <td>${Utils.formatCurrency(p.paid_amount)}</td>
            <td><span class="badge ${p.payment_status === 'paid' ? 'badge-success' : 'badge-warning'}">${p.payment_status.toUpperCase()}</span></td>
            <td>${p.created_by_name}</td>
          </tr>
        `).join('');
      }
    } catch (e) { }
  },

  openModal() {
    const sel = document.getElementById('po-supplier');
    sel.innerHTML = this.suppliers.map(s => `<option value="${s.id}">${s.name} (${s.company_name})</option>`).join('');
    document.getElementById('po-items-container').innerHTML = '';
    this.addItemRow();
    document.getElementById('po-modal').classList.add('active');
  },

  addItemRow() {
    const container = document.getElementById('po-items-container');
    const rowId = Date.now();
    const row = document.createElement('div');
    row.id = `po-row-${rowId}`;
    row.style.cssText = 'display:grid; grid-template-columns:3fr 1fr 1fr 40px; gap:8px; align-items:center;';

    const medOptions = this.medicines.map(m => `<option value="${m.id}">${m.name} (${m.packs_cards || 'Units'}, Cost: ${Utils.formatCurrency(m.purchase_price)})</option>`).join('');

    row.innerHTML = `
      <select class="form-control po-med-id" style="font-size:12px;" required>${medOptions}</select>
      <input type="number" class="form-control po-med-qty" style="font-size:12px;" placeholder="Qty" required value="50">
      <input type="number" step="0.01" class="form-control po-med-cost" style="font-size:12px;" placeholder="Unit Cost" required value="5.00">
      <button type="button" class="action-icon-btn" style="color:var(--danger);" onclick="document.getElementById('po-row-${rowId}').remove()"><i data-lucide="trash"></i></button>
    `;

    container.appendChild(row);
    if (window.lucide) lucide.createIcons();
  },

  async handleSave(e) {
    e.preventDefault();
    const supplier_id = document.getElementById('po-supplier').value;
    const purchase_date = document.getElementById('po-date').value;
    const paid_amount = document.getElementById('po-paid').value;
    const notes = document.getElementById('po-notes').value;

    const rows = document.querySelectorAll('#po-items-container > div');
    const items = [];
    rows.forEach(r => {
      items.push({
        medicine_id: r.querySelector('.po-med-id').value,
        quantity: r.querySelector('.po-med-qty').value,
        unit_cost: r.querySelector('.po-med-cost').value
      });
    });

    try {
      const res = await fetch('api/purchases.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ supplier_id, purchase_date, paid_amount, notes, items })
      });
      const data = await res.json();
      if (data.status === 'success') {
        Utils.showToast(data.message, 'success');
        document.getElementById('po-modal').classList.remove('active');
        await this.loadData();
      } else Utils.showToast(data.message, 'error');
    } catch (err) { }
  }
};

// 4. Customers Controller
const Customers = {
  async render(container) {
    container.innerHTML = `
      <div class="fade-in">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px;">
          <h3>Customer Directory & Purchase History</h3>
          <button class="btn btn-primary" onclick="Customers.openModal()"><i data-lucide="user-plus"></i> Register Customer</button>
        </div>
        <div class="card">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Customer Name</th>
                  <th>Phone Number</th>
                  <th>Email Address</th>
                  <th>Physical Address</th>
                  <th>Total Orders</th>
                  <th>Total Spent</th>
                  ${App.currentUser.role === 'founder' ? '<th>Actions</th>' : ''}
                </tr>
              </thead>
              <tbody id="cust-table-body">
                <tr><td colspan="${App.currentUser.role === 'founder' ? 7 : 6}" style="text-align:center; color:var(--text-muted);"><i data-lucide="loader" class="spin"></i> Loading...</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="modal-backdrop" id="cust-modal">
        <div class="modal" style="max-width:440px;">
          <div class="modal-header">
            <h3 id="cust-modal-title">Register Customer</h3>
            <button class="action-icon-btn" onclick="document.getElementById('cust-modal').classList.remove('active')"><i data-lucide="x"></i></button>
          </div>
          <form id="cust-form">
            <div class="modal-body">
              <input type="hidden" id="cust-id" value="">
              <div class="form-group">
                <label class="form-label">Full Name *</label>
                <input type="text" id="cust-name" class="form-control" required placeholder="e.g. Johnathan Doe">
              </div>
              <div class="form-group">
                <label class="form-label">Phone Number *</label>
                <input type="text" id="cust-phone" class="form-control" required placeholder="e.g. +1 555-234-5678">
              </div>
              <div class="form-group">
                <label class="form-label">Email Address</label>
                <input type="email" id="cust-email" class="form-control" placeholder="jdoe@gmail.com">
              </div>
              <div class="form-group">
                <label class="form-label">Address</label>
                <input type="text" id="cust-address" class="form-control" placeholder="Street address...">
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Save Customer</button>
            </div>
          </form>
        </div>
      </div>
    `;
    if (window.lucide) lucide.createIcons();
    await this.loadData();
    document.getElementById('cust-form').addEventListener('submit', (e) => this.handleSave(e));
  },

  async loadData() {
    try {
      const res = await fetch('api/customers.php');
      const data = await res.json();
      if (data.status === 'success') {
        const isFounder = App.currentUser.role === 'founder';
        const tbody = document.getElementById('cust-table-body');
        tbody.innerHTML = data.data.map(c => `
          <tr>
            <td><strong>${c.name}</strong></td>
            <td>${c.phone}</td>
            <td>${c.email || 'N/A'}</td>
            <td>${c.address || 'N/A'}</td>
            <td><span class="badge badge-info">${c.total_orders} orders</span></td>
            <td><strong>${Utils.formatCurrency(c.total_spent)}</strong></td>
            ${isFounder ? `
            <td>
              <div style="display:flex; gap:6px;">
                <button class="action-icon-btn" onclick="Customers.openModal(${c.id}, '${c.name.replace(/'/g, "\\'")}', '${c.phone}', '${c.email || ''}', '${(c.address || '').replace(/'/g, "\\'")}')"><i data-lucide="edit-3"></i></button>
                ${c.id !== 1 ? `<button class="action-icon-btn" style="color:var(--danger);" onclick="Customers.delete(${c.id})"><i data-lucide="trash-2"></i></button>` : ''}
              </div>
            </td>
            ` : ''}
          </tr>
        `).join('');
        if (window.lucide) lucide.createIcons();
      }
    } catch (e) { }
  },

  openModal(id = null, name = '', phone = '', email = '', address = '') {
    document.getElementById('cust-modal-title').innerText = id ? 'Edit Customer' : 'Register Customer';
    document.getElementById('cust-id').value = id || '';
    document.getElementById('cust-name').value = name;
    document.getElementById('cust-phone').value = phone;
    document.getElementById('cust-email').value = email;
    document.getElementById('cust-address').value = address;
    document.getElementById('cust-modal').classList.add('active');
  },

  async handleSave(e) {
    e.preventDefault();
    const id = document.getElementById('cust-id').value;
    const action = id ? 'edit' : 'add';

    const payload = {
      id: id ? parseInt(id) : undefined,
      name: document.getElementById('cust-name').value,
      phone: document.getElementById('cust-phone').value,
      email: document.getElementById('cust-email').value,
      address: document.getElementById('cust-address').value
    };

    try {
      const res = await fetch(`api/customers.php?action=${action}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();
      if (data.status === 'success') {
        Utils.showToast(data.message, 'success');
        document.getElementById('cust-modal').classList.remove('active');
        await this.loadData();
      } else Utils.showToast(data.message, 'error');
    } catch (err) { }
  },

  async delete(id) {
    if (!confirm('Delete customer record?')) return;
    try {
      const res = await fetch(`api/customers.php?id=${id}`, { method: 'DELETE' });
      const data = await res.json();
      if (data.status === 'success') { Utils.showToast(data.message, 'success'); await this.loadData(); }
    } catch (e) { }
  }
};

// 5. System Audit Logs Controller
const Logs = {
  async render(container) {
    if (App.currentUser.role !== 'founder') {
      container.innerHTML = `<div class="card" style="color:var(--danger);">Forbidden. Audit logs are restricted to Founder.</div>`;
      return;
    }

    container.innerHTML = `
      <div class="fade-in">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px;">
          <h3>System Security & Audit Activity Logs</h3>
          <input type="text" id="log-search-input" class="form-control" style="max-width:350px;" placeholder="Search user, action, details, IP...">
        </div>
        <div class="card">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Timestamp</th>
                  <th>User</th>
                  <th>Action</th>
                  <th>Activity Details</th>
                  <th>IP Address</th>
                </tr>
              </thead>
              <tbody id="log-table-body">
                <tr><td colspan="5" style="text-align:center; color:var(--text-muted);"><i data-lucide="loader" class="spin"></i> Loading audit logs...</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    `;
    if (window.lucide) lucide.createIcons();
    await this.loadData();
    document.getElementById('log-search-input').addEventListener('input', () => this.loadData());
  },

  async loadData() {
    const search = document.getElementById('log-search-input')?.value || '';
    try {
      const res = await fetch(`api/activity_logs.php?search=${encodeURIComponent(search)}`);
      const data = await res.json();
      if (data.status === 'success') {
        const tbody = document.getElementById('log-table-body');
        tbody.innerHTML = data.data.map(l => `
          <tr>
            <td>${Utils.formatDateTime(l.created_at)}</td>
            <td><strong>${l.user_name}</strong></td>
            <td><span class="badge badge-info">${l.action}</span></td>
            <td>${l.details || 'N/A'}</td>
            <td><code>${l.ip_address}</code></td>
          </tr>
        `).join('');
      }
    } catch (e) { }
  }
};
