describe 'Visit', ->

  json_data_from_server = "
    { \"abduction_tension_level\":\"2\",
      \"adduction_tension_level\":\"3\",
      \"created_at\":\"2011-08-24T18:53:48Z\",
      \"crest\":\"X\",
      \"date\":\"2011-08-24T18:53:48Z\",
      \"diagnosis\":\"Visit diagnosis\",
      \"egression_organizing_field\":\"H2\",
      \"eversion_tension_level\":\"1\",
      \"heel_tension_level\":\"0\",
      \"id\":13,
      \"ingression_organizing_field\":\"H1\",
      \"long_lever_arm\":\"X\",
      \"notes\":\"Visit note\",
      \"phase_1\":\"1 > 2 C1\",
      \"phase_1_direction\":\"M\",
      \"phase_1_gateway_1\":\"OCC\",
      \"phase_1_gateway_1_affecting\":\"C1/OCC\",
      \"phase_1_gateway_2\":\"S1\",
      \"phase_1_gateway_2_affecting\":\"C1/C2\",
      \"phase_1_level_of_care\":\"1A\",
      \"phase_2\":\"1 > 2 C5\",
      \"phase_2_direction\":\"L\",
      \"phase_2_gateway_1\":\"S2\",
      \"phase_2_gateway_1_affecting\":\"C3/C4\",
      \"phase_2_gateway_2\":\"S3\",
      \"phase_2_gateway_2_affecting\":\"C4/C3\",
      \"phase_2_level_of_care\":\"1B\",
      \"practice_member_id\":1,
      \"short_leg_amount\":\"0-0.5\",
      \"short_leg_side\":\"L\",
      \"short_lever_arm\":\"X\",
      \"sri_session_1_level_of_care\":\"1C\",
      \"sri_session_1_organizing_field\":\"H1\",
      \"sri_session_1_position_a\":\"2\",
      \"sri_session_1_position_b\":\"3\",
      \"sri_session_1_stage\":\"1\",
      \"sri_session_2_level_of_care\":\"2A\",
      \"sri_session_2_organizing_field\":\"H2\",
      \"sri_session_2_position_a\":\"4\",
      \"sri_session_2_position_b\":\"5\",
      \"sri_session_2_stage\":\"2\",
      \"sri_session_3_level_of_care\":\"2B\",
      \"sri_session_3_organizing_field\":\"H3L\",
      \"sri_session_3_position_a\":\"5\",
      \"sri_session_3_position_b\":null,
      \"sri_session_3_stage\":\"3\",
      \"updated_at\":\"2011-08-30T20:00:00Z\"
    }"

  it 'should instantiate with data', ->
    visit = new Visit(json_data_from_server)
    expect(visit.data).toEqual(jQuery.parseJSON(json_data_from_server))

  it 'should load and set data from the server', ->
    visit = new Visit(json_data_from_server)
    visit.set_ui_values()
    expect(visit.data.abduction_tension_level).toEqual '2'

  it 'should set ui values based on the data from server', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.set_ui_values()

    expect($('#sri_session_1_stage').html()).toEqual('1')
    expect($('#sri_session_1_position_a').html()).toEqual('2')
    expect($('#sri_session_1_position_b').html()).toEqual('3')
    expect($('#sri_session_1_level_of_care').html()).toEqual('1C')
    expect($('#sri_session_1_organizing_field').html()).toEqual('H1')
    expect($('#sri_session_2_stage').html()).toEqual('2')
    expect($('#sri_session_2_position_a').html()).toEqual('4')
    expect($('#sri_session_2_position_b').html()).toEqual('5')
    expect($('#sri_session_2_level_of_care').html()).toEqual('2A')
    expect($('#sri_session_2_organizing_field').html()).toEqual('H2')
    expect($('#sri_session_3_stage').html()).toEqual('3')
    expect($('#sri_session_3_position_a').html()).toEqual('5')
    expect($('#sri_session_3_position_b').html()).toEqual('')
    expect($('#sri_session_3_level_of_care').html()).toEqual('2B')
    expect($('#sri_session_3_organizing_field').html()).toEqual('H3L')

  it 'should only show first SRI session if no SRI session data in Visit', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.data.sri_session_1_stage = null
    visit.data.sri_session_1_position_a = null
    visit.data.sri_session_1_position_b = null
    visit.data.sri_session_1_level_of_care = null
    visit.data.sri_session_1_organizing_field = null
    visit.data.sri_session_2_stage = null
    visit.data.sri_session_2_position_a = null
    visit.data.sri_session_2_position_b = null
    visit.data.sri_session_2_level_of_care = null
    visit.data.sri_session_2_organizing_field = null
    visit.data.sri_session_3_stage = null
    visit.data.sri_session_3_position_a = null
    visit.data.sri_session_3_position_b = null
    visit.data.sri_session_3_level_of_care = null
    visit.data.sri_session_3_organizing_field = null
    visit.set_ui_values()
    expect($('.sri_session_1')).toBeVisible()
    expect($('.sri_session_2')).toBeHidden()
    expect($('.sri_session_3')).toBeHidden()


  it 'should only show first SRI session if only first SRI session data in Visit', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.data.sri_session_2_stage = null
    visit.data.sri_session_2_position_a = null
    visit.data.sri_session_2_position_b = null
    visit.data.sri_session_2_level_of_care = null
    visit.data.sri_session_2_organizing_field = null
    visit.data.sri_session_3_stage = null
    visit.data.sri_session_3_position_a = null
    visit.data.sri_session_3_position_b = null
    visit.data.sri_session_3_level_of_care = null
    visit.data.sri_session_3_organizing_field = null
    visit.set_ui_values()
    expect($('.sri_session_1')).toBeVisible()
    expect($('.sri_session_2')).toBeHidden()
    expect($('.sri_session_3')).toBeHidden()

  it 'should show first and second SRI session if first and second SRI session data in Visit', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.data.sri_session_3_stage = null
    visit.data.sri_session_3_position_a = null
    visit.data.sri_session_3_position_b = null
    visit.data.sri_session_3_level_of_care = null
    visit.data.sri_session_3_organizing_field = null
    visit.set_ui_values()
    expect($('.sri_session_1')).toBeVisible()
    expect($('.sri_session_2')).toBeVisible()
    expect($('.sri_session_3')).toBeHidden()

  it 'should show all three SRI sessions if first, second and third SRI session data in Visit', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.set_ui_values()
    expect($('.sri_session_1')).toBeVisible()
    expect($('.sri_session_2')).toBeVisible()
    expect($('.sri_session_3')).toBeVisible()

  it 'should show the button to add SRI session if one session present', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.data.sri_session_2_stage = null
    visit.data.sri_session_2_position_a = null
    visit.data.sri_session_2_position_b = null
    visit.data.sri_session_2_level_of_care = null
    visit.data.sri_session_2_organizing_field = null
    visit.data.sri_session_3_stage = null
    visit.data.sri_session_3_position_a = null
    visit.data.sri_session_3_position_b = null
    visit.data.sri_session_3_level_of_care = null
    visit.data.sri_session_3_organizing_field = null
    visit.set_ui_values()
    expect($('#add_sri_session_2')).toBeVisible()
    expect($('#add_sri_session_3')).toBeHidden()

  it 'should show the button to add SRI session if two sessions present', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.data.sri_session_3_stage = null
    visit.data.sri_session_3_position_a = null
    visit.data.sri_session_3_position_b = null
    visit.data.sri_session_3_level_of_care = null
    visit.data.sri_session_3_organizing_field = null
    visit.set_ui_values()
    expect($('#add_sri_session_2')).toBeHidden()
    expect($('#add_sri_session_3')).toBeVisible()

  it 'should not show the button to add SRI session if all three sessions data are present', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.set_ui_values()
    expect($('#add_sri_session_2')).toBeHidden()
    expect($('#add_sri_session_3')).toBeHidden()

  it 'should show an additional session when the add SRI session button is clicked', ->
    loadFixtures('visits/_sri_sessions.html.erb')
    visit = new Visit(json_data_from_server)
    visit.data.sri_session_1_stage = null
    visit.data.sri_session_1_position_a = null
    visit.data.sri_session_1_position_b = null
    visit.data.sri_session_1_level_of_care = null
    visit.data.sri_session_1_organizing_field = null
    visit.data.sri_session_2_stage = null
    visit.data.sri_session_2_position_a = null
    visit.data.sri_session_2_position_b = null
    visit.data.sri_session_2_level_of_care = null
    visit.data.sri_session_2_organizing_field = null
    visit.data.sri_session_3_stage = null
    visit.data.sri_session_3_position_a = null
    visit.data.sri_session_3_position_b = null
    visit.data.sri_session_3_level_of_care = null
    visit.data.sri_session_3_organizing_field = null
    visit.set_ui_values()
    
    expect($('#add_sri_session_2')).toBeVisible()
    expect($('#add_sri_session_3')).toBeHidden()
    expect($('.sri_session_2')).toBeHidden()
    expect($('.sri_session_3')).toBeHidden()
    $('#add_sri_session_2').mousedown()

    expect($('#add_sri_session_2')).toBeHidden()
    expect($('#add_sri_session_3')).toBeVisible()
    expect($('.sri_session_2')).toBeVisible()
    expect($('.sri_session_3')).toBeHidden()
    $('#add_sri_session_3').mousedown()

    expect($('#add_sri_session_2')).toBeHidden()
    expect($('#add_sri_session_3')).toBeHidden()
    expect($('.sri_session_2')).toBeVisible()
    expect($('.sri_session_3')).toBeVisible()

  it 'when SRI stage 1 is selected show two position selectors: peace and disconnection with correct labels', -> 
    loadFixtures('visits/_sri_sessions.html.erb', 'practice_room/_selectors.html.erb')

    script = " 
      <script language=\"javascript\">
        $(document).ready(function() {
          visit = new Visit('');
        });
      </script>"
    
    $('#jasmine-fixtures').append(script)

    for sri_session in ['1','2','3']
      $('#add_sri_session_2').mousedown() if sri_session == '2'
      $('#add_sri_session_3').mousedown() if sri_session == '3'

      # default sri session load
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeHidden()
      expect($('#label_sri_session_' + sri_session + '_position_a')).toBeVisible
      expect($('#label_sri_session_' + sri_session + '_position_b')).toBeHidden
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Pos'
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual ''

      $('#sri_session_' + sri_session + '_stage').mousedown()

      $('#select_sri_stage_1').mousedown()
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual '1'
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeVisible()
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Peace'
      expect($('#label_sri_session_' + sri_session + '_position_b').html()).toEqual 'Discon'

  it 'on page load/reload when SRI stage 1 is selected show two position selectors: peace and disconnection with correct labels', -> 
    loadFixtures('visits/_sri_sessions.html.erb', 'practice_room/_selectors.html.erb')

    script = " 
      <script language=\"javascript\">
        $(document).ready(function() {
          visit = new Visit('');
          visit.data = {};
          visit.data.sri_session_1_stage = '1';
          visit.data.sri_session_2_stage = '1';
          visit.data.sri_session_3_stage = '1';
          visit.set_ui_values();
        });
      </script>"
    
    $('#jasmine-fixtures').append(script)
    for sri_session in ['1','2','3']
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual '1'
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeVisible()
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Peace'
      expect($('#label_sri_session_' + sri_session + '_position_b').html()).toEqual 'Discon'

  it 'when SRI stage 2 is selected show two position selectors (Pos A/B) with correct labels', -> 
    loadFixtures('visits/_sri_sessions.html.erb', 'practice_room/_selectors.html.erb')

    script = " 
      <script language=\"javascript\">
        $(document).ready(function() {
          visit = new Visit('');
        });
      </script>"
    
    $('#jasmine-fixtures').append(script)

    for sri_session in ['1','2','3']
      $('#add_sri_session_2').mousedown() if sri_session == '2'
      $('#add_sri_session_3').mousedown() if sri_session == '3'

      # default sri session load
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeHidden()
      expect($('#label_sri_session_' + sri_session + '_position_a')).toBeVisible
      expect($('#label_sri_session_' + sri_session + '_position_b')).toBeHidden
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Pos'
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual ''

      $('#sri_session_' + sri_session + '_stage').mousedown()

      $('#select_sri_stage_2').mousedown()
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual '2'
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeVisible()
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Pos A'
      expect($('#label_sri_session_' + sri_session + '_position_b').html()).toEqual 'Pos B'

  it 'on page load/reload when SRI stage 2 is selected show two position selectors (Pos A/B)', -> 
    loadFixtures('visits/_sri_sessions.html.erb', 'practice_room/_selectors.html.erb')

    script = " 
      <script language=\"javascript\">
        $(document).ready(function() {
          visit = new Visit('');
          visit.data = {};
          visit.data.sri_session_1_stage = '2';
          visit.data.sri_session_2_stage = '2';
          visit.data.sri_session_3_stage = '2';
          visit.set_ui_values();
        });
      </script>"
    
    $('#jasmine-fixtures').append(script)
    for sri_session in ['1','2','3']
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual '2'
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeVisible()
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Pos A'
      expect($('#label_sri_session_' + sri_session + '_position_b').html()).toEqual 'Pos B'

  it 'toggles from stage 1 to stage 2 to other stage position selectors correctly', ->
    loadFixtures('visits/_sri_sessions.html.erb', 'practice_room/_selectors.html.erb')

    script = " 
      <script language=\"javascript\">
        $(document).ready(function() {
          visit = new Visit('');
        });
      </script>"
    
    $('#jasmine-fixtures').append(script)

    for sri_session in ['1','2','3']
      $('#add_sri_session_2').mousedown() if sri_session == '2'
      $('#add_sri_session_3').mousedown() if sri_session == '3'

      $('#sri_session_' + sri_session + '_stage').mousedown()
      $('#select_sri_stage_1').mousedown()
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual '1'
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeVisible()
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Peace'
      expect($('#label_sri_session_' + sri_session + '_position_b').html()).toEqual 'Discon'

      $('#sri_session_' + sri_session + '_stage').mousedown()
      $('#select_sri_stage_2').mousedown()
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual '2'
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeVisible()
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Pos A'
      expect($('#label_sri_session_' + sri_session + '_position_b').html()).toEqual 'Pos B'

      $('#sri_session_' + sri_session + '_stage').mousedown()
      $('#select_sri_stage_3').mousedown()
      expect($('#sri_session_' + sri_session + '_stage').html()).toEqual '3'
      expect($('#sri_session_' + sri_session + '_position_a')).toBeVisible()
      expect($('#sri_session_' + sri_session + '_position_b')).toBeHidden()
      expect($('#label_sri_session_' + sri_session + '_position_a').html()).toEqual 'Pos'

  it 'autosaves data correctly' do
    
