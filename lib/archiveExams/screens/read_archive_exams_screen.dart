import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inception/archiveExams/bloc/read_archive_exams_bloc.dart';
import 'package:inception/archiveExams/repository/archive_exams_category_repository.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:inception/utils/screen_helper.dart';

class ReadArchiveExamsScreen extends StatelessWidget {
  const ReadArchiveExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = (ModalRoute.of(context)?.settings.arguments) as Map;
    print(arguments['id']);
    return Scaffold(
      appBar: AppBar(title: const Text('Archive Exam Questions')),
      body: BlocProvider(
        create: (context) =>
            ReadArchiveExamsBloc(ArchiveExamsRepository(), arguments["id"])
              ..add(ReadArchiveExamsLoadEvent()),
        child: BlocBuilder<ReadArchiveExamsBloc, ReadArchiveExamsState>(
          builder: (context, state) {
            if (state is ReadArchiveExamsInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ReadArchiveExamsLoadedState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.questionArchiveExams.length,
                itemBuilder: (context, index) => Container(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${index + 1}.",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Expanded(
                                child: Html(
                                    data: state.questionArchiveExams[index]
                                        .questionText),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text("A)"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(state
                                        .questionArchiveExams[index]
                                        .options[0]
                                        .optionText),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("B)"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(state
                                        .questionArchiveExams[index]
                                        .options[1]
                                        .optionText),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("C)"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(state
                                        .questionArchiveExams[index]
                                        .options[2]
                                        .optionText),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("D)"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(state
                                        .questionArchiveExams[index]
                                        .options[3]
                                        .optionText),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.cyan,
                            padding: EdgeInsets.only(
                                left: 8,
                                right: ScreenSize.width(context) * .5,
                                top: 8,
                                bottom: 8),
                            child: Column(
                              children: [
                                state.questionArchiveExams[index].options[0]
                                            .isCorrect ==
                                        1
                                    ? Text(
                                        "উত্তর: ${state.questionArchiveExams[index].options[0].optionText}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    : const SizedBox(),
                                state.questionArchiveExams[index].options[1]
                                            .isCorrect ==
                                        1
                                    ? Text(
                                        "উত্তর: ${state.questionArchiveExams[index].options[1].optionText}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    : const SizedBox(),
                                state.questionArchiveExams[index].options[2]
                                            .isCorrect ==
                                        1
                                    ? Text(
                                        "উত্তর: ${state.questionArchiveExams[index].options[2].optionText}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    : const SizedBox(),
                                state.questionArchiveExams[index].options[3]
                                            .isCorrect ==
                                        1
                                    ? Text(
                                        "উত্তর: ${state.questionArchiveExams[index].options[3].optionText}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "ব্যাখ্যা:",
                            style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 22,
                                decoration: TextDecoration.underline),
                          ),
                          Html(
                            shrinkWrap: true,
                            data: state.questionArchiveExams[index].explanation,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
