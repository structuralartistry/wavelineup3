(function() {
  describe('CreditCard', function() {
    it('cleans number by removing spaces and dashes', function() {
      return expect(CreditCard.cleanNumber("123 4-5")).toEqual("12345");
    });
    return it('validates based on mod 10', function() {
      expect(CreditCard.validNumber("4111 1111-11111111")).toBeTruthy();
      return expect(CreditCard.validNumber("4111111111111121")).toBeFalsy();
    });
  });
}).call(this);
