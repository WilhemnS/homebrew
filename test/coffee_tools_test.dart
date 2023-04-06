import 'package:homebrew/models/coffee.dart';
import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 6);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 24);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

  });

  group("ouncesToGrams", () {
    test('calculates grams on 1 ounce', () {
      var grams = CoffeeTools.ouncesToGrams(1);
      expect(grams, 28.35);
    });

    test('calculates grams on positive number of ounces', () {
      var grams = CoffeeTools.ouncesToGrams(4);
      expect(grams, 113.4);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.ouncesToGrams(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.ouncesToGrams(0), throwsArgumentError);
    });

  });

  group("amount of water in grams per cup", () {
    test('calculates amount of coffee on 1 cup of water in grams', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      var grams = CoffeeTools.ouncesToGrams(ounces);
      expect(grams, 170.10000000000002);
    });
    
    test('calculates water on positive number of cups in grams', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      var grams = CoffeeTools.ouncesToGrams(ounces);
      expect(grams, 680.4000000000001);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.ouncesToGrams(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.ouncesToGrams(0), throwsArgumentError);
    });

  }); 

  group("amount of coffee in grams per cup for french press", () {
    test('calculates amount of coffee on 1 cup of water in grams', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      var grams = CoffeeTools.ouncesToGrams(ounces);
      var frenchPress = CoffeeTools.frenchPressCoffeeAmount(grams);
      expect(frenchPress, 12.150000000000002);
    });
    test('calculates water on positive number of cups in grams', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      var grams = CoffeeTools.ouncesToGrams(ounces);
      var frenchPress = CoffeeTools.frenchPressCoffeeAmount(grams);
      expect(frenchPress, 48.60000000000001);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.frenchPressCoffeeAmount(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.frenchPressCoffeeAmount(0), throwsArgumentError);
    });

  });

  group("amount of coffee in grams per cup for drip machine", () {
    test('calculates amount of coffee on 1 cup of water in grams', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      var grams = CoffeeTools.ouncesToGrams(ounces);
      var frenchPress = CoffeeTools.dripMachineCoffeeAmount(grams);
      expect(frenchPress, 10.005882352941178);
    });
    test('calculates water on positive number of cups in grams', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      var grams = CoffeeTools.ouncesToGrams(ounces);
      var frenchPress = CoffeeTools.dripMachineCoffeeAmount(grams);
      expect(frenchPress, 40.02352941176471);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.dripMachineCoffeeAmount(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.dripMachineCoffeeAmount(0), throwsArgumentError);
    });

  });  

  group("invalid input", () {
    test('invalid input empty', () {
      String input = "french_press";
      final homebrew = Homebrew(input);

      bool returnVal = homebrew.validInput('');
      expect(returnVal, isFalse);
    });
    test('invalid input number', () {
      String input = "french_press";
      final homebrew = Homebrew(input);
      bool returnVal = homebrew.validInput('0');
      expect(returnVal, isFalse);
    });

    test('invalid input letter', () {
            String input = "french_press";
      final homebrew = Homebrew(input);

      bool returnVal = homebrew.validInput('a');
      expect(returnVal, isFalse);
    });

    test('invalid character', () {
      String input = "french_press";
      final homebrew = Homebrew(input);

      bool returnVal = homebrew.validInput('#');
      expect(returnVal, isFalse);
    });

    test('valid input', () {
      String input = "french_press";
      final homebrew = Homebrew(input);

      bool returnVal = homebrew.validInput('1');
      expect(returnVal, isTrue);
    });

  });  



}
