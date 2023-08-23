import 'package:flutter/material.dart';
import '../models/archive_exams_model.dart';

archiveDialog(context, ArchiveExamsList data) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop;
                },
                icon: Icon(Icons.cancel_outlined))
          ],
        ),
        Text(
          data.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        )
      ],
    ),
  );
}
