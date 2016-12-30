/*
 * changed by https://github.com/almasaeed2010/AdminLTE
 * @license MIT <http://opensource.org/licenses/MIT>
 */

if (typeof jQuery === "undefined") {
  throw new Error("AdminLTE requires jQuery");
}

$.AdminLTE = {};
$.AdminLTE.options = {
  navbarMenuSlimscrollWidth: "3px", //The width of the scroll bar
  navbarMenuHeight: "200px", //The height of the inner menu
  //'fast', 'normal', or 'slow'
  animationSpeed: 500,
  sidebarToggleSelector: "[data-toggle='offcanvas']",

  screenSizes: {
    xs: 480,
    sm: 768,
    md: 992,
    lg: 1200
  }
};

$(function () {
  "use strict";

  $("body").removeClass("hold-transition");

  var o = $.AdminLTE.options;

  _init();

  $.AdminLTE.layout.activate();

  $.AdminLTE.tree('.sidebar');

  if (typeof $.fn.slimscroll != 'undefined') {
    $(".navbar .menu").slimscroll({
      height: o.navbarMenuHeight,
      alwaysVisible: false,
      size: o.navbarMenuSlimscrollWidth
    }).css("width", "100%");
  }

  $.AdminLTE.pushMenu.activate(o.sidebarToggleSelector);

  /*
   * INITIALIZE BUTTON TOGGLE
   * ------------------------
   */
  $('.btn-group[data-toggle="btn-toggle"]').each(function () {
    var group = $(this);
    $(this).find(".btn").on('click', function (e) {
      group.find(".btn.active").removeClass("active");
      $(this).addClass("active");
      e.preventDefault();
    });

  });

  initGlobalLoadEvent();
});

function _init() {
  'use strict';

  $.AdminLTE.layout = {
    activate: function () {
      var _this = this;
      _this.fix();
      _this.fixSidebar();
      $('body, html, .wrapper').css('height', 'auto');
      $(window, ".wrapper").resize(function () {
        _this.fix();
        _this.fixSidebar();
      });
    },
    fix: function () {
      var neg = $('.main-header').outerHeight();
      var window_height = $(window).height();
      var sidebar_height = $(".sidebar").height();
      //$(".content-wrapper").css('min-height', window_height);
    },
    fixSidebar: function () {
      $(".sidebar").slimScroll({destroy: true}).height("auto");
      $(".sidebar").slimscroll({
        height: ($(window).height() - $(".main-header").height()) + "px",
        width:"auto",
        color: "rgba(0,0,0,0.2)",
        size: "3px"
      });
    },
  };

  $.AdminLTE.pushMenu = {
    activate: function (toggleBtn) {
      //Get the screen sizes
      var screenSizes = $.AdminLTE.options.screenSizes;

      //Enable sidebar toggle
      $(document).on('click', toggleBtn, function (e) {
        e.preventDefault();

        //Enable sidebar push menu
        if ($(window).width() > (screenSizes.sm - 1)) {
          if ($("body").hasClass('sidebar-collapse')) {
            $("body").removeClass('sidebar-collapse');
            $("[data-toggle='tooltip']").tooltip('destroy');
          } else {
            $("body").addClass('sidebar-collapse');
            $("[data-toggle='tooltip']").tooltip();
          }
        }
        //Handle sidebar push menu for small screens
        else {
          if ($("body").hasClass('sidebar-open')) {
            $("body").removeClass('sidebar-open').removeClass('sidebar-collapse');
          } else {
            $("body").addClass('sidebar-open');
          }
        }
      });

      $(".content-wrapper").click(function () {
        //Enable hide menu when clicking on the content-wrapper on small screens
        if ($(window).width() <= (screenSizes.sm - 1) && $("body").hasClass("sidebar-open")) {
          $("body").removeClass('sidebar-open');
        }
      });

    }
  };

  $.AdminLTE.tree = function (menu) {
    var _this = this;
    var animationSpeed = $.AdminLTE.options.animationSpeed;
    $(document).off('click', menu + ' li a')
        .on('click', menu + ' li a', function (e) {
          //Get the clicked link and the next element
          var $this = $(this);
          var checkElement = $this.next();

          //Check if the next element is a menu and is visible
          if ((checkElement.is('.treeview-menu')) && (checkElement.is(':visible'))) {
            checkElement.slideUp(animationSpeed, function () {
              $this.removeClass('open');
            });
          }
          else if ((checkElement.is('.treeview-menu')) && (!checkElement.is(':visible'))) {
            checkElement.slideDown(animationSpeed, function () {
              $this.addClass('open');
            });
          }
          if (checkElement.is('.treeview-menu')) {
            e.preventDefault();
          }
        });
  };

}

function initGlobalLoadEvent(){

  var $loading = $('.load-container');

  // 添加ajax全局事件处理。
  $(document).ajaxSend(function (e, jqXHR, options) {
    $loading.fadeIn();
  }).ajaxError(function (e, xhr, opts) {
    $loading.fadeOut();
  }).ajaxSuccess(function (e, xhr, opts) {
    $loading.fadeOut();
  }).ajaxComplete(function (e, jqXHR, options) {
    $loading.fadeOut();
  }).ajaxStop(function () {
    $loading.fadeOut();
  });
}