import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:spacex_demo/app/app.dart';
import 'package:spacex_demo/crew/data/crew_repository.dart';
import 'package:spacex_demo/rockets/data/rocket_repository.dart';

void main() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final rocketRepository = RocketRepository();
  final crewMemberRepository = CrewMemberRepository();

  runZonedGuarded(
    () => runApp(
      App(
        rocketRepository: rocketRepository,
        crewMemberRepository: crewMemberRepository,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
