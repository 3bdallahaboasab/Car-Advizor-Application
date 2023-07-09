import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addcar_event.dart';
part 'addcar_state.dart';

class AddcarBloc extends Bloc<AddcarEvent, AddcarState> {
  AddcarBloc() : super(AddcarInitial()) {
    on<AddcarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
