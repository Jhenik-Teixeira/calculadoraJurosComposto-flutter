List<double> calculateCompoundInterest(double capital, double monthly, double rate, int months) {
  List<double> results = [];
  double total = capital;

  for (int i = 0; i < months; i++) {
    total += monthly;
    total *= (1 + rate);
    results.add(total);
  }

  return results;
}
