require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Visit Feature", %q{

} do

  context "test aspects of Visit", :js => true, :visit => true do
    before(:each) do
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      @practice_member = create_practice_member('Kahn, David Nathan', practice_name)

      # this will create a new visit organically
      visit("/practice_room/#{@practice_member.id}/visit/new")
      @practice_room_visit_page = page.current_url

      has_text?('Kahn, David N', 'h1')
      confirm_visit_loaded
    end

    scenario "I can change the entrainment date of the visit" do
      fill_in('visit_date', :with => '2011-01-07 15:13')
      sleep(2) # delay for autosave to complete... wait_until {} not working on this

      # verify save
      visit(@practice_room_visit_page)
      get_input_value('visit_date').should == '2011-01-07 15:13'

      # bad date sends back validation message
      fill_in('visit_date', :with => 'xxxxxx')
      sleep(2) # delay for autosave to complete... wait_until {} not working on this
      has_flash_notice?('Date invalid: Please correct').should == true

      # verify save did not take
      visit(@practice_room_visit_page)
      get_input_value('visit_date').should == '2011-01-07 15:13'
    end

    scenario "I can set Phase 1 and 2 values and they autosave and that affected gateway selectors show for phase 1" do
      # phase 1
      get_selector_cell_text('selected_phase_1').should == ''
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_2_c5')
      get_selector_cell_text('selected_phase_1').should == '1 > 2 C5'

      get_selector_cell_text('selected_phase_1_gateway_1').should == ''
      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_s1')
      get_selector_cell_text('selected_phase_1_gateway_1').should == 'S1'

      get_selector_cell_text('selected_phase_1_gateway_1_affecting').should == ''
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      click_selector_cell('select_gateway_c3_c4')
      get_selector_cell_text('selected_phase_1_gateway_1_affecting').should == 'C3/C4'

      get_selector_cell_text('selected_phase_1_gateway_2').should == ''
      click_selector_cell('selected_phase_1_gateway_2')
      click_selector_cell('select_gateway_s2')
      get_selector_cell_text('selected_phase_1_gateway_2').should == 'S2'

      get_selector_cell_text('selected_phase_1_gateway_2_affecting').should == ''
      click_selector_cell('selected_phase_1_gateway_2_affecting')
      click_selector_cell('select_gateway_c4_c3')
      get_selector_cell_text('selected_phase_1_gateway_2_affecting').should == 'C4/C3'

      get_selector_cell_text('selected_phase_1_direction').should == ''
      click_selector_cell('selected_phase_1_direction')
      click_selector_cell('select_direction_m')
      get_selector_cell_text('selected_phase_1_direction').should == 'M'

      get_selector_cell_text('selected_phase_1_level_of_care').should == ''
      click_selector_cell('selected_phase_1_level_of_care')
      click_selector_cell('select_level_of_care_3a')
      get_selector_cell_text('selected_phase_1_level_of_care').should == '3A'


      # phase 2
      click_selector_cell('work_second_phase_button')

      get_selector_cell_text('selected_phase_2').should == ''
      click_selector_cell('selected_phase_2')
      click_selector_cell('select_phase_1_2_c5')
      get_selector_cell_text('selected_phase_2').should == '1 > 2 C5'

      get_selector_cell_text('selected_phase_2_gateway_1').should == ''
      click_selector_cell('selected_phase_2_gateway_1')
      click_selector_cell('select_gateway_s1')
      get_selector_cell_text('selected_phase_2_gateway_1').should == 'S1'

      get_selector_cell_text('selected_phase_2_gateway_1_affecting').should == ''
      click_selector_cell('selected_phase_2_gateway_1_affecting')
      click_selector_cell('select_gateway_c3_c4')
      get_selector_cell_text('selected_phase_2_gateway_1_affecting').should == 'C3/C4'

      get_selector_cell_text('selected_phase_2_gateway_2').should == ''
      click_selector_cell('selected_phase_2_gateway_2')
      click_selector_cell('select_gateway_s2')
      get_selector_cell_text('selected_phase_2_gateway_2').should == 'S2'

      get_selector_cell_text('selected_phase_2_gateway_2_affecting').should == ''
      click_selector_cell('selected_phase_2_gateway_2_affecting')
      click_selector_cell('select_gateway_c4_c3')
      get_selector_cell_text('selected_phase_2_gateway_2_affecting').should == 'C4/C3'

      get_selector_cell_text('selected_phase_2_direction').should == ''
      click_selector_cell('selected_phase_2_direction')
      click_selector_cell('select_direction_m')
      get_selector_cell_text('selected_phase_2_direction').should == 'M'

      get_selector_cell_text('selected_phase_2_level_of_care').should == ''
      click_selector_cell('selected_phase_2_level_of_care')
      click_selector_cell('select_level_of_care_3a')
      get_selector_cell_text('selected_phase_2_level_of_care').should == '3A'


      # verify autosave
      visit(@practice_room_visit_page)
      # phase 1
      get_selector_cell_text('selected_phase_1').should == '1 > 2 C5'
      get_selector_cell_text('selected_phase_1_gateway_1').should == 'S1'
      get_selector_cell_text('selected_phase_1_gateway_1_affecting').should == 'C3/C4'
      get_selector_cell_text('selected_phase_1_gateway_2').should == 'S2'
      get_selector_cell_text('selected_phase_1_gateway_2_affecting').should == 'C4/C3'
      get_selector_cell_text('selected_phase_1_direction').should == 'M'
      get_selector_cell_text('selected_phase_1_level_of_care').should == '3A'


      # phase 2
      click_selector_cell('work_second_phase_button')

      get_selector_cell_text('selected_phase_2').should == '1 > 2 C5'
      get_selector_cell_text('selected_phase_2_gateway_1').should == 'S1'
      get_selector_cell_text('selected_phase_2_gateway_1_affecting').should == 'C3/C4'
      get_selector_cell_text('selected_phase_2_gateway_2').should == 'S2'
      get_selector_cell_text('selected_phase_2_gateway_2_affecting').should == 'C4/C3'
      get_selector_cell_text('selected_phase_2_direction').should == 'M'
      get_selector_cell_text('selected_phase_2_level_of_care').should == '3A'

    end

    scenario "selected phase 3 should autopopulate direction" do
      # phase 1
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_3')
      get_selector_cell_text('selected_phase_1').should == '3'
      get_selector_cell_text('selected_phase_1_direction').should == 'L/B'

      # phase 2
      click_selector_cell('work_second_phase_button')
      click_selector_cell('selected_phase_2')
      click_selector_cell('select_phase_3')
      get_selector_cell_text('selected_phase_2').should == '3'
      get_selector_cell_text('selected_phase_2_direction').should == 'L/B'

      # verify save and reload
      visit(@practice_room_visit_page)
      get_selector_cell_text('selected_phase_1_direction').should == 'L/B'
      get_selector_cell_text('selected_phase_2_direction').should == 'L/B'
    end

    scenario "selected phase 5 has no direction" do
      # phase 1
      has_text?('Dir', 'td').should == true
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_5')
      get_selector_cell_text('selected_phase_1').should == '5'

      has_text?('Dir', 'td').should == false

      # phase 2
      click_selector_cell('work_second_phase_button')
      has_text?('Dir', 'td').should == true
      click_selector_cell('selected_phase_2')
      click_selector_cell('select_phase_5')
      get_selector_cell_text('selected_phase_2').should == '5'

      has_text?('Dir', 'td').should == false
    end

    scenario "phase 1 affected gateway lists show gateways which have not been set a side" do
      visit = Factory.create(:visit)
      visit.practice_member_id = @practice_member.id
      visit.date = DateTime.now
      visit.phase_1 = '1 > 3'
      visit.save!

      practice_room_visit_page = "/practice_room/#{@practice_member.id}/visit/#{visit.id}"
      visit(practice_room_visit_page)

      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_s1')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      get_selector_cell_text('select_gateway_s2').should == 'S2'
    end

    scenario "phase 1 affected gateway lists filter for the same side as the selected gateway", :focus => true do
      visit = Visit.new
      visit.practice_member_id = @practice_member.id
      visit.date = DateTime.now
      visit.save!

      travel_card = @practice_member.travel_card
      travel_card.gateway_c1_occ = 'R'
      travel_card.gateway_c1_c2 = 'L'
      travel_card.gateway_c2_c1 = 'R'
      travel_card.gateway_c2_c3 = 'L'
      travel_card.gateway_c3_c2 = 'R'
      travel_card.gateway_c3_c4 = 'R'
      travel_card.gateway_c4_c3 = 'L'
      travel_card.gateway_s1 = 'L'
      travel_card.gateway_s2 = 'R'
      travel_card.gateway_s3 = 'R'
      travel_card.gateway_s4 = 'L'
      travel_card.gateway_s5 = 'L'
      travel_card.save!

      practice_room_visit_page = "/practice_room/#{@practice_member.id}/visit/#{visit.id}"
      visit(practice_room_visit_page)

      # spot check phase 1 > 2 C1
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_2_c1')
      click_selector_cell('selected_phase_1_gateway_2')
      click_selector_cell('select_gateway_s2')
      click_selector_cell('selected_phase_1_gateway_2_affecting')
      selector_cell_present?('select_gateway_c1_c2').should == false
      verify_visit_gateway_selector('select_gateway_c1_occ', 'R', 'C1/OCC')

      # spot check phase 1 > 2 C5
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_2_c5')
      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_s1')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      selector_cell_present?('select_gateway_c3_c4').should == false
      verify_visit_gateway_selector('select_gateway_c4_c3', 'L', 'C4/C3')

      # spot check phase 1 > 3
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_3')
      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_s1')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      selector_cell_present?('select_gateway_s1').should == false
      selector_cell_present?('select_gateway_s2').should == false
      selector_cell_present?('select_gateway_s3').should == false
      verify_visit_gateway_selector('select_gateway_s4', 'L', 'S4')
      verify_visit_gateway_selector('select_gateway_s5', 'L', 'S5')

      # test gateway 2 affecting
      click_selector_cell('selected_phase_1_gateway_2')
      click_selector_cell('select_gateway_s2')
      click_selector_cell('selected_phase_1_gateway_2_affecting')
      selector_cell_present?('select_gateway_s1').should == false
      selector_cell_present?('select_gateway_s2').should == false
      verify_visit_gateway_selector('select_gateway_s3', 'R', 'S3')
      selector_cell_present?('select_gateway_s4').should == false
      selector_cell_present?('select_gateway_s5').should == false

      # spot check phase 1 > 4
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_4')
      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_s1')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      verify_visit_gateway_selector('select_gateway_c2_c3', 'L', 'C2/C3')
      selector_cell_present?('select_gateway_c3_c2').should == false

      # spot check phase 1 > 5
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_5')
      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_s1')
      click_selector_cell('selected_phase_1_gateway_1_affecting')

      verify_visit_gateway_selector('select_gateway_c1_c2', 'L', 'C1/C2')
      selector_cell_present?('select_gateway_c2_c1').should == false
      verify_visit_gateway_selector('select_gateway_c2_c3', 'L', 'C2/C3')
      selector_cell_present?('select_gateway_c3_c2').should == false
    end

    scenario "click on mini-travel card opens the travel card view" do
      page.find(:xpath, "//div[@id='mini_travel_card']").click
      confirm_travel_card_loaded
    end

    scenario "values for Tension can be set and autosave" do
      get_selector_cell_text('short_leg_side').should == ''
      click_selector_cell('short_leg_side')
      get_selector_cell_text('short_leg_side').should == 'L'

      get_selector_cell_text('short_leg_amount').should == ''
      click_selector_cell('short_leg_amount')
      click_selector_cell('select_amount_1_15')
      get_selector_cell_text('short_leg_amount').should == '1-1.5'

      # tension level fields
      iteration = 0
      tension_level_selector_cell_ids = %w(abduction_tension_level adduction_tension_level heel_tension_level eversion_tension_level)
      tension_level_selector_cell_ids.each do |tension_level_selector_cell_id|
        get_selector_cell_text(tension_level_selector_cell_id).should == ''
        click_selector_cell(tension_level_selector_cell_id)
        click_selector_cell("select_tension_level_#{iteration}")
        get_selector_cell_text(tension_level_selector_cell_id).should == iteration.to_s
        iteration += 1
      end

      # verify autosave
      visit(@practice_room_visit_page)
      get_selector_cell_text('short_leg_side').should == 'L'
      get_selector_cell_text('short_leg_amount').should == '1-1.5'

      # tension level fields
      iteration = 0
      tension_level_selector_cell_ids = %w(abduction_tension_level adduction_tension_level heel_tension_level eversion_tension_level)
      tension_level_selector_cell_ids.each do |tension_level_selector_cell_id|
        get_selector_cell_text(tension_level_selector_cell_id).should == iteration.to_s
        iteration += 1
      end

    end

    scenario "values for Advanced/Misc can be set and autosave" do

      get_selector_cell_text('ingression_organizing_field').should == ''
      click_selector_cell('ingression_organizing_field')
      click_selector_cell('select_organizing_field_h2')
      get_selector_cell_text('ingression_organizing_field').should == 'H2'

      get_selector_cell_text('egression_organizing_field').should == ''
      click_selector_cell('egression_organizing_field')
      click_selector_cell('select_organizing_field_h3u')
      get_selector_cell_text('egression_organizing_field').should == 'H3U'

      boolean_selector_cell_ids = %w(long_lever_arm short_lever_arm crest)
      boolean_selector_cell_ids.each do |selector_cell_id|
        click_selector_cell(selector_cell_id)
        get_selector_cell_text(selector_cell_id).should == 'X'
      end

      # verify autosave
      visit(@practice_room_visit_page)
      get_selector_cell_text('ingression_organizing_field').should == 'H2'
      get_selector_cell_text('egression_organizing_field').should == 'H3U'

      boolean_selector_cell_ids = %w(long_lever_arm short_lever_arm crest)
      boolean_selector_cell_ids.each do |selector_cell_id|
        get_selector_cell_text(selector_cell_id).should == 'X'
      end

    end

    scenario "values for SRI can be set and autosave" do

      get_selector_cell_text('sri_stage').should == ''
      click_selector_cell('sri_stage')
      click_selector_cell('select_sri_stage_3')
      get_selector_cell_text('sri_stage').should == '3'

      get_selector_cell_text('sri_position_a').should == ''
      click_selector_cell('sri_position_a')
      click_selector_cell('select_sri_position_6')
      get_selector_cell_text('sri_position_a').should == '6'

      get_selector_cell_text('sri_level_of_care').should == ''
      click_selector_cell('sri_level_of_care')
      click_selector_cell('select_level_of_care_2b')
      get_selector_cell_text('sri_level_of_care').should == '2B'

      get_selector_cell_text('sri_organizing_field').should == ''
      click_selector_cell('sri_organizing_field')
      click_selector_cell('select_organizing_field_h5')
      get_selector_cell_text('sri_organizing_field').should == 'H5'

      # verify autosave
      visit(@practice_room_visit_page)
      get_selector_cell_text('sri_stage').should == '3'
      get_selector_cell_text('sri_position_a').should == '6'
      get_selector_cell_text('sri_level_of_care').should == '2B'
      get_selector_cell_text('sri_organizing_field').should == 'H5'

    end

    scenario "when SRI stage 1 is selected show two position selectors: peace and disconnection, they can be set and loaded" do
      get_selector_cell_text('sri_position_a').should == ''

      selector_cell_present?('sri_position_a').should == true
      selector_cell_present?('sri_position_b').should == false
      has_text?('Pos', 'td', 'label_sri_position_a')
      has_text?('Pos', 'td', 'label_sri_position_b')

      click_selector_cell('sri_stage')
      click_selector_cell('select_sri_stage_1')
      selector_cell_present?('sri_position_a').should == true
      selector_cell_present?('sri_position_b').should == true
      has_text?('Peace', 'td', 'label_sri_position_a')
      has_text?('Discon', 'td', 'label_sri_position_b')

      click_selector_cell('sri_position_a')
      click_selector_cell('select_sri_position_3')
      get_selector_cell_text('sri_position_a').should == '3'
      click_selector_cell('sri_position_b')
      click_selector_cell('select_sri_position_6')
      get_selector_cell_text('sri_position_b').should == '6'

      # test autosave and reload logic
      visit(@practice_room_visit_page)

      selector_cell_present?('sri_position_a').should == true
      selector_cell_present?('sri_position_b').should == true
      has_text?('Peace', 'td', 'label_sri_position_a')
      has_text?('Discon', 'td', 'label_sri_position_b')
      get_selector_cell_text('sri_position_a').should == '3'
      get_selector_cell_text('sri_position_b').should == '6'

    end

    scenario "when SRI stage 2 is selected show two position selectors" do
      get_selector_cell_text('sri_position_a').should == ''

      selector_cell_present?('sri_position_a').should == true
      selector_cell_present?('sri_position_b').should == false
      has_text?('Pos', 'td', 'label_sri_position_a')
      has_text?('Pos', 'td', 'label_sri_position_b')

      click_selector_cell('sri_stage')
      click_selector_cell('select_sri_stage_2')
      selector_cell_present?('sri_position_a').should == true
      selector_cell_present?('sri_position_b').should == true
      has_text?('Pos A', 'td', 'label_sri_position_a')
      has_text?('Pos B', 'td', 'label_sri_position_b')

      click_selector_cell('sri_position_a')
      click_selector_cell('select_sri_position_2')
      get_selector_cell_text('sri_position_a').should == '2'
      click_selector_cell('sri_position_b')
      click_selector_cell('select_sri_position_4')
      get_selector_cell_text('sri_position_b').should == '4'

      # test autosave and reload logic
      visit(@practice_room_visit_page)

      selector_cell_present?('sri_position_a').should == true
      selector_cell_present?('sri_position_b').should == true
      has_text?('Pos A', 'td', 'label_sri_position_a')
      has_text?('Pos B', 'td', 'label_sri_position_b')
      get_selector_cell_text('sri_position_a').should == '2'
      get_selector_cell_text('sri_position_b').should == '4'
    end

    scenario "values for Diagnosis and Notes can be set and autosave" do
      get_element_text('visit_diagnosis').should == ''
      fill_in('visit_diagnosis', :with => 'I diagnose no diagnosis')
      get_element_text('visit_diagnosis').should == 'I diagnose no diagnosis'

      get_element_text('visit_notes').should == ''
      fill_in('visit_notes', :with => 'I note no notes')
      get_element_text('visit_notes').should == 'I note no notes'

      sleep(2) # delay for autosave to complete... wait_until {} not working on this

      # verify autosave
      visit(@practice_room_visit_page)
      get_element_text('visit_diagnosis').should == 'I diagnose no diagnosis'
      get_element_text('visit_notes').should == 'I note no notes'
    end

    scenario "the mini-travel card should highlight available gateways when a phase is selected for Phase 1" do
      # phase 1 - set phase 2 C1
      verify_highlighted?('mini_travel_card_gateway_c1_occ').should == false
      verify_highlighted?('mini_travel_card_gateway_c1_c2').should == false

      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_2_c1')

      verify_highlighted?('mini_travel_card_gateway_c1_occ').should == true
      verify_highlighted?('mini_travel_card_gateway_c1_c2').should == true

      # phase 2
      click_selector_cell('work_second_phase_button')

      verify_highlighted?('mini_travel_card_gateway_c2_c1').should == false
      verify_highlighted?('mini_travel_card_gateway_c2_c3').should == false
      verify_highlighted?('mini_travel_card_gateway_c3_c2').should == false
      verify_highlighted?('mini_travel_card_gateway_c3_c4').should == false

      click_selector_cell('selected_phase_2')
      click_selector_cell('select_phase_4')

      verify_highlighted?('mini_travel_card_gateway_c2_c1').should == true
      verify_highlighted?('mini_travel_card_gateway_c2_c3').should == true
      verify_highlighted?('mini_travel_card_gateway_c3_c2').should == true
      verify_highlighted?('mini_travel_card_gateway_c3_c4').should == true
    end

    scenario "the mini-travel card should highlight available gateways when a phase is selected for Phase 2" do

    end

    scenario "when selecting Phase 1 > 2 C1, 1 > 2 C5, 1 > 4 the second gateway affecting can be the same as the first gateway affecting" do
      # Louis: on phase 1>2 (both C1 and C5) and for phase 1>4:  the second gateway 'affecting' choice can still be the affected gateway
      # from the first contact. example: I make an occiput contact to affect Left C1/2, I can then also make an S1 contact to
      # affect Left C1/2.  So basically, I can use another part of the spine to affect the same gateway or go for affecting a
      # different gateway within that phase.

      # 1 > 2 C1
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_2_c1')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      expected_gateway_choice_ids = %w(select_gateway_c1_occ select_gateway_c1_c2)
      expected_gateway_choice_ids.each {|id| selector_cell_present?(id).should == true}
      click_selector_cell('select_gateway_') # close dialog

      click_selector_cell('selected_phase_1_gateway_2_affecting')
      expected_gateway_choice_ids.each {|id| selector_cell_present?(id).should == true}
      click_selector_cell('select_gateway_') # close dialog

      # 1 > 2 C5
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_2_c5')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      expected_gateway_choice_ids = %w(
        select_gateway_c3_c4
        select_gateway_c4_c3
        select_gateway_c4_c5
        select_gateway_c5_c4
        select_gateway_c5_c6
        select_gateway_c6_c5
        select_gateway_c6_c7
        select_gateway_c7_c6
        select_gateway_c7_t1
        select_gateway_t1_c7
        select_gateway_t1_t2
        select_gateway_t2_t1
        select_gateway_t2_t3
        select_gateway_t3_t2)
      expected_gateway_choice_ids.each {|id| selector_cell_present?(id).should == true}
      click_selector_cell('select_gateway_') # close dialog

      click_selector_cell('selected_phase_1_gateway_2_affecting')
      expected_gateway_choice_ids.each {|id| selector_cell_present?(id).should == true}
      click_selector_cell('select_gateway_') # close dialog

      # 1 > 4
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_4')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      expected_gateway_choice_ids = %w(
        select_gateway_c2_c1
        select_gateway_c2_c3
        select_gateway_c3_c2
        select_gateway_c3_c4)
      expected_gateway_choice_ids.each {|id| selector_cell_present?(id).should == true}
      click_selector_cell('select_gateway_') # close dialog

      click_selector_cell('selected_phase_1_gateway_2_affecting')
      expected_gateway_choice_ids.each {|id| selector_cell_present?(id).should == true}
      click_selector_cell('select_gateway_') # close dialog
    end

    scenario "in Phase 1 > 3 the affected gateway should not be the same as the primary gateway" do
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_3')
      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_s1')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      selector_cell_present?('select_gateway_s1').should == false

      click_selector_cell('selected_phase_1_gateway_2')
      click_selector_cell('select_gateway_s2')
      click_selector_cell('selected_phase_1_gateway_2_affecting')
      selector_cell_present?('select_gateway_s2').should == false
    end

    scenario "in Phase 1 > 5 the affected gateway should not be the same as the primary gateway" do
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_1_5')
      click_selector_cell('selected_phase_1_gateway_1')
      click_selector_cell('select_gateway_occ')
      click_selector_cell('selected_phase_1_gateway_1_affecting')
      selector_cell_present?('select_gateway_occ').should == false

      click_selector_cell('selected_phase_1_gateway_2')
      click_selector_cell('select_gateway_cx')
      click_selector_cell('selected_phase_1_gateway_2_affecting')
      selector_cell_present?('select_gateway_cx').should == false
    end

    scenario "phase 5 should show CX (no L/R differentiation), L APEX and R APEX as static options" do
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_5')
      click_selector_cell('selected_phase_1_gateway_2')
      expected_gateway_choice_ids = %w(select_gateway_cx_c select_gateway_apex_l select_gateway_apex_r)
      expected_gateway_choice_ids.each {|id| selector_cell_present?(id).should == true}
    end

    scenario "the correct directions are shown for each phase" do

      # all phasse 1 should show M/L
      selected_phase_ids = %w(select_phase_1_2_c1 select_phase_1_2_c5 select_phase_1_3 select_phase_1_4 select_phase_1_5)
      selected_phase_ids.each do |selected_phase_id|
        click_selector_cell('selected_phase_1')
        click_selector_cell(selected_phase_id)

        click_selector_cell('selected_phase_1_direction')
        selector_cell_present?('select_direction_m').should == true
        selector_cell_present?('select_direction_l').should == true
        selector_cell_present?('select_direction_f_e').should == false
        selector_cell_present?('select_direction_l_b').should == false
        selector_cell_present?('select_direction_').should == true

        click_selector_cell('select_direction_') # close dialog
      end

      # Phase 2 C1, 2 C5, 4
      selected_phase_ids = %w(select_phase_2_c1 select_phase_2_c5 select_phase_4)
      selected_phase_ids.each do |selected_phase_id|
        click_selector_cell('selected_phase_1')
        click_selector_cell(selected_phase_id)

        click_selector_cell('selected_phase_1_direction')
        selector_cell_present?('select_direction_m').should == false
        selector_cell_present?('select_direction_l').should == false
        selector_cell_present?('select_direction_f_e').should == true
        selector_cell_present?('select_direction_l_b').should == true
        selector_cell_present?('select_direction_').should == true

        click_selector_cell('select_direction_') # close dialog
      end

      # 3 - auto-set, so no choices
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_3')

      click_selector_cell('selected_phase_1_direction')
      selector_cell_present?('select_direction_m').should == false
      selector_cell_present?('select_direction_l').should == false
      selector_cell_present?('select_direction_f_e').should == false
      selector_cell_present?('select_direction_l_b').should == false
      selector_cell_present?('select_direction_').should == true

      click_selector_cell('select_direction_') # close dialog

      # 5 -- no direction
      click_selector_cell('selected_phase_1')
      click_selector_cell('select_phase_5')
      selector_cell_present?('selected_phase_1_direction').should == false

    end

    scenario "the visit can be deleted" do
      click_selector_cell('Delete')
      has_flash_notice?('Visit successfully deleted').should == true

      page.has_xpath?("//*[@id='no_visit_loaded']").should == true
      selector_cell_present?('New Visit').should == true
    end

  end

  context "test mini-travel card", :js => true, :visit => true do
    before(:each) do
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      @practice_member = create_practice_member('Kahn, David Nathan', practice_name)

      visit = Factory.create(:visit)
      visit.practice_member_id = @practice_member.id
      visit.date = DateTime.now
      visit.save

      @practice_room_visit_page = "/practice_room/#{@practice_member.id}/visit/#{visit.id}"

      set_travel_card_default_values(@practice_member.travel_card)
    end

    scenario "the mini-travel card should show the right gateways with the right coloring" do

      visit(@practice_room_visit_page)

      mini_or_travel_card_non_gateway_cell_correct?('mini_travel_card_level_of_care', '1A')
      mini_or_travel_card_non_gateway_cell_correct?('mini_travel_card_full_respiratory_wave', 'X')
      mini_or_travel_card_non_gateway_cell_correct?('mini_travel_card_leading_bme_strategy', 'B')
      mini_or_travel_card_non_gateway_cell_correct?('mini_travel_card_second_bme_strategy', 'M')

      travel_card_gateway_fields.each do |field|
        mini_or_travel_card_gateway_cell_correct?("mini_travel_card_#{field}", 'L')
      end

      # change fields to r and verify
      travel_card_gateway_fields.each do |field|
        eval("@practice_member.travel_card.#{field}='R'")
      end
      @practice_member.travel_card.save
      visit(@practice_room_visit_page)
      travel_card_gateway_fields.each do |field|
        mini_or_travel_card_gateway_cell_correct?("mini_travel_card_#{field}", 'R')
      end

      # change fields to r and verify
      travel_card_gateway_fields.each do |field|
        eval("@practice_member.travel_card.#{field}=''")
      end
      @practice_member.travel_card.save
      visit(@practice_room_visit_page)
      travel_card_gateway_fields.each do |field|
        mini_or_travel_card_gateway_cell_correct?("mini_travel_card_#{field}", '')
      end

    end

    scenario "the mini-travel card should update gateways and coloring correctly based on changes to the travel card" do
      visit(@practice_room_visit_page)

      mini_or_travel_card_gateway_cell_correct?('mini_travel_card_gateway_occ_c1', 'L')

      # change value on the travel card
      click_selector_cell('Travel Card')
      click_selector_cell('gateway_occ_c1')
      get_selector_cell_text('gateway_occ_c1').should == 'R'

      # return to visit and verify that the value propogated both to the set value and the selector
      click_selector_cell('Visit')
      mini_or_travel_card_gateway_cell_correct?('mini_travel_card_gateway_occ_c1', 'R')
    end
  end

  context "test gateway selector side text and coloring", :js => true, :visit => true do

    before(:each) do
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      practice_member = create_practice_member('Kahn, David Nathan', practice_name)

      practice_member.travel_card.gateway_occ_c1 = 'L'
      practice_member.travel_card.save


      @visit = Factory.create(:visit)
      @visit.practice_member_id = practice_member.id
      @visit.date = DateTime.now
      @visit.phase_1 = 5
      @visit.save

      @practice_room_visit_page = "/practice_room/#{practice_member.id}/visit/#{@visit.id}"
      @practice_room_travel_card_page = "/practice_room/#{practice_member.id}/travel_card"


      visit(@practice_room_visit_page)
    end

    scenario "gateway selector shows the gateway directions color coded on page load" do
      click_selector_cell('selected_phase_1_gateway_1')
      verify_visit_gateway_selector('select_gateway_occ_c1', 'L', 'OCC/C1')
    end

    scenario "gateway selector show the correct gateway direction for CX" do
      @visit.phase_1 = 3
      @visit.save!
      visit(@practice_room_visit_page)

      # CX gateway side not set
      click_selector_cell('selected_phase_1_gateway_1')
      get_selector_cell_text('select_gateway_cx').should == 'CX'

      # CX gateway side set
      @visit.practice_member.travel_card.gateway_cx = 'R'
      @visit.practice_member.travel_card.save!
      visit(@practice_room_visit_page)
      click_selector_cell('selected_phase_1_gateway_1')
      verify_visit_gateway_selector('select_gateway_cx', 'R', 'CX')
    end

    scenario "gateway selector updates based on changes to the travel card without reloading the page" do
      click_selector_cell('selected_phase_1_gateway_1')
      verify_visit_gateway_selector('select_gateway_occ_c1', 'L', 'OCC/C1')

      # change value on the travel card
      click_selector_cell('Travel Card')
      click_selector_cell('gateway_occ_c1')
      get_selector_cell_text('gateway_occ_c1').should == 'R'

      # return to visit and verify that the value propogated both to the set value and the selector
      click_selector_cell('Visit')
      click_selector_cell('selected_phase_1_gateway_1')
      verify_visit_gateway_selector('select_gateway_occ_c1', 'R', 'OCC/C1')
    end

    scenario "selected gateways show the gateways directions on page load" do
      @visit.phase_1_gateway_1 = 'OCC/C1'
      @visit.save
      visit(@practice_room_visit_page)
      verify_visit_gateway_selector('selected_phase_1_gateway_1', 'L', 'OCC/C1')
    end

    scenario "selected gateways show the a gateways' new direction after being changed on the travel card" do
      @visit.phase_1_gateway_1 = 'OCC/C1'
      @visit.save
      visit(@practice_room_visit_page)
      verify_visit_gateway_selector('selected_phase_1_gateway_1', 'L', 'OCC/C1')

      # change value on the travel card
      click_selector_cell('Travel Card')
      click_selector_cell('gateway_occ_c1')
      get_selector_cell_text('gateway_occ_c1').should == 'R'

      # return to visit and verify that the value propogated both to the set value and the selector
      click_selector_cell('Visit')
      verify_visit_gateway_selector('selected_phase_1_gateway_1', 'R', 'OCC/C1')

      # change value on the travel card again
      click_selector_cell('Travel Card')
      click_selector_cell('gateway_occ_c1')
      get_selector_cell_text('gateway_occ_c1').should == ''

      # return to visit and verify that the value propogated both to the set value and the selector
      click_selector_cell('Visit')
      verify_visit_gateway_selector('selected_phase_1_gateway_1', '', 'OCC/C1')
    end

  end

  context "test the different loading strategies of the visit view", :visit => true do
    before(:each) do
      practice_name = 'StructuralArtistry practice'
      logged_in_as_role_for_practice(:practice_user, practice_name)
      @practice_member = create_practice_member('Kahn, David Nathan', practice_name)
    end

    scenario "if a practice member has not had a visit in the last day, just show the New Visit button" do
      visit("/practice_room/#{@practice_member.id}/visit")
      page.has_xpath?("//*[@id='no_visit_loaded']").should == true
    end

    scenario "if a practice member has had a visit in the last day, show the most recent visit on loading the visit view" do
      visit("/practice_room/#{@practice_member.id}/visit/new")

      page.has_xpath?("//*[@id='no_visit_loaded']").should == false

      # get the visit from the url
      page.current_url =~ /[0-9]{1,}?$/
      visit_id = $&

      verify_visit_loaded(visit_id)
    end

    scenario "a new visit is created when user clicks New visit", :js => true do
      visit("/practice_room/#{@practice_member.id}/visit")
      Visit.all.size.should == 0

      click_selector_cell('New Visit')

      visit = Visit.all.first

      verify_visit_loaded(visit.id)
    end

  end

end
