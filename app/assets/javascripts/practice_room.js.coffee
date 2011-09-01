class @Visit
  do_something: (something) ->
    return something
  constructor: (@data) ->
  set_ui_values: ->
    @visit_data = jQuery.parseJSON(@data)
    $('#sri_session_1_stage').html(@visit_data.sri_session_1_stage)


