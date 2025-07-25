import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:iroots/common/app_data.dart';
import 'package:iroots/src/controller/dashboard/dashBoard_controller.dart';
import 'package:iroots/src/controller/home/staff/staff_home_controller.dart';
import 'package:iroots/src/modal/attendance/newwStudentAttendanceUpdatemodel.dart';
import 'package:iroots/src/modal/attendance/studentAttendanceByStaffModalClass.dart';
import 'package:iroots/src/ui/auth/login_page.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';

class UpdateStaffAttendanceController extends GetxController {
  final GetStorage box = Get.put(GetStorage());
  final staffHomeWorkController = Get.put(StaffHomeController());

  String? _selectedDateFromCalender =
      DateFormat('dd/MM/yyyy').format(DateTime.now());
  List<StudentAttendanceByStaffDatum> studentAttendanceDatList = [];

  StudentAttendanceByStaffDatum? fullAttendance;
  StudentAttendanceByStaffDatum? halfAttendance;
  StudentAttendanceByStaffDatum? othersAttendance;
  RxBool showProgress = false.obs;
  RxBool updateAttenShowProgress = false.obs;
  RxBool isDataFound = false.obs;
  RxBool isFirstTime = true.obs;
  final ScrollController verticalScrollController = ScrollController();
  final ScrollController horizontalScrollController = ScrollController();
  DateTime _selectedDate = DateTime.now();

  String? accessToken;

  @override
  void onInit() {
    accessToken = box.read("accessToken");

    showStudentAttendance();
    super.onInit();
  }

  String formatDate() {
    return DateFormat('dd-MMM-yyyy').format(_selectedDate);
  }

