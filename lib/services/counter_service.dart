class CounterService {
  int personCount = 1;

  void increment() {
    personCount = personCount + 1;
  }

  void decrement() {
    if (personCount > 0) {
      personCount = personCount - 1;
    }
  }
}
