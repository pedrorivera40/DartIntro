/*
  This code has been adapted from the Intro to Dart for Java Developers codelab (https://codelabs.developers.google.com/codelabs/from-java-to-dart).
 */

class Bicycle {
  int cadence;
  int _speed = 0;
  int get speed =>
      _speed; // Equivalent to a private variable (by using the '_' character at the beginning of the identifier).
  int gear;

  Bicycle({this.cadence = 10, this.gear = 2}); // Using "optional constructor".

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => 'Bicycle: $_speed mph, cad = $cadence gear = $gear.';
}

// Factory instantiation in Dart.
Bicycle bicycleFactory(Map<String, num> params) {
  if (params.containsKey('cadence') && params.containsKey('gear')) {
    return Bicycle(cadence: params['cadence'], gear: params['gear']);
  }
  if (params.containsKey('cadence')) {
    return Bicycle(cadence: params['cadence']);
  }
  if (params.containsKey('gear')) {
    return Bicycle(gear: params['gear']);
  }
  return Bicycle();
}

void main() {
  print('Using optional constructor:');

  var bike_1 = Bicycle(cadence: 5, gear: 4);
  print('\tbike 1: $bike_1');

  var bike_2 = Bicycle(cadence: 2);
  print('\tbike 2: $bike_2');

  var bike_3 = Bicycle();
  print('\tbike 3: $bike_3');

  print('Using factory constructor:');

  // Using Maps in Dart: https://www.tutorialspoint.com/dart_programming/dart_programming_map.htm
  var map_1 = {'cadence': 5, 'gear': 4};
  var bike_4 = bicycleFactory(map_1);
  print('\tbike 4: $bike_4');

  var map_2 = {'cadence': 20};
  var bike_5 = bicycleFactory(map_2);
  print('\tbike 5: $bike_5');

  var map_3 = {'gear': 4};
  var bike_6 = bicycleFactory(map_3);
  print('\tbike 6: $bike_6');

  var map_4 = Map<String, num>();
  var bike_7 = bicycleFactory(map_4);
  print('\tbike 7: $bike_7');
}
