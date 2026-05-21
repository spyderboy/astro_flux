class StarProductionRate {
  static const int maxTier = 3;

  static bool isValidTier(int tier) => tier >= 1 && tier <= maxTier;

  static int getRate(int tier) {
    switch (tier) {
      case 1:
        return 2;
      case 2:
        return 5;
      case 3:
        return 10;
      default:
        return 0;
    }
  }

  static const Map<int, int> tierRates = {
    1: 2,
    2: 5,
    3: 10,
  };
}