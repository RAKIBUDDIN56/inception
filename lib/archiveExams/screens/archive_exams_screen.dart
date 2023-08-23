import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inception/archiveExams/bloc/archive_exams_bloc.dart';
import 'package:inception/archiveExams/models/archive_exams_model.dart';
import 'package:inception/archiveExams/repository/archive_exams_category_repository.dart';
import 'package:inception/routes/app_routes.dart';
import 'package:inception/utils/screen_helper.dart';

class ArchiveExamsCategoryScreen extends StatelessWidget {
  final int id;
  const ArchiveExamsCategoryScreen({Key? key, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Archive Exams Category')),
      body: BlocProvider(
        create: (context) => ArchiveExamsBloc(ArchiveExamsRepository(), id)
          ..add(ArchiveExamsLoadEvent()),
        child: BlocBuilder<ArchiveExamsBloc, ArchiveExamsState>(
          builder: (context, state) {
            if (state is ArchiveExamsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ArchiveExamsLoadedState) {
              return ListView.builder(
                  itemCount: state.archiveExamsList.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => archiveCategoryDialog(
                            context, state.archiveExamsList[index]),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.archiveExamsList[index].title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Syllabus: ${state.archiveExamsList[index].syllabus}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ))
                            ]),
                          ),
                        ),
                      ));
            }
            if (state is ArchiveExamsLoadedErrorState) {
              return Text(state.error);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Future<dynamic> archiveCategoryDialog(
      BuildContext context, ArchiveExamsList data) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(15),
            insetPadding: const EdgeInsets.all(20),
            content: SizedBox(
              //width: ScreenSize.width(context) * .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    data.title,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.syllabus,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Questions: ${data.totalQuestion}",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Marks: ${data.marksPerQuestion}",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Time: ${data.duration} Min",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.READ_ARCHIVE_EXAMS,
                              arguments: {"id": data.id});
                        },
                        child: Container(
                          width: ScreenSize.width(context) * .3,
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 5, right: 5),
                          color: const Color.fromARGB(255, 8, 28, 45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.menu_book_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'পড়ুন',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.EXAMS_JOIN,
                              arguments: {
                                "id": data.id,
                                "time": data.duration
                              });
                        },
                        child: Container(
                          width: ScreenSize.width(context) * .4,
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 5, right: 5),
                          color: const Color.fromARGB(255, 8, 28, 45),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.library_books_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'আর্কাইভ পরীক্ষা',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        });
  }
}
