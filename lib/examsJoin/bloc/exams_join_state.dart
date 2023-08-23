part of 'exams_join_bloc.dart';

abstract class ExamsJoinState extends Equatable {
  const ExamsJoinState();
  
  @override
  List<Object> get props => [];
}

class ExamsJoinInitial extends ExamsJoinState {}



class ExamsJoinInitialState extends ExamsJoinState {
  @override
  List<Object> get props => [];
}

class ExamsJoinLoadedState extends ExamsJoinState {
  final ExamsJoinModel examsJoinModel;

  const ExamsJoinLoadedState(this.examsJoinModel);
  @override
  List<Object> get props => [examsJoinModel];
}

class ExamsJoinErrorState extends ExamsJoinState {
  final String error;

  const ExamsJoinErrorState(this.error);
  @override
  List<Object> get props => [error];
}
