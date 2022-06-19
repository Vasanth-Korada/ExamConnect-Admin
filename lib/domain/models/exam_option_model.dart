import 'package:json_annotation/json_annotation.dart';

part 'exam_option_model.g.dart';

@JsonSerializable()
class ExamOptionModel {
  ExamOptionModel({this.optionText});

  String? optionText;

  factory ExamOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ExamOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamOptionModelToJson(this);
}
