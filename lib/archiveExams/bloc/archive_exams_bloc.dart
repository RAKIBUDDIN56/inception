import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/archiveExams/models/archive_exams_model.dart';
import 'package:inception/archiveExams/repository/archive_exams_category_repository.dart';

part 'archive_exams_event.dart';
part 'archive_exams_state.dart';

class ArchiveExamsBloc extends Bloc<ArchiveExamsEvent, ArchiveExamsState> {
  final ArchiveExamsRepository repository;
  final int id;
  ArchiveExamsBloc(this.repository, this.id)
      : super(ArchiveExamsLoadingState()) {
    on<ArchiveExamsEvent>((event, emit) async {
      emit(ArchiveExamsLoadingState());
      try {
        final response = await repository.archiveExams(id);
        final archiveExamsList =
            ArchivedExamsModel.fromJson(response.data).payload.allExamsList;
        emit(ArchiveExamsLoadedState(archiveExamsList));
      } catch (error) {
        emit(ArchiveExamsLoadedErrorState(
            ApiService().handleError(error as DioError)));
      }
    });
  }
}
