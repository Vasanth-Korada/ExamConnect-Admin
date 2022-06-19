import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/widgets/app-header.widget.dart';
import 'package:oepadmin/common/widgets/custom_snackbar.dart';
import 'package:oepadmin/common/widgets/text-widget.dart';
import 'package:oepadmin/domain/models/exam_option_model.dart';
import 'package:oepadmin/presentation/controllers/create_exam_ctrl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateQuestionScreen extends GetView {
  const CreateQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateExamCtrl createExamCtrl = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppHeader(title: "Create a\nQuestion"),
            Expanded(child: Obx(() {
              return ListView(
                shrinkWrap: true,
                children: [
                  Text("Question: ${createExamCtrl.currentQuestionNumber.value.toString()}")
                      .paddingOnly(left: 24, right: 16, top: 12),
                  FormBuilder(
                    key: createExamCtrl.createQuestionFormKey,
                    child: Column(
                      children: [
                        //Question Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: Get.width - 60,
                              child: FormBuilderTextField(
                                controller: createExamCtrl.questionCtrl,
                                name: 'question',
                                decoration: const InputDecoration(
                                  labelText: 'Type your question',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 2.0)),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: "Required*")
                                ]),
                                keyboardType: TextInputType.text,
                              ).paddingOnly(left: 8, right: 4, top: 12),
                            ),
                            GestureDetector(
                              onTap: () {
                                createExamCtrl.handleQuestionImage();
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.asset(
                                  "assets/images/image_upload.png",
                                ),
                              ),
                            )
                          ],
                        ),
                        createExamCtrl.questionImage.value.path.isNotEmpty
                            ? SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.file(File(createExamCtrl
                                        .questionImage.value.path))
                                    .paddingOnly(top: 12),
                              )
                            : Container(),

                        Wrap(
                          children: createExamCtrl.optionsList
                              .map((item) => ShowAddedOption(
                                    examOptionModel: item,
                                  ).paddingSymmetric(horizontal: 8))
                              .toList(),
                        ).paddingOnly(bottom: 12),

                        //option row
                        createExamCtrl.optionsList.length >= 5
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: Get.width,
                                    child: FormBuilderTextField(
                                      controller: createExamCtrl.optionCtrl,
                                      name: 'option',
                                      decoration: const InputDecoration(
                                          labelText: 'Type your option',
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.primaryColor,
                                                  width: 2.0))),
                                      keyboardType: TextInputType.text,
                                    ).paddingOnly(left: 12, right: 4, top: 16),
                                  ),
                                ],
                              ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                                label: const Text(
                                  "Add Option",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  if (createExamCtrl.optionsList.length >= 5) {
                                    buildSnackbar(context,
                                        "Sorry, only 5 options allowed");
                                  } else {
                                    createExamCtrl.onAddOptionClicked();
                                  }
                                }),
                            Text(
                                "Added Options(${createExamCtrl.optionsList.length.toString()})"),
                          ],
                        ).paddingSymmetric(horizontal: 24),
                        const Divider(),
                        createExamCtrl.optionsList.isNotEmpty
                            ? const Text("Choose the correct answer")
                                .paddingSymmetric(
                                horizontal: 16,
                              )
                            : Container(),
                        FormBuilderChoiceChip(
                                alignment: WrapAlignment.spaceEvenly,
                                onChanged: (dynamic index) {
                                  print(index);
                                },
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: "Required*")
                                ]),
                                selectedColor: AppColors.lightPurple,
                                name: 'correct_answer',
                                options: createExamCtrl.optionsList
                                    .map((element) => FormBuilderChipOption(
                                          value: createExamCtrl.optionsList
                                              .indexOf(element)
                                              .toString(),
                                          child: Text(element),
                                        ))
                                    .toList())
                            .paddingSymmetric(horizontal: 16, vertical: 10),
                        createExamCtrl.optionsList.isNotEmpty
                            ? FormBuilderDropdown(
                                name: 'allocated_marks',
                                decoration: const InputDecoration(
                                  labelText: 'Allocated Marks',
                                ),
                                // initialValue: 'Male',
                                allowClear: true,
                                hint:
                                    const Text('Enter Marks for this question'),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: "Required*")
                                ]),
                                items: createExamCtrl.marksOptions
                                    .map((marks) => DropdownMenuItem(
                                          value: marks,
                                          child: Text('$marks M'),
                                        ))
                                    .toList(),
                              ).paddingSymmetric(horizontal: 12)
                            : Container(),
                      ],
                    ),
                  ),
                ],
              );
            }))
          ],
        ),
        bottomNavigationBar: ButtonBar(children: [
          ElevatedButton(
            onPressed: () {
              createExamCtrl.onAddQuestionClicked();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0))))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderTextWidget(
                  content: "ADD QUESTION",
                  color: Colors.white,
                ),
                const Icon(
                  Icons.arrow_right_alt_rounded,
                  color: Colors.white,
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              createExamCtrl.onScheduleExamClicked();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green.shade500),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0))))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderTextWidget(
                  content: "Schedule Exam",
                  color: Colors.white,
                ),
                const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ShowAddedOption extends StatelessWidget {
  const ShowAddedOption({
    Key? key,
    required this.examOptionModel,
  }) : super(key: key);

  final String examOptionModel;

  @override
  Widget build(BuildContext context) {
    CreateExamCtrl createExamCtrl = Get.find();
    return SizedBox(
        child: Column(
      children: [
        Text(
          "Option ${createExamCtrl.optionsList.indexOf(examOptionModel) + 1}",
          style: const TextStyle(color: AppColors.primaryGrey),
        ),
        Text(examOptionModel.toString()).paddingOnly(top: 4)
      ],
    )).paddingOnly(top: 8);
  }
}
