@CreditCard =
  cleanNumber: (number) ->
    return number.replace(/[- ]/g, "")

  validNumber: (number) ->
    total = 0
    number = @cleanNumber(number)
    number
