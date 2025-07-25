// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:excel/excel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:iroots/bloc/bloclocalstorage/prefmanager.dart';
// import 'package:iroots/bloc/blocserver/serverhelper.dart';
// import 'package:iroots/common/app_data.dart';
// import 'package:iroots/src/controller/dashboard/dashBoard_controller.dart';
// import 'package:iroots/src/controller/home/staff/staff_home_controller.dart';
// import 'package:iroots/src/modal/attendance/showStudentAttendanceModalClass.dart';
// import 'package:iroots/src/modal/attendance/staffModalClass.dart';
// import 'package:iroots/src/modal/attendance/studentAttendanceModalClass.dart';
// import 'package:iroots/src/ui/auth/login_page.dart';
// import 'package:iroots/src/utility/const.dart';
// import 'package:iroots/src/utility/util.dart';
// import 'package:path_provider/path_provider.dart';

// //mestudentattendance
// class ViewAttendanceController extends GetxController {
//   final GetStorage box = Get.put(GetStorage());
//   final staffHomeWorkController = Get.put(StaffHomeController());

//   StaffData? selectedStudent;
//   List<StaffData> studentDataList = [];
//   RxBool showProgress = false.obs;
//   RxBool saveAttenShowProgress = false.obs;
//   RxBool isFirstTime = true.obs;
//   final ScrollController verticalScrollController = ScrollController();
//   final ScrollController horizontalScrollController = ScrollController();
//   // List<Map<String, dynamic>> batchList = [];
//   // int? selectedBatchId;
//   // bool isLoading = true;

//   var batchList = <Map<String, dynamic>>[].obs;
//   var selectedBatchId = Rxn<int>();
//   var isLoading = true.obs;
//   DateTime _selectedDate = DateTime.now();
//   Datum? studentData;
//   List<Datum?> studentListData = [];
//   List<Attendance?> attendance = [];
//   RxBool isAttandanceDataFound = false.obs;
//   String? selectedAssignmentDate =
//       DateFormat('dd/MM/yyyy').format(DateTime.now());
//   String? selectedSubmissionDate =
//       DateFormat('dd/MM/yyyy').format(DateTime.now());
//   List<String> allBetweenDates = [];

//   String? accessToken;

//   @override
//   void onInit() {
//     accessToken = box.read("accessToken");
//     _getStudents();
//     fetchBatchData();
//     super.onInit();
//   }

//   Future<void> fetchBatchData() async {
//     const String apiUrl = "${ServerHelper.baseUrl}Exam/GetBatchDropList";

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> parsedJson = json.decode(response.body);
//         batchList
//             .assignAll(List<Map<String, dynamic>>.from(parsedJson['data']));

//         if (batchList.isNotEmpty) {
//           selectedBatchId.value =
//               batchList.first['batchId']; // Default selection
//         }
//       } else {
//         throw Exception("Failed to load data");
//       }
//     } catch (error) {
//       print("Error fetching data: $error");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   String formatDate() {
//     return DateFormat('dd-MMM-yyyy').format(_selectedDate);
//   }

//   void pickDateDialog(BuildContext context, int index) {
//     showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     ).then((pickedDate) {
//       if (pickedDate == null) {
//         return;
//       }
//       _selectedDate = pickedDate;
//       if (index == 0) {
//         selectedAssignmentDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
//       } else {
//         selectedSubmissionDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
//       }
//       update();
//     });
//   }

//   Future<void> _getStudents() async {
//     try {
//       Map<String, String> credentials = {};
//       // Map<String, String> credentials = {
//       //   "classId":
//       //       staffHomeWorkController.staffClass!.dataListItemId.toString(),
//       //   "sectionId":
//       //       staffHomeWorkController.staffSection!.dataListItemId.toString(),
//       //   "toDate": ConstClass.currentDate,
//       // };

//       String jsonCredentials = jsonEncode(credentials);
//       final response = await http.post(
//         Uri.parse("${baseUrlName}Attendance/StudentAttendenceForCreation"),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $accessToken',
//         },
//         body: jsonCredentials,
//       );

