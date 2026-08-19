/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Inventory View Controller: Medicine CRUD & Barcode Generator
   ========================================================================== */

const Inventory = {
  categories: [],
  medicines: [],

  async render(container) {
    container.innerHTML = `
      <div class="fade-in">
        <!-- Header Actions -->
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; flex-wrap:wrap; gap:12px;">
          <div style="display:flex; gap:12px; flex:1; max-width:600px;">
            
            <!-- Search Field -->
            <input 
              type="text" 
              id="inv-search-input" 
              class="form-control" 
              placeholder="Search medicine, generic name, barcode, batch #..."
              autocomplete="off"
            >

            <!-- Filter -->
            <select id="inv-filter-select" class="form-control" style="width:180px;">
              <option value="">All Filter Status</option>
              <option value="low_stock">⚠️ Low Stock Items</option>
              <option value="expiring">⏳ Expiring (90 Days)</option>
              <option value="expired">🚨 Expired Items</option>
            </select>
          </div>

          <div style="display:flex; gap:10px;">
            <button class="btn btn-outline" id="inv-export-btn">
              <i data-lucide="file-spreadsheet"></i> Export Excel
            </button>

            ${App.currentUser.role === 'founder' ? `
              <button class="btn btn-primary" id="add-med-btn">
                <i data-lucide="plus-circle"></i> Add New Medicine
              </button>
            ` : ''}
          </div>
        </div>

        <!-- Inventory Data Table -->
        <div class="card">
          <div class="table-responsive">
            <table class="table" id="inventory-table">
              <thead>
                <tr>
                  <th>Barcode</th>
                  <th>Medicine Name</th>
                  <th>Generic Name</th>
                  <th>Category</th>
                  <th>Packs / Cards</th>
                  <th>Batch #</th>
                  <th>Purchase Cost</th>
                  <th>Selling Price</th>
                  <th>Stock Qty</th>
                  <th>Expiry Date</th>
                  <th>Location</th>
                  ${App.currentUser.role === 'founder' ? '<th>Actions</th>' : ''}
                </tr>
              </thead>

              <tbody id="inventory-table-body">
                <tr>
                  <td 
                    colspan="${App.currentUser.role === 'founder' ? 12 : 11}" 
                    style="text-align:center; color:var(--text-muted);"
                  >
                    <i data-lucide="loader" class="spin"></i> Loading catalog...
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Add/Edit Medicine Modal -->
      <div class="modal-backdrop" id="med-modal">
        <div class="modal" style="max-width:700px;">

          <div class="modal-header">
            <h3 id="med-modal-title">Add New Medicine Record</h3>

            <button 
              class="action-icon-btn" 
              onclick="Inventory.closeModal()"
            >
              <i data-lucide="x"></i>
            </button>
          </div>

          <form id="med-form">

            <div class="modal-body">

              <input type="hidden" id="med-id" value="">

              <!-- Medicine Name / Generic -->
              <div style="display:grid; grid-template-columns:1fr 1fr; gap:16px;">

                <div class="form-group">
                  <label class="form-label">Medicine Name *</label>

                  <input 
                    type="text" 
                    id="med-name" 
                    class="form-control" 
                    placeholder="e.g. Amoxicillin 500mg" 
                    required
                  >
                </div>

                <div class="form-group">
                  <label class="form-label">Generic Name *</label>

                  <input 
                    type="text" 
                    id="med-generic" 
                    class="form-control" 
                    placeholder="e.g. Amoxicillin Trihydrate" 
                    required
                  >
                </div>

              </div>

              <!-- Brand / Unit / Category -->
              <div style="display:grid; grid-template-columns:1fr 1fr 1fr; gap:16px;">

                <div class="form-group">
                  <label class="form-label">Brand / Trade Name</label>

                  <input 
                    type="text" 
                    id="med-brand" 
                    class="form-control" 
                    placeholder="e.g. Amoxil"
                  >
                </div>

                <div class="form-group">

                  <label class="form-label">
                    Quantity Unit (Packs/Cards)
                  </label>

                  <select 
                    id="med-packs-cards-unit" 
                    class="form-control" 
                    onchange="Inventory.handleUnitChange(this.value)"
                  >
                    <option value="Packs">Packs</option>
                    <option value="Cards">Cards</option>
                    <option value="Boxes">Boxes</option>
                    <option value="Bottles">Bottles</option>
                    <option value="Sachets">Sachets</option>
                    <option value="Tubes">Tubes</option>
                    <option value="Vials">Vials</option>
                    <option value="Tablets">Tablets</option>
                    <option value="Units">Units</option>
                    <option value="custom">✏️ Custom Unit...</option>
                  </select>

                  <input 
                    type="text" 
                    id="med-packs-cards" 
                    class="form-control" 
                    style="margin-top:6px; display:none;" 
                    placeholder="Specify custom unit..."
                  >

                </div>

                <div class="form-group">

                  <label class="form-label">Category *</label>

                  <select 
                    id="med-category" 
                    class="form-control" 
                    required
                  ></select>

                </div>

              </div>

              <!-- Batch / Barcode / Manufacturer -->
              <div style="display:grid; grid-template-columns:1fr 1fr 1fr; gap:16px;">

                <div class="form-group">

                  <label class="form-label">Batch Number</label>

                  <input 
                    type="text" 
                    id="med-batch" 
                    class="form-control" 
                    placeholder="e.g. BATCH-2026"
                  >

                </div>

                <div class="form-group">

                  <label class="form-label">Barcode Number</label>

                  <input 
                    type="text" 
                    id="med-barcode" 
                    class="form-control" 
                    placeholder="Auto-generated if empty"
                  >

                </div>

                <div class="form-group">

                  <label class="form-label">Manufacturer</label>

                  <input 
                    type="text" 
                    id="med-manufacturer" 
                    class="form-control" 
                    placeholder="e.g. GSK Health"
                  >

                </div>

              </div>

              <!-- Prices / Quantity -->
              <div style="display:grid; grid-template-columns:1fr 1fr 1fr 1fr; gap:16px;">

                <div class="form-group">

                  <label class="form-label">Purchase Price *</label>

                  <input 
                    type="number" 
                    step="0.01" 
                    id="med-purchase-price" 
                    class="form-control" 
                    required 
                    value="0.00"
                  >

                </div>

                <div class="form-group">

                  <label class="form-label">Selling Price *</label>

                  <input 
                    type="number" 
                    step="0.01" 
                    id="med-selling-price" 
                    class="form-control" 
                    required 
                    value="0.00"
                  >

                </div>

                <div class="form-group">

                  <label class="form-label">Initial Quantity *</label>

                  <input 
                    type="number" 
                    id="med-quantity" 
                    class="form-control" 
                    required 
                    value="50"
                  >

                </div>

                <div class="form-group">

                  <label class="form-label">Reorder Level *</label>

                  <input 
                    type="number" 
                    id="med-reorder" 
                    class="form-control" 
                    required 
                    value="10"
                  >

                </div>

              </div>

              <!-- Expiry / Location -->
              <div style="display:grid; grid-template-columns:1fr 1fr; gap:16px;">

                <div class="form-group">

                  <label class="form-label">Expiry Date *</label>

                  <input 
                    type="date" 
                    id="med-expiry" 
                    class="form-control" 
                    required
                  >

                </div>

                <div class="form-group">

                  <label class="form-label">Storage Location</label>

                  <input 
                    type="text" 
                    id="med-location" 
                    class="form-control" 
                    placeholder="e.g. Shelf A-1 or Fridge 2" 
                    value="Shelf A-1"
                  >

                </div>

              </div>

            </div>

            <div class="modal-footer">

              <button 
                type="button" 
                class="btn btn-outline" 
                onclick="Inventory.closeModal()"
              >
                Cancel
              </button>

              <button 
                type="submit" 
                class="btn btn-primary" 
                id="save-med-btn"
              >
                <i data-lucide="check"></i> Save Record
              </button>

            </div>

          </form>
        </div>
      </div>

      <!-- Barcode View Modal -->
      <div class="modal-backdrop" id="barcode-modal">

        <div class="modal" style="max-width:400px; text-align:center;">

          <div class="modal-header">

            <h3>Medicine Barcode Tag</h3>

            <button 
              class="action-icon-btn" 
              onclick="document.getElementById('barcode-modal').classList.remove('active')"
            >
              <i data-lucide="x"></i>
            </button>

          </div>

          <div 
            class="modal-body" 
            style="padding:30px 20px;"
          >

            <h4 
              id="barcode-med-name" 
              style="margin-bottom:4px;"
            ></h4>

            <div 
              id="barcode-med-sub" 
              style="font-size:12px; color:var(--text-muted); margin-bottom:16px;"
            ></div>

            <svg 
              id="barcode-svg" 
              style="max-width:100%; height:80px;"
            ></svg>

            <div 
              id="barcode-num-text" 
              style="font-family:monospace; font-size:14px; font-weight:bold; margin-top:8px;"
            ></div>

          </div>

          <div 
            class="modal-footer" 
            style="justify-content:center;"
          >

            <button 
              class="btn btn-primary" 
              onclick="window.print()"
            >
              <i data-lucide="printer"></i> Print Barcode Tag
            </button>

          </div>

        </div>

      </div>
    `;

    if (window.lucide) {
      lucide.createIcons();
    }

    await this.loadCategories();
    await this.loadMedicines();

    /* ==============================================================
       EVENT LISTENERS
       ============================================================== */

    // Search
    const searchInput = document.getElementById('inv-search-input');

    if (searchInput) {

      let searchTimeout;

      searchInput.addEventListener('input', () => {

        clearTimeout(searchTimeout);

        searchTimeout = setTimeout(() => {
          this.filterData();
        }, 150);

      });

    }

    // Filter
    const filterSelect = document.getElementById('inv-filter-select');

    if (filterSelect) {
      filterSelect.addEventListener('change', () => {
        this.loadMedicines();
      });
    }

    // Add medicine
    const addMedBtn = document.getElementById('add-med-btn');

    if (addMedBtn) {
      addMedBtn.addEventListener('click', () => {
        this.openAddModal();
      });
    }

    // Export
    const exportBtn = document.getElementById('inv-export-btn');

    if (exportBtn) {
      exportBtn.addEventListener('click', () => {
        Utils.exportToExcel(
          'inventory-table',
          'Medicine_Inventory.xlsx'
        );
      });
    }

    // Medicine form
    const medForm = document.getElementById('med-form');

    if (medForm) {
      medForm.addEventListener('submit', (e) => {
        this.handleSave(e);
      });
    }
  },

  /* ==============================================================
     LOAD CATEGORIES
     ============================================================== */

  async loadCategories() {

    try {

      const res = await fetch('api/categories.php');
      const data = await res.json();

      if (data.status === 'success') {

        this.categories = data.data;

        const sel = document.getElementById('med-category');

        if (sel) {

          sel.innerHTML = this.categories
            .map(c => `<option value="${c.id}">${c.name}</option>`)
            .join('');

        }
      }

    } catch (e) {

      console.error('Failed to load categories:', e);

    }
  },

  /* ==============================================================
     LOAD MEDICINES
     ============================================================== */

  async loadMedicines() {

    const filter =
      document.getElementById('inv-filter-select')?.value || '';

    const search =
      document.getElementById('inv-search-input')?.value || '';

    try {

      const res = await fetch(
        `api/medicines.php?filter=${encodeURIComponent(filter)}&search=${encodeURIComponent(search)}`
      );

      const data = await res.json();

      if (data.status === 'success') {

        this.medicines = Array.isArray(data.data)
          ? data.data
          : [];

        /*
         * Render the complete result returned from PHP.
         *
         * We deliberately do not call filterData() here because
         * PHP may already have applied the filter.
         */
        this.renderTable(this.medicines);

      } else {

        this.medicines = [];
        this.renderTable([]);

      }

    } catch (e) {

      console.error('Failed to load medicines:', e);

      Utils.showToast(
        'Failed to load medicines.',
        'error'
      );

    }
  },

  /* ==============================================================
     RENDER INVENTORY TABLE
     ============================================================== */

  renderTable(items) {

    const tbody =
      document.getElementById('inventory-table-body');

    if (!tbody) return;

    const isFounder =
      App.currentUser.role === 'founder';

    if (!items || items.length === 0) {

      tbody.innerHTML = `
        <tr>
          <td 
            colspan="${isFounder ? 12 : 11}" 
            style="
              text-align:center;
              color:var(--text-muted);
              padding:30px;
            "
          >
            No medicine records found.
          </td>
        </tr>
      `;

      return;
    }

    tbody.innerHTML = items.map(m => {

      const quantity =
        parseInt(m.quantity) || 0;

      const reorderLevel =
        parseInt(m.reorder_level) || 0;

      const isLowStock =
        quantity <= reorderLevel;

      const daysLeft =
        parseInt(m.days_until_expiry);

      const isExpired =
        !isNaN(daysLeft) && daysLeft <= 0;

      const isExpiring =
        !isNaN(daysLeft) &&
        daysLeft > 0 &&
        daysLeft <= 90;

      const medicineName =
        String(m.name ?? '');

      const barcode =
        String(m.barcode ?? '');

      const brand =
        String(m.brand ?? '');

      const genericName =
        String(m.generic_name ?? '');

      const batchNumber =
        String(m.batch_number ?? '');

      const categoryName =
        String(m.category_name ?? '');

      const packsCards =
        String(m.packs_cards ?? '');

      const storageLocation =
        String(m.storage_location ?? '');

      return `
        <tr>

          <!-- Barcode -->
          <td>

            <button 
              class="btn btn-sm btn-outline" 
              onclick="Inventory.showBarcode(
                '${barcode.replace(/'/g, "\\'")}',
                '${medicineName.replace(/'/g, "\\'")}',
                '${brand.replace(/'/g, "\\'")}'
              )"
              title="View/Print Barcode"
            >

              <i data-lucide="barcode"></i>

              <code>${barcode || '-'}</code>

            </button>

          </td>

          <!-- Medicine -->
          <td>

            <strong>${medicineName}</strong>

            <br>

            <small style="color:var(--text-muted);">
              ${brand || 'Generic'}
            </small>

          </td>

          <!-- Generic -->
          <td>
            ${genericName || '-'}
          </td>

          <!-- Category -->
          <td>

            <span class="badge badge-info">
              ${categoryName || '-'}
            </span>

          </td>

          <!-- Unit -->
          <td>

            ${
              packsCards
                ? `<span class="badge badge-secondary">${packsCards}</span>`
                : '<span style="color:var(--text-muted);">-</span>'
            }

          </td>

          <!-- Batch -->
          <td>
            <code>${batchNumber || '-'}</code>
          </td>

          <!-- Purchase -->
          <td>
            ${Utils.formatCurrency(m.purchase_price)}
          </td>

          <!-- Selling -->
          <td>
            <strong>
              ${Utils.formatCurrency(m.selling_price)}
            </strong>
          </td>

          <!-- Stock -->
          <td>

            <span 
              class="badge ${
                isLowStock
                  ? 'badge-warning'
                  : 'badge-success'
              }"
            >

              ${quantity}
              ${packsCards || 'units'}

              ${
                isLowStock
                  ? '(LOW)'
                  : ''
              }

            </span>

          </td>

          <!-- Expiry -->
          <td>

            <span 
              class="badge ${
                isExpired
                  ? 'badge-danger'
                  : (
                    isExpiring
                      ? 'badge-warning'
                      : 'badge-success'
                  )
              }"
            >

              ${Utils.formatDate(m.expiry_date)}

              ${
                isExpired
                  ? '(EXPIRED)'
                  : ''
              }

            </span>

          </td>

          <!-- Location -->
          <td>
            <small>${storageLocation || '-'}</small>
          </td>

          <!-- Actions -->
          ${
            isFounder
              ? `
                <td>

                  <div style="display:flex; gap:6px;">

                    <button 
                      class="action-icon-btn"
                      onclick="Inventory.openEditModal(${m.id})"
                      title="Edit Medicine"
                    >
                      <i data-lucide="edit-3"></i>
                    </button>

                    <button 
                      class="action-icon-btn"
                      style="color:var(--danger);"
                      onclick="Inventory.deleteMedicine(
                        ${m.id},
                        '${medicineName.replace(/'/g, "\\'")}'
                      )"
                      title="Delete Medicine"
                    >
                      <i data-lucide="trash-2"></i>
                    </button>

                  </div>

                </td>
              `
              : ''
          }

        </tr>
      `;

    }).join('');

    if (window.lucide) {
      lucide.createIcons();
    }
  },

  /* ==============================================================
     SEARCH / FILTER DATA
     ============================================================== */

  filterData() {

    const input =
      document.getElementById('inv-search-input');

    if (!input) return;

    const query =
      input.value.trim().toLowerCase();

    /*
     * If search is empty, restore all medicines
     * currently loaded from the database.
     */
    if (!query) {

      this.renderTable(this.medicines);

      return;
    }

    /*
     * Search through all useful medicine fields.
     *
     * String(value ?? '') prevents errors when a database
     * field contains NULL.
     */
    const filtered =
      this.medicines.filter(m => {

        const searchableText = [

          m.name,
          m.generic_name,
          m.brand,
          m.barcode,
          m.batch_number,
          m.packs_cards,
          m.category_name,
          m.manufacturer,
          m.storage_location

        ]
          .map(value =>
            String(value ?? '').toLowerCase()
          )
          .join(' ');

        return searchableText.includes(query);

      });

    this.renderTable(filtered);
  },

  /* ==============================================================
     UNIT CHANGE
     ============================================================== */

  handleUnitChange(val) {

    const customInput =
      document.getElementById('med-packs-cards');

    if (!customInput) return;

    if (val === 'custom') {

      customInput.style.display = 'block';
      customInput.value = '';
      customInput.focus();

    } else {

      customInput.style.display = 'none';
      customInput.value = val;

    }
  },

  /* ==============================================================
     OPEN ADD MODAL
     ============================================================== */

  openAddModal() {

    document.getElementById('med-modal-title').innerText =
      'Add New Medicine Record';

    document.getElementById('med-id').value = '';

    document.getElementById('med-form').reset();

    const sel =
      document.getElementById('med-packs-cards-unit');

    if (sel) {
      sel.value = 'Packs';
    }

    const customInput =
      document.getElementById('med-packs-cards');

    if (customInput) {

      customInput.value = 'Packs';
      customInput.style.display = 'none';

    }

    // Default expiry date: 1 year from now
    const d = new Date();

    d.setFullYear(
      d.getFullYear() + 1
    );

    document.getElementById('med-expiry').value =
      d.toISOString().split('T')[0];

    document.getElementById('med-modal')
      .classList.add('active');
  },

  /* ==============================================================
     OPEN EDIT MODAL
     ============================================================== */

  openEditModal(id) {

    const m =
      this.medicines.find(
        item => parseInt(item.id) === id
      );

    if (!m) return;

    document.getElementById('med-modal-title').innerText =
      'Edit Medicine Record';

    document.getElementById('med-id').value =
      m.id;

    document.getElementById('med-name').value =
      m.name;

    document.getElementById('med-generic').value =
      m.generic_name;

    document.getElementById('med-brand').value =
      m.brand || '';

    const unitVal =
      m.packs_cards || 'Packs';

    const sel =
      document.getElementById('med-packs-cards-unit');

    const customInput =
      document.getElementById('med-packs-cards');

    const standardUnits = [
      'Packs',
      'Cards',
      'Boxes',
      'Bottles',
      'Sachets',
      'Tubes',
      'Vials',
      'Tablets',
      'Units'
    ];

    if (sel && customInput) {

      if (standardUnits.includes(unitVal)) {

        sel.value = unitVal;
        customInput.value = unitVal;
        customInput.style.display = 'none';

      } else {

        sel.value = 'custom';
        customInput.value = unitVal;
        customInput.style.display = 'block';

      }
    }

    document.getElementById('med-category').value =
      m.category_id;

    document.getElementById('med-batch').value =
      m.batch_number;

    document.getElementById('med-barcode').value =
      m.barcode;

    document.getElementById('med-manufacturer').value =
      m.manufacturer || '';

    document.getElementById('med-purchase-price').value =
      m.purchase_price;

    document.getElementById('med-selling-price').value =
      m.selling_price;

    document.getElementById('med-quantity').value =
      m.quantity;

    document.getElementById('med-reorder').value =
      m.reorder_level;

    document.getElementById('med-expiry').value =
      m.expiry_date;

    document.getElementById('med-location').value =
      m.storage_location;

    document.getElementById('med-modal')
      .classList.add('active');
  },

  /* ==============================================================
     CLOSE MODAL
     ============================================================== */

  closeModal() {

    const modal =
      document.getElementById('med-modal');

    if (modal) {
      modal.classList.remove('active');
    }
  },

  /* ==============================================================
     SAVE MEDICINE
     ============================================================== */

  async handleSave(e) {

    e.preventDefault();

    const id =
      document.getElementById('med-id').value;

    const action =
      id ? 'edit' : 'add';

    const selUnit =
      document.getElementById(
        'med-packs-cards-unit'
      )?.value;

    let packsCardsVal =
      document.getElementById(
        'med-packs-cards'
      )?.value || '';

    if (
      selUnit &&
      selUnit !== 'custom'
    ) {
      packsCardsVal = selUnit;
    }

    const payload = {

      id: id
        ? parseInt(id)
        : undefined,

      name:
        document.getElementById('med-name').value,

      generic_name:
        document.getElementById('med-generic').value,

      brand:
        document.getElementById('med-brand').value,

      packs_cards:
        packsCardsVal,

      category_id:
        document.getElementById('med-category').value,

      batch_number:
        document.getElementById('med-batch').value,

      barcode:
        document.getElementById('med-barcode').value,

      manufacturer:
        document.getElementById('med-manufacturer').value,

      purchase_price:
        document.getElementById('med-purchase-price').value,

      selling_price:
        document.getElementById('med-selling-price').value,

      quantity:
        document.getElementById('med-quantity').value,

      reorder_level:
        document.getElementById('med-reorder').value,

      expiry_date:
        document.getElementById('med-expiry').value,

      storage_location:
        document.getElementById('med-location').value
    };

    try {

      const res = await fetch(
        `api/medicines.php?action=${action}`,
        {
          method: 'POST',

          headers: {
            'Content-Type': 'application/json'
          },

          body: JSON.stringify(payload)
        }
      );

      const data =
        await res.json();

      if (data.status === 'success') {

        Utils.showToast(
          data.message,
          'success'
        );

        this.closeModal();

        await this.loadMedicines();

      } else {

        Utils.showToast(
          data.message,
          'error'
        );

      }

    } catch (err) {

      console.error(
        'Error saving medicine:',
        err
      );

      Utils.showToast(
        'Error saving medicine record.',
        'error'
      );

    }
  },

  /* ==============================================================
     DELETE MEDICINE
     ============================================================== */

  async deleteMedicine(id, name) {

    if (
      !confirm(
        `Are you sure you want to delete '${name}' from inventory?`
      )
    ) {
      return;
    }

    try {

      const res =
        await fetch(
          `api/medicines.php?id=${id}`,
          {
            method: 'DELETE'
          }
        );

      const data =
        await res.json();

      if (data.status === 'success') {

        Utils.showToast(
          data.message,
          'success'
        );

        await this.loadMedicines();

      } else {

        Utils.showToast(
          data.message,
          'error'
        );

      }

    } catch (err) {

      console.error(
        'Error deleting medicine:',
        err
      );

      Utils.showToast(
        'Error deleting medicine.',
        'error'
      );
    }
  },

  /* ==============================================================
     SHOW BARCODE
     ============================================================== */

  showBarcode(
    barcodeNum,
    name,
    brand
  ) {

    document.getElementById(
      'barcode-med-name'
    ).innerText = name;

    document.getElementById(
      'barcode-med-sub'
    ).innerText =
      brand
        ? `Brand: ${brand}`
        : 'Generic';

    document.getElementById(
      'barcode-num-text'
    ).innerText = barcodeNum;

    if (window.JsBarcode) {

      JsBarcode(
        "#barcode-svg",
        barcodeNum,
        {
          format: "CODE128",
          lineColor: "#000",
          width: 2,
          height: 50,
          displayValue: false
        }
      );

    }

    document.getElementById(
      'barcode-modal'
    ).classList.add('active');
  }
};