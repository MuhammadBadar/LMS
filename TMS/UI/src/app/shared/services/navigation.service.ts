import { Injectable } from "@angular/core";
import { BehaviorSubject } from "rxjs";

interface IMenuItem {
  type: string; // Possible values: link/dropDown/icon/separator/extLink
  name?: string; // Used as display text for item and title for separator type
  state?: string; // Router state
  icon?: string; // Material icon name
  tooltip?: string; // Tooltip text
  disabled?: boolean; // If true, item will not be appeared in sidenav.
  sub?: IChildItem[]; // Dropdown items
  badges?: IBadge[];
}
interface IChildItem {
  type?: string;
  name: string; // Display text
  state?: string; // Router state
  icon?: string;
  sub?: IChildItem[];
}

interface IBadge {
  color: string; // primary/accent/warn/hex color codes(#fff000)
  value: string; // Display text
}

@Injectable()
export class NavigationService {
  constructor() {}
  iconMenu: IMenuItem[] = [
    {
      name: "HOME",
      type: "icon",
      tooltip: "Home",
      icon: "home",
      state: "home"
    },
    {
      name: "PROFILE",
      type: "icon",
      tooltip: "Profile",
      icon: "person",
      state: "profile/overview"
    },
    {
      name: "TOUR",
      type: "icon",
      tooltip: "Tour",
      icon: "flight_takeoff",
      state: "tour"
    },
    // {
    //   type: "separator",
    //   name: "Main Items"
    // },
    {
      name: "DASHBOARD",
      type: "dropDown",
      tooltip: "Dashboard",
      icon: "dashboard",
      state: "dashboard",
      sub: [
        { name: "Default", state: "default" },
        { name: "Analytics", state: "analytics" },
        { name: "Cryptocurrency", state: "crypto" },
        { name: "Dark Cards", state: "dark" }
      ]
    },
    {
      name: "Task",
      type: "dropDown",
      tooltip: "task",
      icon: "center_focus_strong",
      state: "task",
      sub: [
        { name: "Manage Task", state: "managetasks" },
        { name: "Login", state: "login" },
        { name: "Tasks List", state: "taskslist" },
        { name: "Template List", state: "manageTemplate" }
      ]
    }
    ,
    {
      name: "Inquiry",
      type: "dropDown",
      tooltip: "task",
      icon: "center_focus_strong",
      state: "inquiry",
      sub: [
       //{ name: "Login", state: "login" },
       { name: "Login", state: "userlogin" },
        { name: "Manage Inquiry", state: "manageinquiry" },
        {name:"Inquiry List" , state :"inquirylist"},
        { name: "Manage Field", state: "managefield" },
        { name: "Manage Service", state: "manageservice" }
      ]
    },
    {
      name: "Expense",
      type: "dropDown",
      tooltip: "task",
      icon: "center_focus_strong",
      state: "expense",
      sub: [
        { name: "Manage Expense", state: "manageexpense" },
        { name: "Expense Type List", state: "expensetypelist" },
        { name: "Expense List", state: "expenselist" },
        { name: "Login", state: "login" }
       
      ]
    },
    {
      name: "Security",
      type: "dropDown",
      tooltip: "Security",
      icon: "dashboard",
      state: "security",
      sub: [
       // { name: "Login", state: "userlogin" },
        { name: "Manage User", state: "users" },
        { name: "Manage Role", state: "roles" },
        { name: "Assign Role to User", state: "userrole" },
        { name: "Manage Feature", state: "feature" },
        { name: "Manage Permissions", state: "managePermissions" }
      ]
    },
    {
      name: "Attendance",
      type: "dropDown",
      tooltip: "Attendance",
      icon: "dashboard",
      state: "attendance",
      sub: [
        { name: "Login", state: "login" },
        { name: "Daily Report", state: "daily" },
        { name: "Event Log ", state: "logevent" },
      ]
    },
    // {
    //   name: "LMS",
    //   type: "dropDown",
    //   tooltip: "LMS",
    //   icon: "blur_on",
    //   state: "lms",
    //   sub: [
    //     { name: "Login", state: "login"},
    //     {name : "Student Lectures List",state:"studentlec"},        
    //     { name: "Student Registration", state: "stdregistration" },
    //     { name: "Lecture", state: "lecture" },
    //     { name: "Assign Lecture to Student", state: "assignlec" },

     
    //   ]
    // },
    // {
    //   name: "QAFastTrack",
    //   type: "dropDown",
    //   tooltip: "QAFastTrack",
    //   icon: "blur_on",
    //   state: "qafasttrack",
    //   sub: [
    //     { name: "Manage Company", state: "mngCom" },
    //   ]
    // },
    // {
    //   name: "Procurement",
    //   type: "dropDown",
    //   tooltip: "Procurement",
    //   icon: "blur_on",
    //   state: "procurement",
    //   sub: [
    //     { name: "Manage Customer", state: "mngCust" },
    //     { name: " Customer List", state: "custList" },     
    //     { name: " Manage Item", state: "mngItem" },
    //     { name: " Item List", state: "itemList" },
    //     { name: " Sale Order", state: "sOrder" },
    //     { name: "  Order List", state: "orderList" },
    //     { name: " Sale Invoice", state: "sInvoice" },
    //     { name: " Sale Report", state: "sReport" },
    //     { name: " Invoices Report", state: "invReport" },
    //     { name: " Customer Ledger", state: "custLedger" },
     
    //   ]
    // },
    // {
    //   name: "CRUD Table",
    //   type: "link",
    //   tooltip: "CRUD Table",
    //   icon: "format_list_bulleted",
    //   state: "cruds/ngx-table"
    // },
    // {
    //   name: "ECOMMERCE",
    //   type: "dropDown",
    //   tooltip: "Shop",
    //   icon: "shopping_cart",
    //   state: "shop",
    //   sub: [
    //     { name: "PRODUCTS", state: "" },
    //     { name: "PRODUCT DETAILS", state: "products/5a9ae2106f155194e5c95d67" },
    //     { name: "CART", state: "cart" },
    //     { name: "CHECKOUT", state: "checkout" }
    //   ]
    // },
    // {
    //   name: "INBOX",
    //   type: "link",
    //   tooltip: "Inbox",
    //   icon: "inbox",
    //   state: "inbox",
    //   badges: [{ color: "primary", value: "4" }]
    // },
    // {
    //   name: "Invoice",
    //   type: "link",
    //   icon: "receipt",
    //   state: "invoice/list"
    // },
    // {
    //   name: "CHAT",
    //   type: "link",
    //   tooltip: "Chat",
    //   icon: "chat",
    //   state: "chat",
    //   badges: [{ color: "warn", value: "1" }]
    // },
    // {
    //   name: "CALENDAR",
    //   type: "link",
    //   tooltip: "Calendar",
    //   icon: "date_range",
    //   state: "calendar"
    // },
    // {
    //   name: "Todo",
    //   type: "link",
    //   tooltip: "Todo",
    //   icon: "center_focus_strong",
    //   state: "todo/list"
    // },
    // {
    //   name: "DIALOGS",
    //   type: "dropDown",
    //   tooltip: "Dialogs",
    //   icon: "filter_none",
    //   state: "dialogs",
    //   sub: [
    //     { name: "CONFIRM", state: "confirm" },
    //     { name: "LOADER", state: "loader" }
    //   ]
    // },
    
    //     {
    //       name: "Material Kits",
    //       type: "dropDown",
    //       tooltip: "Material",
    //       icon: "favorite",
    //       state: "material",
    //       badges: [{ color: "primary", value: "60+" }],
    //       sub: [
    //         {
    //           name: "Form controls",
    //           type: "dropDown",
    //           sub: [
    //             { name: "Autocomplete", state: "autocomplete" },
    //             { name: "Checkbox", state: "checkbox" },
    //             { name: "Datepicker", state: "datepicker" },
    //             { name: "Form Field", state: "form-field" },
    //             { name: "Input Field", state: "input-field" },
    //             { name: "Radio Button", state: "radio-button" },
    //             { name: "Select", state: "select" },
    //             { name: "Slider", state: "slider" },
    //             { name: "Slider Toggle", state: "slider-toggle" }
    //           ]
    //         },
    //     {
    //       name: "Navigation",
    //       type: "dropDown",
    //       sub: [
    //         { name: "Menu", state: "menu" },
    //         { name: "Sidenav", state: "sidenav" },
    //         { name: "Toolbar", state: "toolbar" }
    //       ]
    //     },
    //     {
    //       name: "Layout",
    //       type: "dropDown",
    //       sub: [
    //         { name: "Card", state: "card" },
    //         { name: "Divider", state: "divider" },
    //         { name: "Expansion Panel", state: "expansion-panel" },
    //         { name: "Grid", state: "grid" },
    //         { name: "List", state: "list" },
    //         { name: "Stepper", state: "stepper" },
    //         { name: "Tab", state: "tab-group" },
    //         { name: "Tree", state: "tree" }
    //       ]
    //     },
    //     {
    //       name: "Buttons & Indicators",
    //       type: "dropDown",
    //       sub: [
    //         { name: "BUTTONS", state: "buttons" },
    //         { name: "Button Toggle", state: "button-toggle" },
    //         { name: "Badge", state: "badge" },
    //         { name: "Chips", state: "chips" },
    //         { name: "Icons", state: "icons" },
    //         { name: "Progress Spinner", state: "progress-spinner" },
    //         { name: "Progress Bar", state: "progress-bar" },
    //         { name: "Ripples", state: "ripples" }
    //       ]
    //     },
    //     {
    //       name: "Popups & Modals",
    //       type: "dropDown",
    //       sub: [
    //         { name: "Tooltip", state: "tooltip" },
    //         { name: "Bottom Sheet", state: "bottom-sheet" },
    //         { name: "Dialog", state: "dialog" },
    //         { name: "Snackbar", state: "snackbar" }
    //       ]
    //     },
    //     {
    //       name: "Data Table",
    //       type: "dropDown",
    //       sub: [
    //         { name: "paginator", state: "paginator" },
    //         { name: "Sort Header", state: "sort-header" },
    //         { name: "Table", state: "table" }
    //       ]
    //     },
    //     { name: "Buttons Loading", state: "loading-buttons" }
    //   ]
    // },
    // {
    //   name: "FORMS",
    //   type: "dropDown",
    //   tooltip: "Forms",
    //   icon: "description",
    //   state: "forms",
    //   sub: [
    //     { name: "BASIC", state: "basic" },
    //     { name: "EDITOR", state: "editor" },
    //     { name: "UPLOAD", state: "upload" },
    //     { name: "WIZARD", state: "wizard" }
    //   ]
    // },
    // {
    //   name: "TABLES",
    //   type: "dropDown",
    //   tooltip: "Tables",
    //   icon: "format_line_spacing",
    //   state: "tables",
    //   sub: [
    //     { name: "FULLSCREEN", state: "fullscreen" },
    //     { name: "PAGING", state: "paging" },
    //     { name: "FILTER", state: "filter" },
    //     { name: "Material Table", state: "mat-table" }
    //   ]
    // },
    // {
    //   name: "PROFILE",
    //   type: "dropDown",
    //   tooltip: "Profile",
    //   icon: "person",
    //   state: "profile",
    //   badges: [{ color: "primary", value: "2" }],
    //   sub: [
    //     { name: "OVERVIEW", state: "overview" },
    //     { name: "SETTINGS", state: "settings" },
    //     { name: "BLANK", state: "blank" }
    //   ]
    // },
    // {
    //   name: "TOUR",
    //   type: "link",
    //   tooltip: "Tour",
    //   icon: "flight_takeoff",
    //   state: "tour"
    // },
    // {
    //   name: "MAP",
    //   type: "link",
    //   tooltip: "Map",
    //   icon: "add_location",
    //   state: "map"
    // },
    // {
    //   name: "CHARTS",
    //   type: "dropDown",
    //   tooltip: "Charts",
    //   icon: "show_chart",
    //   sub: [
    //     {
    //       name: "eChart",
    //       type: "dropDown",
    //       state: "chart",
    //       sub: [
    //         { name: "Pie", state: "pie" },
    //         { name: "Bar", state: "bar" },
    //         { name: "Radar", state: "radar" },
    //         { name: "Heatmap", state: "heatmap" },
    //       ]
    //     },
    //     { name: "Chart js", state: "charts" }
    //   ]
    // },
    // {
    //   name: "CHARTS",
    //   type: "link",
    //   tooltip: "Charts",
    //   icon: "show_chart",
    //   state: "charts"
    // },
    // {
    //   name: "DND",
    //   type: "link",
    //   tooltip: "Drag and Drop",
    //   icon: "adjust",
    //   state: "dragndrop"
    // },
    // {
    //   name: "Page Layouts",
    //   type: "dropDown",
    //   icon: "view_carousel",
    //   state: "page-layouts",
    //   sub: [
    //     { name: "Left sidebar card", state: "left-sidebar-card" },
    //     { name: "Right sidebar card", state: "right-sidebar-card" },
    //     { name: "Full width card", state: "full-width-card" },
    //     { name: "Full width card tab", state: "full-width-card-tab" },

    //     { name: "Full width plain", state: "full-width-plain" },
    //     { name: "Left sidebar plain", state: "left-sidebar-plain" }
    //   ]
    // },
    // {
    //   name: "SESSIONS",
    //   type: "dropDown",
    //   tooltip: "Pages",
    //   icon: "view_carousel",
    //   state: "sessions",
    //   sub: [
    //     { name: "SIGNUP", state: "signup" },
    //     { name: "Signup 2", state: "signup2" },
    //     { name: "Signup 3", state: "signup3" },
    //     { name: "Signup 4", state: "signup4" },
    //     { name: "SIGNIN", state: "signin" },
    //     { name: "Signin 2", state: "signin2" },
    //     { name: "Signin 3", state: "signin3" },
    //     { name: "Signin 4", state: "signin4" },
    //     { name: "FORGOT", state: "forgot-password" },
    //     { name: "LOCKSCREEN", state: "lockscreen" },
    //     { name: "NOTFOUND", state: "404" },
    //     { name: "ERROR", state: "error" }
    //   ]
    // },
    // {
    //   name: "Utilities",
    //   type: "dropDown",
    //   icon: "format_list_bulleted",
    //   state: "utilities",
    //   sub: [
    //     { name: "Border", state: "border" },
    //     { name: "Color", state: "color" },
    //     { name: "Spacing", state: "spacing" },
    //     { name: "Typography", state: "typography" }
    //   ]
    // },
    // {
    //   name: "OTHERS",
    //   type: "dropDown",
    //   tooltip: "Others",
    //   icon: "blur_on",
    //   state: "others",
    //   sub: [
    //     { name: "GALLERY", state: "gallery" },
    //     { name: "PRICINGS", state: "pricing" },
    //     { name: "USERS", state: "users" },
    //     { name: "BLANK", state: "blank" }
    //   ]
    // },
    // {
    //   name: "MATICONS",
    //   type: "link",
    //   tooltip: "Material Icons",
    //   icon: "store",
    //   state: "icons"
    // },
    // {
    //   name: "Multi Level",
    //   type: "dropDown",
    //   tooltip: "Multi Level",
    //   icon: "format_align_center",
    //   state: "",
    //   sub: [
    //     {
    //       name: "Level Two",
    //       type: "dropDown",
    //       state: "fake-1",
    //       sub: [
    //         { name: "Level Three", state: "fake-2" },
    //         { name: "Level Three", state: "fake-3" }
    //       ]
    //     },
    //     { name: "Level Two", state: "fake-4" },
    //     { name: "Level Two", state: "fake-5" }
    //   ]
    // },
    // {
    //   name: "DOC",
    //   type: "extLink",
    //   tooltip: "Documentation",
    //   icon: "library_books",
    //   state: "http://demos.ui-lib.com/egret-doc/"
    // }
  ];

