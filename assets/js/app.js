/* ==========================================================================
   M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
   Main SPA App Controller
   Authentication • Routing • Navigation • Theme • Roles • Mobile UI
   ========================================================================== */

const App = {
  currentUser: null,
  currentRoute: 'dashboard',

  theme: localStorage.getItem('mcares_theme') || 'light',

  /* ========================================================================
     APPLICATION INITIALIZATION
     ======================================================================== */

  async init() {
    // Apply saved theme immediately
    this.applyTheme(this.theme);

    // Check whether the user already has an active session
    try {
      const response = await fetch('api/auth.php?action=check', {
        method: 'GET',
        credentials: 'same-origin',
        headers: {
          'Accept': 'application/json'
        }
      });

      if (!response.ok) {
        throw new Error(`Session check failed: ${response.status}`);
      }

      const data = await response.json();

      if (data.logged_in && data.user) {
        this.currentUser = data.user;

        this.renderAppLayout();
        this.navigateTo('dashboard');
      } else {
        this.renderLoginView();
      }

    } catch (error) {
      console.error('Session check failed:', error);

      this.currentUser = null;
      this.renderLoginView();
    }
  },


  /* ========================================================================
     THEME MANAGEMENT
     ======================================================================== */

  applyTheme(themeName) {
    const validThemes = ['light', 'dark'];

    if (!validThemes.includes(themeName)) {
      themeName = 'light';
    }

    this.theme = themeName;

    document.documentElement.setAttribute(
      'data-theme',
      themeName
    );

    localStorage.setItem(
      'mcares_theme',
      themeName
    );

    this.refreshThemeIcon();
  },


  refreshThemeIcon() {
    const themeIcon = document.getElementById('theme-icon');

    if (!themeIcon) {
      return;
    }

    themeIcon.setAttribute(
      'data-lucide',
      this.theme === 'dark'
        ? 'sun'
        : 'moon'
    );

    if (window.lucide) {
      lucide.createIcons();
    }
  },


  toggleTheme() {
    const newTheme =
      this.theme === 'light'
        ? 'dark'
        : 'light';

    this.applyTheme(newTheme);

    if (typeof Utils !== 'undefined' && Utils.showToast) {
      Utils.showToast(
        `Switched to ${newTheme.toUpperCase()} mode.`,
        'info'
      );
    }
  },


  /* ========================================================================
     LOGIN VIEW
     ======================================================================== */

  renderLoginView() {
    const appEl = document.getElementById('app');

    if (!appEl) {
      console.error('#app element was not found.');
      return;
    }

    appEl.innerHTML = `
      <div class="login-container">

        <!-- Background Decoration -->
        <div class="login-bg-decor"></div>

        <!-- Login Card -->
        <div class="login-card">

          <!-- Brand -->
          <div class="login-logo">

            <img
              src="assets/js/logo.jpg"
              alt="M-Care Logo"
              width="70"
              height="70"
            >

            <div>
              <h1>M - CARE MCPMS</h1>

              <div
                style="
                  font-size:12px;
                  color:var(--primary);
                  font-weight:600;
                "
              >
                MODERN PHARMACY MANAGEMENT
              </div>
            </div>

          </div>


          <!-- Login Form -->
          <form id="login-form">

            <!-- Username -->
            <div class="form-group">

              <label
                for="login-username"
                class="form-label"
              >
                Username
              </label>

              <input
                type="text"
                id="login-username"
                class="form-control"
                placeholder="Enter username"
                autocomplete="username"
                required
              >

            </div>


            <!-- Password -->
            <div class="form-group">

              <label
                for="login-password"
                class="form-label"
              >
                Password
              </label>

              <input
                type="password"
                id="login-password"
                class="form-control"
                placeholder="Enter password"
                autocomplete="current-password"
                required
              >

            </div>


            <!-- Submit -->
            <button
              type="submit"
              class="btn btn-primary btn-block btn-lg"
              id="login-submit-btn"
            >
              <i data-lucide="log-in"></i>
              <span>Sign In</span>
            </button>

          </form>

        </div>

      </div>
    `;


    // Initialize Lucide icons
    if (window.lucide) {
      lucide.createIcons();
    }


    // Login form
    const loginForm = document.getElementById('login-form');

    if (!loginForm) {
      return;
    }


    loginForm.addEventListener('submit', async (event) => {
      event.preventDefault();

      await this.handleLogin();
    });
  },


  /* ========================================================================
     LOGIN HANDLER
     ======================================================================== */

  async handleLogin() {
    const usernameInput =
      document.getElementById('login-username');

    const passwordInput =
      document.getElementById('login-password');

    const submitButton =
      document.getElementById('login-submit-btn');


    if (
      !usernameInput ||
      !passwordInput ||
      !submitButton
    ) {
      return;
    }


    const username =
      usernameInput.value.trim();

    const password =
      passwordInput.value;


    if (!username || !password) {
      this.showToast(
        'Please enter your username and password.',
        'error'
      );

      return;
    }


    // Disable button
    submitButton.disabled = true;

    submitButton.innerHTML = `
      <i data-lucide="loader" class="spin"></i>
      <span>Signing in...</span>
    `;

    if (window.lucide) {
      lucide.createIcons();
    }


    try {
      const response = await fetch(
        'api/auth.php?action=login',
        {
          method: 'POST',

          credentials: 'same-origin',

          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },

          body: JSON.stringify({
            username,
            password
          })
        }
      );


      if (!response.ok) {
        throw new Error(
          `Login request failed: ${response.status}`
        );
      }


      const data =
        await response.json();


      if (data.status === 'success') {

        this.currentUser =
          data.user;


        this.showToast(
          data.message || 'Login successful.',
          'success'
        );


        this.renderAppLayout();

        this.navigateTo('dashboard');

      } else {

        this.showToast(
          data.message || 'Invalid username or password.',
          'error'
        );


        submitButton.disabled = false;

        submitButton.innerHTML = `
          <i data-lucide="log-in"></i>
          <span>Secure Sign In</span>
        `;


        if (window.lucide) {
          lucide.createIcons();
        }
      }

    } catch (error) {

      console.error('Login error:', error);

      this.showToast(
        'Unable to connect to the server. Please try again.',
        'error'
      );


      submitButton.disabled = false;

      submitButton.innerHTML = `
        <i data-lucide="log-in"></i>
        <span>Secure Sign In</span>
      `;


      if (window.lucide) {
        lucide.createIcons();
      }
    }
  },


  /* ========================================================================
     APPLICATION LAYOUT
     ======================================================================== */

  renderAppLayout() {

    if (!this.currentUser) {
      this.renderLoginView();
      return;
    }


    const isFounder =
      this.currentUser.role === 'founder';


    const appEl =
      document.getElementById('app');


    if (!appEl) {
      return;
    }


    const fullName =
      this.escapeHTML(
        this.currentUser.full_name || 'User'
      );


    const role =
      this.escapeHTML(
        this.currentUser.role || 'staff'
      );


    const avatarLetter =
      (this.currentUser.full_name || 'U')
        .charAt(0)
        .toUpperCase();


    appEl.innerHTML = `

      <!-- ================================================================
           SIDEBAR
           ================================================================ -->

      <aside
        class="sidebar"
        id="app-sidebar"
      >

        <!-- Sidebar Header -->
        <div class="sidebar-header">

          <div class="brand-">
            <img
              src="assets/js/logo.jpg"
              alt="M-Care Logo"
              width="70"
              height="70"
              style="border-radius:50%"
            >
          </div>

          <div>
            <div class="brand-title">
              M - CARE
            </div>

            <div class="brand-subtitle">
              Pharmacy Management
            </div>
          </div>

        </div>


        <!-- ============================================================
             NAVIGATION
             ============================================================ -->

        <nav class="sidebar-nav">

          <!-- Core Operations -->
          <div class="nav-section-title">
            Core Operations
          </div>


          <a
            href="#"
            class="nav-item"
            data-route="dashboard"
          >
            <i data-lucide="layout-dashboard"></i>
            <span>Dashboard</span>
          </a>


          <a
            href="#"
            class="nav-item"
            data-route="pos"
          >
            <i data-lucide="shopping-cart"></i>
            <span>Point of Sale (POS)</span>
          </a>


          <a
            href="#"
            class="nav-item"
            data-route="prescriptions"
          >
            <i data-lucide="file-text"></i>
            <span>Prescriptions</span>
          </a>


          <!-- Inventory -->
          <div class="nav-section-title">
            Inventory & Stock
          </div>


          <a
            href="#"
            class="nav-item"
            data-route="inventory"
          >
            <i data-lucide="pill"></i>
            <span>Medicines Catalog</span>
          </a>


          <a
            href="#"
            class="nav-item"
            data-route="categories"
          >
            <i data-lucide="tags"></i>
            <span>Categories</span>
          </a>


          <a
            href="#"
            class="nav-item"
            data-route="suppliers"
          >
            <i data-lucide="truck"></i>
            <span>Suppliers</span>
          </a>


          <a
            href="#"
            class="nav-item"
            data-route="purchases"
          >
            <i data-lucide="package-plus"></i>
            <span>Stock Purchases</span>
          </a>


          <a
            href="#"
            class="nav-item"
            data-route="customers"
          >
            <i data-lucide="users"></i>
            <span>Customers</span>
          </a>


          ${
            isFounder
              ? `

                <!-- Founder Management -->
                <div class="nav-section-title">
                  Founder & Management
                </div>


                <a
                  href="#"
                  class="nav-item"
                  data-route="reports"
                >
                  <i data-lucide="bar-chart-3"></i>
                  <span>Financial & Reports</span>
                </a>


                <a
                  href="#"
                  class="nav-item"
                  data-route="users"
                >
                  <i data-lucide="user-check"></i>
                  <span>Staff & Roles</span>
                </a>


                <a
                  href="#"
                  class="nav-item"
                  data-route="logs"
                >
                  <i data-lucide="shield-check"></i>
                  <span>Audit Logs</span>
                </a>


                <a
                  href="#"
                  class="nav-item"
                  data-route="settings"
                >
                  <i data-lucide="settings"></i>
                  <span>System & Backup</span>
                </a>

              `
              : `

                <!-- Staff Portal -->
                <div class="nav-section-title">
                  Staff Portal
                </div>


                <a
                  href="#"
                  class="nav-item"
                  data-route="reports"
                >
                  <i data-lucide="file-spreadsheet"></i>
                  <span>Sales History</span>
                </a>

              `
          }

        </nav>


        <!-- ============================================================
             SIDEBAR FOOTER
             ============================================================ -->

        <div class="sidebar-footer">

          <div class="user-profile-widget">

            <div class="user-avatar">
              ${avatarLetter}
            </div>

            <div class="user-info">

              <div class="user-name">
                ${fullName}
              </div>

              <div class="user-role-badge ${role}">
                ${role}
              </div>

            </div>

          </div>


          <button
            class="action-icon-btn"
            id="logout-btn"
            title="Logout"
            aria-label="Logout"
          >
            <i data-lucide="log-out"></i>
          </button>

        </div>

      </aside>


      <!-- ================================================================
           MAIN WRAPPER
           ================================================================ -->

      <div class="main-wrapper">

        <!-- Top Header -->
        <header class="top-header">

          <div class="header-title-area">

            <button
              class="mobile-menu-toggle"
              id="mobile-menu-btn"
              aria-label="Open menu"
            >
              <i data-lucide="menu"></i>
            </button>


            <h2 id="page-title">
              Dashboard
            </h2>

          </div>


          <!-- Header Actions -->
          <div class="header-actions">

            <!-- Quick POS -->
            <button
              class="btn btn-sm btn-primary"
              id="quick-pos-btn"
            >
              <i data-lucide="shopping-bag"></i>
              <span>Quick POS Checkout</span>
            </button>


            <!-- Theme -->
            <button
              class="action-icon-btn"
              id="theme-toggle-btn"
              title="Toggle Light/Dark Theme"
              aria-label="Toggle Light/Dark Theme"
            >
              <i
                data-lucide="${this.theme === 'dark' ? 'sun' : 'moon'}"
                id="theme-icon"
              ></i>
            </button>

          </div>

        </header>


        <!-- Page Content -->
        <main
          class="page-body"
          id="page-content"
        >
          <!-- Dynamic module content -->
        </main>

      </div>
    `;


    // Create Lucide icons
    if (window.lucide) {
      lucide.createIcons();
    }


    // Bind navigation
    this.bindNavigationEvents();


    // Theme button
    const themeButton =
      document.getElementById('theme-toggle-btn');

    if (themeButton) {
      themeButton.addEventListener(
        'click',
        () => this.toggleTheme()
      );
    }


    // Mobile menu
    const mobileMenuButton =
      document.getElementById('mobile-menu-btn');

    if (mobileMenuButton) {
      mobileMenuButton.addEventListener(
        'click',
        () => this.toggleMobileSidebar()
      );
    }


    // Logout
    const logoutButton =
      document.getElementById('logout-btn');

    if (logoutButton) {
      logoutButton.addEventListener(
        'click',
        () => this.logout()
      );
    }


    // Quick POS
    const quickPOSButton =
      document.getElementById('quick-pos-btn');

    if (quickPOSButton) {
      quickPOSButton.addEventListener(
        'click',
        () => this.navigateTo('pos')
      );
    }
  },


  /* ========================================================================
     NAVIGATION EVENTS
     ======================================================================== */

  bindNavigationEvents() {

    const navItems =
      document.querySelectorAll('.nav-item');


    navItems.forEach(item => {

      item.addEventListener('click', (event) => {

        event.preventDefault();


        const route =
          item.getAttribute('data-route');


        if (!route) {
          return;
        }


        this.navigateTo(route);


        // Close mobile sidebar
        const sidebar =
          document.getElementById('app-sidebar');


        if (sidebar) {
          sidebar.classList.remove('mobile-open');
        }

      });

    });
  },


  /* ========================================================================
     MOBILE SIDEBAR
     ======================================================================== */

  toggleMobileSidebar() {

    const sidebar =
      document.getElementById('app-sidebar');


    if (!sidebar) {
      return;
    }


    sidebar.classList.toggle('mobile-open');
  },


  /* ========================================================================
     LOGOUT
     ======================================================================== */

  async logout() {

    try {

      await fetch(
        'api/auth.php?action=logout',
        {
          method: 'POST',
          credentials: 'same-origin',
          headers: {
            'Accept': 'application/json'
          }
        }
      );

    } catch (error) {

      console.error(
        'Logout request failed:',
        error
      );

    }


    // Clear application session
    this.currentUser = null;
    this.currentRoute = 'dashboard';


    this.showToast(
      'Logged out successfully.',
      'info'
    );


    // Return to login
    this.renderLoginView();
  },


  /* ========================================================================
     ROUTING
     ======================================================================== */

  navigateTo(route) {

    if (!route) {
      route = 'dashboard';
    }


    // Prevent staff from manually accessing founder-only modules
    if (
      this.currentUser &&
      this.currentUser.role !== 'founder'
    ) {

      const founderOnlyRoutes = [
        'users',
        'logs',
        'settings'
      ];


      if (founderOnlyRoutes.includes(route)) {

        this.showToast(
          'You do not have permission to access this module.',
          'error'
        );


        route = 'dashboard';
      }
    }


    this.currentRoute = route;


    // Update active navigation
    document
      .querySelectorAll('.nav-item')
      .forEach(item => {

        const itemRoute =
          item.getAttribute('data-route');


        if (itemRoute === route) {
          item.classList.add('active');
        } else {
          item.classList.remove('active');
        }

      });


    // Page title
    const titleMap = {

      dashboard:
        'Live Pharmacy Dashboard',

      pos:
        'Point of Sale (POS) Checkout',

      prescriptions:
        'Prescription Records & Dispensing',

      inventory:
        'Medicine Inventory Catalog',

      categories:
        'Medicine Categories',

      suppliers:
        'Supplier Management',

      purchases:
        'Stock Purchases',

      customers:
        'Customer Directory',

      reports:
        'Analytics & Financial Reports',

      users:
        'User Roles & Staff Accounts',

      logs:
        'System Audit Logs',

      settings:
        'Pharmacy Profile & Database Settings'

    };


    const titleElement =
      document.getElementById('page-title');


    if (titleElement) {

      titleElement.innerText =
        titleMap[route] ||
        'Pharmacy Management';

    }


    // Content container
    const contentElement =
      document.getElementById('page-content');


    if (!contentElement) {
      return;
    }


    // Loading screen
    contentElement.innerHTML = `
      <div
        class="module-loading"
        style="
          padding:40px;
          text-align:center;
          color:var(--text-muted);
        "
      >
        <i
          data-lucide="loader"
          class="spin"
        ></i>

        <div style="margin-top:10px;">
          Loading module...
        </div>
      </div>
    `;


    if (window.lucide) {
      lucide.createIcons();
    }


    // Render requested module
    try {

      switch (route) {

        case 'dashboard':

          Dashboard.render(contentElement);

          break;


        case 'pos':

          POS.render(contentElement);

          break;


        case 'inventory':

          Inventory.render(contentElement);

          break;


        case 'categories':

          Categories.render(contentElement);

          break;


        case 'suppliers':

          Suppliers.render(contentElement);

          break;


        case 'purchases':

          Purchases.render(contentElement);

          break;


        case 'customers':

          Customers.render(contentElement);

          break;


        case 'prescriptions':

          Prescriptions.render(contentElement);

          break;


        case 'reports':

          Reports.render(contentElement);

          break;


        case 'users':

          Users.render(contentElement);

          break;


        case 'logs':

          Logs.render(contentElement);

          break;


        case 'settings':

          Settings.render(contentElement);

          break;


        default:

          Dashboard.render(contentElement);

          break;
      }


    } catch (error) {

      console.error(
        `Error loading route "${route}":`,
        error
      );


      contentElement.innerHTML = `
        <div class="card fade-in">

          <div
            style="
              text-align:center;
              padding:50px 20px;
            "
          >

            <div
              style="
                width:60px;
                height:60px;
                margin:0 auto 18px;
                border-radius:50%;
                background:var(--danger-light);
                color:var(--danger);
                display:flex;
                align-items:center;
                justify-content:center;
              "
            >
              <i
                data-lucide="alert-triangle"
                style="width:28px;height:28px;"
              ></i>
            </div>


            <h3>
              Unable to Load Module
            </h3>


            <p
              style="
                margin-top:8px;
                color:var(--text-muted);
              "
            >
              Something went wrong while loading
              this section.
            </p>


            <button
              class="btn btn-primary"
              style="margin-top:20px;"
              onclick="App.navigateTo('dashboard')"
            >
              <i data-lucide="layout-dashboard"></i>
              Return to Dashboard
            </button>

          </div>

        </div>
      `;


      if (window.lucide) {
        lucide.createIcons();
      }


      this.showToast(
        'Unable to load the requested module.',
        'error'
      );
    }
  },


  /* ========================================================================
     TOAST HELPER
     ======================================================================== */

  showToast(message, type = 'info') {

    if (
      typeof Utils !== 'undefined' &&
      typeof Utils.showToast === 'function'
    ) {

      Utils.showToast(
        message,
        type
      );

      return;
    }


    // Fallback toast
    let container =
      document.getElementById(
        'app-toast-container'
      );


    if (!container) {

      container =
        document.createElement('div');

      container.id =
        'app-toast-container';


      container.style.cssText = `
        position:fixed;
        top:20px;
        right:20px;
        z-index:99999;
        display:flex;
        flex-direction:column;
        gap:10px;
      `;


      document.body.appendChild(
        container
      );
    }


    const toast =
      document.createElement('div');


    toast.textContent =
      message;


    toast.style.cssText = `
      min-width:280px;
      max-width:380px;
      padding:14px 18px;
      border-radius:10px;
      color:#fff;
      font-family:Inter, sans-serif;
      font-size:14px;
      font-weight:600;
      box-shadow:0 10px 30px rgba(0,0,0,.2);
      animation:fadeIn .25s ease;
    `;


    const backgrounds = {

      success: '#10b981',

      error: '#ef4444',

      warning: '#f59e0b',

      info: '#0ea5e9'

    };


    toast.style.background =
      backgrounds[type] ||
      backgrounds.info;


    container.appendChild(
      toast
    );


    setTimeout(() => {

      toast.style.opacity = '0';
      toast.style.transform =
        'translateY(-8px)';
      toast.style.transition =
        'all .25s ease';


      setTimeout(() => {

        toast.remove();

      }, 250);

    }, 3000);
  },


  /* ========================================================================
     HTML ESCAPE
     ======================================================================== */

  escapeHTML(value) {

    const div =
      document.createElement('div');


    div.textContent =
      value == null
        ? ''
        : String(value);


    return div.innerHTML;
  },


  /* ========================================================================
     EVENT COMPATIBILITY
     ======================================================================== */

  bindEvents() {
    // Reserved for global application events.
    // Module-specific events are bound when each module renders.
  }
};


/* ==========================================================================
   APPLICATION START
   ========================================================================== */

document.addEventListener(
  'DOMContentLoaded',
  () => {
    App.init();
  }
);