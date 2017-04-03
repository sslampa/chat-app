$(document).on('turbolinks:load', function() {
  $("#message-area .message-heading span").on("click", function() {
    $("#messages").slideToggle();
  });
});
