import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picodia/widgets/picodia_generator.dart';

class GeneratorScreen extends StatelessWidget {
  const GeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PicodiaGeneratorWidget generatorWidget = PicodiaGeneratorWidget();
    return Column(
      children: [
        generatorWidget,
        TextButton(
            onPressed: () => Clipboard.setData(
                  ClipboardData(
                    text: jsonEncode(
                      generatorWidget.picodia.toJson(),
                    ),
                  ),
                ),
            child: const Text("copy to clipboard")),
      ],
    );
  }
}
