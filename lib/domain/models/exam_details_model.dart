import 'package:json_annotation/json_annotation.dart';
import 'package:oepadmin/domain/models/exam_question_model.dart';

part 'exam_details_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ExamDetailsModel {
  ExamDetailsModel({
    this.coinsPerAttempt,
    this.contestImageUrl,
    this.contestPin,
    this.datePosted,
    this.examDuration,
    this.examId,
    this.examMarks,
    this.examName,
    this.examTimeUnix,
    this.examTotalQuestions,
    this.forOrg,
    this.gift,
    this.isActive,
    this.isPurchaseAttempt,
    this.keyUnlockCost,
    this.maxAttempts,
    this.orgName,
    this.questions,
    this.showResult,
    this.contestPinRequired,
    this.examDateTime,
    this.storeUserRes,
  });

  @JsonKey(name: "coins_per_attempt")
  int? coinsPerAttempt;
  @JsonKey(name: "contest_img_url")
  String? contestImageUrl;
  @JsonKey(name: "contest_pin")
  String? contestPin;
  @JsonKey(name: "contest_pin_required")
  bool? contestPinRequired;
  @JsonKey(name: "date_posted")
  String? datePosted;
  @JsonKey(name: "exam_duration")
  int? examDuration;
  @JsonKey(name: "exam_id")
  String? examId;
  @JsonKey(name: "exam_marks")
  String? examMarks;
  @JsonKey(name: "exam_name")
  String? examName;
  @JsonKey(name: "exam_time_unix")
  num? examTimeUnix;
  @JsonKey(name: "exam_date_time")
  String? examDateTime;
  @JsonKey(name: "exam_total_questions")
  String? examTotalQuestions;
  @JsonKey(name: "for_org")
  bool? forOrg;
  @JsonKey(name: "gift")
  int? gift;
  @JsonKey(name: "isActive")
  bool? isActive;
  @JsonKey(name: "is_purchase_attempt")
  bool? isPurchaseAttempt;
  @JsonKey(name: "key_unlock_cost")
  String? keyUnlockCost;
  @JsonKey(name: "max_attempts")
  int? maxAttempts;
  @JsonKey(name: "org_name")
  String? orgName;
  @JsonKey(name: "showResult")
  bool? showResult;
  @JsonKey(name: "questions")
  List<ExamQuestionModel>? questions;
  @JsonKey(name: "storeUserRes")
  bool? storeUserRes;

  factory ExamDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ExamDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDetailsModelToJson(this);
}
