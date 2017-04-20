$(document).ready(function(){
  $(".btn-active-user").click(function() {
    var button = $(this);
    var user_id = this.name;
    var is_active = this.value;
    var url = $(this).attr('action');
    var data = {
        id: user_id,
        is_active: is_active
    };
    $.ajax({
      url: "/admin/users/"+user_id,
      type: 'put',
      data: data,
      dataType: 'json',
      success: function(data){
        if(!data.is_active){
          button.removeClass("btn-warning");
          button.addClass("btn-success");
          button.text("Kích Hoạt");
          button.parent().prev().text("Đã bị khóa");

        } else {
          button.addClass("btn-warning");
          button.removeClass("btn-success");
          button.text("Khóa");
          button.parent().prev().text("Đang hoạt động");
        }
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        alert("Xảy ra lỗi");
      }
    });
  });
})
