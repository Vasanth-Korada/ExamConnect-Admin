// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDetailsModel _$ExamDetailsModelFromJson(Map json) => ExamDetailsModel(
      coinsPerAttempt: json['coins_per_attempt'] as int?,
      contestImageUrl: json['contest_img_url'] as String?,
      contestPin: json['contest_pin'] as String?,
      datePosted: json['date_posted'] as String?,
      examDuration: json['exam_duration'] as int?,
      examId: json['exam_id'] as String?,
      examMarks: json['exam_marks'] as String?,
      examName: json['exam_name'] as String?,
      examTimeUnix: json['exam_time_unix'] as num?,
      examTotalQuestions: json['exam_total_questions'] as String?,
      forOrg: json['for_org'] as bool?,
      gift: json['gift'] as int?,
      isActive: json['isActive'] as bool?,
      isPurchaseAttempt: json['is_purchase_attempt'] as bool?,
      keyUnlockCost: json['key_unlock_cost'] as String?,
      maxAttempts: json['max_attempts'] as int?,
      orgName: json['org_name'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) =>
              ExamQuestionModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      showResult: json['showResult'] as bool?,
      contestPinRequired: json['contest_pin_required'] as bool?,
      examDateTime: json['exam_date_time'] as String?,
      storeUserRes: json['storeUserRes'] as bool?,
    );

Map<String, dynamic> _$ExamDetailsModelToJson(ExamDetailsModel instance) =>
    <String, dynamic>{
      'coins_per_attempt': instance.coinsPerAttempt,
      'contest_img_url': instance.contestImageUrl,
      'contest_pin': instance.contestPin,
      'contest_pin_required': instance.contestPinRequired,
      'date_posted': instance.datePosted,
      'exam_duration': instance.examDuration,
      'exam_id': instance.examId,
      'exam_marks': instance.examMarks,
      'exam_name': instance.examName,
      'exam_time_unix': instance.examTimeUnix,
      'exam_date_time': instance.examDateTime,
      'exam_total_questions': instance.examTotalQuestions,
      'for_org': instance.forOrg,
      'gift': instance.gift,
      'isActive': instance.isActive,
      'is_purchase_attempt': instance.isPurchaseAttempt,
      'key_unlock_cost': instance.keyUnlockCost,
      'max_attempts': instance.maxAttempts,
      'org_name': instance.orgName,
      'showResult': instance.showResult,
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
      'storeUserRes': instance.storeUserRes,
    };
