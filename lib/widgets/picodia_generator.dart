import 'package:flutter/material.dart';
import 'package:picodia/constants.dart';
import 'package:picodia/picodia.dart';
import 'package:picodia/widgets/picodia.dart';
import 'package:provider/provider.dart';

class PicodiaGeneratorWidget extends StatelessWidget {
  final Picodia picodia = Picodia(picodiaSize);

  PicodiaGeneratorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Picodia>.value(
      value: picodia,
      builder: (context, child) => Consumer<Picodia>(
        builder: (context, picodia, child) => PicodiaWidget(
          picodia,
          query: picodia,
          callback: (index) => picodia.updateData(
            index,
            picodia.data[index] == PicodiaValue.occupied
                ? PicodiaValue.empty
                : PicodiaValue.occupied,
          ),
        ),
      ),
    );
  }
}
