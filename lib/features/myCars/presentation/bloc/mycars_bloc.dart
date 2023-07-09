import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mycars_event.dart';
part 'mycars_state.dart';

class MycarsBloc extends Bloc<MycarsEvent, MycarsState> {
  MycarsBloc() : super(MycarsInitial()) {
    on<MycarsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
