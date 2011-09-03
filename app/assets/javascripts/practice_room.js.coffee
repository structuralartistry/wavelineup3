class @Visit
  constructor: (raw_json) ->
    @data = jQuery.parseJSON(raw_json)
  set_ui_values: ->
    $('#sri_session_1_stage').html(@data.sri_session_1_stage)
    $('#sri_session_1_position_a').html(@data.sri_session_1_position_a)
    $('#sri_session_1_position_b').html(@data.sri_session_1_position_b)
    $('#sri_session_1_level_of_care').html(@data.sri_session_1_level_of_care)
    $('#sri_session_1_organizing_field').html(@data.sri_session_1_organizing_field)
    $('#sri_session_2_stage').html(@data.sri_session_2_stage)
    $('#sri_session_2_position_a').html(@data.sri_session_2_position_a)
    $('#sri_session_2_position_b').html(@data.sri_session_2_position_b)
    $('#sri_session_2_level_of_care').html(@data.sri_session_2_level_of_care)
    $('#sri_session_2_organizing_field').html(@data.sri_session_2_organizing_field)
    $('#sri_session_3_stage').html(@data.sri_session_3_stage)
    $('#sri_session_3_position_a').html(@data.sri_session_3_position_a)
    $('#sri_session_3_position_b').html(@data.sri_session_3_position_b)
    $('#sri_session_3_level_of_care').html(@data.sri_session_3_level_of_care)
    $('#sri_session_3_organizing_field').html(@data.sri_session_3_organizing_field)

    if @data.sri_session_2_stage!=null && @data.sri_session_2_stage!=''
      $('.sri_session_2').show()
      $('#add_sri_session_2').hide()
      $('#add_sri_session_3').show()

    if @data.sri_session_3_stage!=null && @data.sri_session_3_stage!=''
      $('.sri_session_3').show()
      $('#add_sri_session_3').hide()

    @set_sri_positions()

  set_sri_positions: ->
    for sri_session in ['1','2','3']
      sri_stage = $('#sri_session_' + sri_session + '_stage').html()
      if sri_stage!=undefined && sri_stage!=''
        # if is stage 1 or 2 show the second field and place appropriate text in the label
        if sri_stage=='1' || sri_stage=='2'
          $('#label_sri_session_' + sri_session + '_position_b').show()
          $('#sri_session_' + sri_session + '_position_b').show()
          if sri_stage=='1'
            $('#label_sri_session_' + sri_session + '_position_a').html('Peace')
            $('#label_sri_session_' + sri_session + '_position_b').html('Discon')
          if sri_stage=='2'
            $('#label_sri_session_' + sri_session + '_position_a').html('Pos A')
            $('#label_sri_session_' + sri_session + '_position_b').html('Pos B')
          if sri_session=='1'
            $('#label_sri_4_col').hide()
            $('#label_sri_5_col').show()
        else
          # hide the second position field and clear the value visually and in hidden field
          $('#label_sri_session_' + sri_session + '_position_a').html('Pos')
          $('#label_sri_session_' + sri_session + '_position_b').html('Pos')
          $('#label_sri_session_' + sri_session + '_position_b').hide()
          $('#sri_session_' + sri_session + '_position_b').html('').hide()
          $('#visit_sri_session_' + sri_session + '_position_b').val('')
          $('#label_sri_4_col').show()
          $('#label_sri_5_col').hide()

  show_selector: (selector_id, calling_object) -> 
    field_to_set = $(calling_object).attr('id')

    $('#' + selector_id).find('.selector_cell').each( ->
      $(this).attr('onMouseDown',"visit.set_selected_value($(this).html(),'#{field_to_set}'); visit.set_sri_positions();")
    )

    eleOffset = $(calling_object).offset()
    left = eleOffset.left + 'px'
    topp = eleOffset.top + 'px'
    $(".selector").hide()
    $('#' + selector_id).css("left",left).css("top",topp).css("position","absolute")
    $('#' + selector_id).show('fast')

  set_selected_value: (value, field_to_set) ->
    $('#' + field_to_set).html(value) 
    $(".selector").hide('fast')
