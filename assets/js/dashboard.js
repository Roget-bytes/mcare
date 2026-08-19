/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Dashboard View Controller: Stats Cards & Interactive Chart.js Integration
   ========================================================================== */

const Dashboard = {
  async render(container) {
    try {
      const res = await fetch('api/dashboard.php');
      const data = await res.json();

      if (data.status !== 'success') {
        container.innerHTML = `<div class="card" style="color:var(--danger);">Error loading dashboard metrics.</div>`;
        return;
      }

      const kpi = data.kpi;
      const isFounder = App.currentUser.role === 'founder';

      // Check notification dot
      const notifDot = document.getElementById('header-notif-dot');
      if (notifDot) {
        if (kpi.low_stock_count > 0 || kpi.expiring_count > 0) {
          notifDot.style.display = 'block';
        } else {
          notifDot.style.display = 'none';
        }
      }

      container.innerHTML = `
        <div class="fade-in">
          <!-- KPI Stats Banner Grid -->
          <div class="stats-grid">
            <div class="stat-card">
              <div class="stat-info">
                <h3>Today's Revenue</h3>
                <div class="stat-value">${Utils.formatCurrency(kpi.today_sales_amount)}</div>
                <small style="color:var(--text-muted);">${kpi.today_sales_count} Transactions Today</small>
              </div>
              <div class="stat-icon"><i data-lucide="dollar-sign"></i></div>
            </div>

            <div class="stat-card stat-green">
              <div class="stat-info">
                <h3>Total Revenue</h3>
                <div class="stat-value">${Utils.formatCurrency(kpi.total_sales_amount)}</div>
                <small style="color:var(--text-muted);">${kpi.total_sales_count} Total Invoices</small>
              </div>
              <div class="stat-icon"><i data-lucide="trending-up"></i></div>
            </div>

            <div class="stat-card stat-teal">
              <div class="stat-info">
                <h3>Daily Profit</h3>
                <div class="stat-value">${Utils.formatCurrency(kpi.today_profit)}</div>
                <small style="color:var(--text-muted);">Today's Net Profit</small>
              </div>
              <div class="stat-icon"><i data-lucide="sun"></i></div>
            </div>

            <div class="stat-card stat-indigo">
              <div class="stat-info">
                <h3>Weekly Profit</h3>
                <div class="stat-value">${Utils.formatCurrency(kpi.weekly_profit)}</div>
                <small style="color:var(--text-muted);">Last 7 Days Profit</small>
              </div>
              <div class="stat-icon"><i data-lucide="calendar"></i></div>
            </div>

            <div class="stat-card stat-purple">
              <div class="stat-info">
                <h3>Monthly Profit</h3>
                <div class="stat-value">${Utils.formatCurrency(kpi.monthly_profit)}</div>
                <small style="color:var(--text-muted);">This Month's Profit</small>
              </div>
              <div class="stat-icon"><i data-lucide="pie-chart"></i></div>
            </div>

            <div class="stat-card">
              <div class="stat-info">
                <h3>Total Inventory</h3>
                <div class="stat-value">${kpi.total_medicines}</div>
                <small style="color:var(--text-muted);">${kpi.total_customers} Registered Customers</small>
              </div>
              <div class="stat-icon"><i data-lucide="pill"></i></div>
            </div>

            <div class="stat-card stat-amber">
              <div class="stat-info">
                <h3>Low Stock Items</h3>
                <div class="stat-value">${kpi.low_stock_count}</div>
                <small style="color:var(--text-muted);">Below Reorder Limit</small>
              </div>
              <div class="stat-icon"><i data-lucide="alert-triangle"></i></div>
            </div>

            <div class="stat-card stat-red">
              <div class="stat-info">
                <h3>Expiring Soon</h3>
                <div class="stat-value">${kpi.expiring_count}</div>
                <small style="color:var(--text-muted);">Within 90 Days / Expired</small>
              </div>
              <div class="stat-icon"><i data-lucide="clock"></i></div>
            </div>
          </div>

          <!-- Charts Section Grid -->
          <div class="grid-2">
            <div class="card">
              <div class="card-header">
                <div class="card-title"><i data-lucide="line-chart" style="color:var(--primary);"></i> 7-Day Sales Performance Trend</div>
              </div>
              <div style="height: 260px; position: relative;">
                <canvas id="salesTrendChart"></canvas>
              </div>
            </div>

            <div class="card">
              <div class="card-header">
                <div class="card-title"><i data-lucide="pie-chart" style="color:var(--secondary);"></i> Category Distribution</div>
              </div>
              <div style="height: 260px; position: relative;">
                <canvas id="categoryPieChart"></canvas>
              </div>
            </div>
          </div>

          <!-- Alert Lists Grid -->
          <div class="grid-2">
            <!-- Low Stock Warnings -->
            <div class="card">
              <div class="card-header">
                <div class="card-title"><i data-lucide="alert-circle" style="color:var(--warning);"></i> Low Stock Reorder Alerts</div>
                <button class="btn btn-sm btn-outline" onclick="App.navigateTo('inventory')">View All</button>
              </div>
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Medicine Name</th>
                      <th>Category</th>
                      <th>In Stock</th>
                      <th>Reorder Level</th>
                      ${isFounder ? '<th>Action</th>' : ''}
                    </tr>
                  </thead>
                  <tbody>
                    ${data.low_stock_items.length === 0 ? `<tr><td colspan="${isFounder ? 5 : 4}" style="text-align:center; color:var(--text-muted);">All stock levels healthy!</td></tr>` : 
                      data.low_stock_items.map(item => `
                        <tr>
                          <td><strong>${item.name}</strong><br><small style="color:var(--text-muted);">${item.generic_name}</small></td>
                          <td>${item.category_name}</td>
                          <td><span class="badge badge-warning">${item.quantity} units</span></td>
                          <td>${item.reorder_level}</td>
                          ${isFounder ? `<td><button class="btn btn-sm btn-primary" onclick="App.navigateTo('purchases')">Reorder</button></td>` : ''}
                        </tr>
                      `).join('')
                    }
                  </tbody>
                </table>
              </div>
            </div>

            <!-- Expiring Medicine Alerts -->
            <div class="card">
              <div class="card-header">
                <div class="card-title"><i data-lucide="calendar" style="color:var(--danger);"></i> Expiring Medicine Alerts</div>
                <button class="btn btn-sm btn-outline" onclick="App.navigateTo('inventory')">View All</button>
              </div>
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Medicine</th>
                      <th>Batch #</th>
                      <th>Expiry Date</th>
                      <th>Days Left</th>
                    </tr>
                  </thead>
                  <tbody>
                    ${data.expiring_items.length === 0 ? '<tr><td colspan="4" style="text-align:center; color:var(--text-muted);">No medicines expiring soon!</td></tr>' :
                      data.expiring_items.map(item => {
                        const days = parseInt(item.days_left);
                        const isExpired = days <= 0;
                        return `
                          <tr>
                            <td><strong>${item.name}</strong></td>
                            <td><code>${item.batch_number}</code></td>
                            <td>${Utils.formatDate(item.expiry_date)}</td>
                            <td>
                              <span class="badge ${isExpired ? 'badge-danger' : 'badge-warning'}">
                                ${isExpired ? 'EXPIRED' : days + ' Days'}
                              </span>
                            </td>
                          </tr>
                        `;
                      }).join('')
                    }
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <!-- Recent Transactions Section -->
          <div class="card">
            <div class="card-header">
              <div class="card-title"><i data-lucide="receipt" style="color:var(--primary);"></i> Recent POS Sales Transactions</div>
              <button class="btn btn-sm btn-outline" onclick="App.navigateTo('reports')">Full Sales History</button>
            </div>
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th>Invoice No</th>
                    <th>Date & Time</th>
                    <th>Customer</th>
                    <th>Payment Method</th>
                    <th>Grand Total</th>
                    <th>Cashier</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  ${data.recent_sales.map(s => `
                    <tr>
                      <td><code>${s.invoice_no}</code></td>
                      <td>${Utils.formatDateTime(s.sale_date)}</td>
                      <td>${s.customer_name}</td>
                      <td><span class="badge badge-info">${s.payment_method.toUpperCase()}</span></td>
                      <td><strong>${Utils.formatCurrency(s.grand_total)}</strong></td>
                      <td>${s.staff_name}</td>
                      <td>
                        <button class="btn btn-sm btn-outline" onclick="Dashboard.reprintInvoice(${s.id})">
                          <i data-lucide="printer"></i> Print
                        </button>
                      </td>
                    </tr>
                  `).join('')}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      `;

      if (window.lucide) lucide.createIcons();

      // Render Charts
      this.initCharts(data.daily_trends, data.category_distribution);

    } catch (e) {
      console.error('Dashboard render error:', e);
      container.innerHTML = `<div class="card" style="color:var(--danger);">Error connecting to MCPMS dashboard API.</div>`;
    }
  },

  initCharts(trends, categories) {
    if (typeof Chart === 'undefined') return;

    // 1. Sales Trend Line Chart
    const ctxTrend = document.getElementById('salesTrendChart');
    if (ctxTrend) {
      const labels = trends.map(t => Utils.formatDate(t.sale_day));
      const totals = trends.map(t => parseFloat(t.daily_total));

      new Chart(ctxTrend, {
        type: 'line',
        data: {
          labels: labels.length ? labels : ['Today'],
          datasets: [{
            label: 'Daily Sales (₦)',
            data: totals.length ? totals : [0],
            borderColor: '#0ea5e9',
            backgroundColor: 'rgba(14, 165, 233, 0.15)',
            borderWidth: 3,
            fill: true,
            tension: 0.4
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: { legend: { display: false } },
          scales: {
            y: { beginAtZero: true, grid: { color: 'rgba(255,255,255,0.05)' } },
            x: { grid: { display: false } }
          }
        }
      });
    }

    // 2. Category Pie Chart
    const ctxPie = document.getElementById('categoryPieChart');
    if (ctxPie) {
      const catNames = categories.map(c => c.name);
      const catCounts = categories.map(c => parseInt(c.item_count));

      new Chart(ctxPie, {
        type: 'doughnut',
        data: {
          labels: catNames,
          datasets: [{
            data: catCounts,
            backgroundColor: [
              '#0ea5e9', '#10b981', '#f59e0b', '#ef4444', '#8b5cf6', '#3b82f6', '#ec4899'
            ]
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: { legend: { position: 'right', labels: { boxWidth: 12, font: { size: 11 } } } }
        }
      });
    }
  },

  async reprintInvoice(saleId) {
    try {
      const res = await fetch(`api/sales.php?id=${saleId}`);
      const data = await res.json();
      if (data.status === 'success') {
        Utils.printThermalReceipt(data.data);
      }
    } catch (e) {
      Utils.showToast('Failed to fetch invoice details.', 'error');
    }
  }
};
