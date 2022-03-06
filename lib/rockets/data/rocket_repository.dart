import 'package:spacex_demo/rockets/data/rocket.dart';
import 'package:spacex_demo/rockets/data/rocket_api_service.dart';

/// Thrown when an error occurs while looking up rockets.
class RocketsException implements Exception {}

/// Thrown when an error occurs while performing a search.
class SearchException implements Exception {}

/// {@template rocket_repository}
/// A Dart class which exposes methods to implement rocket-related
/// functionality.
/// {@endtemplate}
class RocketRepository {
  /// {@macro rocket_repository}
  RocketRepository({RocketsApiService? rocketsApiService})
      : _rocketsApiService = rocketsApiService ?? RocketsApiService();

  final RocketsApiService _rocketsApiService;

  /// Returns a list of all SpaceX rockets.
  ///
  /// Throws a [RocketsException] if an error occurs.
  Future<List<Rocket>> fetchAllRockets() {
    try {
      return _rocketsApiService.fetchAllRockets();
    } on Exception {
      throw RocketsException();
    }
  }
}
