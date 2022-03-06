import 'package:spacex_demo/crew/data/crew_api_service.dart';
import 'package:spacex_demo/crew/data/crew_member.dart';

/// Thrown when an error occurs while looking up the crew members
class CrewMembersException implements Exception {}

/// {@template crew_member_repository}
/// A Dart package to manage the crew domain
/// {@endtemplate}
class CrewMemberRepository {
  ///  {@macro crew_member_repository}
  CrewMemberRepository({CrewMemberApiService? crewMemberApiService})
      : _crewMemberApiService = crewMemberApiService ?? CrewMemberApiService();

  final CrewMemberApiService _crewMemberApiService;

  /// Returns an list alphabetabetically sorted by name
  /// of all SpaceX crew members
  ///
  /// Throws a [CrewMembersException] if an error occurs.
  Future<List<CrewMember>> fetchAllCrewMembers() async {
    try {
      final crewMembers = await _crewMemberApiService.fetchAllCrewMembers();

      crewMembers.sort((a, b) => a.name.compareTo(b.name));

      return crewMembers;
    } on Exception {
      throw CrewMembersException();
    }
  }
}
