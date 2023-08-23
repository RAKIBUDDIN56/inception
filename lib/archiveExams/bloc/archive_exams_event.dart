part of 'archive_exams_bloc.dart';

abstract class ArchiveExamsEvent extends Equatable {
  const ArchiveExamsEvent();
  @override
  List<Object> get props => [];
}

class ArchiveExamsLoadEvent extends ArchiveExamsEvent {}
