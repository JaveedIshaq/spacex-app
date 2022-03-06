// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:spacex_demo/crew/data/crew_api_service.dart';
import 'package:spacex_demo/crew/data/crew_member.dart';
import 'package:spacex_demo/crew/data/crew_repository.dart';
import 'package:test/test.dart';

class MockSpaceXApiClient extends Mock implements CrewMemberApiService {}

void main() {
  group('CrewMemberRepository', () {
    late CrewMemberApiService crewMemberApiService;
    late CrewMemberRepository subject;

    final crewMembers = List.generate(
      3,
      (i) => CrewMember(
        id: '$i',
        name: 'Alejandro Ferrero',
        status: 'active',
        agency: 'Very Good Aliens',
        image:
            'https://media-exp1.licdn.com/dms/image/C4D03AQHVNIVOMkwQaA/profile-displayphoto-shrink_200_200/0/1631637257882?e=1637193600&v=beta&t=jFm-Ckb0KS0Z5hJDbo3ZBSEZSYLHfllUf4N-IV2NDTc',
        wikipedia: 'https://www.wikipedia.org/',
        launches: ['Launch $i'],
      ),
    );

    setUp(() {
      crewMemberApiService = MockSpaceXApiClient();
      when(() => crewMemberApiService.fetchAllCrewMembers())
          .thenAnswer((_) async => crewMembers);

      subject =
          CrewMemberRepository(crewMemberApiService: crewMemberApiService);
    });

    test('constructor returns normally', () {
      expect(
        () => CrewMemberRepository(),
        returnsNormally,
      );
    });

    group('.fetchAllCrewMembers', () {
      test(
        'throws CrewMembersException when api throws an exception',
        () async {
          when(() => crewMemberApiService.fetchAllCrewMembers())
              .thenThrow(Exception());

          expect(
            () => subject.fetchAllCrewMembers(),
            throwsA(isA<CrewMembersException>()),
          );

          verify(() => crewMemberApiService.fetchAllCrewMembers()).called(1);
        },
      );

      test('makes correct request', () async {
        await subject.fetchAllCrewMembers();

        verify(() => crewMemberApiService.fetchAllCrewMembers()).called(1);
      });

      test('returns correct crew members', () async {
        expect(await crewMemberApiService.fetchAllCrewMembers(), crewMembers);
      });
    });
  });
}
