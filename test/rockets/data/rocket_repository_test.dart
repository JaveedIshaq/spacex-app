import 'package:mocktail/mocktail.dart';
import 'package:spacex_demo/rockets/data/rocket.dart';
import 'package:spacex_demo/rockets/data/rocket_api_service.dart';
import 'package:spacex_demo/rockets/data/rocket_repository.dart';
import 'package:test/test.dart';

class MockSpaceXApiClient extends Mock implements RocketsApiService {}

void main() {
  group('RocketRepository', () {
    late RocketsApiService rocketsApiService;
    late RocketRepository subject;

    final rockets = List.generate(
      3,
      (i) => Rocket(
        id: '$i',
        name: 'mock-rocket-name-$i',
        description: 'mock-rocket-description-$i',
        height: const Length(meters: 1, feet: 1),
        diameter: const Length(meters: 1, feet: 1),
        mass: const Mass(kg: 1, lb: 1),
      ),
    );

    setUp(() {
      rocketsApiService = MockSpaceXApiClient();
      when(() => rocketsApiService.fetchAllRockets())
          .thenAnswer((_) async => rockets);

      subject = RocketRepository(rocketsApiService: rocketsApiService);
    });

    test('constructor returns normally', () {
      expect(
        () => RocketRepository(),
        returnsNormally,
      );
    });

    group('.fetchAllRockets', () {
      test('throws RocketsException when api throws an exception', () async {
        when(() => rocketsApiService.fetchAllRockets()).thenThrow(Exception());

        expect(
          () => subject.fetchAllRockets(),
          throwsA(isA<RocketsException>()),
        );

        verify(() => rocketsApiService.fetchAllRockets()).called(1);
      });

      test('makes correct request', () async {
        await subject.fetchAllRockets();

        verify(() => rocketsApiService.fetchAllRockets()).called(1);
      });
    });
  });
}
