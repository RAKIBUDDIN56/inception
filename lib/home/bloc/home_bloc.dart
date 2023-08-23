import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/home/models/archive_category_model.dart';
import 'package:inception/archiveExams/models/archive_exams_model.dart';
import 'package:inception/home/models/category_exams_model.dart';
import 'package:inception/home/models/packages_model.dart';
import 'package:inception/home/repository/home_repository.dart';
import 'dart:core';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc(this.homeRepository) : super(LiveExamsLoading()) {
    on<ArchiveCategoryEvent>((event, emit) async {
      emit(ArchiveCategoryLoading());
      try {
        final response = await homeRepository.categoryArchiveExams();
        final categoriesArchiveList =
            ArchiveCategoryModel.fromJson(response.data).payload.categories;
        print('Archive exams callded');
        emit(ArchiveCategoryLoaded(categoriesArchiveList));
      } catch (error) {
        emit(ArchiveCategoryLoadingError(error.toString()));
      }
    });

    // on<ArchiveExamsEvent>((event, emit) async {
    //   emit(ArchiveExamLoading());
    //   try {
    //     final response = await homeRepository.categoryArchiveExams();
    //     final categoriesArchiveList =
    //         ArchivedExamsModel.fromJson(response.data).payload.allExamsList;
    //     print('Archive exams callded');
    //     emit(AchiveExamsLoaded(categoriesArchiveList));
    //   } catch (error) {
    //     emit(ArchiveExamsLoadingError(error.toString()));
    //   }
    // });
    on<PackagesEvent>((event, emit) async {
      emit(PackagesLoading());
      try {
        final response = await homeRepository.packaages();
        final packagesList =
            PackagesModel.fromJson(response.data).payload.packages;
        print('Archive exams callded');
        emit(PackagesLoaded(packagesList));
      } catch (error) {
        emit(PackagesLoadingError(error.toString()));
      }
    });
    on<LiveExamsEvent>((event, emit) async {
      emit(LiveExamsLoading());
      try {
        final response = await homeRepository.liveExams();
        final categoriesList =
            CategoryExamsModel.fromJson(response.data).payload.allExamsList;
        print('Live exams callded');
        emit(LiveExamsLoaded(categoriesList));
      } catch (error) {
        var err = ApiService().handleError(error as DioError);
        emit(LiveExamsLoadingError(err));
      }
    });
  }
}