//       if (response.statusCode == 200) {
//         var studentAttendance =
//             showStudentAttendanceModalClassFromJson(response.body);
//         if (studentAttendance.responseCode == "201" &&
//             studentAttendance.data!.isNotEmpty) {
//           studentDataList.clear();
//           studentDataList.add(StaffData(
//             staffName: 'All Students',
//             username: 'Dummy Username',
//             password: 'Dummy Password',
//             description: 'Dummy Description',
//             staffId: 0,
//           ));

//           for (var myData in studentAttendance.data!) {
//             studentDataList.add(StaffData(
//                 staffName: myData.name,
//                 username: myData.section,
//                 password: myData.parentEmail,
//                 description: myData.category,
//                 staffId: myData.studentId));
//           }
//         } else if (studentAttendance.responseCode == "500") {
//           // AppUtil.snackBar("Something went wrong");
//         } else {}
//       } else {
//         // AppUtil.snackBar('Something went wrong');
//       }
//     } catch (error) {
//       AppUtil.snackBar('$error');
//     }

//     update();
//   }

//   void showStudentAttendance() {
//     // if (selectedStudent == null) {
//     //   AppUtil.snackBar('Please select student');
//     //   return;
//     // }

//     DateTime assignmentDate =
//         DateFormat('dd/MM/yyyy').parse(selectedAssignmentDate!);
//     DateTime submissionDate =
//         DateFormat('dd/MM/yyyy').parse(selectedSubmissionDate!);

//     if (assignmentDate.isAfter(submissionDate)) {
//       AppUtil.snackBar('End date cannot be less than the start date');
//       return;
//     }
//     // else if (selectedAssignmentDate == selectedSubmissionDate) {
//     //   AppUtil.snackBar('Start date and end date must be different');
//     //   return;
//     // }

//     _showStudentAttandance();
//   }

//   void _showProgress() {
//     showProgress.value = true;
//   }

//   void _hideProgress() {
//     showProgress.value = false;
//   }

//   Future<void> _showStudentAttandance() async {
//     isFirstTime.value = false;
//     _showProgress();
//     String jsonString1 = await PrefManager.getAdditionalInfo();

//     String jsonstring2 = jsonString1;
//     List<dynamic> studentList = jsonDecode(jsonstring2);

//     num? batchId = studentList[0]["BatchId"];
//     allBetweenDates.clear();
//     allBetweenDates.addAll(getAllFormattedDatesBetween(
//         selectedAssignmentDate!, selectedSubmissionDate!));

//     try {
//       // Map<String, String> credentials = {};
//       Map<String, String> credentials = {
//         "batchId": selectedBatchId.value.toString(),
//         "classId":
//             // "614",
//             staffHomeWorkController.dataItemId.toString(),

//         "sectionId":
//             staffHomeWorkController.staffClassmodel?.data?.isNotEmpty ?? false
//                 ? staffHomeWorkController.staffClassmodel!.data!
//                         .firstWhere(
//                           (item) => item.isClassTeacher == true,
//                           // Replace `Data()` with an appropriate default object
//                         )
//                         .sectionId
//                         .toString() ??
//                     ""
//                 : "",
//         // staffHomeWorkController.staffSection!.dataListItemId.toString(),
//         'fromDate': selectedAssignmentDate!,
//         'toDate': selectedSubmissionDate!,
//         'studentId': "0"
//         // selectedStudent!.staffId.toString(),
//       };

//       /*Map<String, String> credentials = {
//         "classId": "414",
//         "sectionId": "421",
//         "fromDate": "15/06/2023",
//         "toDate": "05/07/2023",
//         "studentId": "1658"
//       };*/

//       String jsonCredentials = jsonEncode(credentials);

//       print("sgsgwgwgwg$jsonCredentials");

//       final response = await http.post(
//         Uri.parse("${baseUrlName}Attendance/ViewStudentAttendance"),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $accessToken',
//         },
//         body: jsonCredentials,
//       );
//       log("${baseUrlName}Attendance/ViewStudentAttendance");
//       print("sgsgwgwgwg${response.statusCode}");

