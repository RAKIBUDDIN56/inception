part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class ArchiveCategoryLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class ArchiveCategoryLoaded extends HomeState {
  final List<ArchiveCategory> archiveCategoryList;

  ArchiveCategoryLoaded(this.archiveCategoryList);
  @override
  List<Object?> get props => [archiveCategoryList];
}

class ArchiveCategoryLoadingError extends HomeState {
  final String error;

  ArchiveCategoryLoadingError(this.error);
  @override
  List<Object?> get props => [error];
}

class LiveExamsLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class LiveExamsLoaded extends HomeState {
  final List<AllLiveExamsList> allLiveExmas;

  LiveExamsLoaded(this.allLiveExmas);
  @override
  List<Object?> get props => [allLiveExmas];
}

class LiveExamsLoadingError extends HomeState {
  final String error;

  LiveExamsLoadingError(this.error);
  @override
  List<Object?> get props => [error];
}

class ArchiveExamLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class AchiveExamsLoaded extends HomeState {
  final List<ArchiveExamsList> archivedCategoryList;

  AchiveExamsLoaded(this.archivedCategoryList);
  @override
  List<Object?> get props => [archivedCategoryList];
}

class ArchiveExamsLoadingError extends HomeState {
  final String error;

  ArchiveExamsLoadingError(this.error);
  @override
  List<Object?> get props => [error];
}

class PackagesLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class PackagesLoaded extends HomeState {
  final List<Package> packageList;

  PackagesLoaded(this.packageList);
  @override
  List<Object?> get props => [packageList];
}

class PackagesLoadingError extends HomeState {
  final String error;

  PackagesLoadingError(this.error);
  @override
  List<Object?> get props => [error];
}
