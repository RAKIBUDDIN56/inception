import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inception/notes/bloc/notes_bloc.dart';
import 'package:inception/notes/models/notes_model.dart';
import 'package:inception/notes/repository/notes_repository.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  String subjectValue = "Select a subject";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: BlocProvider(
        create: (context) =>
            NotesBloc(NotesRepository())..add(NotesLoadEvent()),
        child: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state is NotesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NotesLoadedState) {
              return Column(
                children: [
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 16, bottom: 16),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        hint: const Text(
                          "Select a subject",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        isDense: true,
                        isExpanded: true,
                        items: state.subjectList
                            .map((value) => DropdownMenuItem<String>(
                                value: value, child: Text(value)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            subjectValue = value!;
                          });
                        },
                        value: subjectValue,
                      ),
                    ),
                  )),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.notesList.length,
                      itemBuilder: (context, index) => Card(
                          child: Container(
                        height: 80,
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              state.notesList[index].title,
                              style: const TextStyle(fontSize: 16),
                            )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.file_download_outlined))
                          ],
                        ),
                      )),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    ));
  }
}
