import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iroots/src/controller/attendance/staff/view_attendance_controller.dart';
import 'package:iroots/src/modal/attendance/staffModalClass.dart';
import 'package:iroots/src/modal/attendance/studentAttendanceModalClass.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';

//meviewstudentattendance
class ViewAttendanceScreen extends StatelessWidget {
  const ViewAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ViewAttendanceController(),
      builder: (logic) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ConstClass.dashBoardColor,
          title: AppUtil.customText(
            text: "View Student Attendance",
            style: const TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xffF1F5F9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customDropDown1(
                      "Select Class",
                      // logic.staffHomeWorkController.staffClass!
                      //     .dataListItemName,
                      logic.staffHomeWorkController.dataItemName == ""
                          ? ""
                          : logic.staffHomeWorkController.dataItemName
                              .toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  customDropDown1(
                    "Select Section",
                    logic.staffHomeWorkController.staffClassmodel?.data
                                ?.isNotEmpty ??
                            false
                        ? logic.staffHomeWorkController.staffClassmodel!.data!
                                .firstWhere(
                                  (item) => item.isClassTeacher == true,
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

                  AppUtil.customText(
                    text: "Select Batch",
                    style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  // customDropDown1("Select Batch", "sa"
                  //     // logic.staffHomeWorkController.staffClassmodel!.data
                  //     // logic
                  //     //     .staffHomeWorkController.staffSection!.dataListItemName,
                  //     ),
                  Center(
                    child: Obx(() {
                      if (logic.isLoading.value) {
                        return CircularProgressIndicator();
                      }

                      return logic.batchList.isNotEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black, // Border color
                                  width: .4, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    6), // Optional: Rounded corners
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: DropdownButton<int>(
                                  // focusColor: Colors.amber,
                                  value: logic.selectedBatchId.value,
                                  onChanged: (int? newValue) {
                                    logic.selectedBatchId.value = newValue;
                                  },
                                  items: logic.batchList.map((batch) {
                                    return DropdownMenuItem<int>(
                                      value: batch['batchId'],
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 29.0, right: 29),
                                        child: Text(batch['batchName']),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          : Text("No data available");
                    }),
                  ),

                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // customDropDown(
                  //     logic,
                  //     "Select Student",
                  //     "Please Select Student",
                  //     logic.studentDataList, (newValue) {
                  //   logic.selectedStudent = newValue;
                  // }, logic.selectedStudent),
                  const SizedBox(
                    height: 10,
                  ),
                  AppUtil.customText(
                    text: "From Date",
                    style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  customOutlinedButton(
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
                    text: "To Date",
                    style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  customOutlinedButton(
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
                  Obx(() {
                    if (logic.showProgress.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        width: Get.width,
                        child: customOutlinedButton(
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
                              child: AppUtil.customText(
                                text: "Show",
                                style: const TextStyle(
                                    color: Color(0xff1575FF),
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ), () {
                          logic.showStudentAttendance();
                        }),
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  attandanceStatus(),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Total No Of Students : ",
                        style: const TextStyle(
                            color: Color(0xff0F172A),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                        children: [
                          TextSpan(
                              text: logic.studentListData.isNotEmpty
                                  ? "${logic.studentListData.length}"
                                  : "0",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14))
                        ]),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "No of Present day : ",
                        style: const TextStyle(
                            color: Color(0xff0F172A),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                        children: [
                          TextSpan(
                              text: logic.studentListData.length == 1
                                  ? logic.isAttandanceDataFound.value
                                      ? logic.studentData!.totalAttendedDays
                                      : ""
                                  : "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14))
                        ]),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    if (logic.isFirstTime.value) {
                      return const SizedBox();
                    } else if (logic.isAttandanceDataFound.value) {
                      return logic.studentListData.length == 1
                          ? ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 255),
                              child: Scrollbar(
                                thickness: 8,
                                radius: const Radius.circular(8),
                                interactive: true,
                                controller: logic.horizontalScrollController,
                                thumbVisibility: true,
                                child: SingleChildScrollView(
                                  controller: logic.horizontalScrollController,
                                  scrollDirection: Axis.horizontal,
                                  child: Scrollable(
                                    viewportBuilder: (BuildContext context,
                                        ViewportOffset position) {
                                      return DataTable(
                                        border: TableBorder.all(),
                                        columns: [
                                          DataColumn(
                                              label: AppUtil.customText(
                                            textAlign: TextAlign.center,
                                            text: "S. no.",
                                            style: const TextStyle(
                                                color: Color(0xff0F172A),
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          )),
                                          DataColumn(
                                              label: AppUtil.customText(
                                            textAlign: TextAlign.center,
                                            text: "Student Name",
                                            style: const TextStyle(
                                                color: Color(0xff0F172A),
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          )),
                                          DataColumn(
                                              label: AppUtil.customText(
                                            textAlign: TextAlign.center,
                                            text: "Class",
                                            style: const TextStyle(
                                                color: Color(0xff0F172A),
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          )),
                                          DataColumn(
                                              label: AppUtil.customText(
                                            textAlign: TextAlign.center,
                                            text: "Section",
                                            style: const TextStyle(
                                                color: Color(0xff0F172A),
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          )),
                                          for (var date
                                              in logic.allBetweenDates)
                                            DataColumn(
                                              label: AppUtil.customText(
                                                textAlign: TextAlign.center,
                                                // text: date,
                                                text: date
                                                    .split("/")
                                                    .first
                                                    .trim(),
                                                style: const TextStyle(
                                                    color: Color(0xff0F172A),
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          DataColumn(
                                              label: AppUtil.customText(
                                            textAlign: TextAlign.center,
                                            text: "Attendance %",
                                            style: const TextStyle(
                                                color: Color(0xff0F172A),
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          )),
                                        ],
                                        rows: [
                                          DataRow(
                                            cells: [
                                              datacell("${1}"),
                                              datacell(logic
                                                  .attendance[0]!.studentName),
                                              datacell(logic
                                                  .attendance[0]!.className),
                                              datacell(logic
                                                  .attendance[0]!.sectionName),
                                              for (var date
                                                  in logic.allBetweenDates)
                                                buildDateComparisonWidget(
                                                    date, logic),
                                              datacell(logic
                                                  .studentData!.attendancePer),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )
                          : logic.studentListData.isEmpty
                              ? SizedBox.shrink()
                              : ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxHeight: 255),
                                  child: Scrollbar(
                                    thickness: 8,
                                    radius: const Radius.circular(8),
                                    interactive: true,
                                    controller: logic.verticalScrollController,
                                    thumbVisibility: true,
                                    child: SingleChildScrollView(
                                      controller:
                                          logic.verticalScrollController,
                                      scrollDirection: Axis.vertical,
                                      child: Scrollbar(
                                        thickness: 8,
                                        radius: const Radius.circular(8),
                                        interactive: true,
                                        controller:
                                            logic.horizontalScrollController,
                                        thumbVisibility: true,
                                        child: SingleChildScrollView(
                                          controller:
                                              logic.horizontalScrollController,
                                          scrollDirection: Axis.horizontal,
                                          child: Scrollable(
                                            viewportBuilder:
                                                (BuildContext context,
                                                    ViewportOffset position) {
                                              return DataTable(
                                                  border: TableBorder.all(),
                                                  columns: [
                                                    DataColumn(
                                                        label:
                                                            AppUtil.customText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: "S. no.",
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff0F172A),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    )),
                                                    DataColumn(
                                                        label:
                                                            AppUtil.customText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: "Student Name",
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff0F172A),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    )),
                                                    DataColumn(
                                                        label:
                                                            AppUtil.customText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: "Class",
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff0F172A),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    )),
                                                    DataColumn(
                                                        label:
                                                            AppUtil.customText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: "Section",
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff0F172A),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    )),
                                                    for (var date in logic
                                                        .allBetweenDates)
                                                      DataColumn(
                                                        label:
                                                            AppUtil.customText(
                                                          textAlign:
                                                              TextAlign.center,
                                                          // text: date,
                                                          text: date
                                                              .split("/")
                                                              .first
                                                              .trim(),
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xff0F172A),
                                                              fontFamily:
                                                                  'Open Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    DataColumn(
                                                        label:
                                                            AppUtil.customText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: "Attendance %",
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff0F172A),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    )),
                                                  ],
                                                  rows: [
                                                    for (var index = 0;
                                                        index <
                                                            logic
                                                                .studentListData
                                                                .length;
                                                        index++)
                                                      buildDataRow(
                                                          index, logic),
                                                  ]);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                    } else if (!logic.showProgress.value) {
                      return Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: AppUtil.noDataFound("No Data Found"),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: logic.isAttandanceDataFound.value ? 110 : 80,
          color: const Color(0xffF1F5F9),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: customOutlinedButton(
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
                                horizontal: 0, vertical: 0),
                            child: AppUtil.customText(
                              text: "Mark Attendance",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            )), () {
                      Get.back();
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: false,
                    child: Obx(() {
                      if (logic.isAttandanceDataFound.value) {
                        return SizedBox(
                          width: Get.width,
                          child: customOutlinedButton(
                              OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1.5, color: Color(0xff0DB166)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                child: AppUtil.customText(
                                  text: "Export to Excel",
                                  style: const TextStyle(
                                      color: Color(0xff0DB166),
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ), () {
                            logic.exportData();
                          }),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget customOutlinedButton(
      ButtonStyle buttonStyle, Widget widget, Function() onPressed) {
    return OutlinedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: widget,
    );
  }

  DataCell datacell(String? text) {
    return DataCell(AppUtil.customText(
      textAlign: TextAlign.center,
      text: text,
      style: const TextStyle(
          color: Color(0xff334155),
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
          fontSize: 12),
    ));
  }

  Widget customDropDown(
    ViewAttendanceController logic,
    String? dropDownText,
    String? hintText,
    List<StaffData> staffDataList,
    void Function(StaffData) onChanged,
    StaffData? value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppUtil.customText(
          text: dropDownText,
          style: const TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
        const SizedBox(
          height: 2,
        ),
        staffDataList.isNotEmpty
            ? DropdownButtonFormField<StaffData>(
                icon: SvgPicture.asset(
                  "assets/icons/arrowdown_icon.svg",
                  height: 20,
                  width: 20,
                ),
                value: value,
                style: const TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
                items: staffDataList.map((item) {
                  return DropdownMenuItem<StaffData>(
                      value: item,
                      child: AppUtil.customText(
                        textAlign: TextAlign.center,
                        text: item.staffName,
                        style: const TextStyle(
                            color: Color(0xff0F172A),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ));
                }).toList(),
                onChanged: (newValue) {
                  onChanged(newValue!);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: Color(0xff0F172A),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xff94A3B8),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xff94A3B8),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xff94A3B8),
                      width: 1,
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              )
      ],
    );
  }

  Widget customDropDown1(
    String? title,
    String? buttonValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppUtil.customText(
          text: title,
          style: const TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          width: Get.width,
          child: customOutlinedButton(
              OutlinedButton.styleFrom(
                side: const BorderSide(width: 1, color: Color(0xff94A3B8)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppUtil.customText(
                      text: buttonValue,
                      style: const TextStyle(
                          color: Color(0xff0F172A),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrowdown_icon.svg",
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              () {}),
        )
      ],
    );
  }

  DataCell buildDateComparisonWidget(
      String date, ViewAttendanceController logic) {
    for (var entry in logic.attendance) {
      if (entry!.createdDate == date) {
        return buildAttendanceIcon(entry.markFullDayAbsent == "True",
            entry.markHalfDayAbsent == " True");
      }
    }
    return const DataCell(SizedBox());
  }

  DataCell allbuildDateComparisonWidget(String date, Datum? logic) {
    for (var entry in logic!.attendance) {
      if (entry!.createdDate == date) {
        return buildAttendanceIcon(entry.markFullDayAbsent == "True",
            entry.markHalfDayAbsent == " True");
      }
    }
    return const DataCell(SizedBox());
  }

  DataCell buildAttendanceIcon(bool markFullDayAbsent, bool markHalfDayAbsent) {
    if (markFullDayAbsent) {
      return DataCell(AppUtil.customText(
        text: "✔",
        style: const TextStyle(
            color: Colors.green,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ));
    } else if (markHalfDayAbsent) {
      return DataCell(AppUtil.customText(
        textAlign: TextAlign.center,
        text: "½",
        style: const TextStyle(
            color: Color(0xff0F172A),
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w400,
            fontSize: 14),
      ));
    } else if (!markFullDayAbsent && !markHalfDayAbsent) {
      return DataCell(AppUtil.customText(
        text: "✖",
        style: const TextStyle(
            color: Colors.red,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ));
    } else {
      return const DataCell(SizedBox());
    }
  }

  Widget attandanceStatus() {
    return Column(
      children: [
        Row(
          children: [
            RichText(
              text: const TextSpan(
                  text: "Full Day Present :",
                  style: TextStyle(
                      color: Color(0xff0F172A),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  children: [
                    TextSpan(
                        text: ' ✔',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14))
                  ]),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              width: 50,
            ),
            RichText(
              text: const TextSpan(
                  text: "Half Day Present :",
                  style: TextStyle(
                      color: Color(0xff0F172A),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  children: [
                    TextSpan(
                        text: ' ½',
                        style: TextStyle(
                            color: Color(0xff0F172A),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14))
                  ]),
              textAlign: TextAlign.start,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            RichText(
              text: const TextSpan(
                  text: "Absent :",
                  style: TextStyle(
                      color: Color(0xff0F172A),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  children: [
                    TextSpan(
                        text: ' ✖',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14))
                  ]),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              width: 110,
            ),
            RichText(
              text: const TextSpan(
                  text: "Other :",
                  style: TextStyle(
                      color: Color(0xff0F172A),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  children: [
                    TextSpan(
                        text: ' 0',
                        style: TextStyle(
                            color: Color(0xff0F172A),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14))
                  ]),
              textAlign: TextAlign.start,
            ),
          ],
        )
      ],
    );
  }

  DataRow buildDataRow(int index, ViewAttendanceController logic) {
    var student = logic.studentListData[index];
    List<DataCell> cells = [
      datacell("${index + 1}"),
      datacell(student!.attendance[0]!.className!),
      datacell(student.attendance[0]!.studentName),
      datacell(student.attendance[0]!.sectionName),
      for (var date in logic.allBetweenDates)
        allbuildDateComparisonWidget(date, student),
      datacell(student.attendancePer),
    ];

    return DataRow(cells: cells);
  }
}
