import 'package:homebrew/utils/coffee_tools.dart';

class Homebrew {
  String _device = "";
  String _recommendation = "";
  String _coffeeType = "";
  int _coffeeGrams;
  int _waterGrams;

  Homebrew(String word) {
    _device = word;
    _recommendation = "";
    _coffeeGrams = 0;
    _waterGrams = 0;
  }

  String device() {
    return _device;
  }

  String recommendation() {
    return _recommendation;
  }

  String coffeeType(String device) {
    return _coffeeType;
  }  

  int coffeeGrams(String numCups){
    return _coffeeGrams;
  }

  int waterGrams(String numCups){
    return _waterGrams;
  }

  bool validInput(String userInput) {

    if (userInput.isEmpty ||  userInput.contains(RegExp(r'[a-zA-Z]')) || !userInput.contains(RegExp(r'^[1-9][0-9]*$'))) 
    {
      return false;
    } else {
      return true;
    }
    
  }  

  Map<String, int> recommended(int numCups, String device){
    
    int ounces = CoffeeTools.cupsToOunces(numCups);
    double water = CoffeeTools.ouncesToGrams(ounces);

    int coffeeGrams;
    int roundedWater = water.round();
    Map<String, int> rec;
    if (device == "french_press") {
      coffeeGrams = CoffeeTools.frenchPressCoffeeAmount(water).round();
      rec = {'Coffee': coffeeGrams, 'Water': roundedWater};
    } else if (device == "drip_machine") {
      coffeeGrams = CoffeeTools.dripMachineCoffeeAmount(water).round();
      rec = {'Coffee': coffeeGrams, 'Water': roundedWater};
    }
    return rec;

  }

  String coffeeTypes(String device) {

    if (device == "french_press") {
      _coffeeType = "course";
    } else if (device == "drip_machine") {
      _coffeeType = "medium";
    }

    return _coffeeType;
  } 

}