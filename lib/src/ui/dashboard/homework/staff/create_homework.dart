import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:iroots/src/controller/homework/staff/staff_homework_controller.dart';
import 'package:iroots/src/modal/homework/getHomeworkModalClass.dart';
import 'package:iroots/src/service/model/get_class_model.dart';
import 'package:iroots/src/ui/dashboard/admin/fill_marks/admin_fill_controller.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';
import 'package:iroots/src/utility/widget/flutter_typeahead.dart';

//mecreatehomework
class CreateHomeworkScreen extends StatelessWidget {
  final GetHomeWorkData? homeworkModal;
  // AdminFillController con = Get.put(AdminFillController());
  const CreateHomeworkScreen({super.key, this.homeworkModal});

//staffHomeWorkController.
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(GetClassList());

    return GetBuilder(
      init: StaffHomeWorkController(),
      builder: (logic) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ConstClass.dashBoardColor,
          title: AppUtil.customText(
            text: "Create Homework",
            style: const TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              // if (homeworkModal != null) {
              //   logic.homeworkTitle.text = homeworkModal!.assignMentName!;
              //   logic.selectedCourse.=homeworkModal!.subjectName!.toString();
              // }

              return Container(
                // height: 0.9,
                color: const Color(0xffF1F5F9),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppUtil.customText(
                        text: "Homework Title",
                        style: const TextStyle(
                            color: Color(0xff475569),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      widgetHomeTextField(
                          controllerEmail: logic.homeworkTitle,
                          hint: "Enter your homework title",
                          keyboardType: TextInputType.text),
                      const SizedBox(
                        height: 15,
                      ),

                      /* AppUtil.customText(
                      text: "Instructions",
                      style: TextStyle(
                          color: const Color(0xff475569),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    widgetHomeTextField(
                        controllerEmail: logic.homeworkInstructions,
                        hint: "Enter your homework instructions",
                        keyboardType: TextInputType.text),
                    SizedBox(
                      height: 15.h,
                    ),*/
                      // _Class(con: con),
                      //looking

                      logic.staffHomeWorkController.isclassteacherany == false
                          ? Column(
                              children: [
                                // DropdownButton<dynamic>(
                                //   value: context
                                //       .read<MainBloc>()
                                //       .classdropdownvalue,
                                //   onChanged: (dynamic newValue) {
                                //     context.read<MainBloc>().add(
                                //         UpdateClassDropdownValue(
                                //             newValue: newValue));
                                //   },
                                //   items: context
                                //           .read<MainBloc>()
                                //           .classListModel
                                //           .data
                                //           ?.map<DropdownMenuItem<dynamic>>(
                                //               (dynamic value) {
                                //         return DropdownMenuItem<dynamic>(
                                //           value: value,
                                //           child: Text(value
                                //               .toString()), // Convert to string for display
                                //         );
                                //       }).toList() ??
                                //       [], // Handle null case
                                // ),
                              ],
                            )
                          : AppUtil.customDropDown1(
                              "Select Class",
                              logic.staffHomeWorkController.dataItemName == ""
                                  ? ""
                                  : logic.staffHomeWorkController.dataItemName
                                      .toString()

                              // logic.staffHomeWorkController.staffClass!
                              //     .dataListItemName
                              ),
                      const SizedBox(
                        height: 10,
                      ),

                      logic.staffHomeWorkController.isclassteacherany == false
                          ? Column(
                              children: [
                                // DropdownButton<dynamic>(
                                //   value: context
                                //       .read<MainBloc>()
                                //       .classdropdownvalue,
                                //   onChanged: (dynamic newValue) {
                                //     context.read<MainBloc>().add(
                                //         UpdateClassDropdownValue(
                                //             newValue: newValue));
                                //   },
                                //   items: context
                                //           .read<MainBloc>()
                                //           .classListModel
                                //           .data
                                //           ?.map<DropdownMenuItem<dynamic>>(
                                //               (dynamic value) {
                                //         return DropdownMenuItem<dynamic>(
                                //           value: value,
                                //           child: Text(value
                                //               .toString()), // Convert to string for display
                                //         );
                                //       }).toList() ??
                                //       [], // Handle null case
                                // ),
                              ],
                            )
                          : AppUtil.customDropDown1(
                              "Select Section",

                              logic.staffHomeWorkController.staffClassmodel
                                          ?.data?.isNotEmpty ??
                                      false
                                  ? logic.staffHomeWorkController
                                          .staffClassmodel!.data!
                                          .firstWhere(
                                            (item) =>
                                                item.isClassTeacher == true,
                                            // Replace `Data()` with an appropriate default object
                                          )
                                          .section ??
                                      ""
                                  : "",

                              // logic
                              //     .staffHomeWorkController.staffSection!.dataListItemName,
                            ),

                      const SizedBox(
                        height: 10,
                      ),
                      AppUtil.customDropDown(
                          logic,
                          "Select Subject",
                          "Please Select Subject",
                          logic.dashBoardController.adminCourseDataList,
                          (newValue) {
                        logic.selectedCourse = newValue;
                      }, logic.selectedCourse),
                      const SizedBox(
                        height: 10,
                      ),
                      AppUtil.customText(
                        text: "Assignment Date",
                        style: const TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppUtil.customOutlinedButton(
                          OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Color(0xff94A3B8)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppUtil.customText(
                                  text: logic.selectedAssignmentDate,
                                  style: const TextStyle(
                                      color: Color(0xff0F172A),
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                SvgPicture.asset(
                                  "assets/icons/calendar_icon.svg",
                                  height: 20,
                                  width: 20,
                                )
                              ],
                            ),
                          ), () {
                        logic.pickDateDialog(context, 0);
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      AppUtil.customText(
                        text: "Submission Date",
                        style: const TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppUtil.customOutlinedButton(
                          OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Color(0xff94A3B8)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppUtil.customText(
                                  text: logic.selectedSubmissionDate,
                                  style: const TextStyle(
                                      color: Color(0xff0F172A),
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                SvgPicture.asset(
                                  "assets/icons/calendar_icon.svg",
                                  height: 20,
                                  width: 20,
                                )
                              ],
                            ),
                          ), () {
                        logic.pickDateDialog(context, 1);
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      /* SizedBox(
                      height: 100.h,
                      width: 1.sw,
                      child: DottedBorder(
                        dashPattern: const <double>[6, 8],
                        color: const Color(0xff94A3B8),
                        strokeWidth: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0).w,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/homework_icons/icon_homework_upload_file.svg",
                                  height: 20.h,
                                  width: 20.w,
                                ),
                                AppUtil.customText(
                                  text: "Click to Upload",
                                  style: TextStyle(
                                      color: const Color(0xff1575FF),
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp),
                                ),
                                AppUtil.customText(
                                  text: "Pdf, Png or jpg files",
                                  style: TextStyle(
                                      color: const Color(0xff64748B),
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),*/
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          color: const Color(0xffF1F5F9),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Obx(() {
                if (logic.showProgress.value) {
                  return const SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return SizedBox(
                    width: Get.width,
                    child: AppUtil.customOutlinedButton(
                        OutlinedButton.styleFrom(
                          backgroundColor: ConstClass.themeColor,
                          side: BorderSide(
                              width: 1.5, color: ConstClass.themeColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                size: 26,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppUtil.customText(
                                text: "Create Homework",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ), () {
                      logic.createHomeWork(context);
                    }),
                  );
                }
              })),
        ),
      ),
    );
  }

  String getColumnName(int index) {
    switch (index) {
      case 0:
        return 'S.no';
      case 1:
        return 'Student Name';
      case 2:
        return 'Mark Full Day Present';
      case 4:
        return 'Mark Half Day Present';
      case 6:
        return 'Other';
      default:
        return '';
    }
  }

  String getCellData(int rowIndex, int colIndex) {
    switch (colIndex) {
      case 0:
        return (rowIndex + 1).toString();
      case 1:
        return 'Student ${rowIndex + 1}';
      case 2:
        return 'A';
      case 4:
        return 'H';
      case 6:
        return 'Other';
      default:
        return '';
    }
  }

  Widget widgetHomeTextField(
      {required TextEditingController controllerEmail,
      required String hint,
      required TextInputType? keyboardType}) {
    return TextFormField(
      controller: controllerEmail,
      decoration: InputDecoration(
        hintText: hint,
        counterText: '',
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        fillColor: Colors.white,
        filled: true,
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff94A3B8),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
    );
  }
}

class _Class extends StatelessWidget {
  final AdminFillController con;

  const _Class({required this.con});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Select Class',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffF1F5F9),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xff94A3B8)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                      color: Colors.black,
                    ),
                    controller: con.classController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      hintText: "Select Class",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        fontFamily: 'Open Sans',
                        color: Colors.black,
                      ),
                      filled: true,
                      counterStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Open Sans',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 20,
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    List<ClassModel> indTemp = [];
                    for (int i = 0; i < con.classList.length; i++) {
                      if (removeDiacritics(con.classList[i].dataListItemName!
                              .trim()
                              .toLowerCase())
                          .contains(
                              removeDiacritics(pattern.trim().toLowerCase()))) {
                        if (indTemp
                            .where((element) =>
                                element.dataListItemName!
                                    .trim()
                                    .toLowerCase() ==
                                con.classList[i].dataListItemName!
                                    .trim()
                                    .toLowerCase())
                            .isEmpty) {
                          indTemp.add(con.classList[i]);
                        }
                      }
                    }

                    return indTemp;
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Select Class";
                    }
                    return null;
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(
                        suggestion.dataListItemName ?? "",
                        style: const TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    con.classController.text =
                        suggestion.dataListItemName ?? "";
                    con.selectedClass.value = suggestion;
                    con.getSectionList();
                  },
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
