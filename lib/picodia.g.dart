// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picodia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picodia _$PicodiaFromJson(Map<String, dynamic> json) => Picodia(
      json['size'] as int,
    )..data = (json['data'] as List<dynamic>)
        .map((e) => $enumDecode(_$PicodiaValueEnumMap, e))
        .toList();

Map<String, dynamic> _$PicodiaToJson(Picodia instance) => <String, dynamic>{
      'size': instance.size,
      'data': instance.data.map((e) => _$PicodiaValueEnumMap[e]!).toList(),
    };

const _$PicodiaValueEnumMap = {
  PicodiaValue.empty: 'empty',
  PicodiaValue.occupied: 'occupied',
  PicodiaValue.incorrect: 'incorrect',
};
