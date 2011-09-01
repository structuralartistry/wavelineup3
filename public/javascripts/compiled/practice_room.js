(function() {
  this.Visit = (function() {
    Visit.prototype.do_something = function(something) {
      return something;
    };
    function Visit(data) {
      this.data = data;
    }
    Visit.prototype.set_ui_values = function() {
      this.visit_data = jQuery.parseJSON(this.data);
      return $('#sri_session_1_stage').html(this.visit_data.sri_session_1_stage);
    };
    return Visit;
  })();
}).call(this);
