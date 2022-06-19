import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:oepadmin/common/widgets/app-header.widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oepadmin/presentation/controllers/create_exam_ctrl.dart';

import '../../common/widgets/text-widget.dart';

class CreateExamScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    var createExamCtrl = Get.put(CreateExamCtrl(), permanent: true);
    return SafeArea(
      child: Obx(() {
        return ModalProgressHUD(
            inAsyncCall: createExamCtrl.isLoading.value,
            child: Scaffold(
              body: Column(
                children: [
                  const AppHeader(title: "Create &\nSchedule Exam"),
                  Expanded(
                      child: ListView(
                    shrinkWrap: true,
                    children: [
                      FormBuilder(
                          key: createExamCtrl.formKey,
                          child: Column(
                            children: [
                              //Exam ID
                              FormBuilderTextField(
                                name: 'exam_id',
                                decoration: const InputDecoration(
                                    labelText: 'Exam Code',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 2.0))),
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(errorText: "*Required")]),
                                keyboardType: TextInputType.text,
                              ).paddingOnly(left: 12, right: 12, top: 16),
                              //Exam Name
                              FormBuilderTextField(
                                name: 'exam_name',
                                decoration: const InputDecoration(
                                    labelText: 'Exam Name',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 2.0))),
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(errorText: "*Required")]),
                                keyboardType: TextInputType.text,
                              ).paddingOnly(left: 12, right: 12, top: 16),

                              //Exam Name
                              FormBuilderTextField(
                                name: 'exam_duration',
                                decoration: const InputDecoration(
                                    labelText: 'Exam Duration in Mins',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 2.0))),
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(errorText: "*Required")]),
                                keyboardType: TextInputType.number,
                              ).paddingOnly(left: 12, right: 12, top: 16),

                              //Exam Date Time
                              FormBuilderDateTimePicker(
                                name: 'exam_date_time',
                                currentDate: DateTime.now(),
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                decoration: const InputDecoration(
                                    labelText: 'Exam Date & Time',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 2.0))),
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(errorText: "*Required")]),
                              ).paddingOnly(left: 12, right: 12, top: 16),

                              //Exam Max Attempts
                              FormBuilderTextField(
                                name: 'max_attempts',
                                decoration: const InputDecoration(
                                    labelText: 'Max number of attempts',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 2.0))),
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(errorText: "*Required")]),
                                keyboardType: TextInputType.number,
                              ).paddingOnly(left: 12, right: 12, top: 16),

                              //Exam PIN
                              FormBuilderTextField(
                                name: 'contest_pin',
                                decoration: const InputDecoration(
                                    labelText: 'Exam PIN',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 2.0))),
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(errorText: "*Required")]),
                                keyboardType: TextInputType.number,
                              ).paddingOnly(left: 12, right: 12, top: 16),
                            ],
                          ))
                    ],
                  ))
                ],
              ),
              bottomNavigationBar: BottomAppBar(
                child: SizedBox(
                  width: Get.width,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      createExamCtrl.onSaveCreateExamClicked();
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0))))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeaderTextWidget(
                          content: "Save & Next",
                          color: Colors.white,
                        ),
                        const Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