  void pickDateDialog(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      _selectedDate = pickedDate;
      _selectedDateFromCalender =
          DateFormat('dd/MM/yyyy').format(_selectedDate);
      update();
    });
  }

  void showStudentAttendance() {
    _showStudentAtten();
  }

  Future<void> _showStudentAtten() async {
    isFirstTime.value = false;
    _showProgress();
//work
    try {
      // Map<String, String> credentials = {
      //   "classId": "209",
      //   "sectionId": "244",
      //   "fromDate": "21/07/2025",
      //   "toDate": "21/07/2025",
      //   "studentId": "0",
      //   "batchId": "22"
      // };

      Map<String, String> credentials = {
        "classId": staffHomeWorkController.dataItemName == ""
            ? ""
            : staffHomeWorkController.dataItemId.toString(),
        "sectionId":
            staffHomeWorkController.staffClassmodel?.data?.isNotEmpty ?? false
                ? staffHomeWorkController.staffClassmodel!.data!
                        .firstWhere(
                          (item) => item.isClassTeacher == true,
                          // Replace `Data()` with an appropriate default object
                        )
                        .sectionId
                        .toString() ??
                    ""
                : "",
        "toDate": _selectedDateFromCalender!,
        'fromDate': _selectedDateFromCalender!,
        "batchId": "22",
        'studentId': "0"
      };

      // Map<String, String> credentials = {};

      String jsonCredentials = jsonEncode(credentials);
      print("dbdhdhdhdhbd$jsonCredentials");
//nowworkinggggg
      http.Response response = await http.post(
        // Uri.parse("${baseUrlName}Attendance/StudentAttendanceById"),
        Uri.parse("${baseUrlName}Attendance/ViewStudentAttendance"),
        // Uri.parse(
        //     "${baseUrlName}Student/GetStudentDetailsByClassSection?ClassId=${staffHomeWorkController.dataItemName == "" ? "" : staffHomeWorkController.dataItemId.toString()}&SectionId=${staffHomeWorkController.staffClassmodel?.data?.isNotEmpty ?? false ? staffHomeWorkController.staffClassmodel!.data!.firstWhere(
        //           (item) => item.isClassTeacher == true,
        //           // Replace `Data()` with an appropriate default object
        //         ).sectionId.toString() ?? "" : ""}"
        //     // "${baseUrlName}Attendance/StudentAttendenceForCreation"

        //     ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonCredentials,
      );
//meeeatworkkkkk
//try to entre the value inside the model
      if (response.statusCode == 200) {
        var studentAttendance =
            updatettStudentAttendanceModalClassFromJson(response.body);
        if (studentAttendance.responseCode == "200" &&
            studentAttendance.data!.isNotEmpty) {
          // Loop through all students
          for (int i = 0; i < studentAttendance.data!.length; i++) {
            StudentAttendanceDatum student = studentAttendance.data![i];

            // Check if student has attendance records
            if (student.attendance != null && student.attendance!.isNotEmpty) {
              // Loop through all attendance records for this student
              // for (int j = 0; j < student.attendance!.length; j++) {
              if (student.attendance!.isNotEmpty) {
                Attendance attendanceItem = student.attendance![0];

                // Convert Attendance to StudentAttendanceByStaffDatum
                StudentAttendanceByStaffDatum convertedItem =
                    StudentAttendanceByStaffDatum(
                  attendanceId: attendanceItem.attendanceId,
                  classId: attendanceItem.classId,
                  sectionId: attendanceItem.sectionId,
                  batchId: attendanceItem.batchId?.toString(),
                  className: attendanceItem.className,
                  sectionName: attendanceItem.sectionName,
                  markFullDayAbsent: attendanceItem.markFullDayAbsent,
                  markHalfDayAbsent: attendanceItem.markHalfDayAbsent,
                  studentRegisterId: attendanceItem.studentRegisterId,
                  studentName: attendanceItem.studentName,
                  createdDate: attendanceItem.createdDate,
                  day: attendanceItem.day,
                  createdBy: attendanceItem.createdBy,
                  others: attendanceItem.others,
                );

                studentAttendanceDatList.add(convertedItem);
              }
            }
          }

          print(
              "Total attendance records added: ${studentAttendanceDatList.length}");
          print(studentAttendanceDatList);
          isDataFound.value = true;
          _hideProgress();
        }
        // if (studentAttendance.responseCode == "200" &&
        //     studentAttendance.data!.isNotEmpty &&
        //     studentAttendance.data![0].attendance!.isNotEmpty) {
        //   Attendance attendanceItem = studentAttendance.data![0].attendance![0];

        //   // Convert Attendance to StudentAttendanceByStaffDatum
        //   StudentAttendanceByStaffDatum convertedItem =
        //       StudentAttendanceByStaffDatum(
        //     attendanceId: attendanceItem.attendanceId,
        //     classId: attendanceItem.classId,
        //     sectionId: attendanceItem.sectionId,
        //     batchId:
        //         attendanceItem.batchId?.toString(), // Convert int to String
        //     className: attendanceItem.className,
        //     sectionName: attendanceItem.sectionName,
        //     markFullDayAbsent: attendanceItem.markFullDayAbsent,
        //     markHalfDayAbsent: attendanceItem.markHalfDayAbsent,
        //     studentRegisterId: attendanceItem.studentRegisterId,
        //     studentName: attendanceItem.studentName,
        //     createdDate: attendanceItem.createdDate,
        //     day: attendanceItem.day,
        //     createdBy: attendanceItem.createdBy,
        //     others: attendanceItem.others,
        //   );

        //   studentAttendanceDatList.add(convertedItem);
        //   print(studentAttendanceDatList);
        //   isDataFound.value = true;
        //   _hideProgress();
        // }

        // if (studentAttendance.responseCode == "200" &&
        //     studentAttendance.data!.isNotEmpty) {
        //   List<Attendance>? attendance22;
        //   attendance22!.add(studentAttendance.data![0].attendance![0]);
        //   studentAttendanceDatList.add(attendance22[0]);
        //   print(studentAttendanceDatList);
        //   isDataFound.value = true;
        //   _hideProgress();
        // }

        else if (studentAttendance.responseCode == "500") {
          _hideProgress();
          isDataFound.value = false;
          AppUtil.snackBar("Something went wrong");
        } else {
          _hideProgress();
          isDataFound.value = false;
        }
      } else if (response.statusCode == 401) {
        _hideProgress();
        AppUtil.showAlertDialog(onPressed: () {
          Get.back();
          box.remove('accessToken');
          box.remove('isUserLogin');
          box.remove('userRole');
          Get.offAll(() => const LoginPage());
        });
      } else {
        _hideProgress();
        isDataFound.value = false;
        AppUtil.snackBar('Something went wrong');
      }
    } catch (error) {
      _hideProgress();
      isDataFound.value = false;
      AppUtil.snackBar('$error');
    }

    update();
  }

  void _showProgress() {
    showProgress.value = true;
  }

  void _hideProgress() {
    showProgress.value = false;
  }

  void markAllFullAttendance() {
    for (var allAttendance in studentAttendanceDatList) {
      allAttendance.markFullDayAbsent =
          (allAttendance.markFullDayAbsent == "False") ? "True" : "False";
      fullAttendance = allAttendance;
    }

    update();
  }

  void markAllHalfAttendance() {
    for (var allAttendance in studentAttendanceDatList) {
      allAttendance.markHalfDayAbsent =
          (allAttendance.markHalfDayAbsent == "False") ? "True" : "False";
      halfAttendance = allAttendance;
    }

    update();
  }

  void markAllOthersAttendance() {
    for (var allAttendance in studentAttendanceDatList) {
      allAttendance.others =
          (allAttendance.others == "False") ? "True" : "False";
      othersAttendance = allAttendance;
    }

    update();
  }

  void markFullAttendance(StudentAttendanceByStaffDatum item, int index) {
    item.markFullDayAbsent =
        (item.markFullDayAbsent == "False") ? "True" : "False";
    update();
  }

  void markHalfAttendance(StudentAttendanceByStaffDatum item) {
    item.markHalfDayAbsent =
        (item.markHalfDayAbsent == "False") ? "True" : "False";
    update();
  }

  void markOtherAttendance(StudentAttendanceByStaffDatum item) {
    item.others = (item.others == "False") ? "True" : "False";
    update();
  }

  Future<void> updateAttendance() async {
    updateAttenShowProgress.value = true;

    try {
      String jsonCredentials = jsonEncode(studentAttendanceDatList);

      http.Response response = await http.post(
        Uri.parse("${baseUrlName}Attendance/EditStudentAttendance"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonCredentials,
      );

      print("sgsgsgsgsg${response.statusCode}");

      if (response.statusCode == 200) {
        Get.back();
        AppUtil.snackBar("Update attendance successfully");
        // var studentAttendance =
        //     studentAttendanceByStaffModalClassFromJson(response.body);
        // if (studentAttendance.responseCode == "200") {
        //   updateAttenShowProgress.value = false;
        //   Get.back();
        //   AppUtil.snackBar("Update attendance successfully");
        // } else if (studentAttendance.responseCode == "500") {
        //   updateAttenShowProgress.value = false;
        //   AppUtil.snackBar("Something went wrong");
        // } else {
        //   updateAttenShowProgress.value = false;
        //   AppUtil.snackBar(studentAttendance.msg);
        // }
      } else if (response.statusCode == 401) {
        updateAttenShowProgress.value = false;
        AppUtil.showAlertDialog(onPressed: () {
          Get.back();
          box.remove('accessToken');
          box.remove('isUserLogin');
          box.remove('userRole');
          Get.offAll(() => const LoginPage());
        });
      } else {
        updateAttenShowProgress.value = false;
        AppUtil.snackBar('Something went wrong');
      }
    } catch (error) {
      print("sgsgsgsgsg$error");

      updateAttenShowProgress.value = false;
      AppUtil.snackBar('$error');
    }
  }
}
