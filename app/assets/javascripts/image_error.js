$(document).ready(function(){
  function checkImg(img) {
    if (img.naturalHeight <= 1 && img.naturalWidth <= 1) {
      img.src = "../assets/default.jpg";
    }
  }

  $("img").each(function() {
    if (this.complete) {
      checkImg(this);
    } else {
      $(this).load(function() {
        checkImg(this);
      }).error(function() {
        this.src = "../assets/default.jpg";
      });
    }
  });
});
