jQuery ->
  $('#taco_salsa_select').validate ->
    debug: true
    rules:
      "taco_ids[]": 
        required: true 
      "salsa_ids[]":
        required: true
