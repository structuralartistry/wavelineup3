(function() {
  this.CreditCard = {
    cleanNumber: function(number) {
      return number.replace(/[- ]/g, "");
    },
    validNumber: function(number) {
      var total;
      total = 0;
      number = this.cleanNumber(number);
      return number;
    }
  };
}).call(this);
