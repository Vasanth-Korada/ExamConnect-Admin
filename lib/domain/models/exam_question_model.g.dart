// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamQuestionModel _$ExamQuestionModelFromJson(Map json) => ExamQuestionModel(
      questionImgUrl: json['questionImgUrl'] as String?,
      question: json['question'] as String?,
      allocatedMarks: json['allocated_marks'] as String?,
      correctAnswer: json['correct_answer'] as String?,
      explanation: json['explanation'] as String?,
      type: json['type'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ExamQuestionModelToJson(ExamQuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'questionImgUrl': instance.questionImgUrl,
      'allocated_marks': instance.allocatedMarks,
      'correct_answer': instance.correctAnswer,
      'explanation': instance.explanation,
      'type': instance.type,
      'options': instance.options,
    };
