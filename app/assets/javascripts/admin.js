var ready = function() {
  $('#monthly_emails').toggle();
  $('#prospective_tas').toggle();

  function initClick(id) {
    $(id + '_header').click(function(event) {
      console.log("hello");
      event.preventDefault();
      $(id + '_icon i').toggleClass('fa-angle-right');
      $(id + '_icon i').toggleClass('fa-angle-down');
      $(id).toggle();
    });
  }

  initClick('#monthly_emails');
  initClick('#prospective_tas');
}


$(document).ready(ready);
$(document).on('page:load', ready);