// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import { initTheme, setTheme } from "./utils/theme_toggle";
import Sidebar from "./utils/sidebar";
import "./helper/isDesktop";

import * as bootstrap from "bootstrap"
import Swal from 'sweetalert2';
import 'block-ui';
window.Swal = Swal;



var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
});

const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))

document.addEventListener("turbo:load", () => {

    const forms = document.querySelectorAll("form");
    const blocker = document.getElementById("screen-blocker");

    forms.forEach(function (form) {
        form.addEventListener("submit", function () {
            if (blocker) blocker.style.display = "block";
        });
    });
    
    initTheme();
    const toggler = document.getElementById("toggle-dark")
    const theme = localStorage.getItem('theme')
    if(toggler) {
        toggler.checked = theme === "dark"
        toggler.addEventListener("input", (e) => {
          setTheme(e.target.checked ? "dark" : "light", true)
        })
    }


    const sidebarEl = document.getElementById("sidebar");
    if (sidebarEl) {
      new Sidebar(sidebarEl);
    }

    /**
     * On First Load
     */
    const onFirstLoad = (sidebarEL) => {
        if (!sidebarEl) return
        // if (isDesktop(window)) {
        //     sidebarEL.classList.add("active")
        //     sidebarEL.classList.add('sidebar-desktop')
        // }
    
        // Get submenus size
        let submenus = document.querySelectorAll(".sidebar-item.has-sub .submenu")
        for (var i = 0; i < submenus.length; i++) {
            let submenu = submenus[i]
            const sidebarItem = submenu.parentElement
            const height = submenu.clientHeight
            if (sidebarItem.classList.contains('active')) submenu.classList.add('submenu-open')
            else submenu.classList.add('submenu-closed')
            setTimeout(() => {
                const height = calculateChildrenHeight(submenu, true)
            }, 50);
        }
    }
    
    const reInit_SubMenuHeight = (sidebarEl) => {
        if (!sidebarEl) return
        // Get submenus size
        let submenus = document.querySelectorAll(".sidebar-item.has-sub .submenu")
        for (var i = 0; i < submenus.length; i++) {
            let submenu = submenus[i]
            const sidebarItem = submenu.parentElement
            const height = submenu.clientHeight
            if (sidebarItem.classList.contains('active')) submenu.classList.add('submenu-open')
            else submenu.classList.add('submenu-closed')
            setTimeout(() => {
                const height = calculateChildrenHeight(submenu, true)
            }, 50);
        }
    }
    
    
    if (document.readyState !== 'loading') {
        onFirstLoad(sidebarEl)
    }
    else {
        window.addEventListener('DOMContentLoaded', () => onFirstLoad(sidebarEl))
    }

 
});