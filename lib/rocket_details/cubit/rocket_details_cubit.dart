import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_demo/rockets/data/rocket.dart';

part 'rocket_details_state.dart';

class RocketDetailsCubit extends Cubit<RocketDetailsState> {
  RocketDetailsCubit({
    required Rocket rocket,
  }) : super(RocketDetailsState(rocket: rocket));
}
