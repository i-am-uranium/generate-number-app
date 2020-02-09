// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberDetail _$NumberDetailFromJson(Map<String, dynamic> json) {
  return NumberDetail(
    id: json['id'] as String,
    number: json['number'] as int,
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$NumberDetailToJson(NumberDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'error': instance.error,
    };
