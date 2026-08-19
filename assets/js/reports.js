/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Reports View Controller: Financial, Sales, Profit & Loss & Performance Reports
   ========================================================================== */

const Reports = {
  activeTab: 'sales',

  async render(container) {
    const isFounder = App.currentUser.role === 'founder';

    container.innerHTML = `
      <div class="fade-in">
        <!-- Date Filter Bar -->
        <div class="card" style="margin-bottom:20px; padding:16px 20px;">
          <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:12px;">
            <div style="display:flex; gap:12px; align-items:center;">
              <label class="form-label" style="margin:0;">Date Range:</label>
              <input type="date" id="rep-start-date" class="form-control" style="width:160px;" value="${this.getDefaultStartDate()}">
              <span>to</span>
              <input type="date" id="rep-end-date" class="form-control" style="width:160px;" value="${new Date().toISOString().split('T')[0]}">
              <button class="btn btn-primary" id="rep-filter-btn"><i data-lucide="filter"></i> Generate Report</button>
            </div>

            <div style="display:flex; gap:8px;">
              <button class="btn btn-outline" id="rep-excel-btn"><i data-lucide="file-spreadsheet"></i> Excel</button>
              <button class="btn btn-outline" id="rep-pdf-btn"><i data-lucide="printer"></i> PDF / Print</button>
            </div>
          </div>
        </div>

        <!-- Report Tabs Navigation -->
        <div style="display:flex; gap:10px; margin-bottom:20px; border-bottom:1px solid var(--border-color); padding-bottom:10px; overflow-x:auto;">
          <button class="btn ${this.activeTab === 'sales' ? 'btn-primary' : 'btn-outline'}" onclick="Reports.switchTab('sales')">📊 Sales History Report</button>
          ${isFounder ? `
            <button class="btn ${this.activeTab === 'profit_loss' ? 'btn-primary' : 'btn-outline'}" onclick="Reports.switchTab('profit_loss')">💰 Profit & Loss Statement</button>
            <button class="btn ${this.activeTab === 'staff_performance' ? 'btn-primary' : 'btn-outline'}" onclick="Reports.switchTab('staff_performance')">👩‍⚕️ Staff Performance Report</button>
          ` : ''}
          <button class="btn ${this.activeTab === 'inventory' ? 'btn-primary' : 'btn-outline'}" onclick="Reports.switchTab('inventory')">📦 Inventory Valuation</button>
          <button class="btn ${this.activeTab === 'expired' ? 'btn-primary' : 'btn-outline'}" onclick="Reports.switchTab('expired')">🚨 Expired Medicines Report</button>
          <button class="btn ${this.activeTab === 'low_stock' ? 'btn-primary' : 'btn-outline'}" onclick="Reports.switchTab('low_stock')">⚠️ Low Stock Report</button>
        </div>

        <!-- Report Content Output Container -->
        <div id="report-output-container">
          <div style="text-align:center; padding:40px; color:var(--text-muted);"><i data-lucide="loader" class="spin"></i> Generating report...</div>
        </div>
      </div>
    `;

    if (window.lucide) lucide.createIcons();

    document.getElementById('rep-filter-btn').addEventListener('click', () => this.loadActiveTab());
    document.getElementById('rep-excel-btn').addEventListener('click', () => Utils.exportToExcel('report-table', `${this.activeTab}_report.xlsx`));
    document.getElementById('rep-pdf-btn').addEventListener('click', () => Utils.exportToPDF('report-output-container', `${this.activeTab.toUpperCase()} REPORT`));

    await this.loadActiveTab();
  },

  getDefaultStartDate() {
    const d = new Date();
    d.setDate(d.getDate() - 30);
    return d.toISOString().split('T')[0];
  },

  switchTab(tabName) {
    this.activeTab = tabName;
    this.render(document.getElementById('page-content'));
  },

  async loadActiveTab() {
    const start = document.getElementById('rep-start-date')?.value || this.getDefaultStartDate();
    const end = document.getElementById('rep-end-date')?.value || new Date().toISOString().split('T')[0];
    const container = document.getElementById('report-output-container');

    try {
      const res = await fetch(`api/reports.php?type=${this.activeTab}&start_date=${start}&end_date=${end}`);
      const data = await res.json();

      if (data.status !== 'success') {
        container.innerHTML = `<div class="card" style="color:var(--danger);">${data.message || 'Error loading report data.'}</div>`;
        return;
      }

      if (this.activeTab === 'sales') this.renderSalesReport(data, container);
      if (this.activeTab === 'profit_loss') this.renderProfitLossReport(data, container);
      if (this.activeTab === 'staff_performance') this.renderStaffPerformanceReport(data, container);
      if (this.activeTab === 'inventory') this.renderInventoryReport(data, container);
      if (this.activeTab === 'expired') this.renderExpiredReport(data, container);
      if (this.activeTab === 'low_stock') this.renderLowStockReport(data, container);

    } catch (e) {
      container.innerHTML = `<div class="card" style="color:var(--danger);">Failed to connect to reports API.</div>`;
    }
  },

  renderSalesReport(data, container) {
    const sum = data.summary;
    container.innerHTML = `
      <div class="stats-grid" style="grid-template-columns:repeat(2, 1fr); margin-bottom:20px;">
        <div class="stat-card">
          <div class="stat-info">
            <h3>Total Sales Revenue</h3>
            <div class="stat-value">${Utils.formatCurrency(sum.total_revenue)}</div>
          </div>
        </div>
        <div class="stat-card stat-green">
          <div class="stat-info">
            <h3>Total Invoices</h3>
            <div class="stat-value">${sum.invoice_count}</div>
          </div>
        </div>
      </div>

      <div class="card">
        <div class="table-responsive">
          <table class="table" id="report-table">
            <thead>
              <tr>
                <th>Invoice No</th>
                <th>Date & Time</th>
                <th>Customer</th>
                <th>Subtotal</th>
                <th>Grand Total</th>
                <th>Method</th>
                <th>Cashier</th>
              </tr>
            </thead>
            <tbody>
              ${data.data.map(s => `
                <tr>
                  <td><code>${s.invoice_no}</code></td>
                  <td>${Utils.formatDateTime(s.sale_date)}</td>
                  <td>${s.customer_name}</td>
                  <td>${Utils.formatCurrency(s.subtotal)}</td>
                  <td><strong>${Utils.formatCurrency(s.grand_total)}</strong></td>
                  <td><span class="badge badge-info">${s.payment_method.toUpperCase()}</span></td>
                  <td>${s.staff_name}</td>
                </tr>
              `).join('')}
            </tbody>
          </table>
        </div>
      </div>
    `;
  },

  renderProfitLossReport(data, container) {
    container.innerHTML = `
      <div class="card" style="max-width:700px; margin:0 auto;" id="report-table">
        <div class="card-header" style="border-bottom:2px solid var(--primary); padding-bottom:12px;">
          <h3 style="font-size:20px; color:var(--primary);">Profit & Loss Financial Statement</h3>
          <div>For Period: <strong>${data.start_date}</strong> to <strong>${data.end_date}</strong></div>
        </div>

        <div style="padding:20px 0; font-size:15px; display:flex; flex-direction:column; gap:14px;">
          <div style="display:flex; justify-content:space-between; border-bottom:1px solid var(--border-color); padding-bottom:8px;">
            <span><strong>(+) Gross Sales Revenue:</strong></span>
            <span style="font-weight:bold; color:var(--secondary);">${Utils.formatCurrency(data.gross_revenue)}</span>
          </div>

          <div style="display:flex; justify-content:space-between; border-bottom:1px dashed var(--border-color); padding-bottom:8px; font-weight:bold;">
            <span>(=) Net Sales Income:</span>
            <span>${Utils.formatCurrency(data.gross_revenue)}</span>
          </div>

          <div style="display:flex; justify-content:space-between; border-bottom:1px solid var(--border-color); padding-bottom:8px; color:var(--danger);">
            <span>(-) Cost of Goods Sold (COGS):</span>
            <span>-${Utils.formatCurrency(data.cost_of_goods_sold)}</span>
          </div>

          <div style="display:flex; justify-content:space-between; border-top:2px solid var(--primary); padding-top:14px; font-size:20px; font-weight:800; color:var(--primary);">
            <span>NET OPERATING PROFIT:</span>
            <span>${Utils.formatCurrency(data.net_profit)}</span>
          </div>
        </div>
      </div>
    `;
  },

  renderStaffPerformanceReport(data, container) {
    container.innerHTML = `
      <div class="card">
        <div class="table-responsive">
          <table class="table" id="report-table">
            <thead>
              <tr>
                <th>Staff Member</th>
                <th>Role</th>
                <th>Total Invoices Processed</th>
                <th>Average Ticket Value</th>
                <th>Total Revenue Generated</th>
              </tr>
            </thead>
            <tbody>
              ${data.data.map(u => `
                <tr>
                  <td><strong>${u.full_name}</strong></td>
                  <td><span class="badge badge-info">${u.role.toUpperCase()}</span></td>
                  <td>${u.total_transactions} sales</td>
                  <td>${Utils.formatCurrency(u.avg_sale_value)}</td>
                  <td><strong style="color:var(--primary); font-size:16px;">${Utils.formatCurrency(u.total_revenue)}</strong></td>
                </tr>
              `).join('')}
            </tbody>
          </table>
        </div>
      </div>
    `;
  },

  renderInventoryReport(data, container) {
    container.innerHTML = `
      <div class="stats-grid" style="grid-template-columns:1fr 1fr; margin-bottom:20px;">
        <div class="stat-card">
          <div class="stat-info">
            <h3>Total Inventory Asset Value (At Purchase Cost)</h3>
            <div class="stat-value">${Utils.formatCurrency(data.summary.total_cost_valuation)}</div>
          </div>
        </div>
        <div class="stat-card stat-green">
          <div class="stat-info">
            <h3>Total Potential Retail Revenue</h3>
            <div class="stat-value">${Utils.formatCurrency(data.summary.total_retail_valuation)}</div>
          </div>
        </div>
      </div>

      <div class="card">
        <div class="table-responsive">
          <table class="table" id="report-table">
            <thead>
              <tr>
                <th>Medicine Name</th>
                <th>Category</th>
                <th>Stock Qty</th>
                <th>Purchase Unit Price</th>
                <th>Selling Unit Price</th>
                <th>Total Asset Value</th>
                <th>Potential Revenue</th>
              </tr>
            </thead>
            <tbody>
              ${data.data.map(m => `
                <tr>
                  <td><strong>${m.name}</strong></td>
                  <td>${m.category_name}</td>
                  <td>${m.quantity} units</td>
                  <td>${Utils.formatCurrency(m.purchase_price)}</td>
                  <td>${Utils.formatCurrency(m.selling_price)}</td>
                  <td><strong>${Utils.formatCurrency(m.asset_value)}</strong></td>
                  <td><strong style="color:var(--secondary);">${Utils.formatCurrency(m.potential_revenue)}</strong></td>
                </tr>
              `).join('')}
            </tbody>
          </table>
        </div>
      </div>
    `;
  },

  renderExpiredReport(data, container) {
    container.innerHTML = `
      <div class="card">
        <div class="table-responsive">
          <table class="table" id="report-table">
            <thead>
              <tr>
                <th>Medicine Name</th>
                <th>Category</th>
                <th>Batch #</th>
                <th>Stock Qty</th>
                <th>Expiry Date</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              ${data.data.map(m => `
                <tr>
                  <td><strong>${m.name}</strong></td>
                  <td>${m.category_name}</td>
                  <td><code>${m.batch_number}</code></td>
                  <td>${m.quantity} units</td>
                  <td>${Utils.formatDate(m.expiry_date)}</td>
                  <td><span class="badge badge-danger">EXPIRED</span></td>
                </tr>
              `).join('')}
            </tbody>
          </table>
        </div>
      </div>
    `;
  },

  renderLowStockReport(data, container) {
    container.innerHTML = `
      <div class="card">
        <div class="table-responsive">
          <table class="table" id="report-table">
            <thead>
              <tr>
                <th>Medicine Name</th>
                <th>Category</th>
                <th>Stock Qty</th>
                <th>Reorder Level</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              ${data.data.map(m => `
                <tr>
                  <td><strong>${m.name}</strong></td>
                  <td>${m.category_name}</td>
                  <td><strong style="color:var(--warning);">${m.quantity} units</strong></td>
                  <td>${m.reorder_level}</td>
                  <td><span class="badge badge-warning">REORDER REQUIRED</span></td>
                </tr>
              `).join('')}
            </tbody>
          </table>
        </div>
      </div>
    `;
  }
};
