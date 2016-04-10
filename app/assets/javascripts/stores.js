(function($) {
  $.fn.TacoError = function() {
    $("#taco_salsa_select").validate({
      rules: {
        "taco_ids[]": {
          required : true
        },
        "salsa_ids[]": {
          required : true
        }
      },
      messages: {
        "taco_ids[]" : "Select a Taco or 2",
        "salsa_ids[]": "Grab some Salsa!"
      },
      errorPlacement: function(label, element) {
        label.addClass('taco-warning');
        $(element).parent().append(label);
      }
    });
  };
})(jQuery);
