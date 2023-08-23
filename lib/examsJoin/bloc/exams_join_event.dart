part of 'exams_join_bloc.dart';

abstract class ExamsJoinEvent extends Equatable {
  const ExamsJoinEvent();

  @override
  List<Object> get props => [];
}

class ExamsJoinLoadEvent extends ExamsJoinEvent {}