  separatorMenu: IMenuItem[] = [
    {
      type: "separator",
      name: "Custom components"
    },
    {
      name: "DASHBOARD",
      type: "link",
      tooltip: "Dashboard",
      icon: "dashboard",
      state: "dashboard"
    },
    {
      name: "INBOX",
      type: "link",
      tooltip: "Inbox",
      icon: "inbox",
      state: "inbox"
    },
    {
      name: "CHAT",
      type: "link",
      tooltip: "Chat",
      icon: "chat",
      state: "chat"
    },
    {
      name: "CRUD Table",
      type: "link",
      tooltip: "CRUD Table",
      icon: "format_list_bulleted",
      state: "cruds/ngx-table"
    },
    {
      name: "DIALOGS",
      type: "dropDown",
      tooltip: "Dialogs",
      icon: "filter_none",
      state: "dialogs",
      sub: [
        { name: "CONFIRM", state: "confirm" },
        { name: "LOADER", state: "loader" }
      ]
    },
    {
      name: "PROFILE",
      type: "dropDown",
      tooltip: "Profile",
      icon: "person",
      state: "profile",
      sub: [
        { name: "OVERVIEW", state: "overview" },
        { name: "SETTINGS", state: "settings" },
        { name: "BLANK", state: "blank" }
      ]
    },
    {
      name: "TOUR",
      type: "link",
      tooltip: "Tour",
      icon: "flight_takeoff",
      state: "tour"
    },
    {
      type: "separator",
      name: "Integrated components"
    },
    {
      name: "CALENDAR",
      type: "link",
      tooltip: "Calendar",
      icon: "date_range",
      state: "calendar"
    },
    {
      name: "MATERIAL",
      type: "dropDown",
      tooltip: "Material",
      icon: "favorite",
      state: "material",
      sub: [
        { name: "BUTTONS", state: "buttons" },
        { name: "Button Toggle", state: "button-toggle" },
        { name: "Buttons Loading", state: "loading-buttons" },
        { name: "CARDS", state: "cards" },
        { name: "GRIDS", state: "grids" },
        { name: "LISTS", state: "lists" },
        { name: "MENU", state: "menu" },
        { name: "TABS", state: "tabs" },
        { name: "SELECT", state: "select" },
        { name: "RADIO", state: "radio" },
        { name: "AUTOCOMPLETE", state: "autocomplete" },
        { name: "SLIDER", state: "slider" },
        { name: "PROGRESS", state: "progress" },
        { name: "SNACKBAR", state: "snackbar" }
      ]
    },
    {
      name: "FORMS",
      type: "dropDown",
      tooltip: "Forms",
      icon: "description",
      state: "forms",
      sub: [
        { name: "BASIC", state: "basic" },
        { name: "EDITOR", state: "editor" },
        { name: "UPLOAD", state: "upload" },
        { name: "WIZARD", state: "wizard" }
      ]
    },
    {
      name: "TABLES",
      type: "dropDown",
      tooltip: "Tables",
      icon: "format_line_spacing",
      state: "tables",
      sub: [
        { name: "FULLSCREEN", state: "fullscreen" },
        { name: "PAGING", state: "paging" },
        { name: "FILTER", state: "filter" }
      ]
    },
    {
      name: "MAP",
      type: "link",
      tooltip: "Map",
      icon: "add_location",
      state: "map"
    },
    {
      name: "CHARTS",
      type: "link",
      tooltip: "Charts",
      icon: "show_chart",
      state: "charts"
    },
    {
      name: "DND",
      type: "link",
      tooltip: "Drag and Drop",
      icon: "adjust",
      state: "dragndrop"
    },
    {
      type: "separator",
      name: "Other components"
    },
    {
      name: "SESSIONS",
      type: "dropDown",
      tooltip: "Pages",
      icon: "view_carousel",
      state: "sessions",
      sub: [
        { name: "SIGNUP", state: "signup" },
        { name: "SIGNIN", state: "signin" },
        { name: "FORGOT", state: "forgot-password" },
        { name: "LOCKSCREEN", state: "lockscreen" },
        { name: "NOTFOUND", state: "404" },
        { name: "ERROR", state: "error" }
      ]
    },
    {
      name: "OTHERS",
      type: "dropDown",
      tooltip: "Others",
      icon: "blur_on",
      state: "others",
      sub: [
        { name: "GALLERY", state: "gallery" },
        { name: "PRICINGS", state: "pricing" },
        { name: "USERS", state: "users" },
        { name: "BLANK", state: "blank" }
      ]
    },
    {
      name: "MATICONS",
      type: "link",
      tooltip: "Material Icons",
      icon: "store",
      state: "icons"
    },
    {
      name: "DOC",
      type: "extLink",
      tooltip: "Documentation",
      icon: "library_books",
      state: "http://demos.ui-lib.com/egret-doc/"
    }
  ];

