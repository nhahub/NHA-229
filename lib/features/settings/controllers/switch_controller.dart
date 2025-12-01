import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SwitchEvent {}

class ToggleSwitch extends SwitchEvent {
  final bool switchValue;

  ToggleSwitch(this.switchValue);
}

class SwitchController extends Bloc<SwitchEvent, bool> {
  SwitchController(super.initialState) {
    on<ToggleSwitch>((event, emit) {
      emit(event.switchValue);
    });
  }
}
