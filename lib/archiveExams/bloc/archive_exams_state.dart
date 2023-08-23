part of 'archive_exams_bloc.dart';

abstract class ArchiveExamsState extends Equatable {
  const ArchiveExamsState();
}

class ArchiveExamsLoadingState extends ArchiveExamsState {
  @override
  List<Object?> get props => [];
}

class ArchiveExamsLoadedState extends ArchiveExamsState {
  final List<ArchiveExamsList> archiveExamsList;
  const ArchiveExamsLoadedState(this.archiveExamsList);
  @override
  List<Object?> get props => [archiveExamsList];
}

class ArchiveExamsLoadedErrorState extends ArchiveExamsState {
  final String error;
 const  ArchiveExamsLoadedErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
