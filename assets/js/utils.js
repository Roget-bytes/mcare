/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   JavaScript Utilities: Toast, Currency, Date, Export & Receipt Printing
   ========================================================================== */

const Utils = {
  // Global Currency Symbol (default ₦)
  currencySymbol: '₦',

  setCurrencySymbol(sym) {
    if (sym) this.currencySymbol = sym;
  },

  formatCurrency(amount) {
    const val = parseFloat(amount) || 0;
    return `${this.currencySymbol}${val.toFixed(2)}`;
  },

  formatDate(dateStr) {
    if (!dateStr) return 'N/A';
    const d = new Date(dateStr);
    return d.toLocaleDateString(undefined, { year: 'numeric', month: 'short', day: 'numeric' });
  },

  formatDateTime(dateStr) {
    if (!dateStr) return 'N/A';
    const d = new Date(dateStr);
    return d.toLocaleString(undefined, { year: 'numeric', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' });
  },

  showToast(message, type = 'info') {
    let container = document.getElementById('toast-container');
    if (!container) {
      container = document.createElement('div');
      container.id = 'toast-container';
      container.style.cssText = 'position: fixed; bottom: 24px; right: 24px; z-index: 9999; display: flex; flex-direction: column; gap: 10px;';
      document.body.appendChild(container);
    }

    const toast = document.createElement('div');
    const colors = {
      success: '#10b981',
      error: '#ef4444',
      warning: '#f59e0b',
      info: '#0ea5e9'
    };
    const icons = {
      success: 'check-circle',
      error: 'alert-triangle',
      warning: 'bell',
      info: 'info'
    };

    toast.style.cssText = `
      background-color: ${colors[type] || colors.info};
      color: white;
      padding: 12px 20px;
      border-radius: 10px;
      font-size: 14px;
      font-weight: 600;
      box-shadow: 0 10px 25px rgba(0,0,0,0.2);
      display: flex;
      align-items: center;
      gap: 10px;
      animation: fadeIn 0.3s ease-out;
      max-width: 380px;
    `;
    
    toast.innerHTML = `<i data-lucide="${icons[type] || 'info'}"></i> <span>${message}</span>`;
    container.appendChild(toast);

    if (window.lucide) lucide.createIcons();

    setTimeout(() => {
      toast.style.opacity = '0';
      toast.style.transform = 'translateY(10px)';
      toast.style.transition = 'all 0.3s ease';
      setTimeout(() => toast.remove(), 300);
    }, 4000);
  },

  // Export Table Data to Excel (.xlsx) using SheetJS
  exportToExcel(tableId, filename = 'Export.xlsx') {
    const table = document.getElementById(tableId);
    if (!table) {
      this.showToast('Table not found for export.', 'error');
      return;
    }
    if (typeof XLSX === 'undefined') {
      this.showToast('SheetJS library is loading, please try again.', 'warning');
      return;
    }
    const wb = XLSX.utils.table_to_book(table, { sheet: "MCPMS Report" });
    XLSX.writeFile(wb, filename);
    this.showToast(`Exported ${filename} successfully!`, 'success');
  },

  // Export Data to PDF using jsPDF or Window Print
  exportToPDF(elementId, title = 'Pharmacy Report') {
    const element = document.getElementById(elementId);
    if (!element) {
      this.showToast('Report element not found.', 'error');
      return;
    }
    const printWindow = window.open('', '_blank');
    printWindow.document.write(`
      <html>
        <head>
          <title>${title}</title>
          <style>
            body { font-family: Arial, sans-serif; padding: 20px; color: #333; }
            h1 { font-size: 20px; color: #0284c7; margin-bottom: 5px; }
            h2 { font-size: 14px; color: #666; margin-bottom: 20px; }
            table { width: 100%; border-collapse: collapse; margin-top: 15px; font-size: 12px; }
            th, td { border: 1px solid #ddd; padding: 8px 12px; text-align: left; }
            th { background-color: #f1f5f9; font-weight: bold; }
            .badge { padding: 2px 6px; border-radius: 4px; font-size: 10px; text-transform: uppercase; }
          </style>
        </head>
        <body>
          <h1>M - CARE MODERN PHARMACY MANAGEMENT SYSTEM</h1>
          <h2>${title} — Generated on ${new Date().toLocaleString()}</h2>
          ${element.outerHTML}
        </body>
      </html>
    `);
    printWindow.document.close();
    printWindow.focus();
    setTimeout(() => {
      printWindow.print();
      printWindow.close();
    }, 500);
  },

  // Print Thermal 80mm Receipt
  printThermalReceipt(inv) {
    const p = inv.pharmacy || {};
    const itemsHtml = inv.items.map(item => `
      <tr>
        <td style="text-align:left;">${item.name}<br><small style="color:#666;">Batch: ${item.batch_number}</small></td>
        <td style="text-align:center;">${item.quantity}</td>
        <td style="text-align:right;">${this.formatCurrency(item.unit_price)}</td>
        <td style="text-align:right;">${this.formatCurrency(item.subtotal)}</td>
      </tr>
    `).join('');

    const html = `
      <div class="thermal-receipt">
        <div class="thermal-header">
          <h2>${p.pharmacy_name || 'M - CARE PHARMACY'}</h2>
          <div>${p.address || ''}</div>
          <div>Tel: ${p.phone || ''}</div>
          <div class="thermal-line"></div>
          <div style="font-weight:bold;">SALES RECEIPT</div>
          <div>Invoice #: ${inv.invoice_no}</div>
          <div>Date: ${inv.sale_date}</div>
          <div>Cashier: ${inv.cashier_name}</div>
          <div>Customer: ${inv.customer_name}</div>
        </div>
        <div class="thermal-line"></div>
        <table style="width:100%; font-size:11px; border-collapse:collapse;">
          <thead>
            <tr style="border-bottom:1px solid #000;">
              <th style="text-align:left;">Item</th>
              <th style="text-align:center;">Qty</th>
              <th style="text-align:right;">Price</th>
              <th style="text-align:right;">Total</th>
            </tr>
          </thead>
          <tbody>
            ${itemsHtml}
          </tbody>
        </table>
        <div class="thermal-line"></div>
        <div style="font-size:12px;">
          <div style="display:flex; justify-content:space-between;"><span>Subtotal:</span> <span>${this.formatCurrency(inv.subtotal)}</span></div>
          <div style="display:flex; justify-content:space-between; font-weight:bold; font-size:14px; margin-top:4px;"><span>GRAND TOTAL:</span> <span>${this.formatCurrency(inv.grand_total)}</span></div>
          <div class="thermal-line"></div>
          <div style="display:flex; justify-content:space-between;"><span>Paid (${inv.payment_method}):</span> <span>${this.formatCurrency(inv.paid_amount)}</span></div>
          <div style="display:flex; justify-content:space-between;"><span>Change Due:</span> <span>${this.formatCurrency(inv.change_amount)}</span></div>
        </div>
        <div class="thermal-line"></div>
        <div style="text-align:center; font-size:11px; margin-top:10px;">
          ${p.invoice_footer || 'Thank you for choosing M - CARE! Get well soon.'}
        </div>
      </div>
    `;

    const win = window.open('', '_blank');
    win.document.write(`<html><head><title>Thermal Receipt ${inv.invoice_no}</title><style>
      body { margin: 0; padding: 0; background: #fff; }
      .thermal-receipt { width: 78mm; padding: 5px; font-family: monospace; font-size: 11px; }
      .thermal-line { border-top: 1px dashed #000; margin: 4px 0; }
    </style></head><body>${html}</body></html>`);
    win.document.close();
    win.focus();
    setTimeout(() => {
      win.print();
      win.close();
    }, 400);
  },

  // Print A4 Professional Invoice
  printA4Invoice(inv) {
    const p = inv.pharmacy || {};
    const itemsHtml = inv.items.map((item, idx) => `
      <tr>
        <td>${idx + 1}</td>
        <td><strong>${item.name}</strong><br><small style="color:#666;">Batch: ${item.batch_number}</small></td>
        <td style="text-align:center;">${item.quantity}</td>
        <td style="text-align:right;">${this.formatCurrency(item.unit_price)}</td>
        <td style="text-align:right;">${this.formatCurrency(item.subtotal)}</td>
      </tr>
    `).join('');

    const win = window.open('', '_blank');
    win.document.write(`
      <html>
        <head>
          <title>A4 Invoice - ${inv.invoice_no}</title>
          <style>
            body { font-family: 'Helvetica Neue', Arial, sans-serif; color: #1e293b; padding: 40px; background: #fff; font-size: 13px; }
            .inv-header { display: flex; justify-content: space-between; align-items: flex-start; border-bottom: 2px solid #0ea5e9; padding-bottom: 20px; margin-bottom: 30px; }
            .brand { font-size: 24px; font-weight: bold; color: #0284c7; }
            .inv-details { text-align: right; font-size: 13px; }
            .inv-details h2 { font-size: 20px; color: #0f172a; margin: 0 0 5px 0; }
            .meta-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px; }
            .meta-box { background: #f8fafc; padding: 15px; border-radius: 8px; border: 1px solid #e2e8f0; }
            .meta-box h4 { margin: 0 0 8px 0; color: #64748b; font-size: 11px; text-transform: uppercase; }
            table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
            th { background: #0ea5e9; color: white; padding: 10px 14px; text-align: left; font-size: 12px; }
            td { padding: 12px 14px; border-bottom: 1px solid #e2e8f0; }
            .tot-box { width: 300px; margin-left: auto; background: #f8fafc; padding: 15px; border-radius: 8px; border: 1px solid #e2e8f0; }
            .tot-row { display: flex; justify-content: space-between; margin-bottom: 6px; }
            .tot-row.grand { font-size: 16px; font-weight: bold; color: #0284c7; border-top: 2px solid #0ea5e9; padding-top: 8px; }
            .footer-note { margin-top: 50px; text-align: center; color: #64748b; font-size: 12px; border-top: 1px solid #e2e8f0; padding-top: 20px; }
          </style>
        </head>
        <body>
          <div class="inv-header">
            <div>
              <div class="brand">${p.pharmacy_name || 'M - CARE PHARMACY'}</div>
              <div>${p.address || ''}</div>
              <div>Phone: ${p.phone || ''} | Email: ${p.email || ''}</div>
            </div>
            <div class="inv-details">
              <h2>INVOICE</h2>
              <div><strong>Invoice #:</strong> ${inv.invoice_no}</div>
              <div><strong>Date:</strong> ${inv.sale_date}</div>
              <div><strong>Payment:</strong> ${inv.payment_method}</div>
            </div>
          </div>

          <div class="meta-grid">
            <div class="meta-box">
              <h4>Billed To (Customer):</h4>
              <div><strong>${inv.customer_name}</strong></div>
              <div>Phone: ${inv.customer_phone}</div>
            </div>
            <div class="meta-box">
              <h4>Issued By:</h4>
              <div><strong>Staff: ${inv.cashier_name}</strong></div>
              <div>Branch: MCPMS Central</div>
            </div>
          </div>

          <table>
            <thead>
              <tr>
                <th style="width:40px;">#</th>
                <th>Item Description</th>
                <th style="text-align:center; width:80px;">Qty</th>
                <th style="text-align:right; width:100px;">Unit Price</th>
                <th style="text-align:right; width:120px;">Subtotal</th>
              </tr>
            </thead>
            <tbody>
              ${itemsHtml}
            </tbody>
          </table>

          <div class="tot-box">
            <div class="tot-row"><span>Subtotal:</span> <span>${this.formatCurrency(inv.subtotal)}</span></div>
            <div class="tot-row grand"><span>Grand Total:</span> <span>${this.formatCurrency(inv.grand_total)}</span></div>
            <div class="tot-row"><span>Amount Paid:</span> <span>${this.formatCurrency(inv.paid_amount)}</span></div>
            <div class="tot-row"><span>Change Returned:</span> <span>${this.formatCurrency(inv.change_amount)}</span></div>
          </div>

          <div class="footer-note">
            ${p.invoice_footer || 'Thank you for choosing M - CARE! Get well soon.'}
          </div>
        </body>
      </html>
    `);
    win.document.close();
    win.focus();
    setTimeout(() => {
      win.print();
      win.close();
    }, 400);
  }
};
