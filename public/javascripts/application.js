
$(function() {
  $('form.ajax-validation').railsAjaxValidation();
})


function remove_field(element, item) {
  element.up(item).remove();
}

