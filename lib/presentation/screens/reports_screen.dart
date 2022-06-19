import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/utils/utils.dart';
import 'package:oepadmin/common/widgets/app-header.widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oepadmin/presentation/controllers/reports_controller.dart';

class ReportsScreen extends GetView {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reportsCtrl = Get.put(ReportsController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppHeader(title: "Reports"),
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                FormBuilder(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: Get.width * 0.65,
                      child: FormBuilderTextField(
                        controller: reportsCtrl.examIdCtrl.value,
                        name: 'exam_id',
                        decoration: const InputDecoration(
                            labelText: 'Enter Exam Code',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 2.0))),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(errorText: "*Required")
                        ]),
                        keyboardType: TextInputType.text,
                      ).paddingOnly(left: 12, right: 12, top: 16),
                    ),
                    TextButton(
                            onPressed: () {
                              TCUtils().hideKeyBoard(context);
                              reportsCtrl.getExamReport();
                            },
                            child: const Text("GET REPORT"))
                        .paddingOnly(top: 16)
                  ],
                )),
                Center(
                    child: Text(
                  "STUDENTS FOR ${reportsCtrl.examIdCtrl.value.text}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )).paddingOnly(top: 12),
                Obx(() {
                  return Card(
                    elevation: 6,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: reportsCtrl.reportData.value
                            .map((e) => Column(
                                  children: [
                                    StdDataRow(
                                            title: "REGD NO",
                                            value: e['regd_no'])
                                        .paddingOnly(top: 12),
                                    const Divider(),
                                    StdDataRow(
                                        title: "NAME",
                                        value: e['userName'].toString()),
                                    StdDataRow(
                                        title: "DEPT",
                                        value: e['branch'].toString()),
                                    StdDataRow(
                                        title: "MARKS SCORED",
                                        value: e['marks'].toString()),
                                    StdDataRow(
                                        title: "IS ATTEMPTED",
                                        value: e['isAttempted'] ? "Yes" : "No"),
                                    StdDataRow(
                                        title: "IS SUBMITTED",
                                        value: e['isSubmitted'] ? "Yes" : "No"),
                                    StdDataRow(
                                      title: "REPORT",
                                      value: e['marks'] >
                                              reportsCtrl.totalMarks.value / 2
                                          ? "GOOD"
                                          : e['marks'] <
                                                  reportsCtrl.totalMarks.value /
                                                      2
                                              ? "AVERAGE"
                                              : "BAD",
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ).paddingAll(16);
                })
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class StdDataRow extends StatelessWidget {
  final String title;
  final String value;

  const StdDataRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          value,
          style: TextStyle(color: AppColors.primaryColor),
        )
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 6);
  }
}
