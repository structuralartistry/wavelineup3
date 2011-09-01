(function() {
  describe('PracticeRoom', function() {
    var json_data_from_server;
    json_data_from_server = "{\"abduction_tension_level\":\"2\",\"adduction_tension_level\":\"3\",\"created_at\":\"2011-08-24T18:53:48Z\",\"crest\":\"X\",\"date\":\"2011-08-24T18:53:48Z\",\"diagnosis\":\"Visit diagnosis\",\"egression_organizing_field\":\"H2\",\"eversion_tension_level\":\"1\",\"heel_tension_level\":\"0\",\"id\":13,\"ingression_organizing_field\":\"H1\",\"long_lever_arm\":\"X\",\"notes\":\"Visit note\",\"phase_1\":\"1 > 2 C1\",\"phase_1_direction\":\"M\",\"phase_1_gateway_1\":\"OCC\",\"phase_1_gateway_1_affecting\":\"C1/OCC\",\"phase_1_gateway_2\":\"S1\",\"phase_1_gateway_2_affecting\":\"C1/C2\",\"phase_1_level_of_care\":\"1A\",\"phase_2\":\"1 > 2 C5\",\"phase_2_direction\":\"L\",\"phase_2_gateway_1\":\"S2\",\"phase_2_gateway_1_affecting\":\"C3/C4\",\"phase_2_gateway_2\":\"S3\",\"phase_2_gateway_2_affecting\":\"C4/C3\",\"phase_2_level_of_care\":\"1B\",\"practice_member_id\":1,\"short_leg_amount\":\"0-0.5\",\"short_leg_side\":\"L\",\"short_lever_arm\":\"X\",\"sri_session_1_level_of_care\":\"1C\",\"sri_session_1_organizing_field\":\"H1\",\"sri_session_1_position_a\":\"2\",\"sri_session_1_position_b\":\"3\",\"sri_session_1_stage\":\"1\",\"sri_session_2_level_of_care\":\"2A\",\"sri_session_2_organizing_field\":\"H2\",\"sri_session_2_position_a\":\"4\",\"sri_session_2_position_b\":\"5\",\"sri_session_2_stage\":\"2\",\"sri_session_3_level_of_care\":\"2B\",\"sri_session_3_organizing_field\":\"H3L\",\"sri_session_3_position_a\":\"5\",\"sri_session_3_position_b\":null,\"sri_session_3_stage\":\"3\",\"updated_at\":\"2011-08-30T20:00:00Z\"}";
    it('should do something', function() {
      return expect(PracticeRoom.do_something('something')).toEqual('something');
    });
    it('should load and set data from the server', function() {
      var visit;
      return visit = new this.Visit(json_data_from_server);
    });
    it('should set ui values based on the data from server', function() {
      var visit;
      visit = new this.Visit(json_data_from_server);
      return visit.set_ui_values();
    });
    return it('should instantiate with data', function() {
      var data_from_server, loaded_data, visit;
      data_from_server = 'some data from the server';
      visit = new this.Visit(data_from_server);
      loaded_data = visit.loaded_raw_data;
      return expect(loaded_data).toEqual(dataFromServer);
    });
  });
}).call(this);
