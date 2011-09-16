describe 'View Type', ->

  describe 'paid feature', ->

    beforeEach ->
      loadFixtures('spec/javascripts/fixtures/practice_room_paid.html')

      script = "
        <script language=\"javascript\">
          $(document).ready(function() {
            visit = new Visit('');
            visit.data = {};
          });
        </script>"

      $('#jasmine-fixtures').append(script)
      $('#practice_room_visit').show()

    describe 'View Type button', ->

      it 'should show the View Type toggle element', ->
        expect($('#visit_view_type')).toBeVisible()
        expect($('#visit_view_type').html()).toEqual('Std')

      it 'should toggle the view type in the object', ->
        expect(PracticeRoom.Visit.view_type).toEqual('Std')
        PracticeRoom.Visit.click_view_type()
        expect(PracticeRoom.Visit.view_type).toEqual('SOAP')
        PracticeRoom.Visit.click_view_type()
        expect(PracticeRoom.Visit.view_type).toEqual('Std')

      it 'should toggle the View Type on the page when clicked', ->
        expect($('#visit_view_type').html()).toEqual('Std')
        $('#visit_view_type').mousedown()
        expect($('#visit_view_type').html()).toEqual('SOAP')
        $('#visit_view_type').mousedown()
        expect($('#visit_view_type').html()).toEqual('Std')

