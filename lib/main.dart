import 'package:flutter/material.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/archiveExams/screens/read_archive_exams_screen.dart';
import 'package:inception/examsJoin/screens/exams_join_screen.dart';
import 'package:inception/home/bloc/home_bloc.dart';
import 'package:inception/home/repository/home_repository.dart';
import 'package:inception/home/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inception/notes/screens/notes_screen.dart';
import 'package:inception/rourines/screens/routines_screen.dart';
import 'package:inception/archiveExams/screens/archive_exams_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';

void main() {
  ApiService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: "ProximaNova",
      ),
      home: Demo(),
      routes: {
        '/routines': (context) => const RoutinesScreen(),
        '/notes': (context) => NotesScreen(),
        '/readArchiveExams': (context) => const ReadArchiveExamsScreen(),
        '/examsJoin': (context) => ExamsJoinScreen()
      },
    );
  }
}

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String _code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: PinFieldAutoFill(
            decoration: UnderlineDecoration(
              textStyle: const TextStyle(fontSize: 20, color: Colors.black),
              colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
            ),
            currentCode: _code,
            onCodeSubmitted: (code) {},
            onCodeChanged: (code) {
              if (code!.length == 6) {
                FocusScope.of(context).requestFocus(FocusNode());
              }
            },
          ),
        ),
      ),
    );
  }
}
