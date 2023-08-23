import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/examsJoin/models/exams_join_model.dart';
import 'package:inception/examsJoin/repository/exam_join_repository.dart';

part 'exams_join_event.dart';
part 'exams_join_state.dart';

class ExamsJoinBloc extends Bloc<ExamsJoinEvent, ExamsJoinState> {
  final ExamsJoinRepository repository;
  final int id;
  ExamsJoinBloc(this.repository, this.id) : super(ExamsJoinInitial()) {
    on<ExamsJoinLoadEvent>(_examsLoad);
  }

  _examsLoad(ExamsJoinLoadEvent event, Emitter<ExamsJoinState> emit) async {
    emit(ExamsJoinInitialState());
    try {
      final response = await repository.examJoin(id);
      final examsData = ExamsJoinModel.fromJson(response.data);
      print(examsData);
      emit(ExamsJoinLoadedState(examsData));
    } catch (error) {
      emit(ExamsJoinErrorState(ApiService().handleError(error as DioError)));
    }
  }
}

class RadioCubit extends Cubit<String> {
  RadioCubit(String initialOption) : super(initialOption);

  void changeOption(String newOption) {
    emit(newOption);
  }
}
