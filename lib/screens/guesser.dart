import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:picodia/picodia.dart';
import 'package:picodia/widgets/picodia_guesser.dart';

class GuesserScreen extends StatefulWidget {
  const GuesserScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuesserScreenState();
}

class _GuesserScreenState extends State<GuesserScreen> {
  Picodia? _answer;
  String _input = "";

  @override
  Widget build(BuildContext context) {
    if (_answer == null) {
      return Column(
        children: [
          TextField(
            onChanged: (value) => setState(() => _input = value),
          ),
          TextButton(
            child: const Text("generate"),
            onPressed: () {
              setState(() => _answer = Picodia.fromJson(jsonDecode(_input)));
            },
          ),
        ],
      );
    }
    return PicodiaGuesser(expectedAnswer: _answer!);
  }
}
