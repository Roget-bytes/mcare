/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Settings View Controller: Pharmacy Profile, Taxes, Currency & DB Backup
   ========================================================================== */

const Settings = {
  async render(container) {
    if (App.currentUser.role !== 'founder') {
      container.innerHTML = `<div class="card" style="color:var(--danger);">Forbidden. Settings access restricted to Founder.</div>`;
      return;
    }

    container.innerHTML = `
      <div class="fade-in">
        <div class="grid-2">
          <!-- Pharmacy Profile & Invoicing Config -->
          <div class="card">
            <div class="card-header">
              <div class="card-title"><i data-lucide="building" style="color:var(--primary);"></i> Pharmacy Profile & Invoice Settings</div>
            </div>

            <form id="settings-form">
              <div class="form-group">
                <label class="form-label">Pharmacy Full Name</label>
                <input type="text" id="set-pharmacy-name" class="form-control" required value="M - CARE MODERN PHARMACY MANAGEMENT SYSTEM">
              </div>

              <div style="display:grid; grid-template-columns:1fr 1fr; gap:12px;">
                <div class="form-group">
                  <label class="form-label">Abbreviation / Short Name</label>
                  <input type="text" id="set-short-name" class="form-control" required value="MCPMS">
                </div>

                <div class="form-group">
                  <label class="form-label">Currency Symbol</label>
                  <input type="text" id="set-currency" class="form-control" required value="₦">
                </div>
              </div>

              <div style="display:grid; grid-template-columns:1fr 1fr; gap:12px;">
                <div class="form-group">
                  <label class="form-label">Phone Number(s)</label>
                  <input type="text" id="set-phone" class="form-control" value="+1 (800) 555-MCARE">
                </div>

                <div class="form-group">
                  <label class="form-label">Email Address</label>
                  <input type="email" id="set-email" class="form-control" value="info@mcarepharmacy.com">
                </div>
              </div>

              <div class="form-group">
                <label class="form-label">Physical Address</label>
                <input type="text" id="set-address" class="form-control" value="Suite 100, Healthcare Plaza, Main Medical Blvd">
              </div>

              <div style="display:grid; grid-template-columns:1fr 1fr; gap:12px;">
                <div class="form-group">
                  <label class="form-label">Default System Theme</label>
                  <select id="set-theme-mode" class="form-control">
                    <option value="light">Light Healthcare Mode</option>
                    <option value="dark">Dark Slate Glass Mode</option>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="form-label">Welcome Message Banner</label>
                <textarea id="set-welcome" class="form-control" rows="2">Welcome to M - CARE MODERN PHARMACY MANAGEMENT SYSTEM — Smart, Secure, and Efficient Pharmacy Management.</textarea>
              </div>

              <div class="form-group">
                <label class="form-label">Receipt & Invoice Footer Note</label>
                <input type="text" id="set-footer" class="form-control" value="Thank you for choosing M - CARE! Get well soon.">
              </div>

              <button type="submit" class="btn btn-primary btn-block"><i data-lucide="check"></i> Save System Configuration</button>
            </form>
          </div>

          <!-- Database Backup & Restore Center -->
          <div class="card">
            <div class="card-header">
              <div class="card-title"><i data-lucide="database" style="color:var(--secondary);"></i> Database Backup & Restore Center</div>
            </div>

            <div style="padding:10px 0;">
              <p style="font-size:13px; color:var(--text-muted); margin-bottom:20px;">
                Backup your entire MySQL database schema, medicines inventory, customer accounts, and sales history to a timestamped <code>.sql</code> file, or restore from a previous backup file.
              </p>

              <div style="background:var(--bg-tertiary); padding:20px; border-radius:12px; border:1px solid var(--border-color); margin-bottom:24px;">
                <h4 style="font-size:14px; margin-bottom:8px;"><i data-lucide="download"></i> Download Full Database Backup</h4>
                <p style="font-size:12px; color:var(--text-muted); margin-bottom:16px;">Generates a standalone SQL script containing database setup and all tables.</p>
                <a href="api/backup.php?action=download" class="btn btn-secondary btn-block" target="_blank">
                  <i data-lucide="hard-drive-download"></i> Download SQL Backup File
                </a>
              </div>

              <div style="background:var(--bg-tertiary); padding:20px; border-radius:12px; border:1px solid var(--border-color);">
                <h4 style="font-size:14px; margin-bottom:8px;"><i data-lucide="upload-cloud"></i> Restore Database From Backup</h4>
                <p style="font-size:12px; color:var(--danger); margin-bottom:16px;">⚠️ Warning: Restoring will overwrite existing database records.</p>
                
                <form id="restore-db-form" enctype="multipart/form-data">
                  <div class="form-group">
                    <input type="file" id="sql-file-input" class="form-control" accept=".sql" required>
                  </div>
                  <button type="submit" class="btn btn-danger btn-block"><i data-lucide="refresh-cw"></i> Execute Database Restore</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    `;

    if (window.lucide) lucide.createIcons();

    await this.loadSettings();

    document.getElementById('settings-form').addEventListener('submit', (e) => this.handleSave(e));
    document.getElementById('restore-db-form').addEventListener('submit', (e) => this.handleRestore(e));
  },

  async loadSettings() {
    try {
      const res = await fetch('api/settings.php');
      const data = await res.json();
      if (data.status === 'success') {
        const s = data.data;
        if (s.pharmacy_name) document.getElementById('set-pharmacy-name').value = s.pharmacy_name;
        if (s.pharmacy_short_name) document.getElementById('set-short-name').value = s.pharmacy_short_name;
        if (s.currency_symbol) {
          document.getElementById('set-currency').value = s.currency_symbol;
          Utils.setCurrencySymbol(s.currency_symbol);
        }
        if (s.phone) document.getElementById('set-phone').value = s.phone;
        if (s.email) document.getElementById('set-email').value = s.email;
        if (s.address) document.getElementById('set-address').value = s.address;

        if (s.theme_mode) document.getElementById('set-theme-mode').value = s.theme_mode;
        if (s.welcome_message) document.getElementById('set-welcome').value = s.welcome_message;
        if (s.invoice_footer) document.getElementById('set-invoice-footer').value = s.invoice_footer;
      }
    } catch (e) {}
  },

  async handleSave(e) {
    e.preventDefault();

    const payload = {
      pharmacy_name: document.getElementById('set-pharmacy-name').value,
      pharmacy_short_name: document.getElementById('set-short-name').value,
      currency_symbol: document.getElementById('set-currency').value,
      phone: document.getElementById('set-phone').value,
      email: document.getElementById('set-email').value,
      address: document.getElementById('set-address').value,

      theme_mode: document.getElementById('set-theme-mode').value,
      welcome_message: document.getElementById('set-welcome').value,
      invoice_footer: document.getElementById('set-footer').value
    };

    try {
      const res = await fetch('api/settings.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();

      if (data.status === 'success') {
        Utils.setCurrencySymbol(payload.currency_symbol);
        App.applyTheme(payload.theme_mode);
        Utils.showToast(data.message, 'success');
      } else {
        Utils.showToast(data.message, 'error');
      }
    } catch (err) {
      Utils.showToast('Error saving settings.', 'error');
    }
  },

  async handleRestore(e) {
    e.preventDefault();
    const fileInput = document.getElementById('sql-file-input');
    if (!fileInput.files || fileInput.files.length === 0) return;

    if (!confirm('Are you sure you want to overwrite your existing database records with this SQL file?')) return;

    const formData = new FormData();
    formData.append('sql_file', fileInput.files[0]);

    try {
      const res = await fetch('api/backup.php?action=restore', {
        method: 'POST',
        body: formData
      });
      const data = await res.json();

      if (data.status === 'success') {
        Utils.showToast(data.message, 'success');
        setTimeout(() => location.reload(), 1500);
      } else {
        Utils.showToast(data.message, 'error');
      }
    } catch (err) {
      Utils.showToast('Restore execution failed.', 'error');
    }
  }
};
