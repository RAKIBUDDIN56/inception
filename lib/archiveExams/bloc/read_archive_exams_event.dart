part of 'read_archive_exams_bloc.dart';

abstract class ReadArchiveExamsEvent extends Equatable {
  const ReadArchiveExamsEvent();

  @override
  List<Object> get props => [];
}

class ReadArchiveExamsLoadEvent extends ReadArchiveExamsEvent {}
