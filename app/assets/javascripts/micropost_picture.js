$(document).ready(function(){
  $('#micropost_picture').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > Settings.number.five) {
      alert('Maximum file size is 5MB. Please choose a smaller file.');
    }
  });
});
