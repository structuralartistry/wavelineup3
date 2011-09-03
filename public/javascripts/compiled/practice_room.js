(function() {
  this.Visit = (function() {
    function Visit(raw_json) {
      this.data = jQuery.parseJSON(raw_json);
    }
    Visit.prototype.set_ui_values = function() {
      $('#sri_session_1_stage').html(this.data.sri_session_1_stage);
      $('#sri_session_1_position_a').html(this.data.sri_session_1_position_a);
      $('#sri_session_1_position_b').html(this.data.sri_session_1_position_b);
      $('#sri_session_1_level_of_care').html(this.data.sri_session_1_level_of_care);
      $('#sri_session_1_organizing_field').html(this.data.sri_session_1_organizing_field);
      $('#sri_session_2_stage').html(this.data.sri_session_2_stage);
      $('#sri_session_2_position_a').html(this.data.sri_session_2_position_a);
      $('#sri_session_2_position_b').html(this.data.sri_session_2_position_b);
      $('#sri_session_2_level_of_care').html(this.data.sri_session_2_level_of_care);
      $('#sri_session_2_organizing_field').html(this.data.sri_session_2_organizing_field);
      $('#sri_session_3_stage').html(this.data.sri_session_3_stage);
      $('#sri_session_3_position_a').html(this.data.sri_session_3_position_a);
      $('#sri_session_3_position_b').html(this.data.sri_session_3_position_b);
      $('#sri_session_3_level_of_care').html(this.data.sri_session_3_level_of_care);
      $('#sri_session_3_organizing_field').html(this.data.sri_session_3_organizing_field);
      if (this.data.sri_session_2_stage !== null && this.data.sri_session_2_stage !== '') {
        $('.sri_session_2').show();
        $('#add_sri_session_2').hide();
        $('#add_sri_session_3').show();
      }
      if (this.data.sri_session_3_stage !== null && this.data.sri_session_3_stage !== '') {
        $('.sri_session_3').show();
        $('#add_sri_session_3').hide();
      }
      return this.set_sri_positions();
    };
    Visit.prototype.set_sri_positions = function() {
      var sri_session, sri_stage, _i, _len, _ref, _results;
      _ref = ['1', '2', '3'];
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        sri_session = _ref[_i];
        sri_stage = $('#sri_session_' + sri_session + '_stage').html();
        _results.push(sri_stage !== void 0 && sri_stage !== '' ? sri_stage === '1' || sri_stage === '2' ? ($('#label_sri_session_' + sri_session + '_position_b').show(), $('#sri_session_' + sri_session + '_position_b').show(), sri_stage === '1' ? ($('#label_sri_session_' + sri_session + '_position_a').html('Peace'), $('#label_sri_session_' + sri_session + '_position_b').html('Discon')) : void 0, sri_stage === '2' ? ($('#label_sri_session_' + sri_session + '_position_a').html('Pos A'), $('#label_sri_session_' + sri_session + '_position_b').html('Pos B')) : void 0, sri_session === '1' ? ($('#label_sri_4_col').hide(), $('#label_sri_5_col').show()) : void 0) : ($('#label_sri_session_' + sri_session + '_position_a').html('Pos'), $('#label_sri_session_' + sri_session + '_position_b').html('Pos'), $('#label_sri_session_' + sri_session + '_position_b').hide(), $('#sri_session_' + sri_session + '_position_b').html('').hide(), $('#visit_sri_session_' + sri_session + '_position_b').val(''), $('#label_sri_4_col').show(), $('#label_sri_5_col').hide()) : void 0);
      }
      return _results;
    };
    Visit.prototype.show_selector = function(selector_id, calling_object) {
      var eleOffset, field_to_set, left, topp;
      field_to_set = $(calling_object).attr('id');
      $('#' + selector_id).find('.selector_cell').each(function() {
        return $(this).attr('onMouseDown', "visit.set_selected_value($(this).html(),'" + field_to_set + "'); visit.set_sri_positions();");
      });
      eleOffset = $(calling_object).offset();
      left = eleOffset.left + 'px';
      topp = eleOffset.top + 'px';
      $(".selector").hide();
      $('#' + selector_id).css("left", left).css("top", topp).css("position", "absolute");
      return $('#' + selector_id).show('fast');
    };
    Visit.prototype.set_selected_value = function(value, field_to_set) {
      $('#' + field_to_set).html(value);
      return $(".selector").hide('fast');
    };
    return Visit;
  })();
}).call(this);
