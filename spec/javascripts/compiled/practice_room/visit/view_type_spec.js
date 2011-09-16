(function() {
  describe('View Type', function() {
    return describe('paid feature', function() {
      beforeEach(function() {
        var script;
        loadFixtures('spec/javascripts/fixtures/practice_room_paid.html');
        script = "        <script language=\"javascript\">          $(document).ready(function() {            visit = new Visit('');            visit.data = {};          });        </script>";
        $('#jasmine-fixtures').append(script);
        return $('#practice_room_visit').show();
      });
      return describe('View Type button', function() {
        it('should show the View Type toggle element', function() {
          expect($('#visit_view_type')).toBeVisible();
          return expect($('#visit_view_type').html()).toEqual('Std');
        });
        it('should toggle the view type in the object', function() {
          expect(PracticeRoom.Visit.view_type).toEqual('Std');
          PracticeRoom.Visit.click_view_type();
          expect(PracticeRoom.Visit.view_type).toEqual('SOAP');
          PracticeRoom.Visit.click_view_type();
          return expect(PracticeRoom.Visit.view_type).toEqual('Std');
        });
        return it('should toggle the View Type on the page when clicked', function() {
          expect($('#visit_view_type').html()).toEqual('Std');
          $('#visit_view_type').mousedown();
          expect($('#visit_view_type').html()).toEqual('SOAP');
          $('#visit_view_type').mousedown();
          return expect($('#visit_view_type').html()).toEqual('Std');
        });
      });
    });
  });
}).call(this);
