import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routines_event.dart';
part 'routines_state.dart';

class RoutinesBloc extends Bloc<RoutinesEvent, RoutinesState> {
  RoutinesBloc() : super(RoutinesInitial()) {
    on<RoutinesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
