import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/archiveExams/models/read_archive_exams_model.dart';
import 'package:inception/archiveExams/repository/archive_exams_category_repository.dart';

part 'read_archive_exams_event.dart';
part 'read_archive_exams_state.dart';

class ReadArchiveExamsBloc
    extends Bloc<ReadArchiveExamsEvent, ReadArchiveExamsState> {
  final ArchiveExamsRepository repository;
  final int id;
  ReadArchiveExamsBloc(this.repository, this.id)
      : super(ReadArchiveExamsInitialState()) {
    on<ReadArchiveExamsEvent>((event, emit) async {
      emit(ReadArchiveExamsInitialState());
      try {
        final response = await repository.readArchiveExams(id);
        final questionsList =
            ReadArchiveExamsModel.fromJson(response.data).payload.questions;
        emit(ReadArchiveExamsLoadedState(questionsList));
      } catch (error) {
        emit(ReadArchiveExamsErrorState(
            ApiService().handleError(error as DioError)));
      }
    });
  }
}
