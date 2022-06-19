import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsController extends GetxController {
  var examIdCtrl = TextEditingController().obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var reportData = <Map<String, dynamic>>[].obs;
  var totalMarks = 0.obs;

  Future<void> getExamReport() async {
    var ref = _db
        .collection("tests")
        .doc(examIdCtrl.value.text)
        .collection("participants")
        .get();
    ref.then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        reportData.add(element.data());
      });
    });

    var docRef = _db.collection("tests").doc(examIdCtrl.value.text).get();
    await docRef.then((value) {
      var data = value.data() ?? {"exam_marks":0};
      totalMarks.value = int.parse(data['exam_marks']);
    });
  }
}
