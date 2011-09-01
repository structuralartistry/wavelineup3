(function() {
  this.PracticeRoom = (function() {
    function PracticeRoom() {}
    PracticeRoom.prototype.do_something = function(something) {
      return something;
    };
    return PracticeRoom;
  })();
}).call(this);
