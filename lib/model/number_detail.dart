import 'package:json_annotation/json_annotation.dart';

part 'number_detail.g.dart';

@JsonSerializable()
class NumberDetail {
  NumberDetail({
    this.id,
    this.number,
    this.error,
  });

  factory NumberDetail.fromJson(Map<String, dynamic> json) =>
      _$NumberDetailFromJson(json);

  final String id;
  final int number;
  final String error;
}
