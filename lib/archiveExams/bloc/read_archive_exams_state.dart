part of 'read_archive_exams_bloc.dart';

abstract class ReadArchiveExamsState extends Equatable {
  const ReadArchiveExamsState();
}

class ReadArchiveExamsInitialState extends ReadArchiveExamsState {
  @override
  List<Object> get props => [];
}

class ReadArchiveExamsLoadedState extends ReadArchiveExamsState {
  final List<QuestionArchiveExams> questionArchiveExams;

  const ReadArchiveExamsLoadedState(this.questionArchiveExams);
  @override
  List<Object> get props => [questionArchiveExams];
}

class ReadArchiveExamsErrorState extends ReadArchiveExamsState {
  final String error;

  const ReadArchiveExamsErrorState(this.error);
  @override
  List<Object> get props => [error];
}
