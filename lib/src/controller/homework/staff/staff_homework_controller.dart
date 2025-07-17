import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:iroots/common/app_data.dart';
import 'package:iroots/src/controller/dashboard/dashBoard_controller.dart';
import 'package:iroots/src/controller/home/staff/staff_home_controller.dart';
import 'package:iroots/src/modal/attendance/staffModalClass.dart';
import 'package:iroots/src/modal/homework/createHomeWorkModalClass.dart';
import 'package:iroots/src/modal/homework/getHomeworkModalClass.dart';
import 'package:iroots/src/modal/selection_popup_model.dart';
import 'package:iroots/src/ui/auth/login_page.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';
import 'package:path/path.dart';

class StaffHomeWorkController extends GetxController {
  final GetStorage box = Get.put(GetStorage());

  final staffHomeWorkController = Get.put(StaffHomeController());
  final dashBoardController = Get.put(DashBoardController());
  TextEditingController classController2 = TextEditingController();
  StaffData? selectedCourse;
  RxBool showProgress = false.obs;
  RxBool homeWorkProgress = false.obs;
  TextEditingController homeworkTitle = TextEditingController();
  TextEditingController homeworkInstructions = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  SelectionPopupModel? selectedSelection;

  String? selectedAssignmentDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now());
  String? selectedSubmissionDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now());

  List<GetHomeWorkData> getHomeworkDataList = [];
  RxBool isHomeWorkDataFound = false.obs;

  String? accessToken;

  @override
  void onInit() {
    accessToken = box.read("accessToken");

    getHomeWork();
    super.onInit();
  }

  void pickDateDialog(BuildContext context, int index) {
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
      if (index == 0) {
        selectedAssignmentDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
      } else {
        selectedSubmissionDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
      }

      update();
    });
  }

  void createHomeWork(BuildContext context) {
    DateTime assignmentDate =
        DateFormat('dd/MM/yyyy').parse(selectedAssignmentDate!);
    DateTime submissionDate =
        DateFormat('dd/MM/yyyy').parse(selectedSubmissionDate!);

    if (homeworkTitle.text.isEmpty) {
      AppUtil.snackBar('Please enter homework title');
      return;
    }

    if (selectedCourse == null) {
      AppUtil.snackBar('Please select Subject');
      return;
    }

    if (assignmentDate.isAfter(submissionDate)) {
      AppUtil.snackBar(
          'Assignment date cannot be greater than submission date');
      return;
    }

    _createHomeWork(context);
  }

  void _showProgress() {
    showProgress.value = true;
  }

  void _hideProgress() {
    showProgress.value = false;
  }

  Future<void> _createHomeWork(BuildContext context) async {
    _showProgress();

    try {
      Map<String, String> credentials = {
        "assignmentId": "0",
        "className": staffHomeWorkController.dataItemName == ""
            ? ""
            : staffHomeWorkController.dataItemName.toString(),
        "classId": staffHomeWorkController.dataItemId == ""
            ? ""
            : staffHomeWorkController.dataItemId.toString(),
        "sectionName":
            staffHomeWorkController.staffClassmodel?.data?.isNotEmpty ?? false
                ? staffHomeWorkController.staffClassmodel!.data!
                        .firstWhere(
                          (item) => item.isClassTeacher == true,
                          // Replace `Data()` with an appropriate default object
                        )
                        .section ??
                    ""
                : "",
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
        "subjectName": selectedCourse!.staffName ?? "",
        "subjectId": selectedCourse!.staffId.toString(),
        "newAssignment": homeworkTitle.text,
        "assignmentDate": selectedAssignmentDate ?? "",
        "submittedDate": selectedSubmissionDate ?? "",
        "createdDate": selectedAssignmentDate ?? "",
        "batchId": "4",
        "staff_Id": staffHomeWorkController.staffDetail == null
            ? ""
            : staffHomeWorkController.staffDetail.value.staffid ?? "",
      };

      String jsonCredentials = jsonEncode(credentials);
      log(jsonCredentials.toString());
      final response = await http.post(
        // Uri.parse("${baseUrlName}Student/AddAssignment"),
        Uri.parse("${baseUrlName}Exam/AddHomeWork"),

        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonCredentials,
      );

      if (response.statusCode == 200) {
        var studentAttendance = createHomeWorkModalClassFromJson(response.body);
        Navigator.pop(context);
        getHomeWork();
        if (studentAttendance.responseCode == "201") {
          _hideProgress();
          Get.back();
          getHomeWork();
          AppUtil.snackBar("Homework created successfully");
        } else if (studentAttendance.responseCode == "500") {
          _hideProgress();
          AppUtil.snackBar("Something went wrong");
        } else {
          _hideProgress();
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
        AppUtil.snackBar('Something went wrong');
      }
    } catch (error) {
      _hideProgress();
      AppUtil.snackBar('$error');
    }
  }

//megethomeworkmethod
  Future<void> getHomeWork() async {
    homeWorkProgress.value = true;
    try {
      var sectionIds = staffHomeWorkController.staffClassmodel!.data!
          .firstWhere(
            (item) => item.isClassTeacher == true,
          )
          .sectionId
          .toString();
      var classsId = staffHomeWorkController.dataItemId.toString();
      //dataavailable
//"${baseUrlName}Exam/GetAllAssignmentDetails?classid=203&sectionId=23&SubjectId=0"
      final response = await http.get(
          Uri.parse(
              "${baseUrlName}Exam/GetAllAssignmentDetails?classid=$classsId&sectionId=$sectionIds&SubjectId=0"
              // Uri.parse("${baseUrlName}Student/GetAllAssignmentDetails?classid=614"
              // "${staffHomeWorkController.staffClass!.dataListItemId}"
              // "&sectionid=${staffHomeWorkController.staffSection!.dataListItemId}"
              ),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          });
      log("${baseUrlName}Exam/GetAllAssignmentDetails?classid=$classsId&sectionId=$sectionIds&SubjectId=0");
      if (response.statusCode == 200) {
        log(response.body);
        var homeWorkResponse = getHomeWorkModalClassFromJson(response.body);
        // AppUtil.snackBar(homeWorkResponse.msg.toString());
        if (homeWorkResponse.responseCode == "200" &&
            homeWorkResponse.data!.isNotEmpty) {
          getHomeworkDataList.clear();
          getHomeworkDataList.addAll(homeWorkResponse.data!);
          isHomeWorkDataFound.value = true;
          homeWorkProgress.value = false;
        } else if (homeWorkResponse.responseCode == "500") {
          homeWorkProgress.value = false;
          isHomeWorkDataFound.value = false;
          AppUtil.snackBar("Something went wrong");
        } else {
          homeWorkProgress.value = false;
          isHomeWorkDataFound.value = false;
        }
      } else if (response.statusCode == 401) {
        isHomeWorkDataFound.value = false;
        homeWorkProgress.value = false;
        AppUtil.showAlertDialog(onPressed: () {
          Get.back();
          box.remove('accessToken');
          box.remove('isUserLogin');
          box.remove('userRole');
          Get.offAll(() => const LoginPage());
        });
      } else {
        homeWorkProgress.value = false;
        isHomeWorkDataFound.value = false;
        AppUtil.snackBar('Something went wrong');
      }
    } catch (error) {
      isHomeWorkDataFound.value = false;
      homeWorkProgress.value = false;
      AppUtil.snackBar('$error');
    }
    update();
  }
}
