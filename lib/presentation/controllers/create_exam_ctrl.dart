import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oepadmin/common/widgets/custom_snackbar.dart';
import 'package:oepadmin/domain/models/exam_details_model.dart';
import 'package:oepadmin/domain/models/exam_question_model.dart';
import 'package:oepadmin/routes/routes.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'dart:io' as io;

class CreateExamCtrl extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final createQuestionFormKey = GlobalKey<FormBuilderState>();
  var isLoading = false.obs;
  var examDetailsObj = ExamDetailsModel();
  var questionImage = XFile("").obs;

  // var optionImage = XFile("").obs;
  var questionUrl = "";

  // var optionUrl = "";
  var questionCtrl = TextEditingController();
  var optionCtrl = TextEditingController();
  List<UploadTask> _uploadTasks = [];
  late Reference ref;
  var questionsList = List.filled(0, ExamQuestionModel(), growable: true).obs;
  var optionsList = <String>[].obs;
  var currentQuestionNumber = 1.obs;
  var currentOption = 0.obs;
  var correctAnswerIndex;
  var marksOptions = ["1", "2", "3", "4", "5"];
  var totalMarks = 0;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// The user selects a file, and the task is added to the list.
  Future<UploadTask?> uploadFile(XFile? file) async {
    var uuid = const Uuid();

    if (file == null) {
      buildSnackbar(Get.context!, "No file was selected");

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    ref = FirebaseStorage.instance
        .ref()
        .child(examDetailsObj.examId ?? "NO_EXAM_ID")
        .child('${uuid.v1()}.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }

    return Future.value(uploadTask);
  }

  onSaveCreateExamClicked() async {
    isLoading.value = true;
    bool? isValidForm = formKey.currentState?.validate();

    if (isValidForm != null && isValidForm == true) {
      formKey.currentState?.save();
      var examInfoWithoutQues = formKey.currentState?.value ?? {};

      examDetailsObj
        ..examId = examInfoWithoutQues['exam_id']
        ..examName = examInfoWithoutQues['exam_name']
        ..examDuration = int.parse(examInfoWithoutQues['exam_duration'])
        ..examDateTime = examInfoWithoutQues["exam_date_time"].toString()
        ..maxAttempts = int.parse(examInfoWithoutQues["max_attempts"])
        ..contestPin = examInfoWithoutQues["contest_pin"]
        ..keyUnlockCost = "0"
        ..isPurchaseAttempt = false
        ..isActive = false
        ..gift = 10
        ..forOrg = true
        ..contestPinRequired = true
        ..coinsPerAttempt = 5;

      isLoading.value = false;
      await Get.toNamed(Routes.CREATE_QUESTION);
    } else {
      isLoading.value = false;
      formKey.currentState?.validate();
    }
  }

  handleQuestionImage() async {
    questionImage.value =
        await ImagePicker().pickImage(source: ImageSource.camera) ?? XFile("");
    UploadTask? task = await uploadFile(questionImage.value);

    task?.whenComplete(() async {
      questionUrl = await ref.getDownloadURL();
    });
  }

  onAddOptionClicked() async {
    if (optionCtrl.text.isNotEmpty) {
      optionsList.add(optionCtrl.text);
      optionCtrl.text = "";
      // optionImage.value = XFile("");
      // optionUrl = "";
      currentOption.value = optionsList.length;
    } else {
      buildSnackbar(Get.context!, "Option is required");
    }
  }

  onAddQuestionClicked() async {
    bool? isValidForm = createQuestionFormKey.currentState?.validate();

    var opsList = <String>[];
    opsList.addAll(optionsList);
    if (isValidForm == true && isValidForm != null) {
      createQuestionFormKey.currentState!.save();
      questionsList.add(ExamQuestionModel(
          questionImgUrl: questionUrl,
          question: questionCtrl.value.text,
          allocatedMarks:
              createQuestionFormKey.currentState?.value['allocated_marks'] ??
                  "1",
          correctAnswer: optionsList[int.parse(
              createQuestionFormKey.currentState?.value['correct_answer'])],
          explanation: "",
          type: "Single",
          options: opsList));

      currentQuestionNumber++;
      questionUrl = "";
      questionCtrl.clear();
      questionCtrl.text = "";
      optionsList.clear();
      createQuestionFormKey.currentState?.reset();
      createQuestionFormKey.currentState?.reassemble();
    } else {
      createQuestionFormKey.currentState?.validate();
    }

    print(questionsList.first.correctAnswer);
  }

  calculateTotalExamMarks() {
    questionsList.forEach((questionObj) {
      totalMarks += int.parse(questionObj.allocatedMarks.toString());
    });
  }

  onScheduleExamClicked() async {
    calculateTotalExamMarks();
    examDetailsObj.questions = questionsList;
    examDetailsObj.examMarks = totalMarks.toString();
    examDetailsObj.examTotalQuestions = questionsList.length.toString();
    examDetailsObj.datePosted = DateTime.now().toString();
    examDetailsObj.examTimeUnix = 0;
    examDetailsObj.showResult = true;
    examDetailsObj.contestPinRequired = true;
    examDetailsObj.storeUserRes = true;
    examDetailsObj.orgName = "Exam Connect";
    examDetailsObj.contestImageUrl =
        "https://firebasestorage.googleapis.com/v0/b/examconnect-da70a.appspot.com/o/assets%2Ftc_test_banner.png?alt=media&token=24cb5a12-ff3d-4001-b3ce-ad1dae89a32f";
    addExam(examDetailsObj).then((_) {
      buildSnackbar(Get.context!, "Exam Scheduled Successfully");
      Get.delete<CreateExamCtrl>();
      Get.offAllNamed(Routes.ADMIN_DASHBOARD);
    }).catchError((e) {
      buildSnackbar(Get.context!, "Fail");
    });
  }

  Future addExam(ExamDetailsModel examDetailsModel) async {
    final collection = _db.collection("tests").withConverter<ExamDetailsModel>(
          fromFirestore: (snapshot, _) =>
              ExamDetailsModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
    collection.doc(examDetailsModel.examId).set(examDetailsModel);
  }
}
