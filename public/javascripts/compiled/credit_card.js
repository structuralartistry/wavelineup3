(function() {
  this.CreditCard = (function() {
    function CreditCard() {}
    CreditCard.prototype.cleanNumber = function(number) {
      return number.replace(/[- ]/g, "");
    };
    CreditCard.prototype.validNumber = function(number) {
      var total;
      total = 0;
      number = cleanNumber(number);
      return number;
    };
    return CreditCard;
  })();
}).call(this);
