import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostawak/data/preferences/preference_manager.dart';

abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String languageCode;

  ChangeLanguage(this.languageCode);
}

class LanguageController extends Bloc<LanguageEvent, String> {
  LanguageController(super.initialState) {
    on<ChangeLanguage>((event, emit) {
      PreferenceManager().setString('languageCode', event.languageCode);
      emit(event.languageCode);
    });
  }
}
