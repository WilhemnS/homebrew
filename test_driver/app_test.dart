// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "61g - course ground coffee"
      And I should see "851g - water"
    */
    test("should give recommendation for French Press", () async {
      // your code here
      final frenchPress = find.byValueKey('french-press');

      await driver.tap(frenchPress);

      final continueButton1 = find.byValueKey('continue1');

      await driver.tap(continueButton1);

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final input = find.byValueKey('cup-input');

      await driver.tap(input);
      await driver.enterText('5');
      expect(await driver.getText(input), '5');    

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);

      final coffeeType = find.byValueKey('type-coffee');

      expect(await driver.getText(coffeeType), "61g - course ground coffee");

      final waterAmount = find.byValueKey('water');

      expect(await driver.getText(waterAmount), "851g - water");

      final done = find.byValueKey('done');

      await driver.tap(done);

    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "50g - medium ground coffee"
      And I should see "851g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
      
      final dripMachine = find.byValueKey('drip-machine');

      await driver.tap(dripMachine);

      final continueButton1 = find.byValueKey('continue1');

      await driver.tap(continueButton1);

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final input = find.byValueKey('cup-input');

      await driver.tap(input);
      await driver.enterText('5');
      expect(await driver.getText(input), '5');    

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);

      await driver.waitFor(find.text("50g - medium ground coffee"));

      await driver.waitFor(find.text("851g - water"));     

      final done = find.byValueKey('done');

      await driver.tap(done);

      });

  });

  group('Sad Paths', ()  {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection", () async {
      //your code here

      final chooseDevice = find.byValueKey('device');

      expect(await driver.getText(chooseDevice), "What coffee maker are you using?");

      final continueButton1 = find.byValueKey('continue1');

      await driver.tap(continueButton1);

      expect(await driver.getText(chooseDevice), "What coffee maker are you using?");

    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here

      final frenchPress = find.byValueKey('french-press');

      await driver.tap(frenchPress);

      final continueButton1 = find.byValueKey('continue1');

      await driver.tap(continueButton1);      

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);      

      expect(await driver.getText(numCups), "How many cups would you like?");

    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount", () async{
      //your code here

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final input = find.byValueKey('cup-input');

      await driver.tap(input);
      await driver.enterText('-1');
      expect(await driver.getText(input), '-1');    

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);

      expect(await driver.getText(numCups), "How many cups would you like?");


    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with letter for cup amount", () async {
      //your code here

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final input = find.byValueKey('cup-input');

      await driver.tap(input);
      await driver.enterText('a');
      expect(await driver.getText(input), 'a');    

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);

      expect(await driver.getText(numCups), "How many cups would you like?");

      //if you can restrict the keyboard to numbers only you can delete this test
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here

      final back1 = find.byValueKey('back1');

      await driver.tap(back1);

      final chooseDevice = find.byValueKey('device');

      expect(await driver.getText(chooseDevice), "What coffee maker are you using?");

      final dripMachine = find.byValueKey('drip-machine');

      await driver.tap(dripMachine);

      final continueButton1 = find.byValueKey('continue1');

      await driver.tap(continueButton1);    

      await driver.waitFor(find.text("How many cups would you like?"));

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);      

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount", () async {
      //your code here

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final input = find.byValueKey('cup-input');

      await driver.tap(input);
      await driver.enterText('-1');
      expect(await driver.getText(input), '-1');    

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);

      expect(await driver.getText(numCups), "How many cups would you like?");      

    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with letter for cup amount", () async {
      //your code here

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final input = find.byValueKey('cup-input');

      await driver.tap(input);
      await driver.enterText('a');
      expect(await driver.getText(input), 'a');    

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);

      expect(await driver.getText(numCups), "How many cups would you like?");

      //if you can restrict the keyboard to numbers only you can delete this test
    });
  });

  group('back Button', () {
    //make up your own tests to check that the back button works
    //on every page
    test("recommended back to how many cups", () async {

      final input = find.byValueKey('cup-input');

      await driver.tap(input);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);

      final recommended = find.byValueKey('recommended');

      await driver.waitFor(recommended);

      expect(await driver.getText(recommended), "Recommended");   

    });
    test("how many cups to coffee device selection", () async {

      final back2 = find.byValueKey('back2');

      await driver.tap(back2);

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final back1 = find.byValueKey('back1');

      await driver.tap(back1);

      final chooseDevice = find.byValueKey('device');

      expect(await driver.getText(chooseDevice), "What coffee maker are you using?");

    });    

    test("done button should go back to coffee device to start new", () async {
      final frenchPress = find.byValueKey('french-press');

      await driver.tap(frenchPress);

      final continueButton1 = find.byValueKey('continue1');

      await driver.tap(continueButton1);

      final numCups = find.byValueKey('cups');

      expect(await driver.getText(numCups), "How many cups would you like?");

      final input = find.byValueKey('cup-input');

      await driver.tap(input);
      await driver.enterText('5');

      final continueButton2 = find.byValueKey('continue2');

      await driver.tap(continueButton2);

      final chooseDevice = find.byValueKey('device');

      final coffeeType = find.byValueKey('type-coffee');

      expect(await driver.getText(coffeeType), "61g - course ground coffee");

      final waterAmount = find.byValueKey('water');

      expect(await driver.getText(waterAmount), "851g - water");

      final done = find.byValueKey('done');

      await driver.tap(done);

      final homebrew = find.byValueKey('homebrew');

      expect(await driver.getText(homebrew), "HOMEBREW");

      expect(await driver.getText(chooseDevice), "What coffee maker are you using?");

    });

  });
}
