import 'package:flutter_bloc/flutter_bloc.dart';

class TimerEvent {}

class StartTimer extends TimerEvent {
  final Duration duration;

  StartTimer(this.duration);
}

class DecreaseTimer extends TimerEvent {}

class TimerBloc extends Bloc<TimerEvent, Duration> {
  TimerBloc([super.initialState = const Duration(minutes: 1)]) {
    on<StartTimer>((event, emit) {
      emit(event.duration);
    });

    on<DecreaseTimer>((event, emit) {
      if (state.inSeconds > 0) {
        emit(state - const Duration(seconds: 1));
      }
    });
  }
}