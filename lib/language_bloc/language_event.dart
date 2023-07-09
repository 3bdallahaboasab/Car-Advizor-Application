part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class InitialLanguageEvent extends LanguageEvent {
  final Locale locale;

  const InitialLanguageEvent({required this.locale});
  @override
  List<Object> get props => [locale];
}

class ConverLanguageEvent extends LanguageEvent {
  final Locale locale;

  const ConverLanguageEvent({required this.locale});
  @override
  List<Object> get props => [locale];
}
