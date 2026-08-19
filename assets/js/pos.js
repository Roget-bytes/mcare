/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Point of Sale (POS) View Controller: Fast Checkout & Receipt Printer
   ========================================================================== */

const POS = {
  cart: [],
  medicines: [],
  customers: [],
  taxRate: 5.00, // default 5%
  selectedCustomerId: 1, // Walk-in Customer
  _userEditingPaid: false, // tracks manual editing of paid amount field

  async render(container) {
    container.innerHTML = `
      <div class="pos-container fade-in">
        <!-- Left Side: Catalog & Search -->
        <div class="pos-catalog">
          <div class="pos-search-bar card" style="padding:12px 16px;">
            <div style="position:relative; flex:1;">
              <i data-lucide="search" style="position:absolute; left:12px; top:12px; color:var(--text-muted);"></i>
              <input type="text" id="pos-search-input" class="form-control" style="padding-left:38px;" placeholder="Scan Barcode or Search Medicine Name / Batch / Generic..." autofocus>
            </div>
            <button class="btn btn-primary" id="pos-barcode-simulate-btn" title="Simulate Barcode Scan">
              <i data-lucide="barcode"></i> Scan
            </button>
          </div>

          <div class="pos-grid" id="pos-medicine-grid">
            <div style="grid-column:1/-1; text-align:center; color:var(--text-muted); padding:40px;"><i data-lucide="loader" class="spin"></i> Loading catalog...</div>
          </div>
        </div>

        <!-- Right Side: POS Cart Panel -->
        <div class="pos-cart">
          <div class="pos-cart-header">
            <div style="display:flex; align-items:center; gap:8px;">
              <i data-lucide="shopping-bag" style="color:var(--primary);"></i>
              <h3 style="font-size:16px;">Current Cart</h3>
            </div>
            <button class="btn btn-sm btn-outline" style="color:var(--danger);" onclick="POS.clearCart()"><i data-lucide="trash-2"></i> Clear</button>
          </div>

          <!-- Customer Selection Row -->
          <div style="padding:12px 16px; background:var(--bg-tertiary); border-bottom:1px solid var(--border-color); display:flex; gap:8px; align-items:center;">
            <i data-lucide="user" style="color:var(--text-muted);"></i>
            <select id="pos-customer-select" class="form-control" style="flex:1; font-size:13px;"></select>
            <button class="btn btn-sm btn-outline" id="pos-add-cust-btn" title="Quick Register Customer"><i data-lucide="user-plus"></i></button>
          </div>

          <!-- Cart Items Container -->
          <div class="pos-cart-items" id="pos-cart-items">
            <div style="text-align:center; color:var(--text-muted); margin-top:50px;">
              <i data-lucide="shopping-cart" style="font-size:40px; opacity:0.3;"></i>
              <p style="font-size:13px; margin-top:10px;">Cart is empty.<br>Click items on the left to add.</p>
            </div>
          </div>

          <!-- Cart Totals & Checkout -->
          <div class="pos-cart-summary">
            <div class="summary-row">
              <span>Subtotal:</span>
              <span id="pos-subtotal">₦0.00</span>
            </div>



            <div class="summary-row total">
              <span>GRAND TOTAL:</span>
              <span id="pos-grand-total">₦0.00</span>
            </div>

            <div style="margin:12px 0;">
              <label class="form-label" style="font-size:11px;">Payment Method</label>
              <select id="pos-payment-method" class="form-control" style="font-size:13px;">
                <option value="cash">💵 Cash Payment</option>
                <option value="card">💳 Credit / Debit Card</option>
                <option value="mobile_money">📱 Mobile Money</option>
              </select>
            </div>

            <div style="display:grid; grid-template-columns:1fr 1fr; gap:10px; margin-bottom:14px;" id="cash-payment-rows">
              <div>
                <label style="font-size:11px; color:var(--text-muted);">Paid Amount (₦)</label>
                <input type="number" step="0.01" id="pos-paid-amount" class="form-control" style="font-size:14px; font-weight:bold;" value="0.00">
              </div>
              <div>
                <label style="font-size:11px; color:var(--text-muted);">Change Due</label>
                <div id="pos-change-due" style="font-size:15px; font-weight:bold; color:var(--secondary); padding:8px 0;">₦0.00</div>
              </div>
            </div>

            <button class="btn btn-primary btn-block btn-lg" id="pos-checkout-btn" onclick="POS.processCheckout()">
              <i data-lucide="check-circle-2"></i> Complete Sale & Print Invoice
            </button>
          </div>
        </div>
      </div>

      <!-- Quick Add Customer Modal -->
      <div class="modal-backdrop" id="pos-cust-modal">
        <div class="modal" style="max-width:400px;">
          <div class="modal-header">
            <h3>Quick Customer Registration</h3>
            <button class="action-icon-btn" onclick="document.getElementById('pos-cust-modal').classList.remove('active')"><i data-lucide="x"></i></button>
          </div>
          <form id="pos-cust-form">
            <div class="modal-body">
              <div class="form-group">
                <label class="form-label">Full Name *</label>
                <input type="text" id="quick-cust-name" class="form-control" required placeholder="e.g. Sarah Connor">
              </div>
              <div class="form-group">
                <label class="form-label">Phone Number *</label>
                <input type="text" id="quick-cust-phone" class="form-control" required placeholder="e.g. +1 555-0199">
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Register & Select</button>
            </div>
          </form>
        </div>
      </div>

      <!-- Checkout Success & Printing Receipt Modal -->
      <div class="modal-backdrop" id="receipt-modal">
        <div class="modal" style="max-width:480px; text-align:center;">
          <div class="modal-header">
            <h3 style="color:var(--secondary); display:flex; align-items:center; gap:8px;">
              <i data-lucide="check-circle"></i> Sale Completed Successfully!
            </h3>
            <button class="action-icon-btn" onclick="POS.closeReceiptModal()"><i data-lucide="x"></i></button>
          </div>
          <div class="modal-body" id="receipt-modal-body" style="text-align:left; max-height:400px; overflow-y:auto; background:var(--bg-tertiary); padding:16px; border-radius:8px;">
          </div>
          <div class="modal-footer" style="justify-content:space-between;">
            <button class="btn btn-outline" onclick="POS.closeReceiptModal()">Done & New Sale</button>
            <div style="display:flex; gap:8px;">
              <button class="btn btn-secondary" id="print-thermal-btn"><i data-lucide="printer"></i> Thermal (80mm)</button>
              <button class="btn btn-primary" id="print-a4-btn"><i data-lucide="file-text"></i> A4 Invoice</button>
            </div>
          </div>
        </div>
      </div>
    `;

    if (window.lucide) lucide.createIcons();

    await this.loadCustomers();
    await this.loadMedicines();

    // Event handlers
    document.getElementById('pos-search-input').addEventListener('input', (e) => this.filterMedicines(e.target.value));
    document.getElementById('pos-search-input').addEventListener('keypress', (e) => {
      if (e.key === 'Enter') {
        this.handleBarcodeScan(e.target.value);
      }
    });


    document.getElementById('pos-paid-amount').addEventListener('input', () => {
      this._userEditingPaid = true;
      this.updateCartTotals();
    });
    document.getElementById('pos-paid-amount').addEventListener('blur', () => {
      this._userEditingPaid = false;
    });
    document.getElementById('pos-payment-method').addEventListener('change', (e) => {
      const isCash = e.target.value === 'cash';
      document.getElementById('cash-payment-rows').style.display = isCash ? 'grid' : 'none';
      this._userEditingPaid = false; // Reset flag on payment method change
      this.updateCartTotals();
    });

    document.getElementById('pos-add-cust-btn').addEventListener('click', () => {
      document.getElementById('pos-cust-modal').classList.add('active');
    });

    document.getElementById('pos-cust-form').addEventListener('submit', (e) => this.handleQuickCustomerAdd(e));
  },

  async loadCustomers() {
    try {
      const res = await fetch('api/customers.php');
      const data = await res.json();
      if (data.status === 'success') {
        this.customers = data.data;
        const sel = document.getElementById('pos-customer-select');
        if (sel) {
          sel.innerHTML = this.customers.map(c => `<option value="${c.id}">${c.name} (${c.phone})</option>`).join('');
          if (this.customers.length > 0) {
            const defaultCust = this.customers.find(c => parseInt(c.id) === parseInt(this.selectedCustomerId)) || this.customers[0];
            this.selectedCustomerId = parseInt(defaultCust.id);
            sel.value = this.selectedCustomerId;
          }
          sel.addEventListener('change', (e) => {
            this.selectedCustomerId = parseInt(e.target.value);
          });
        }
      }
    } catch (e) {}
  },

  async loadMedicines(query = '') {
    try {
      const res = await fetch(`api/pos.php?query=${encodeURIComponent(query)}`);
      const data = await res.json();
      if (data.status === 'success') {
        this.medicines = data.data;
        this.renderCatalogGrid(this.medicines);
      }
    } catch (e) {}
  },

  renderCatalogGrid(items) {
    const grid = document.getElementById('pos-medicine-grid');
    if (!items || items.length === 0) {
      grid.innerHTML = `<div style="grid-column:1/-1; text-align:center; color:var(--text-muted); padding:30px;">No matching medicines found in stock.</div>`;
      return;
    }

    grid.innerHTML = items.map(m => `
      <div class="pos-item-card" onclick="POS.addToCart(${m.id})">
        <div>
          <div class="pos-item-title">${m.name}</div>
          <div class="pos-item-generic">${m.brand || m.generic_name} ${m.packs_cards ? `<span class="badge badge-secondary" style="font-size:10px; margin-left:4px;">${m.packs_cards}</span>` : ''}</div>
          <div style="font-size:10px; color:var(--text-muted);">Batch: <code>${m.batch_number}</code></div>
        </div>
        <div class="pos-item-footer">
          <div class="pos-item-price">${Utils.formatCurrency(m.selling_price)}</div>
          <div class="pos-item-stock"><span class="badge badge-info">${m.quantity} ${m.packs_cards || 'units'} left</span></div>
        </div>
      </div>
    `).join('');
  },

  filterMedicines(query) {
    this.loadMedicines(query);
  },

  handleBarcodeScan(code) {
    const codeClean = code.trim();
    if (!codeClean) return;

    const item = this.medicines.find(m => m.barcode === codeClean || m.batch_number === codeClean);
    if (item) {
      this.addToCart(item.id);
      document.getElementById('pos-search-input').value = '';
      Utils.showToast(`Scanned and added: ${item.name}`, 'success');
    }
  },

  addToCart(medId) {
    const med = this.medicines.find(m => parseInt(m.id) === parseInt(medId));
    if (!med) return;

    const existing = this.cart.find(i => parseInt(i.medicine_id) === parseInt(medId));
    if (existing) {
      if (existing.quantity >= med.quantity) {
        Utils.showToast(`Cannot add more than available stock (${med.quantity} ${med.packs_cards || 'units'}).`, 'warning');
        return;
      }
      existing.quantity += 1;
    } else {
      this.cart.push({
        medicine_id: med.id,
        name: med.name,
        packs_cards: med.packs_cards || '',
        batch_number: med.batch_number,
        unit_price: parseFloat(med.selling_price),
        stock_max: parseInt(med.quantity),
        quantity: 1
      });
    }

    this.renderCartItems();
  },

  updateCartQty(medId, delta) {
    const item = this.cart.find(i => parseInt(i.medicine_id) === parseInt(medId));
    if (!item) return;

    item.quantity += delta;
    if (item.quantity > item.stock_max) {
      item.quantity = item.stock_max;
      Utils.showToast(`Max available stock reached (${item.stock_max} ${item.packs_cards || 'units'}).`, 'warning');
    }
    if (item.quantity <= 0) {
      this.cart = this.cart.filter(i => parseInt(i.medicine_id) !== parseInt(medId));
    }

    this.renderCartItems();
  },

  clearCart() {
    this.cart = [];
    this.renderCartItems();
  },

  renderCartItems() {
    const container = document.getElementById('pos-cart-items');
    if (this.cart.length === 0) {
      container.innerHTML = `
        <div style="text-align:center; color:var(--text-muted); margin-top:50px;">
          <i data-lucide="shopping-cart" style="font-size:40px; opacity:0.3;"></i>
          <p style="font-size:13px; margin-top:10px;">Cart is empty.<br>Click items on the left to add.</p>
        </div>
      `;
      if (window.lucide) lucide.createIcons();
      this.updateCartTotals();
      return;
    }

    container.innerHTML = this.cart.map(item => `
      <div class="cart-item-row">
        <div class="cart-item-info">
          <h4>${item.name}</h4>
          <span>${Utils.formatCurrency(item.unit_price)} × ${item.quantity} ${item.packs_cards || 'units'} = <strong>${Utils.formatCurrency(item.unit_price * item.quantity)}</strong></span>
        </div>
        <div class="cart-qty-ctrl">
          <button class="cart-qty-btn" onclick="POS.updateCartQty(${item.medicine_id}, -1)">-</button>
          <span style="font-weight:bold; font-size:13px; width:20px; text-align:center;">${item.quantity}</span>
          <button class="cart-qty-btn" onclick="POS.updateCartQty(${item.medicine_id}, 1)">+</button>
        </div>
      </div>
    `).join('');

    this.updateCartTotals();
  },

  updateCartTotals() {
    const subtotal = this.cart.reduce((sum, item) => sum + (item.unit_price * item.quantity), 0);
    const taxAmount = 0;
    const discount = 0;
    const grandTotal = subtotal;

    // Update subtotal and grand total displays
    const subtotalEl = document.getElementById('pos-subtotal');
    const grandTotalEl = document.getElementById('pos-grand-total');
    if (subtotalEl) subtotalEl.innerText = Utils.formatCurrency(subtotal);
    if (grandTotalEl) grandTotalEl.innerText = Utils.formatCurrency(grandTotal);

    // Always set paid amount to grand total
    const paidInput = document.getElementById('pos-paid-amount');
    const paymentMethod = document.getElementById('pos-payment-method')?.value || 'cash';

    if (paidInput) {
      paidInput.value = grandTotal.toFixed(2);
      paidInput.disabled = (paymentMethod !== 'cash');
    }

    // Calculate and display change due
    const paidAmount = parseFloat(paidInput?.value || 0);
    const changeDue = Math.max(0, paidAmount - grandTotal);
    const changeDueEl = document.getElementById('pos-change-due');
    if (changeDueEl) changeDueEl.innerText = Utils.formatCurrency(changeDue);

    // Fallback: ensure paid amount is set after any async DOM updates
    setTimeout(() => {
      const pi = document.getElementById('pos-paid-amount');
      if (pi && parseFloat(pi.value) !== grandTotal) {
        pi.value = grandTotal.toFixed(2);
      }
    }, 50);
  },

  async handleQuickCustomerAdd(e) {
    e.preventDefault();
    const name = document.getElementById('quick-cust-name').value;
    const phone = document.getElementById('quick-cust-phone').value;

    try {
      const res = await fetch('api/customers.php?action=add', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name, phone })
      });
      const data = await res.json();

      if (data.status === 'success') {
        Utils.showToast('Customer registered!', 'success');
        document.getElementById('pos-cust-modal').classList.remove('active');
        document.getElementById('pos-cust-form').reset();
        await this.loadCustomers();
        this.selectedCustomerId = data.id;
        document.getElementById('pos-customer-select').value = data.id;
      } else {
        Utils.showToast(data.message, 'error');
      }
    } catch (err) {
      Utils.showToast('Error registering customer.', 'error');
    }
  },

  async processCheckout() {
    if (this.cart.length === 0) {
      Utils.showToast('Please add items to cart before checkout.', 'warning');
      return;
    }

    const subtotal = this.cart.reduce((sum, item) => sum + (item.unit_price * item.quantity), 0);
    const taxAmount = 0;
    const discountAmount = 0;
    const grandTotal = subtotal;

    const paymentMethod = document.getElementById('pos-payment-method').value;
    let paidAmount = parseFloat(document.getElementById('pos-paid-amount').value || 0);

    if (paymentMethod !== 'cash') paidAmount = grandTotal;

    if (paidAmount < grandTotal && paymentMethod === 'cash') {
      Utils.showToast(`Paid amount (${Utils.formatCurrency(paidAmount)}) is less than Grand Total (${Utils.formatCurrency(grandTotal)}).`, 'error');
      return;
    }

    const changeAmount = paidAmount - grandTotal;
    const btn = document.getElementById('pos-checkout-btn');
    btn.disabled = true;
    btn.innerHTML = `<i data-lucide="loader" class="spin"></i> Processing Checkout...`;

    const payload = {
      customer_id: this.selectedCustomerId,
      items: this.cart,
      subtotal,
      tax_amount: taxAmount,
      discount_amount: discountAmount,
      grand_total: grandTotal,
      paid_amount: paidAmount,
      change_amount: changeAmount,
      payment_method: paymentMethod
    };

    try {
      const res = await fetch('api/pos.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();

      if (data.status === 'success') {
        Utils.showToast('Checkout completed successfully!', 'success');
        this.cart = [];
        this.renderCartItems();
        this.loadMedicines(); // Refresh stock quantities

        this.openReceiptModal(data.invoice);
      } else {
        Utils.showToast(data.message || 'Checkout failed.', 'error');
      }
    } catch (e) {
      Utils.showToast('Server error processing checkout.', 'error');
    } finally {
      btn.disabled = false;
      btn.innerHTML = `<i data-lucide="check-circle-2"></i> Complete Sale & Print Invoice`;
      if (window.lucide) lucide.createIcons();
    }
  },

  openReceiptModal(inv) {
    const body = document.getElementById('receipt-modal-body');
    body.innerHTML = `
      <div><strong>Invoice #:</strong> <code>${inv.invoice_no}</code></div>
      <div><strong>Date:</strong> ${inv.sale_date}</div>
      <div><strong>Customer:</strong> ${inv.customer_name}</div>
      <div><strong>Payment Method:</strong> ${inv.payment_method}</div>
      <hr style="margin:10px 0; border:0; border-top:1px dashed var(--border-color);">
      <table style="width:100%; font-size:12px;">
        ${inv.items.map(i => `
          <tr>
            <td>${i.name} × ${i.quantity}</td>
            <td style="text-align:right;">${Utils.formatCurrency(i.subtotal)}</td>
          </tr>
        `).join('')}
      </table>
      <hr style="margin:10px 0; border:0; border-top:1px dashed var(--border-color);">
      <div style="display:flex; justify-content:space-between; font-weight:bold; font-size:14px; color:var(--primary);">
        <span>GRAND TOTAL:</span> <span>${Utils.formatCurrency(inv.grand_total)}</span>
      </div>
    `;

    document.getElementById('print-thermal-btn').onclick = () => Utils.printThermalReceipt(inv);
    document.getElementById('print-a4-btn').onclick = () => Utils.printA4Invoice(inv);

    document.getElementById('receipt-modal').classList.add('active');
  },

  closeReceiptModal() {
    document.getElementById('receipt-modal').classList.remove('active');
  }
};
