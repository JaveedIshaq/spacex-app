// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spacex_demo/rocket_details/rocket_details.dart';
import 'package:spacex_demo/rockets/data/rocket.dart';
import 'package:spacex_demo/rockets/data/rocket_repository.dart';

class MockRocketRepository extends Mock implements RocketRepository {}

void main() {
  group('RocketDetailsCubit', () {
    const rocket = Rocket(
      id: '0',
      name: 'mock-rocket-name',
      description: 'mock-rocket-description',
      height: Length(meters: 1, feet: 1),
      diameter: Length(meters: 1, feet: 1),
      mass: Mass(kg: 1, lb: 1),
    );

    test('initial state is correct', () {
      expect(
        RocketDetailsCubit(rocket: rocket).state,
        equals(RocketDetailsState(rocket: rocket)),
      );
    });
  });
}
