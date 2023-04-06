class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  static double ouncesToGrams(int ounces){
    if(ounces <= 0){
      throw ArgumentError();
    }
    return (ounces * 28.35); 
  }

  static double frenchPressCoffeeAmount(double water) {
    if (water <= 0) {
      throw ArgumentError();
    }
    return (water / 14); 
  }  

  static double dripMachineCoffeeAmount(double water) {
    if (water <= 0) {
      throw ArgumentError();
    }
    return (water / 17); 
  }

}
