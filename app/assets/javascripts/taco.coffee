jQuery.ready   ->
  $('#taco_salsa_select').validate ->
    debug: true
    rules:
      'taco_ids[]': 
        onecheck: true 
      'checkbox:salsa_ids[]':
        onecheck: true
