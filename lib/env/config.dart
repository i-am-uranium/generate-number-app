import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(createToJson: false)
class Config {
  Config({
    this.serviceEndpoint,
    this.env,
  });

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  final String env;
  final String serviceEndpoint;
}
