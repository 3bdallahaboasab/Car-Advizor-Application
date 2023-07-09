import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_car_event.dart';
part 'add_car_state.dart';

class AddCarBloc extends Bloc<AddCarEvent, AddCarState> {
  AddCarBloc() : super(AddCarInitial()) {
    on<AddCarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
