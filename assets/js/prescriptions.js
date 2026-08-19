/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Prescriptions Controller: Prescription Records & Dispensing Bridge
   ========================================================================== */

const Prescriptions = {
  medicinesList: [],

  async render(container) {
    container.innerHTML = `
      <div class="fade-in">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; flex-wrap:wrap; gap:12px;">
          <input type="text" id="rx-search-input" class="form-control" style="max-width:400px;" placeholder="Search Rx number, patient name, doctor...">
          <button class="btn btn-primary" id="add-rx-btn"><i data-lucide="plus-circle"></i> Record New Prescription</button>
        </div>

        <div class="card">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Rx #</th>
                  <th>Patient Name</th>
                  <th>Age / Gender</th>
                  <th>Prescribing Doctor</th>
                  <th>Hospital / Clinic</th>
                  <th>Medicines Count</th>
                  <th>Status</th>
                  <th>Date</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody id="rx-table-body">
                <tr><td colspan="9" style="text-align:center; color:var(--text-muted);"><i data-lucide="loader" class="spin"></i> Loading prescriptions...</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Add Prescription Modal -->
      <div class="modal-backdrop" id="rx-modal">
        <div class="modal" style="max-width:700px;">
          <div class="modal-header">
            <h3>Record New Patient Prescription</h3>
            <button class="action-icon-btn" onclick="document.getElementById('rx-modal').classList.remove('active')"><i data-lucide="x"></i></button>
          </div>
          <form id="rx-form">
            <div class="modal-body">
              <div style="display:grid; grid-template-columns:2fr 1fr 1fr; gap:16px;">
                <div class="form-group">
                  <label class="form-label">Patient Name *</label>
                  <input type="text" id="rx-patient-name" class="form-control" placeholder="e.g. Johnathan Doe" required>
                </div>
                <div class="form-group">
                  <label class="form-label">Age</label>
                  <input type="number" id="rx-patient-age" class="form-control" placeholder="e.g. 42">
                </div>
                <div class="form-group">
                  <label class="form-label">Gender</label>
                  <select id="rx-patient-gender" class="form-control">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                  </select>
                </div>
              </div>

              <div style="display:grid; grid-template-columns:1fr 1fr; gap:16px;">
                <div class="form-group">
                  <label class="form-label">Doctor Name *</label>
                  <input type="text" id="rx-doctor-name" class="form-control" placeholder="e.g. Dr. Robert Chen, MD" required>
                </div>
                <div class="form-group">
                  <label class="form-label">Hospital / Clinic</label>
                  <input type="text" id="rx-hospital" class="form-control" placeholder="e.g. Central City Hospital">
                </div>
              </div>

              <div style="margin:20px 0; border-top:1px solid var(--border-color); padding-top:16px;">
                <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:12px;">
                  <h4 style="font-size:14px;">Prescribed Medicines & Dosage Instructions</h4>
                  <button type="button" class="btn btn-sm btn-outline" id="rx-add-med-row"><i data-lucide="plus"></i> Add Item</button>
                </div>

                <div id="rx-med-items-container" style="display:flex; flex-direction:column; gap:10px;">
                  <!-- Dynamic Item Rows -->
                </div>
              </div>

              <div class="form-group">
                <label class="form-label">Clinical / Dosage Notes</label>
                <textarea id="rx-notes" class="form-control" rows="2" placeholder="e.g. Take with plenty of water after meals..."></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-outline" onclick="document.getElementById('rx-modal').classList.remove('active')">Cancel</button>
              <button type="submit" class="btn btn-primary"><i data-lucide="check"></i> Save Prescription</button>
            </div>
          </form>
        </div>
      </div>
    `;

    if (window.lucide) lucide.createIcons();

    await this.loadMedicines();
    await this.loadPrescriptions();

    document.getElementById('rx-search-input').addEventListener('input', () => this.loadPrescriptions());
    document.getElementById('add-rx-btn').addEventListener('click', () => this.openAddModal());
    document.getElementById('rx-add-med-row').addEventListener('click', () => this.addMedicineRow());
    document.getElementById('rx-form').addEventListener('submit', (e) => this.handleSave(e));
  },

  async loadMedicines() {
    try {
      const res = await fetch('api/medicines.php');
      const data = await res.json();
      if (data.status === 'success') {
        this.medicinesList = data.data;
      }
    } catch (e) { }
  },

  async loadPrescriptions() {
    const search = document.getElementById('rx-search-input')?.value || '';
    try {
      const res = await fetch(`api/prescriptions.php?search=${encodeURIComponent(search)}`);
      const data = await res.json();

      if (data.status === 'success') {
        this.renderTable(data.data);
      }
    } catch (e) { }
  },

  renderTable(items) {
    const tbody = document.getElementById('rx-table-body');
    if (!items || items.length === 0) {
      tbody.innerHTML = `<tr><td colspan="9" style="text-align:center; color:var(--text-muted); padding:30px;">No prescriptions recorded.</td></tr>`;
      return;
    }

    tbody.innerHTML = items.map(rx => {
      const badgeClass = rx.status === 'dispensed' ? 'badge-success' : (rx.status === 'pending' ? 'badge-warning' : 'badge-danger');
      return `
        <tr>
          <td><code>${rx.rx_number}</code></td>
          <td><strong>${rx.patient_name}</strong></td>
          <td>${rx.patient_age || 'N/A'} yrs / ${rx.patient_gender}</td>
          <td>${rx.doctor_name}</td>
          <td>${rx.hospital_clinic || 'N/A'}</td>
          <td>${rx.item_count} items</td>
          <td><span class="badge ${badgeClass}">${rx.status.toUpperCase()}</span></td>
          <td>${Utils.formatDate(rx.created_at)}</td>
          <td>
            <div style="display:flex; gap:6px;">
              <button class="btn btn-sm btn-primary" onclick="Prescriptions.dispenseToPOS(${rx.id})" title="Dispense at POS">
                <i data-lucide="shopping-bag"></i> Checkout POS
              </button>
            </div>
          </td>
        </tr>
      `;
    }).join('');

    if (window.lucide) lucide.createIcons();
  },

  openAddModal() {
    document.getElementById('rx-form').reset();
    document.getElementById('rx-med-items-container').innerHTML = '';
    this.addMedicineRow();
    document.getElementById('rx-modal').classList.add('active');
  },

  addMedicineRow() {
    const container = document.getElementById('rx-med-items-container');
    const rowId = Date.now();
    const row = document.createElement('div');
    row.id = `rx-row-${rowId}`;
    row.style.cssText = 'display:grid; grid-template-columns:2fr 1fr 1fr 1fr 40px; gap:8px; align-items:center;';

    const medOptions = this.medicinesList.map(m => `<option value="${m.id}">${m.name} (${m.quantity} ${m.packs_cards || 'units'} left)</option>`).join('');

    row.innerHTML = `
      <select class="form-control rx-med-id" style="font-size:12px;" required>${medOptions}</select>
      <input type="text" class="form-control rx-med-dosage" style="font-size:12px;" placeholder="Dosage (500mg)" required value="1 tab">
      <input type="text" class="form-control rx-med-freq" style="font-size:12px;" placeholder="Freq (3x daily)" required value="3x daily">
      <input type="number" class="form-control rx-med-qty" style="font-size:12px;" placeholder="Qty" required value="10">
      <button type="button" class="action-icon-btn" style="color:var(--danger);" onclick="document.getElementById('rx-row-${rowId}').remove()"><i data-lucide="trash"></i></button>
    `;

    container.appendChild(row);
    if (window.lucide) lucide.createIcons();
  },

  async handleSave(e) {
    e.preventDefault();

    const patient_name = document.getElementById('rx-patient-name').value;
    const patient_age = document.getElementById('rx-patient-age').value;
    const patient_gender = document.getElementById('rx-patient-gender').value;
    const doctor_name = document.getElementById('rx-doctor-name').value;
    const hospital_clinic = document.getElementById('rx-hospital').value;
    const notes = document.getElementById('rx-notes').value;

    const itemRows = document.querySelectorAll('#rx-med-items-container > div');
    const items = [];
    itemRows.forEach(r => {
      items.push({
        medicine_id: r.querySelector('.rx-med-id').value,
        dosage: r.querySelector('.rx-med-dosage').value,
        frequency: r.querySelector('.rx-med-freq').value,
        duration: '7 days',
        quantity: r.querySelector('.rx-med-qty').value
      });
    });

    try {
      const res = await fetch('api/prescriptions.php?action=add', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ patient_name, patient_age, patient_gender, doctor_name, hospital_clinic, notes, items })
      });
      const data = await res.json();

      if (data.status === 'success') {
        Utils.showToast(data.message, 'success');
        document.getElementById('rx-modal').classList.remove('active');
        await this.loadPrescriptions();
      } else {
        Utils.showToast(data.message, 'error');
      }
    } catch (err) {
      Utils.showToast('Error saving prescription.', 'error');
    }
  },

  async dispenseToPOS(rxId) {
    try {
      const res = await fetch(`api/prescriptions.php?id=${rxId}`);
      const data = await res.json();

      if (data.status === 'success') {
        const rx = data.data;
        App.navigateTo('pos');

        setTimeout(() => {
          POS.clearCart();
          rx.items.forEach(item => {
            POS.addToCart(parseInt(item.medicine_id));
          });
          Utils.showToast(`Prescription ${rx.rx_number} items transferred to POS cart!`, 'success');
        }, 300);
      }
    } catch (e) {
      Utils.showToast('Error fetching prescription details.', 'error');
    }
  }
};
