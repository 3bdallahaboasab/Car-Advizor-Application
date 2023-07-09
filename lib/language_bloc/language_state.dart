part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class SetLanguageState extends LanguageState {
  final Locale locale;

  const SetLanguageState({required this.locale});
  @override
  List<Object> get props => [locale];
}