  plainMenu: IMenuItem[] = [
    {
      name: "DASHBOARD",
      type: "link",
      tooltip: "Dashboard",
      icon: "dashboard",
      state: "dashboard"
    },
    {
      name: "INBOX",
      type: "link",
      tooltip: "Inbox",
      icon: "inbox",
      state: "inbox"
    },
    {
      name: "CHAT",
      type: "link",
      tooltip: "Chat",
      icon: "chat",
      state: "chat"
    },
    {
      name: "CRUD Table",
      type: "link",
      tooltip: "CRUD Table",
      icon: "format_list_bulleted",
      state: "cruds/ngx-table"
    },
    {
      name: "CALENDAR",
      type: "link",
      tooltip: "Calendar",
      icon: "date_range",
      state: "calendar"
    },
    {
      name: "DIALOGS",
      type: "dropDown",
      tooltip: "Dialogs",
      icon: "filter_none",
      state: "dialogs",
      sub: [
        { name: "CONFIRM", state: "confirm" },
        { name: "LOADER", state: "loader" }
      ]
    },
    {
      name: "MATERIAL",
      type: "dropDown",
      icon: "favorite",
      state: "component",
      sub: [
        { name: "BUTTONS", state: "buttons" },
        { name: "Button Toggle", state: "button-toggle" },
        { name: "Buttons Loading", state: "loading-buttons" },
        { name: "CARDS", state: "cards" },
        { name: "GRIDS", state: "grids" },
        { name: "LISTS", state: "lists" },
        { name: "MENU", state: "menu" },
        { name: "TABS", state: "tabs" },
        { name: "SELECT", state: "select" },
        { name: "RADIO", state: "radio" },
        { name: "AUTOCOMPLETE", state: "autocomplete" },
        { name: "SLIDER", state: "slider" },
        { name: "PROGRESS", state: "progress" },
        { name: "SNACKBAR", state: "snackbar" }
      ]
    },
    {
      name: "FORMS",
      type: "dropDown",
      tooltip: "Forms",
      icon: "description",
      state: "forms",
      sub: [
        { name: "BASIC", state: "basic" },
        { name: "EDITOR", state: "editor" },
        { name: "UPLOAD", state: "upload" },
        { name: "WIZARD", state: "wizard" }
      ]
    },
    {
      name: "TABLES",
      type: "dropDown",
      tooltip: "Tables",
      icon: "format_line_spacing",
      state: "tables",
      sub: [
        { name: "FULLSCREEN", state: "fullscreen" },
        { name: "PAGING", state: "paging" },
        { name: "FILTER", state: "filter" }
      ]
    },
    {
      name: "PROFILE",
      type: "dropDown",
      tooltip: "Profile",
      icon: "person",
      state: "profile",
      sub: [
        { name: "OVERVIEW", state: "overview" },
        { name: "SETTINGS", state: "settings" },
        { name: "BLANK", state: "blank" }
      ]
    },
    {
      name: "TOUR",
      type: "link",
      tooltip: "Tour",
      icon: "flight_takeoff",
      state: "tour"
    },
    {
      name: "MAP",
      type: "link",
      tooltip: "Map",
      icon: "add_location",
      state: "map"
    },
    {
      name: "CHARTS",
      type: "link",
      tooltip: "Charts",
      icon: "show_chart",
      state: "charts"
    },
    {
      name: "DND",
      type: "link",
      tooltip: "Drag and Drop",
      icon: "adjust",
      state: "dragndrop"
    },
    {
      name: "SESSIONS",
      type: "dropDown",
      tooltip: "Pages",
      icon: "view_carousel",
      state: "sessions",
      sub: [
        { name: "SIGNUP", state: "signup" },
        { name: "SIGNIN", state: "signin" },
        { name: "FORGOT", state: "forgot-password" },
        { name: "LOCKSCREEN", state: "lockscreen" },
        { name: "NOTFOUND", state: "404" },
        { name: "ERROR", state: "error" }
      ]
    },
    {
      name: "OTHERS",
      type: "dropDown",
      tooltip: "Others",
      icon: "blur_on",
      state: "others",
      sub: [
        { name: "GALLERY", state: "gallery" },
        { name: "PRICINGS", state: "pricing" },
        { name: "USERS", state: "users" },
        { name: "BLANK", state: "blank" }
      ]
    },
    {
      name: "MATICONS",
      type: "link",
      tooltip: "Material Icons",
      icon: "store",
      state: "icons"
    },
    {
      name: "DOC",
      type: "extLink",
      tooltip: "Documentation",
      icon: "library_books",
      state: "http://demos.ui-lib.com/egret-doc/"
    }
  ];

  // Icon menu TITLE at the very top of navigation.
  // This title will appear if any icon type item is present in menu.
  iconTypeMenuTitle: string = "Frequently Accessed";
  // sets iconMenu as default;
  menuItems = new BehaviorSubject<IMenuItem[]>(this.iconMenu);
  // navigation component has subscribed to this Observable
  menuItems$ = this.menuItems.asObservable();

  // Customizer component uses this method to change menu.
  // You can remove this method and customizer component.
  // Or you can customize this method to supply different menu for
  // different user type.
  publishNavigationChange(menuType: string) {
    switch (menuType) {
      case "separator-menu":
        this.menuItems.next(this.separatorMenu);
        break;
      case "icon-menu":
        this.menuItems.next(this.iconMenu);
        break;
      default:
        this.menuItems.next(this.plainMenu);
    }
  }
}
