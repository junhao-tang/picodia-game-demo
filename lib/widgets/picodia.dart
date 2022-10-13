import 'package:flutter/material.dart';
import 'package:picodia/picodia.dart';

class PicodiaWidget extends StatelessWidget {
  static const double fontSize = 16;
  static const double componentSize = 400;
  static const double offset = 100;

  static const Map<PicodiaValue, Color> colours = {
    PicodiaValue.empty: Colors.white,
    PicodiaValue.occupied: Colors.black,
    PicodiaValue.incorrect: Colors.red,
  };

  final Picodia picodia;
  final Picodia query; // consecutive query
  final Function(int index) callback;

  const PicodiaWidget(this.picodia,
      {required this.query, required this.callback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: componentSize + offset,
      height: componentSize + offset,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            top: 0,
            left: offset,
            child: SizedBox(
              width: componentSize,
              height: offset,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List<Widget>.generate(
                  picodia.size,
                  (index) => SizedBox(
                    width: fontSize,
                    child: Text(query
                        .getConsecutives(target: index, isHorizontal: false)
                        .join(" ")),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: offset,
            left: 0,
            child: SizedBox(
              height: componentSize,
              width: offset,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List<Widget>.generate(
                  picodia.size,
                  (index) => SizedBox(
                    height: fontSize,
                    child: Text(query
                        .getConsecutives(target: index, isHorizontal: true)
                        .join(" ")),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: componentSize,
              height: componentSize,
              child: GridView.count(
                crossAxisCount: picodia.size,
                children: List<Widget>.generate(
                  picodia.size * picodia.size,
                  (index) => GestureDetector(
                    onTap: () => callback(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: colours[picodia.data[index]],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
