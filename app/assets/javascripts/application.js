// This is a manifest file that"ll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin"s vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It"s not advisable to add code directly here, but if you do, it"ll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require select2-full
//= require select2_locale_vi
//= require_tree .

$(document).ready(function(){
  $(".select2").select2({
    placeholder: function(){
      $(this).data("placeholder");
    }
  });

  $(".dropdown").hover(
    function() {
      $(".dropdown-menu", this).stop( true, true ).slideDown("fast");
      $(this).toggleClass("open");
    },
    function() {
      $(".dropdown-menu", this).stop( true, true ).slideUp("fast");
      $(this).toggleClass("open");
    }
  );

  $(function () {
    // $("#example1").DataTable();
    // $("#example2").DataTable({
    //   "paging": true,
    //   "lengthChange": false,
    //   "searching": false,
    //   "ordering": true,
    //   "info": true,
    //   "autoWidth": false
    // });

    $(".data-table").DataTable({
      "language": {
        "sProcessing":   "Đang xử lý...",
        "sLengthMenu":   "Xem _MENU_ mục",
        "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
        "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
        "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
        "sInfoFiltered": "(được lọc từ _MAX_ mục)",
        "sInfoPostFix":  "",
        "sSearch":       "Tìm:",
        "sUrl":          "",
        "oPaginate": {
          "sFirst":    "Đầu",
          "sPrevious": "Trước",
          "sNext":     "Tiếp",
          "sLast":     "Cuối"
        }
      }
    });
  });

  $(".imagefile").on("change", function () {
    if (typeof (FileReader) != "undefined") {
      var image_holder = $("#image-preview");
      image_holder.empty();
      var reader = new FileReader();
      reader.onload = function (e) {
        $("<img />", {
          "src": e.target.result,
          "class": "thumb-image",
        }).appendTo(image_holder);
      }
      image_holder.show();
      reader.readAsDataURL($(this)[0].files[0]);
    } else {
      alert("Trình duyệt không hỗ trợ đọc file");
    }
  });
});