//       if (response.statusCode == 200) {
//         studentListData.clear();
//         attendance.clear();

//         var studentAttendance = studentAttendanceFromJson(response.body);
//         if (studentAttendance.responseCode == "200" &&
//             studentAttendance.data.isNotEmpty) {
//           studentData = studentAttendance.data[0];
//           print("sdgfsgsgvgevsdf${studentData!.totalAttendedDays}");

//           studentListData.addAll(studentAttendance.data);
//           attendance.addAll(studentData!.attendance);
//           _hideProgress();
//           isAttandanceDataFound.value = true;
//         } else if (studentAttendance.responseCode == "500") {
//           _hideProgress();
//           isAttandanceDataFound.value = false;
//           AppUtil.snackBar("Something went wrong");
//         } else {
//           _hideProgress();
//           isAttandanceDataFound.value = false;
//         }
//       } else if (response.statusCode == 401) {
//         _hideProgress();
//         AppUtil.showAlertDialog(onPressed: () {
//           Get.back();
//           box.remove('accessToken');
//           box.remove('isUserLogin');
//           box.remove('userRole');
//           Get.offAll(() => const LoginPage());
//         });
//       } else {
//         _hideProgress();
//         isAttandanceDataFound.value = false;
//         AppUtil.snackBar('Something went wrong');
//       }
//     } catch (error) {
//       _hideProgress();
//       isAttandanceDataFound.value = false;
//       AppUtil.snackBar('$error');
//     }
//     update();
//   }

//   List<String> getAllFormattedDatesBetween(String startDate, String endDate) {
//     List<String> dates = [];
//     DateTime currentStartDate = DateFormat('dd/MM/yyyy').parse(startDate);
//     DateTime currentEndDate = DateFormat('dd/MM/yyyy').parse(endDate);

//     while (currentStartDate.isBefore(currentEndDate) ||
//         currentStartDate.isAtSameMomentAs(currentEndDate)) {
//       dates.add(DateFormat('dd/MM/yyyy').format(currentStartDate));
//       currentStartDate = currentStartDate.add(const Duration(days: 1));
//     }

//     return dates;
//   }

//   Future<void> exportData() async {
//     /* String formattedDateTime =
//         DateFormat('yyyyMMddTHHmmss').format(DateTime.now());

//     var excel = Excel.createExcel();

//     var sheet = excel['Sheet1'];

//     List<List<dynamic>> data = [
//       [
//         "S. no.",
//         "Student Name",
//         "Class",
//         "Section",
//         for (var date in allBetweenDates) date.split("/").first.trim(),
//         "Attendance %"
//       ],
//       for (var index = 0; index < studentListData.length; index++)
//         buildDataRow(index, studentListData[index]!),
//     ];

//     for (var row in data) {
//       print("sgehehehehe${row}");
//       sheet.appendRow(row);
//     }

//     final directory = await getApplicationDocumentsDirectory();

//     final folderPath = join(directory.path, 'Nirmala Convent S.S. School');
//     final folder = Directory(folderPath);
//     if (!await folder.exists()) {
//       await folder.create(recursive: true);
//     }
//     final filePath = join(folderPath,
//         '${staffHomeWorkController.staffClass!.dataListItemName}_${staffHomeWorkController.staffSection!.dataListItemName}_$formattedDateTime.xlsx');

//     List<int>? fileBytes = excel.save();

//     if (fileBytes != null) {
//       var file = File(filePath);
//       file.createSync(recursive: true);
//       //await file.writeAsBytes(excel.encode()!);
//       await file.writeAsBytes(fileBytes);
//     }

//     print('Excel file created successfully at: $filePath');*/

//     // Create a new Excel workbook
//     final Excel excel = Excel.createExcel();

