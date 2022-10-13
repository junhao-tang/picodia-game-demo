import 'package:flutter/material.dart';
import 'package:picodia/constants.dart';
import 'package:picodia/picodia.dart';
import 'package:picodia/widgets/picodia.dart';
import 'package:provider/provider.dart';

class PicodiaGuesser extends StatelessWidget {
  final Picodia expectedAnswer;
  late final Picodia answer;

  PicodiaGuesser({
    required this.expectedAnswer,
    Key? key,
  }) : super(key: key) {
    answer = Picodia(picodiaSize);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Picodia>.value(
      value: answer,
      builder: (context, child) => Consumer<Picodia>(
        builder: (context, answer, child) => PicodiaWidget(
          answer,
          query: expectedAnswer,
          callback: (index) {
            if (answer.data[index] != PicodiaValue.empty) return;
            answer.updateData(
                index,
                expectedAnswer.data[index] == PicodiaValue.occupied
                    ? PicodiaValue.occupied
                    : PicodiaValue.incorrect);
            if (answer.match(expectedAnswer)) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Completed'),
                  content: const Text('Done'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
