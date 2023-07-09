import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sellcar_event.dart';
part 'sellcar_state.dart';

class SellcarBloc extends Bloc<SellcarEvent, SellcarState> {
  SellcarBloc() : super(SellcarInitial()) {
    on<SellcarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
