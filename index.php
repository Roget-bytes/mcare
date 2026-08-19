 <!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)</title>
  <meta name="description" content="M - CARE MODERN PHARMACY MANAGEMENT SYSTEM — Smart, Secure, and Efficient Cloud-Based Pharmacy Management.">
  
  <!-- Favicon -->
  <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>💊</text></svg>">

  <!-- Core Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Outfit:wght@400;500;600;700;800&display=swap" rel="stylesheet">

  <!-- Application CSS -->
  <link rel="stylesheet" href="assets/css/style.css">

  <!-- Third-party CDN Libraries -->
  <!-- Lucide Icons -->
  <script src="https://unpkg.com/lucide@latest"></script>
  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!-- JsBarcode -->
  <script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/JsBarcode.all.min.js"></script>
  <!-- SheetJS (XLSX Export) -->
  <script src="https://cdn.jsdelivr.net/npm/xlsx@0.18.5/dist/xlsx.full.min.js"></script>
</head>
<body>

  <!-- Main SPA Container -->
  <div id="app">
    <div style="display:flex; justify-content:center; align-items:center; height:100vh; width:100vw; background:linear-gradient(135deg, #0284c7, #0f172a); color:white; font-family:'Outfit', sans-serif;">
      <div style="text-align:center;">
        <div style="font-size:48px; margin-bottom:10px;">💊</div>
        <h2>M - CARE MCPMS</h2>
        <p style="opacity:0.8; font-size:14px; margin-top:5px;">Initializing Pharmacy Management Engine...</p>
      </div>
    </div>
  </div>

  <!-- JavaScript Application Bundle -->
  <script src="assets/js/utils.js?v=<?= time() ?>"></script>
  <script src="assets/js/dashboard.js?v=<?= time() ?>"></script>
  <script src="assets/js/inventory.js?v=<?= time() ?>"></script>
  <script src="assets/js/pos.js?v=<?= time() ?>"></script>
  <script src="assets/js/reports.js?v=<?= time() ?>"></script>
  <script src="assets/js/prescriptions.js?v=<?= time() ?>"></script>
  <script src="assets/js/users.js?v=<?= time() ?>"></script>
  <script src="assets/js/settings.js?v=<?= time() ?>"></script>
  <script src="assets/js/aux_modules.js?v=<?= time() ?>"></script>
  <script src="assets/js/app.js?v=<?= time() ?>"></script>

</body>
</html>
