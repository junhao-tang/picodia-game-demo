import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picodia.g.dart';

enum PicodiaValue {
  empty,
  occupied,
  incorrect,
}

@JsonSerializable()
class Picodia extends ChangeNotifier {
  final int size;
  late List<PicodiaValue> data;
  Picodia(this.size) {
    data = List<PicodiaValue>.filled(size * size, PicodiaValue.empty);
  }

  void updateData(int location, PicodiaValue value) {
    data[location] = value;
    notifyListeners();
  }

  List<int> getVerticalIndices({required int size, required int target}) {
    return List<int>.generate(size, (index) => index * size + target);
  }

  List<int> getHorizontalIndices({required int size, required int target}) {
    return List<int>.generate(size, (index) => target * size + index);
  }

  List<int> getConsecutives({
    bool isHorizontal = true,
    required int target,
  }) {
    List<int> result = [];
    List<int> indices = (isHorizontal
        ? getHorizontalIndices
        : getVerticalIndices)(size: size, target: target);
    var consecutive = 0;
    for (var idx in indices) {
      var val = data[idx];
      if (val == PicodiaValue.occupied) consecutive += 1;
      if (val == PicodiaValue.empty && consecutive > 0) {
        result.add(consecutive);
        consecutive = 0;
      }
    }
    if (consecutive > 0) result.add(consecutive);
    if (result.isEmpty) result.add(0);
    return result;
  }

  bool match(Picodia expectedAnswer) {
    for (var i = 0; i < data.length; i++) {
      if (expectedAnswer.data[i] == PicodiaValue.occupied &&
          data[i] != PicodiaValue.occupied) return false;
    }
    return true;
  }

  factory Picodia.fromJson(Map<String, dynamic> json) =>
      _$PicodiaFromJson(json);
  Map<String, dynamic> toJson() => _$PicodiaToJson(this);
}