//     // Create a sheet and add data
//     final Sheet sheet = excel['Sheet1'];
//     // sheet.appendRow(['Name', 'Age', 'Country']);
//     // sheet.appendRow(['John', 30, 'USA']);
//     // sheet.appendRow(['Alice', 25, 'Canada']);
//     // sheet.appendRow(['Bob', 35, 'UK']);

//     // Get the temporary directory
//     final Directory directory = await getTemporaryDirectory();
//     final String path = '${directory.path}/example.xlsx';

//     // Save the Excel file
//     excel.save(fileName: path);

//     print('Excel file exported to: $path');
//   }

//   List<dynamic> buildDataRow(int index, Datum logic) {
//     return [
//       index + 1,
//       logic.studentName,
//       logic.attendance[0]!.className,
//       logic.attendance[0]!.sectionName,
//       for (var date in allBetweenDates) date.split("/").first.trim(),
//       for (var attendance in logic.attendance)
//         attendance!.markFullDayAbsent != null ? 'Absent' : 'Present',
//       logic.attendancePer,
//     ];
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:iroots/bloc/bloclocalstorage/prefmanager.dart';
import 'package:iroots/bloc/blocserver/serverhelper.dart';
import 'package:iroots/common/app_data.dart';
import 'package:iroots/src/controller/dashboard/dashBoard_controller.dart';
import 'package:iroots/src/controller/home/staff/staff_home_controller.dart';
import 'package:iroots/src/modal/attendance/showStudentAttendanceModalClass.dart';
import 'package:iroots/src/modal/attendance/staffModalClass.dart';
import 'package:iroots/src/modal/attendance/studentAttendanceModalClass.dart';
import 'package:iroots/src/ui/auth/login_page.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';
import 'package:path_provider/path_provider.dart';

//mestudentattendance
class ViewAttendanceController extends GetxController {
  final GetStorage box = Get.put(GetStorage());
  final staffHomeWorkController = Get.put(StaffHomeController());

  StaffData? selectedStudent;
  List<StaffData> studentDataList = [];
  RxBool showProgress = false.obs;
  RxBool saveAttenShowProgress = false.obs;
  RxBool isFirstTime = true.obs;
  final ScrollController verticalScrollController = ScrollController();
  final ScrollController horizontalScrollController = ScrollController();

  var batchList = <Map<String, dynamic>>[].obs;
  var selectedBatchId = Rxn<int>();
  var isLoading = true.obs;

  // Interactive Dropdown Variables
  RxString selectedClass = ''.obs;
  RxString selectedSection = ''.obs;
  RxString selectedClassId = ''.obs;
  RxString selectedSectionId = ''.obs;
  RxList<Map<String, dynamic>> sectionList = <Map<String, dynamic>>[].obs;
  RxBool isSectionLoading = false.obs;

