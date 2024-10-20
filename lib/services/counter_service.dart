class CounterService {
  int personCount = 1;
  double _billTotal = 0;
  double _tipPercentage = 0;

  void setBillTotal(double billTotal) {
    _billTotal = billTotal;
  }

  void setTipPercentage(double tipPercentage) {
    _tipPercentage = tipPercentage;
  }
  
  void increment() {
    personCount = personCount + 1;
  }

  void decrement() {
    if (personCount > 1) {
      personCount = personCount - 1;
    }
  }

  double totalPerPerson() {
    return ((_billTotal * _tipPercentage) + (_billTotal)) / personCount;
  }

  double totalTip() {
    return _billTotal * _tipPercentage;
  }
}
