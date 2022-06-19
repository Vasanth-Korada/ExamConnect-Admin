import 'package:json_annotation/json_annotation.dart';
import 'package:oepadmin/domain/models/exam_option_model.dart';

part 'exam_question_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ExamQuestionModel {
   ExamQuestionModel(
      {this.questionImgUrl,
      this.question,
      this.allocatedMarks,
      this.correctAnswer,
      this.explanation,
      this.type,
      this.options});

  @JsonKey(name: "question")
  String? question;
  @JsonKey(name: "questionImgUrl")
  String? questionImgUrl;
  @JsonKey(name: "allocated_marks")
  String? allocatedMarks;
  @JsonKey(name: "correct_answer")
  String? correctAnswer;
  @JsonKey(name: "explanation")
  String? explanation;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "options")
  List<String>? options;

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamQuestionModelToJson(this);
}
