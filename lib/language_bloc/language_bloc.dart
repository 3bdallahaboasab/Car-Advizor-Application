import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
 import 'package:flutter/material.dart';
import 'package:test/Data/Helper/cache_helper.dart';
import 'package:test/Data/Strings/cache_string.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) {
      if (event is InitialLanguageEvent) {
        final lang = CacheHelper.getData(key: LANG_CACHE);
        if (lang != null) {
          emit(SetLanguageState(locale: Locale(lang, '')));
        } else {
          emit(SetLanguageState(locale: event.locale));
        }
      } else if (event is ConverLanguageEvent) {
        CacheHelper.saveData(key: LANG_CACHE, value: event.locale.languageCode);
        emit(SetLanguageState(locale: event.locale));
      }
    });
  }
}
