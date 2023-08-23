import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/notes/models/notes_model.dart';
import 'package:inception/notes/repository/notes_repository.dart';
import 'package:dio/dio.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository notesRepository;
  NotesBloc(this.notesRepository) : super(NotesLoadingState()) {
    on<NotesEvent>((event, emit) async {
      emit(NotesLoadingState());
      try {
        final response = await notesRepository.notes();
        final notesList = NotesModel.fromJson(response.data).payload.notes;
        final subject = NotesModel.fromJson(response.data).payload.subjects;
        var subjectalist = <String>["Select a subject"];
        for (var element in subject) {
          subjectalist.add(element.name);
        }
        emit(NotesLoadedState(notesList, subjectalist));
      } catch (error) {
        var err = ApiService().handleError(error as DioError);
        emit(NotesLoadedErrorState(err));
      }
    });
  }
}
