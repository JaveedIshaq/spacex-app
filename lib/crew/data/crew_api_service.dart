import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:spacex_demo/crew/data/crew_member.dart';

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

/// Thrown if an `http` request returns a non-200 status code.
class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown when an error occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

/// A Dart API Client for the spacex Crew Members REST API.
class CrewMemberApiService {
  CrewMemberApiService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  /// The host URL used for all API requests.
  ///
  /// Only exposed for testing purposes. Do not use directly.
  @visibleForTesting
  static const authority = 'api.spacexdata.com';

  final http.Client _httpClient;

  /// Fetches all SpaceX crew members.
  ///
  /// REST call: `GET /crew`
  Future<List<CrewMember>> fetchAllCrewMembers() async {
    final uri = Uri.https(authority, '/v4/crew');
    final responseBody = await _get(uri);

    try {
      return responseBody
          .map(
            (dynamic item) => CrewMember.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  Future<List<dynamic>> _get(Uri uri) async {
    http.Response response;

    try {
      response = await _httpClient.get(uri);
    } catch (_) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      return json.decode(response.body) as List;
    } catch (_) {
      throw JsonDecodeException();
    }
  }
}
