part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class NotesLoadEvent extends NotesEvent {
  @override
  List<Object> get props => [];
}
