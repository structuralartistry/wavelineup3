describe("CreditCard", function() {
  it("cleans number by removing spaces and dashes", function() {
    expect(CreditCard.cleanNumber("123 4-5")).toEqual("12345");
  });

  it("validates based on mod 10", function() {
    expect(CreditCard.validNumber("4111 1111-11111111")).toBeTruthy();
    expect(CreditCard.validNumber("4111111111111121")).toBeFalsy();
  });
});
