part of 'mycars_bloc.dart';

abstract class MycarsState extends Equatable {
  const MycarsState();  

  @override
  List<Object> get props => [];
}
class MycarsInitial extends MycarsState {}
