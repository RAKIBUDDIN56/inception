import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:inception/examsJoin/bloc/exams_join_bloc.dart';
import 'package:inception/examsJoin/models/exams_join_model.dart';
import 'package:inception/examsJoin/repository/exam_join_repository.dart';
import 'package:inception/utils/screen_helper.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class ExamsJoinScreen extends StatefulWidget {
  ExamsJoinScreen({Key? key}) : super(key: key);

  @override
  State<ExamsJoinScreen> createState() => _ExamsJoinScreenState();
}

class _ExamsJoinScreenState extends State<ExamsJoinScreen> {
  late StopWatchTimer _stopWatchTimer;
  List<Options> option1List = [];
  List<Options> option2List = [];
  void changeOption(String? newValue, BuildContext context) {
    if (newValue != null) {
      context.read<RadioCubit>().changeOption(newValue);
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = (ModalRoute.of(context)?.settings.arguments) as Map;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              ExamsJoinBloc(ExamsJoinRepository(), arguments["id"])
                ..add(ExamsJoinLoadEvent()),
          child: BlocBuilder<ExamsJoinBloc, ExamsJoinState>(
              builder: (context, state) {
            if (state is ExamsJoinInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ExamsJoinLoadedState) {
              _stopWatchTimer = StopWatchTimer(
                  mode: StopWatchMode.countDown,
                  presetMillisecond:
                      StopWatchTimer.getMilliSecFromMinute(arguments["time"]));
              for (var element in state.examsJoinModel.payload.questions) {
                option1List.add(element.options[0]);
              }
              for (var element in state.examsJoinModel.payload.questions) {
                option2List.add(element.options[1]);
              }

              print(option1List.length);
              _stopWatchTimer.onStartTimer();
              String groupValue = "";
              return Column(
                children: [
                  appBar(context, state),
                  Expanded(
                    child: ListView.builder(
                        itemCount:
                            state.examsJoinModel.payload.questions.length,
                        itemBuilder: (context, index) {
                          // var list =< state >[];
                          // state.examsJoinModel.payload.questions[index].options[0]

                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Html(
                                          shrinkWrap: true,
                                          data:
                                              "${index + 1}.${state.examsJoinModel.payload.questions[index].questionText}"),
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: option1List[index].optionText,
                                  groupValue: groupValue,
                                  onChanged: (val) {
                                    setState(() {
                                      groupValue = val!;
                                      print(groupValue);
                                    });
                                  },
                                ),
                                Radio(
                                  value: option2List[index].optionText,
                                  groupValue: groupValue,
                                  onChanged: (val) {
                                    setState(() {
                                      groupValue = val!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }

  Container appBar(BuildContext context, ExamsJoinLoadedState state) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: ScreenSize.width(context),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 16, 181, 33),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Column(children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            Expanded(
              child: Text(
                state.examsJoinModel.payload.exam.syllabus,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Questions: ${state.examsJoinModel.payload.questions.length}"),
                Text("TIme: ${state.examsJoinModel.payload.questions.length}"),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
                "Marks: ${state.examsJoinModel.payload.exam.marksPerQuestion * state.examsJoinModel.payload.questions.length}"),
            const Spacer(),
            Column(
              children: [
                Container(
                  height: 30,
                  width: 100,
                  padding: const EdgeInsets.all(4),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Center(
                    child: StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: 0,
                      builder: (context, snap) {
                        final value = snap.data;
                        //print(value.);
                        final displayTime = StopWatchTimer.getDisplayTime(
                            value!,
                            milliSecond: false);
                        return Text(
                          displayTime,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 30,
                    width: 100,
                    padding: const EdgeInsets.all(4),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Text(
                      "0/${state.examsJoinModel.payload.questions.length}",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ]),
    );
  }
}
