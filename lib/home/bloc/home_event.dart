part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class ArchiveCategoryEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class LiveExamsEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ArchiveExamsEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class PackagesEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
