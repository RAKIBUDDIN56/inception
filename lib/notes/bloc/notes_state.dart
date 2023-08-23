part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();
}

class NotesLoadingState extends NotesState {
  @override
  List<Object?> get props => [];
}

class NotesLoadedState extends NotesState {
  List<Notes> notesList;
  List<String> subjectList;
  NotesLoadedState(this.notesList, this.subjectList);
  @override
  List<Object?> get props => [notesList, subjectList];
}

class NotesLoadedErrorState extends NotesState {
  String error;
  NotesLoadedErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