  DateTime _selectedDate = DateTime.now();
  Datum? studentData;
  List<Datum?> studentListData = [];
  List<Attendance?> attendance = [];
  RxBool isAttandanceDataFound = false.obs;
  String? selectedAssignmentDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now());
  String? selectedSubmissionDate =
      DateFormat('dd/MM/yyyy').format(DateTime.now());
  List<String> allBetweenDates = [];

  String? accessToken;

  @override
  void onInit() {
    accessToken = box.read("accessToken");
    _getStudents();
    fetchBatchData();
    _initializeDefaults();
    super.onInit();
  }

  void _initializeDefaults() {
    // Set default class based on available data
    if (staffHomeWorkController.dataItemName.isNotEmpty) {
      selectedClass.value = staffHomeWorkController.dataItemName;
      selectedClassId.value = staffHomeWorkController.dataItemId.toString();
    }

    // Set default section for class teachers
    if (staffHomeWorkController.isclassteacherany == true &&
        staffHomeWorkController.staffClassmodel?.data != null) {
      try {
        final classTeacherData = staffHomeWorkController.staffClassmodel!.data!
            .firstWhere((item) => item.isClassTeacher == true);

        selectedSection.value = classTeacherData.section ?? '';
        selectedSectionId.value = classTeacherData.sectionId.toString();
      } catch (e) {
        print('No class teacher data found');
      }
    }
  }

  // Method to fetch sections based on selected class
  Future<void> fetchSections(String staffId, String classId) async {
    if (staffId.isEmpty || classId.isEmpty) {
      print('Staff ID or Class ID is empty');
      return;
    }

    try {
      isSectionLoading.value = true;
      sectionList.clear();
      selectedSection.value = '';
      selectedSectionId.value = '';

      final sectionResponse =
          await staffHomeWorkController.getStaffSectionList(staffId, classId);

      if (sectionResponse != null &&
          sectionResponse.responseCode == "200" &&
          sectionResponse.data != null &&
          sectionResponse.data!.isNotEmpty) {
        // Create new objects with the same data to avoid type conflicts
        for (var item in sectionResponse.data!) {
          sectionList.add({
            'sectionId': item.sectionId,
            'sectionName': item.sectionName,
          });
        }

        // Auto-select first section if available
        if (sectionList.isNotEmpty) {
          selectedSection.value = sectionList.first['sectionName'] ?? '';
          selectedSectionId.value = sectionList.first['sectionId'].toString();
        }

        print('Sections loaded: ${sectionList.length}');
      } else {
        print('No sections found or API error');
        AppUtil.snackBar("No sections found for selected class");
      }
    } catch (e) {
      print('Error fetching sections: $e');
      AppUtil.snackBar("Error loading sections: $e");
    } finally {
      isSectionLoading.value = false;
    }
  }

  Future<void> fetchBatchData() async {
    const String apiUrl = "${ServerHelper.baseUrl}Exam/GetBatchDropList";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedJson = json.decode(response.body);
        batchList
            .assignAll(List<Map<String, dynamic>>.from(parsedJson['data']));

        if (batchList.isNotEmpty) {
          selectedBatchId.value =
              batchList.last['batchId']; // Default selection
        }
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      print("Error fetching data: $error");
    } finally {
      isLoading.value = false;
    }
  }

  String formatDate() {
    return DateFormat('dd-MMM-yyyy').format(_selectedDate);
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

  Future<void> _getStudents() async {
    try {
      Map<String, String> credentials = {};

      String jsonCredentials = jsonEncode(credentials);
      final response = await http.post(
        Uri.parse("${baseUrlName}Attendance/StudentAttendenceForCreation"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonCredentials,
      );

      if (response.statusCode == 200) {
        var studentAttendance =
            showStudentAttendanceModalClassFromJson(response.body);
        if (studentAttendance.responseCode == "201" &&
            studentAttendance.data!.isNotEmpty) {
          studentDataList.clear();
          studentDataList.add(StaffData(
            staffName: 'All Students',
            username: 'Dummy Username',
            password: 'Dummy Password',
            description: 'Dummy Description',
            staffId: 0,
          ));

          for (var myData in studentAttendance.data!) {
            studentDataList.add(StaffData(
                staffName: myData.name,
                username: myData.section,
                password: myData.parentEmail,
                description: myData.category,
                staffId: myData.studentId));
          }
        } else if (studentAttendance.responseCode == "500") {
          // AppUtil.snackBar("Something went wrong");
        } else {}
      } else {
        // AppUtil.snackBar('Something went wrong');
      }
    } catch (error) {
      AppUtil.snackBar('$error');
    }

    update();
  }

  void showStudentAttendance() {
    DateTime assignmentDate =
        DateFormat('dd/MM/yyyy').parse(selectedAssignmentDate!);
    DateTime submissionDate =
        DateFormat('dd/MM/yyyy').parse(selectedSubmissionDate!);

    if (assignmentDate.isAfter(submissionDate)) {
      AppUtil.snackBar('End date cannot be less than the start date');
      return;
    }

    _showStudentAttandance();
  }

  void _showProgress() {
    showProgress.value = true;
  }

  void _hideProgress() {
    showProgress.value = false;
  }

  Future<void> _showStudentAttandance() async {
    isFirstTime.value = false;
    _showProgress();
    String jsonString1 = await PrefManager.getAdditionalInfo();

    String jsonstring2 = jsonString1;
    List<dynamic> studentList = jsonDecode(jsonstring2);

    num? batchId = studentList[0]["BatchId"];
    allBetweenDates.clear();
    allBetweenDates.addAll(getAllFormattedDatesBetween(
        selectedAssignmentDate!, selectedSubmissionDate!));

    try {
      // Use selected values from dropdowns
      String classId = selectedClassId.value.isNotEmpty
          ? selectedClassId.value
          : staffHomeWorkController.dataItemId.toString();

      String sectionId = selectedSectionId.value.isNotEmpty
          ? selectedSectionId.value
          : (staffHomeWorkController.staffClassmodel?.data?.isNotEmpty ?? false
              ? staffHomeWorkController.staffClassmodel!.data!
                      .firstWhere(
                        (item) => item.isClassTeacher == true,
                      )
                      .sectionId
                      .toString() ??
                  ""
              : "");

      Map<String, String> credentials = {
        "batchId": selectedBatchId.value.toString(),
        "classId": classId,
        "sectionId": sectionId,
        'fromDate': selectedAssignmentDate!,
        'toDate': selectedSubmissionDate!,
        'studentId': "0"
      };

      String jsonCredentials = jsonEncode(credentials);
//nowworkinggggg
      print("Request payload: $jsonCredentials");

      final response = await http.post(
        Uri.parse("${baseUrlName}Attendance/ViewStudentAttendance"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonCredentials,
      );

      log("${baseUrlName}Attendance/ViewStudentAttendance");
      print("Response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        studentListData.clear();
        attendance.clear();

        var studentAttendance = studentAttendanceFromJson(response.body);
        if (studentAttendance.responseCode == "200" &&
            studentAttendance.data.isNotEmpty) {
          studentData = studentAttendance.data[0];
          print("Total attended days: ${studentData!.totalAttendedDays}");

          studentListData.addAll(studentAttendance.data);
          attendance.addAll(studentData!.attendance);
          _hideProgress();
          isAttandanceDataFound.value = true;
        } else if (studentAttendance.responseCode == "500") {
          _hideProgress();
          isAttandanceDataFound.value = false;
          AppUtil.snackBar("Something went wrong");
        } else {
          _hideProgress();
          isAttandanceDataFound.value = false;
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
        isAttandanceDataFound.value = false;
        AppUtil.snackBar('Something went wrong');
      }
    } catch (error) {
      _hideProgress();
      isAttandanceDataFound.value = false;
      AppUtil.snackBar('$error');
    }
    update();
  }

  List<String> getAllFormattedDatesBetween(String startDate, String endDate) {
    List<String> dates = [];
    DateTime currentStartDate = DateFormat('dd/MM/yyyy').parse(startDate);
    DateTime currentEndDate = DateFormat('dd/MM/yyyy').parse(endDate);

    while (currentStartDate.isBefore(currentEndDate) ||
        currentStartDate.isAtSameMomentAs(currentEndDate)) {
      dates.add(DateFormat('dd/MM/yyyy').format(currentStartDate));
      currentStartDate = currentStartDate.add(const Duration(days: 1));
    }

    return dates;
  }

  Future<void> exportData() async {
    // Create a new Excel workbook
    final Excel excel = Excel.createExcel();

    // Create a sheet and add data
    final Sheet sheet = excel['Sheet1'];

    // Get the temporary directory
    final Directory directory = await getTemporaryDirectory();
    final String path = '${directory.path}/example.xlsx';

    // Save the Excel file
    excel.save(fileName: path);

    print('Excel file exported to: $path');
  }

  List<dynamic> buildDataRow(int index, Datum logic) {
    return [
      index + 1,
      logic.studentName,
      logic.attendance[0]!.className,
      logic.attendance[0]!.sectionName,
      for (var date in allBetweenDates) date.split("/").first.trim(),
      for (var attendance in logic.attendance)
        attendance!.markFullDayAbsent != null ? 'Absent' : 'Present',
      logic.attendancePer,
    ];
  }
}
