import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iroots/common/app_data.dart';
import 'package:iroots/src/controller/attendance/staff/staff_attendance_controller.dart';
import 'package:iroots/src/controller/dashboard/dashBoard_controller.dart';
import 'package:iroots/src/controller/home/staff/staff_home_controller.dart';
import 'package:iroots/src/modal/home/staff/staffDetails.dart';
import 'package:iroots/src/ui/dashboard/attendance/staff/update_staff_attendence.dart';
import 'package:iroots/src/ui/dashboard/attendance/staff/view_attendence.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';

//mestudentAttendancereal
class StaffAttendanceScreen extends StatefulWidget {
  final bool? fromAdmin;
  final StaffDetail? staffDetail;

  const StaffAttendanceScreen({
    super.key,
    this.fromAdmin,
    this.staffDetail,
  });

  @override
  State<StaffAttendanceScreen> createState() => _StaffAttendanceScreenState();
}

class _StaffAttendanceScreenState extends State<StaffAttendanceScreen> {
  final DateTime _selectedDate = DateTime.now();
  final GetStorage box = Get.put(GetStorage());
  final staffHomeWorkController = Get.put(StaffHomeController());

  String? accessToken;

  @override
  void initState() {
    accessToken = box.read("accessToken");
    // TODO: implement initState
    // fetchStaffDetails();
    super.initState();
  }

  //   Future<void> fetchStaffDetails() async {
  //   _showProgress();

  //   Map<String, String>? credentials = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $accessToken',
  //   };

  //   try {
  //     final response = await http.get(
  //         Uri.parse("${baseUrlName}UserCredentials/GetStaffDetails"),
  //         headers: credentials);

  //     if (response.statusCode == 200) {
  //       var loginResponse = staffDetailsModalFromMap(response.body);
  //       if (loginResponse.responseCode.toString() == "200") {
  //         if (loginResponse.data!.isNotEmpty) {
  //           if (loginResponse.data!.isNotEmpty) {
  //             staffDetail.value = loginResponse.data![0];
  //           }
  //         }
  //         _hideProgress();
  //       } else if (loginResponse.responseCode == "500") {
  //         AppUtil.snackBar("Something went wrong");
  //         _hideProgress();
  //       } else {
  //         // AppUtil.snackBar(loginResponse.msg!);
  //         _hideProgress();
  //       }
  //     } else if (response.statusCode == 401) {
  //       _hideProgress();
  //       AppUtil.showAlertDialog(onPressed: () {
  //         Get.back();
  //         box.remove('accessToken');
  //         box.remove('isUserLogin');
  //         box.remove('userRole');
  //         Get.offAll(() => const LoginPage());
  //       });
  //     } else {
  //       AppUtil.snackBar('Something went wrong');
  //       _hideProgress();
  //     }
  //   } catch (error) {
  //     AppUtil.snackBar('$error');
  //     _hideProgress();
  //   }
  // }
  //   final AdminCoScholasticController con =
  // Future<void> _refresh() async {
  //   await Future.delayed(
  //       const Duration(seconds: 2)); // Simulating network request
  //   DashBoardController();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: StaffAttendanceController(),
      // initState: ,
      builder: (logic) => Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: ConstClass.dashBoardColor,
              title: AppUtil.customText(
                text: "Student Attendance",
                style: const TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 16),
              ),
              actions: [
                // InkWell(
                //   child: Icon(Icons.refresh),
                //   onTap: () {
                //     _refresh();
                //   },
                // ),
              ]),
          body: SingleChildScrollView(
            child: Container(
              color: const Color(0xffF1F5F9),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDropDown(
                      "Select Staff",
                      //  ""
                      logic.staffHomeWorkController.staffDetail == null
                          ? ""
                          : logic.staffHomeWorkController.staffDetail.value
                                  .name ??
                              "",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customDropDown(
                        "Select Class",
                        // "X33"
                        logic.staffHomeWorkController.dataItemName == ""
                            ? ""
                            : logic.staffHomeWorkController.dataItemName
                                .toString()

                        // logic.staffHomeWorkController.staffDetail == null
                        //   ? ""
                        //   : logic.staffHomeWorkController.staffDetail.value
                        //           .gender ??
                        //       "",
                        ),
                    const SizedBox(
                      height: 10,
                    ),

                    customDropDown(
                      "Select Section",
                      logic.staffHomeWorkController.isclassteacherany == false
                          ? ""
                          : logic.staffHomeWorkController.staffClassmodel?.data
                                      ?.isNotEmpty ??
                                  false
                              ? logic.staffHomeWorkController.staffClassmodel!
                                      .data!
                                      .firstWhere(
                                        (item) => item.isClassTeacher == true,
                                        // Replace `Data()` with an appropriate default object
                                      )
                                      .section ??
                                  ""
                              : "",
                    ),
//                     customDropDown(
//                       "Select Section",

//                       logic.staffHomeWorkController.staffClassmodel == null
//                           ? ""
//                           : logic.staffHomeWorkController.staffClassmodel!
//                                       .data ==
//                                   null
//                               ? ""
//                               :
//                             logic.staffHomeWorkController.staffClassmodel!
//                                       .data!.firstWhere(
//   (item) => item.isClassTeacher == true,
//   orElse: () => "",
// )?.section ?? ""

//                               // logic.staffHomeWorkController.staffClassmodel!
//                               //             .data![0].isClassTeacher ==
//                               //         true
//                               //     ? logic.staffHomeWorkController
//                               //         .staffClassmodel!.data![0].section
//                               //     : ""
//                                   ,

//                       // logic.staffHomeWorkController.staffSectionModel == null
//                       //     ? ""
//                       //     : logic.staffHomeWorkController.staffSectionModel!
//                       //         .data![0].dataListItemName
//                       //         .toString()
//                       // logic.staffHomeWorkController.staffSection
//                       //         ?.dataListItemName ??
//                       // ""
//                     ),

                    const SizedBox(
                      height: 10,
                    ),
                    AppUtil.customText(
                      text: "Select Date",
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
                                text: logic.formatDate(),
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
                      logic.pickDateDialog(context);
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
                            if (logic.staffHomeWorkController
                                    .isclassteacherany ==
                                false) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Don't have the permission for mark attendance");
                            } else {
                              logic.showStudentAttendance(
                                logic.staffHomeWorkController.dataItemId
                                    .toString(),
                                // "614"

                                // logic.staffHomeWorkController.staffClassmodel
                                //             ?.data?.isNotEmpty ??
                                //         false
                                //     ? logic.staffHomeWorkController
                                //                 .staffSectionModel ==
                                //             null
                                //         ? ""
                                //         : logic
                                //             .staffHomeWorkController
                                //             .staffSectionModel!
                                //             .data![0]
                                //             .dataListItemId
                                //             .toString()
                                //     : "",
                                logic.staffHomeWorkController.staffClassmodel!
                                        .data!
                                        .firstWhere(
                                          (item) => item.isClassTeacher == true,
                                          // Replace `Data()` with an appropriate default object
                                        )
                                        .sectionId
                                        .toString() ??
                                    "",
                                // logic.staffHomeWorkController
                                //             .staffSectionModel ==
                                //         null
                                //     ? ""
                                //     : logic
                                //         .staffHomeWorkController
                                //         .staffSectionModel!
                                //         .data![0]
                                //         .dataListItemId
                                //         .toString()
                              );
                            }
                          }),
                        );
                      }
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      if (logic.isFirstTime.value) {
                        return const SizedBox();
                      } else if (logic.isDataFound.value) {
                        // return ConstrainedBox(
                        //   constraints: const BoxConstraints(maxHeight: 255),
                        //   child: Scrollbar(
                        //     controller: logic.verticalScrollController,
                        //     thickness: 8,
                        //     radius: const Radius.circular(8),
                        //     interactive: true,
                        //     thumbVisibility: true,
                        //     child: SingleChildScrollView(
                        //       controller: logic.verticalScrollController,
                        //       scrollDirection: Axis.vertical,
                        //       child: Scrollbar(
                        //         controller: logic.horizontalScrollController,
                        //         thickness: 8,
                        //         radius: const Radius.circular(8),
                        //         interactive: true,
                        //         thumbVisibility: true,
                        //         child: SingleChildScrollView(
                        //           controller: logic.horizontalScrollController,
                        //           scrollDirection: Axis.horizontal,
                        //           child: Scrollable(
                        //             viewportBuilder: (BuildContext context,
                        //                 ViewportOffset position) {
                        //               return DataTable(
                        //                 border: TableBorder.all(),
                        //                 columns: List<DataColumn>.generate(
                        //                   8,
                        //                   (index) => DataColumn(
                        //                       label: index == 3
                        //                           ? IconButton(
                        //                               onPressed: () {
                        //                                 logic
                        //                                     .markAllFullAttendance();
                        //                               },
                        //                               icon: logic.fullAttendance !=
                        //                                           null &&
                        //                                       logic.fullAttendance!
                        //                                               .markFullDayAbsent ==
                        //                                           "True"
                        //                                   ? const Icon(
                        //                                       Icons.check_box)
                        //                                   : const Icon(Icons
                        //                                       .check_box_outline_blank),
                        //                               color:
                        //                                   ConstClass.themeColor,
                        //                             )
                        //                           : index == 5
                        //                               ? IconButton(
                        //                                   onPressed: () {
                        //                                     logic
                        //                                         .markAllHalfAttendance();
                        //                                   },
                        //                                   icon: logic.halfAttendance !=
                        //                                               null &&
                        //                                           logic.halfAttendance!
                        //                                                   .markHalfDayAbsent ==
                        //                                               "True"
                        //                                       ? const Icon(Icons
                        //                                           .check_box)
                        //                                       : const Icon(Icons
                        //                                           .check_box_outline_blank),
                        //                                   color: ConstClass
                        //                                       .themeColor,
                        //                                 )
                        //                               : index == 7
                        //                                   ? IconButton(
                        //                                       onPressed: () {
                        //                                         logic
                        //                                             .markAllOthersAttendance();
                        //                                       },
                        //                                       icon: logic.othersAttendance !=
                        //                                                   null &&
                        //                                               logic.othersAttendance!
                        //                                                       .others ==
                        //                                                   "True"
                        //                                           ? const Icon(Icons
                        //                                               .check_box)
                        //                                           : const Icon(Icons
                        //                                               .check_box_outline_blank),
                        //                                       color: ConstClass
                        //                                           .themeColor,
                        //                                     )
                        //                                   : AppUtil.customText(
                        //                                       textAlign:
                        //                                           TextAlign
                        //                                               .center,
                        //                                       text:
                        //                                           getColumnName(
                        //                                               index),
                        //                                       style: const TextStyle(
                        //                                           color: Color(
                        //                                               0xff0F172A),
                        //                                           fontFamily:
                        //                                               'Open Sans',
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .w600,
                        //                                           fontSize: 12),
                        //                                     )),
                        //                 ),
                        //                 rows: logic.dummyList
                        //                     .asMap()
                        //                     .map((index, item) {
                        //                       return MapEntry(
                        //                           index,
                        //                           DataRow(
                        //                             cells: [
                        //                               datacell("${index + 1}"),
                        //                               datacell(
                        //                                   item.studentName),
                        //                               // datacell(logic
                        //                               //             .staffHomeWorkController
                        //                               //             .dataItemName ==
                        //                               //         ""
                        //                               //     ? ""
                        //                               //     : logic
                        //                               //         .staffHomeWorkController
                        //                               //         .dataItemName
                        //                               //        .toString()),
                        //                               // datacell(
                        //                               //   logic
                        //                               //           .staffHomeWorkController
                        //                               //           .staffClassmodel!
                        //                               //           .data!
                        //                               //           .firstWhere(
                        //                               //             (item) =>
                        //                               //                 item.isClassTeacher ==
                        //                               //                 true,
                        //                               //              // Replace `Data()` with an appropriate default object
                        //                               //           )
                        //                               //           .section
                        //                               //           .toString() ??
                        //                               //       "",
                        //                               // ),
                        //                               datacell("A"),
                        //                               DataCell(IconButton(
                        //                                 onPressed: () {
                        //                                   logic
                        //                                       .markFullAttendance(
                        //                                           item);
                        //                                 },
                        //                                 icon: item.markFullDayAbsent ==
                        //                                         "True"
                        //                                     ? const Icon(
                        //                                         Icons.check_box)
                        //                                     : const Icon(Icons
                        //                                         .check_box_outline_blank),
                        //                                 color: ConstClass
                        //                                     .themeColor,
                        //                               )),
                        //                               datacell("H"),
                        //                               DataCell(IconButton(
                        //                                 onPressed: () {
                        //                                   logic
                        //                                       .markHalfAttendance(
                        //                                           item);
                        //                                 },
                        //                                 icon: item.markHalfDayAbsent ==
                        //                                         "True"
                        //                                     ? const Icon(
                        //                                         Icons.check_box)
                        //                                     : const Icon(Icons
                        //                                         .check_box_outline_blank),
                        //                                 color: ConstClass
                        //                                     .themeColor,
                        //                               )),
                        //                               datacell("O"),
                        //                               DataCell(IconButton(
                        //                                 onPressed: () {
                        //                                   logic
                        //                                       .markOtherAttendance(
                        //                                           item);
                        //                                 },
                        //                                 icon: item.others ==
                        //                                         "True"
                        //                                     ? const Icon(
                        //                                         Icons.check_box)
                        //                                     : const Icon(Icons
                        //                                         .check_box_outline_blank),
                        //                                 color: ConstClass
                        //                                     .themeColor,
                        //                               )),
                        //                             ],
                        //                           ));
                        //                     })
                        //                     .values
                        //                     .toList(),
                        //               );
                        //             },
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // );

                        // return ConstrainedBox(
                        //   constraints: const BoxConstraints(maxHeight: 255),
                        //   child: Scrollbar(
                        //     controller: logic.verticalScrollController,
                        //     thickness: 8,
                        //     radius: const Radius.circular(8),
                        //     interactive: true,
                        //     thumbVisibility: true,
                        //     child: SingleChildScrollView(
                        //       controller: logic.verticalScrollController,
                        //       scrollDirection: Axis.vertical,
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           // Fixed columns (S.No and Name)
                        //           Table(
                        //             border: TableBorder.all(),
                        //             columnWidths: const {
                        //               0: FixedColumnWidth(50), // S.No width
                        //               1: FixedColumnWidth(150), // Name width
                        //             },
                        //             children: [
                        //               // Header row
                        //               TableRow(
                        //                 decoration: BoxDecoration(
                        //                   color: Colors.grey[200],
                        //                 ),
                        //                 children: [
                        //                   TableCell(
                        //                     child: Padding(
                        //                       padding:
                        //                           const EdgeInsets.all(8.0),
                        //                       child: AppUtil.customText(
                        //                         textAlign: TextAlign.center,
                        //                         text: 'S.No',
                        //                         style: const TextStyle(
                        //                           color: Color(0xff0F172A),
                        //                           fontFamily: 'Open Sans',
                        //                           fontWeight: FontWeight.w600,
                        //                           fontSize: 12,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   TableCell(
                        //                     child: Padding(
                        //                       padding:
                        //                           const EdgeInsets.all(8.0),
                        //                       child: AppUtil.customText(
                        //                         textAlign: TextAlign.center,
                        //                         text: 'Name',
                        //                         style: const TextStyle(
                        //                           color: Color(0xff0F172A),
                        //                           fontFamily: 'Open Sans',
                        //                           fontWeight: FontWeight.w600,
                        //                           fontSize: 12,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               // Data rows
                        //               ...logic.dummyList
                        //                   .asMap()
                        //                   .entries
                        //                   .map((entry) {
                        //                 int index = entry.key;
                        //                 var item = entry.value;
                        //                 return TableRow(
                        //                   children: [
                        //                     TableCell(
                        //                       child: Padding(
                        //                         padding:
                        //                             const EdgeInsets.all(8.0),
                        //                         child: Text(
                        //                           "${index + 1}",
                        //                           textAlign: TextAlign.center,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     TableCell(
                        //                       child: Padding(
                        //                         padding:
                        //                             const EdgeInsets.all(8.0),
                        //                         child: Text(
                        //                           item.studentName.toString(),
                        //                           textAlign: TextAlign.left,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 );
                        //               }),
                        //             ],
                        //           ),
                        //           // Scrollable columns (attendance marking)
                        //           Expanded(
                        //             child: Scrollbar(
                        //               controller:
                        //                   logic.horizontalScrollController,
                        //               thickness: 8,
                        //               radius: const Radius.circular(8),
                        //               interactive: true,
                        //               thumbVisibility: true,
                        //               child: SingleChildScrollView(
                        //                 controller:
                        //                     logic.horizontalScrollController,
                        //                 scrollDirection: Axis.horizontal,
                        //                 child: Table(
                        //                   border: TableBorder.all(),
                        //                   columnWidths: const {
                        //                     0: FixedColumnWidth(40), // A column
                        //                     1: FixedColumnWidth(
                        //                         40), // Full attendance checkbox
                        //                     2: FixedColumnWidth(40), // H column
                        //                     3: FixedColumnWidth(
                        //                         40), // Half attendance checkbox
                        //                     4: FixedColumnWidth(40), // O column
                        //                     5: FixedColumnWidth(
                        //                         40), // Other attendance checkbox
                        //                   },
                        //                   children: [
                        //                     // Header row
                        //                     TableRow(
                        //                       decoration: BoxDecoration(
                        //                         color: Colors.grey[200],
                        //                       ),
                        //                       children: [
                        //                         TableCell(
                        //                           child: Padding(
                        //                             padding:
                        //                                 const EdgeInsets.all(
                        //                                     8.0),
                        //                             child: AppUtil.customText(
                        //                               textAlign:
                        //                                   TextAlign.center,
                        //                               text: 'A',
                        //                               style: const TextStyle(
                        //                                 color:
                        //                                     Color(0xff0F172A),
                        //                                 fontFamily: 'Open Sans',
                        //                                 fontWeight:
                        //                                     FontWeight.w600,
                        //                                 fontSize: 12,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                         TableCell(
                        //                           child: IconButton(
                        //                             padding: EdgeInsets.zero,
                        //                             onPressed: () {
                        //                               logic
                        //                                   .markAllFullAttendance();
                        //                             },
                        //                             icon: logic.fullAttendance !=
                        //                                         null &&
                        //                                     logic.fullAttendance!
                        //                                             .markFullDayAbsent ==
                        //                                         "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           ),
                        //                         ),
                        //                         TableCell(
                        //                           child: Padding(
                        //                             padding:
                        //                                 const EdgeInsets.all(
                        //                                     8.0),
                        //                             child: AppUtil.customText(
                        //                               textAlign:
                        //                                   TextAlign.center,
                        //                               text: 'H',
                        //                               style: const TextStyle(
                        //                                 color:
                        //                                     Color(0xff0F172A),
                        //                                 fontFamily: 'Open Sans',
                        //                                 fontWeight:
                        //                                     FontWeight.w600,
                        //                                 fontSize: 12,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                         TableCell(
                        //                           child: IconButton(
                        //                             padding: EdgeInsets.zero,
                        //                             onPressed: () {
                        //                               logic
                        //                                   .markAllHalfAttendance();
                        //                             },
                        //                             icon: logic.halfAttendance !=
                        //                                         null &&
                        //                                     logic.halfAttendance!
                        //                                             .markHalfDayAbsent ==
                        //                                         "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           ),
                        //                         ),
                        //                         TableCell(
                        //                           child: Padding(
                        //                             padding:
                        //                                 const EdgeInsets.all(
                        //                                     8.0),
                        //                             child: AppUtil.customText(
                        //                               textAlign:
                        //                                   TextAlign.center,
                        //                               text: 'O',
                        //                               style: const TextStyle(
                        //                                 color:
                        //                                     Color(0xff0F172A),
                        //                                 fontFamily: 'Open Sans',
                        //                                 fontWeight:
                        //                                     FontWeight.w600,
                        //                                 fontSize: 12,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                         TableCell(
                        //                           child: IconButton(
                        //                             padding: EdgeInsets.zero,
                        //                             onPressed: () {
                        //                               logic
                        //                                   .markAllOthersAttendance();
                        //                             },
                        //                             icon: logic.othersAttendance !=
                        //                                         null &&
                        //                                     logic.othersAttendance!
                        //                                             .others ==
                        //                                         "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                     // Data rows
                        //                     ...logic.dummyList
                        //                         .asMap()
                        //                         .entries
                        //                         .map((entry) {
                        //                       var item = entry.value;
                        //                       return TableRow(
                        //                         children: [
                        //                           TableCell(
                        //                             child: Padding(
                        //                               padding:
                        //                                   const EdgeInsets.all(
                        //                                       8.0),
                        //                               child: Text(
                        //                                 "A",
                        //                                 textAlign:
                        //                                     TextAlign.center,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           TableCell(
                        //                             child: IconButton(
                        //                               padding: EdgeInsets.zero,
                        //                               onPressed: () {
                        //                                 logic
                        //                                     .markFullAttendance(
                        //                                         item);
                        //                               },
                        //                               icon: item.markFullDayAbsent ==
                        //                                       "True"
                        //                                   ? const Icon(
                        //                                       Icons.check_box)
                        //                                   : const Icon(Icons
                        //                                       .check_box_outline_blank),
                        //                               color:
                        //                                   ConstClass.themeColor,
                        //                             ),
                        //                           ),
                        //                           TableCell(
                        //                             child: Padding(
                        //                               padding:
                        //                                   const EdgeInsets.all(
                        //                                       8.0),
                        //                               child: Text(
                        //                                 "H",
                        //                                 textAlign:
                        //                                     TextAlign.center,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           TableCell(
                        //                             child: IconButton(
                        //                               padding: EdgeInsets.zero,
                        //                               onPressed: () {
                        //                                 logic
                        //                                     .markHalfAttendance(
                        //                                         item);
                        //                               },
                        //                               icon: item.markHalfDayAbsent ==
                        //                                       "True"
                        //                                   ? const Icon(
                        //                                       Icons.check_box)
                        //                                   : const Icon(Icons
                        //                                       .check_box_outline_blank),
                        //                               color:
                        //                                   ConstClass.themeColor,
                        //                             ),
                        //                           ),
                        //                           TableCell(
                        //                             child: Padding(
                        //                               padding:
                        //                                   const EdgeInsets.all(
                        //                                       8.0),
                        //                               child: Text(
                        //                                 "O",
                        //                                 textAlign:
                        //                                     TextAlign.center,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           TableCell(
                        //                             child: IconButton(
                        //                               padding: EdgeInsets.zero,
                        //                               onPressed: () {
                        //                                 logic
                        //                                     .markOtherAttendance(
                        //                                         item);
                        //                               },
                        //                               icon: item.others ==
                        //                                       "True"
                        //                                   ? const Icon(
                        //                                       Icons.check_box)
                        //                                   : const Icon(Icons
                        //                                       .check_box_outline_blank),
                        //                               color:
                        //                                   ConstClass.themeColor,
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       );
                        //                     }),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );

                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 255),
                          child: Scrollbar(
                            controller: logic.verticalScrollController,
                            thickness: 8,
                            radius: const Radius.circular(8),
                            interactive: true,
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              controller: logic.verticalScrollController,
                              scrollDirection: Axis.vertical,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Fixed columns (S.No and Name)
                                  Table(
                                    border: TableBorder.all(),
                                    columnWidths: const {
                                      0: FixedColumnWidth(50), // S.No width
                                      1: FixedColumnWidth(150), // Name width
                                    },
                                    children: [
                                      // Header row
                                      TableRow(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                        ),
                                        children: [
                                          TableCell(
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(9.0),
                                                child: AppUtil.customText(
                                                  textAlign: TextAlign.center,
                                                  text: getColumnName(0),
                                                  style: const TextStyle(
                                                    color: Color(0xff0F172A),
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: AppUtil.customText(
                                                textAlign: TextAlign.center,
                                                text: getColumnName(1),
                                                style: const TextStyle(
                                                  color: Color(0xff0F172A),
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Data rows
                                      ...logic.dummyList
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int index = entry.key;
                                        var item = entry.value;
                                        return TableRow(
                                          children: [
                                            TableCell(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(14.0),
                                                child: Text(
                                                  "${index + 1}",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(14.0),
                                                child: Text(
                                                  item.studentName.toString(),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ],
                                  ),
                                  // Scrollable columns (attendance marking)
                                  Expanded(
                                    child: Scrollbar(
                                      controller:
                                          logic.horizontalScrollController,
                                      thickness: 6,
                                      radius: const Radius.circular(8),
                                      interactive: true,
                                      thumbVisibility: true,
                                      child: SingleChildScrollView(
                                        controller:
                                            logic.horizontalScrollController,
                                        scrollDirection: Axis.horizontal,
                                        child: Table(
                                          border: TableBorder.all(),
                                          defaultColumnWidth:
                                              const FixedColumnWidth(100),
                                          children: [
                                            // Header row
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                              ),
                                              children: [
                                                // Column 2 (starting with index 2)
                                                TableCell(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0.0,
                                                            right: 0),
                                                    child: AppUtil.customText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: getColumnName(2),
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff0F172A),
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Column 3 (A)
                                                TableCell(
                                                  child: AppUtil.customText(
                                                    textAlign: TextAlign.center,
                                                    text: getColumnName(3),
                                                    style: const TextStyle(
                                                      color: Color(0xff0F172A),
                                                      fontFamily: 'Open Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                // Column 4 (Full attendance checkbox)
                                                TableCell(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      logic
                                                          .markAllFullAttendance();
                                                    },
                                                    icon: logic.fullAttendance !=
                                                                null &&
                                                            logic.fullAttendance!
                                                                    .markFullDayAbsent ==
                                                                "True"
                                                        ? const Icon(
                                                            Icons.check_box)
                                                        : const Icon(Icons
                                                            .check_box_outline_blank),
                                                    color:
                                                        ConstClass.themeColor,
                                                  ),
                                                ),
                                                // Column 5 (H)
                                                TableCell(
                                                  child: AppUtil.customText(
                                                    textAlign: TextAlign.center,
                                                    text: getColumnName(5),
                                                    style: const TextStyle(
                                                      color: Color(0xff0F172A),
                                                      fontFamily: 'Open Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                // Column 6 (Half attendance checkbox)
                                                TableCell(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      logic
                                                          .markAllHalfAttendance();
                                                    },
                                                    icon: logic.halfAttendance !=
                                                                null &&
                                                            logic.halfAttendance!
                                                                    .markHalfDayAbsent ==
                                                                "True"
                                                        ? const Icon(
                                                            Icons.check_box)
                                                        : const Icon(Icons
                                                            .check_box_outline_blank),
                                                    color:
                                                        ConstClass.themeColor,
                                                  ),
                                                ),
                                                // Column 7 (O)
                                                TableCell(
                                                  child: AppUtil.customText(
                                                    textAlign: TextAlign.center,
                                                    text: getColumnName(7),
                                                    style: const TextStyle(
                                                      color: Color(0xff0F172A),
                                                      fontFamily: 'Open Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                // Column 8 (Others checkbox)
                                                TableCell(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      logic
                                                          .markAllOthersAttendance();
                                                    },
                                                    icon: logic.othersAttendance !=
                                                                null &&
                                                            logic.othersAttendance!
                                                                    .others ==
                                                                "True"
                                                        ? const Icon(
                                                            Icons.check_box)
                                                        : const Icon(Icons
                                                            .check_box_outline_blank),
                                                    color:
                                                        ConstClass.themeColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Data rows
                                            ...logic.dummyList
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              int index = entry.key;
                                              var item = entry.value;
                                              return TableRow(
                                                children: [
                                                  // Column 2
                                                  TableCell(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "A",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  // Column 3
                                                  TableCell(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "A", // Original value as in your code
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  // Column 4 (Full attendance checkbox)
                                                  TableCell(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        logic
                                                            .markFullAttendance(
                                                                item);
                                                      },
                                                      icon: item.markFullDayAbsent ==
                                                              "True"
                                                          ? const Icon(
                                                              Icons.check_box)
                                                          : const Icon(Icons
                                                              .check_box_outline_blank),
                                                      color:
                                                          ConstClass.themeColor,
                                                    ),
                                                  ),
                                                  // Column 5
                                                  TableCell(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "H",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  // Column 6 (Half attendance checkbox)
                                                  TableCell(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        logic
                                                            .markHalfAttendance(
                                                                item);
                                                      },
                                                      icon: item.markHalfDayAbsent ==
                                                              "True"
                                                          ? const Icon(
                                                              Icons.check_box)
                                                          : const Icon(Icons
                                                              .check_box_outline_blank),
                                                      color:
                                                          ConstClass.themeColor,
                                                    ),
                                                  ),
                                                  // Column 7
                                                  TableCell(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "O",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  // Column 8 (Others checkbox)
                                                  TableCell(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        logic
                                                            .markOtherAttendance(
                                                                item);
                                                      },
                                                      icon: item.others ==
                                                              "True"
                                                          ? const Icon(
                                                              Icons.check_box)
                                                          : const Icon(Icons
                                                              .check_box_outline_blank),
                                                      color:
                                                          ConstClass.themeColor,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        // return SingleChildScrollView(
                        //   child: SizedBox(
                        //     height: 500,
                        //     width: 500,
                        //     child: Stack(
                        //       children: [
                        //         // Fixed S.No and Student Name Column
                        //         Positioned(
                        //           left: 0,
                        //           top: 0,
                        //           bottom: 0,
                        //           child: Container(
                        //             width: 120, // Adjust the width as needed
                        //             color: Colors
                        //                 .white, // Ensure the background is visible
                        //             child: Column(
                        //               children: [
                        //                 DataTable(
                        //                   border: TableBorder.all(),
                        //                   columns: [
                        //                     DataColumn(
                        //                       label: AppUtil.customText(
                        //                         textAlign: TextAlign.center,
                        //                         text: "S.No",
                        //                         style: const TextStyle(
                        //                           color: Color(0xff0F172A),
                        //                           fontFamily: 'Open Sans',
                        //                           fontWeight: FontWeight.w600,
                        //                           fontSize: 12,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     DataColumn(
                        //                       label: AppUtil.customText(
                        //                         textAlign: TextAlign.center,
                        //                         text: "Student",
                        //                         style: const TextStyle(
                        //                           color: Color(0xff0F172A),
                        //                           fontFamily: 'Open Sans',
                        //                           fontWeight: FontWeight.w600,
                        //                           fontSize: 12,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                   rows: logic.dummyList
                        //                       .asMap()
                        //                       .map((index, item) {
                        //                         return MapEntry(
                        //                           index,
                        //                           DataRow(
                        //                             cells: [
                        //                               datacell("${index + 1}"),
                        //                               datacell(
                        //                                   item.studentName),
                        //                             ],
                        //                           ),
                        //                         );
                        //                       })
                        //                       .values
                        //                       .toList(),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //         // Scrollable DataTable (excluding first two columns)
                        //         Positioned(
                        //           left: 120, // Same width as fixed section
                        //           right: 0,
                        //           top: 0,
                        //           bottom: 0,
                        //           child: SingleChildScrollView(
                        //             scrollDirection: Axis.horizontal,
                        //             child: DataTable(
                        //               border: TableBorder.all(),
                        //               columns: List<DataColumn>.generate(
                        //                 6, // Rest of the columns
                        //                 (index) => DataColumn(
                        //                   label: index == 1
                        //                       ? IconButton(
                        //                           onPressed: () {
                        //                             logic
                        //                                 .markAllFullAttendance();
                        //                           },
                        //                           icon: logic.fullAttendance !=
                        //                                       null &&
                        //                                   logic.fullAttendance!
                        //                                           .markFullDayAbsent ==
                        //                                       "True"
                        //                               ? const Icon(
                        //                                   Icons.check_box)
                        //                               : const Icon(Icons
                        //                                   .check_box_outline_blank),
                        //                           color: ConstClass.themeColor,
                        //                         )
                        //                       : index == 3
                        //                           ? IconButton(
                        //                               onPressed: () {
                        //                                 logic
                        //                                     .markAllHalfAttendance();
                        //                               },
                        //                               icon: logic.halfAttendance !=
                        //                                           null &&
                        //                                       logic.halfAttendance!
                        //                                               .markHalfDayAbsent ==
                        //                                           "True"
                        //                                   ? const Icon(
                        //                                       Icons.check_box)
                        //                                   : const Icon(Icons
                        //                                       .check_box_outline_blank),
                        //                               color:
                        //                                   ConstClass.themeColor,
                        //                             )
                        //                           : index == 5
                        //                               ? IconButton(
                        //                                   onPressed: () {
                        //                                     logic
                        //                                         .markAllOthersAttendance();
                        //                                   },
                        //                                   icon: logic.othersAttendance !=
                        //                                               null &&
                        //                                           logic.othersAttendance!
                        //                                                   .others ==
                        //                                               "True"
                        //                                       ? const Icon(Icons
                        //                                           .check_box)
                        //                                       : const Icon(Icons
                        //                                           .check_box_outline_blank),
                        //                                   color: ConstClass
                        //                                       .themeColor,
                        //                                 )
                        //                               : AppUtil.customText(
                        //                                   textAlign:
                        //                                       TextAlign.center,
                        //                                   text: getColumnName(
                        //                                       index +
                        //                                           2), // Offset for column index
                        //                                   style:
                        //                                       const TextStyle(
                        //                                     color: Color(
                        //                                         0xff0F172A),
                        //                                     fontFamily:
                        //                                         'Open Sans',
                        //                                     fontWeight:
                        //                                         FontWeight.w600,
                        //                                     fontSize: 12,
                        //                                   ),
                        //                                 ),
                        //                 ),
                        //               ),
                        //               rows: logic.dummyList
                        //                   .asMap()
                        //                   .map((index, item) {
                        //                     return MapEntry(
                        //                       index,
                        //                       DataRow(
                        //                         cells: [
                        //                           datacell("A"),
                        //                           DataCell(IconButton(
                        //                             onPressed: () {
                        //                               logic.markFullAttendance(
                        //                                   item);
                        //                             },
                        //                             icon: item.markFullDayAbsent ==
                        //                                     "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           )),
                        //                           datacell("H"),
                        //                           DataCell(IconButton(
                        //                             onPressed: () {
                        //                               logic.markHalfAttendance(
                        //                                   item);
                        //                             },
                        //                             icon: item.markHalfDayAbsent ==
                        //                                     "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           )),
                        //                           datacell("O"),
                        //                           DataCell(IconButton(
                        //                             onPressed: () {
                        //                               logic.markOtherAttendance(
                        //                                   item);
                        //                             },
                        //                             icon: item.others == "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           )),
                        //                         ],
                        //                       ),
                        //                     );
                        //                   })
                        //                   .values
                        //                   .toList(),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );

                        // return Container(
                        //   height: 255, // Ensuring max height
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(8),
                        //     border: Border.all(color: Colors.grey.shade300),
                        //   ),
                        //   child: Stack(
                        //     children: [

                        //       // Scrollable section
                        //       Positioned.fill(
                        //         left: 120, // Same width as fixed section
                        //         child: SingleChildScrollView(
                        //           scrollDirection: Axis.horizontal,
                        //           child: SingleChildScrollView(
                        //             controller: logic.verticalScrollController,
                        //             scrollDirection: Axis.vertical,
                        //             child: DataTable(
                        //               border: TableBorder.all(),
                        //               columns: List<DataColumn>.generate(
                        //                 6, // Rest of the columns
                        //                 (index) => DataColumn(
                        //                   label: index == 1
                        //                       ? IconButton(
                        //                           onPressed: () {
                        //                             logic
                        //                                 .markAllFullAttendance();
                        //                           },
                        //                           icon: logic.fullAttendance !=
                        //                                       null &&
                        //                                   logic.fullAttendance!
                        //                                           .markFullDayAbsent ==
                        //                                       "True"
                        //                               ? const Icon(
                        //                                   Icons.check_box)
                        //                               : const Icon(Icons
                        //                                   .check_box_outline_blank),
                        //                           color: ConstClass.themeColor,
                        //                         )
                        //                       : index == 3
                        //                           ? IconButton(
                        //                               onPressed: () {
                        //                                 logic
                        //                                     .markAllHalfAttendance();
                        //                               },
                        //                               icon: logic.halfAttendance !=
                        //                                           null &&
                        //                                       logic.halfAttendance!
                        //                                               .markHalfDayAbsent ==
                        //                                           "True"
                        //                                   ? const Icon(
                        //                                       Icons.check_box)
                        //                                   : const Icon(Icons
                        //                                       .check_box_outline_blank),
                        //                               color:
                        //                                   ConstClass.themeColor,
                        //                             )
                        //                           : index == 5
                        //                               ? IconButton(
                        //                                   onPressed: () {
                        //                                     logic
                        //                                         .markAllOthersAttendance();
                        //                                   },
                        //                                   icon: logic.othersAttendance !=
                        //                                               null &&
                        //                                           logic.othersAttendance!
                        //                                                   .others ==
                        //                                               "True"
                        //                                       ? const Icon(Icons
                        //                                           .check_box)
                        //                                       : const Icon(Icons
                        //                                           .check_box_outline_blank),
                        //                                   color: ConstClass
                        //                                       .themeColor,
                        //                                 )
                        //                               : AppUtil.customText(
                        //                                   textAlign:
                        //                                       TextAlign.center,
                        //                                   text: getColumnName(
                        //                                       index +
                        //                                           2), // Offset for column index
                        //                                   style:
                        //                                       const TextStyle(
                        //                                     color: Color(
                        //                                         0xff0F172A),
                        //                                     fontFamily:
                        //                                         'Open Sans',
                        //                                     fontWeight:
                        //                                         FontWeight.w600,
                        //                                     fontSize: 12,
                        //                                   ),
                        //                                 ),
                        //                 ),
                        //               ),
                        //               rows: logic.dummyList
                        //                   .asMap()
                        //                   .map((index, item) {
                        //                     return MapEntry(
                        //                       index,
                        //                       DataRow(
                        //                         cells: [
                        //                           datacell("A"),
                        //                           DataCell(IconButton(
                        //                             onPressed: () {
                        //                               logic.markFullAttendance(
                        //                                   item);
                        //                             },
                        //                             icon: item.markFullDayAbsent ==
                        //                                     "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           )),
                        //                           datacell("H"),
                        //                           DataCell(IconButton(
                        //                             onPressed: () {
                        //                               logic.markHalfAttendance(
                        //                                   item);
                        //                             },
                        //                             icon: item.markHalfDayAbsent ==
                        //                                     "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           )),
                        //                           datacell("O"),
                        //                           DataCell(IconButton(
                        //                             onPressed: () {
                        //                               logic.markOtherAttendance(
                        //                                   item);
                        //                             },
                        //                             icon: item.others == "True"
                        //                                 ? const Icon(
                        //                                     Icons.check_box)
                        //                                 : const Icon(Icons
                        //                                     .check_box_outline_blank),
                        //                             color:
                        //                                 ConstClass.themeColor,
                        //                           )),
                        //                         ],
                        //                       ),
                        //                     );
                        //                   })
                        //                   .values
                        //                   .toList(),
                        //             ),
                        //           ),
                        //         ),
                        //       ),

                        //       // Fixed S.No and Student Name Column
                        //       Positioned(
                        //         left: 0,
                        //         top: 0,
                        //         bottom: 0,
                        //         child: Container(
                        //           width: 120, // Fixed width
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             border: Border(
                        //               right: BorderSide(
                        //                   color: Colors.grey.shade300),
                        //             ),
                        //           ),
                        //           child: SingleChildScrollView(
                        //             controller: logic
                        //                 .verticalScrollController, // Sync vertical scroll
                        //             scrollDirection: Axis.vertical,
                        //             child: DataTable(
                        //               border: TableBorder.all(),
                        //               columns: [
                        //                 DataColumn(
                        //                   label: AppUtil.customText(
                        //                     textAlign: TextAlign.center,
                        //                     text: "S.No",
                        //                     style: const TextStyle(
                        //                       color: Color(0xff0F172A),
                        //                       fontFamily: 'Open Sans',
                        //                       fontWeight: FontWeight.w600,
                        //                       fontSize: 12,
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 DataColumn(
                        //                   label: AppUtil.customText(
                        //                     textAlign: TextAlign.center,
                        //                     text: "Student Name",
                        //                     style: const TextStyle(
                        //                       color: Color(0xff0F172A),
                        //                       fontFamily: 'Open Sans',
                        //                       fontWeight: FontWeight.w600,
                        //                       fontSize: 12,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //               rows: logic.dummyList
                        //                   .asMap()
                        //                   .map((index, item) {
                        //                     return MapEntry(
                        //                       index,
                        //                       DataRow(
                        //                         cells: [
                        //                           datacell("${index + 1}"),
                        //                           datacell(item.studentName),
                        //                         ],
                        //                       ),
                        //                     );
                        //                   })
                        //                   .values
                        //                   .toList(),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      } else if (!logic.showProgress.value) {
                        return Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: AppUtil.noDataFound("No Data Found"),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                    Obx(() {
                      if (logic.isDataFound.value) {
                        return const SizedBox(
                          height: 24,
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
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
                                horizontal: 0, vertical: 10),
                            child: AppUtil.customText(
                              text: "Update Students Attendence",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ), () {
                        if (logic.staffHomeWorkController.isclassteacherany ==
                            false) {
                          Fluttertoast.showToast(
                              msg:
                                  "Don't have the permission for mark attendance");
                        } else {
                          Get.to(() => const UpdateStaffAttendanceScreen());
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: customOutlinedButton(
                          OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.5, color: ConstClass.themeColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: AppUtil.customText(
                              text: "View Students Attendance",
                              style: const TextStyle(
                                  color: Color(0xff1575FF),
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ), () {
                        if (logic.staffHomeWorkController.isclassteacherany ==
                            false) {
                          Fluttertoast.showToast(
                              msg:
                                  "Don't have the permission for mark attendance");
                        } else {
                          Get.to(() => const ViewAttendanceScreen());
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      if (!logic.isDataFound.value) {
                        return const SizedBox();
                      } else if (logic.saveAttenShowProgress.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/save_icon.svg",
                                      height: 16,
                                      width: 16,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    AppUtil.customText(
                                      text: "Save",
                                      style: const TextStyle(
                                          color: Color(0xff0DB166),
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ), () {
                            logic.saveAttendance();
                          }),
                        );
                      }
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  String getColumnName(int index) {
    switch (index) {
      case 0:
        return 'S.no';
      case 1:
        return 'Student Name';
      // case 2:
      //   return 'Class';
      // case 3:
      //   return 'Section';
      case 2:
        return 'Mark Full Day Present';
      case 3:
        return '';
      case 4:
        return 'Mark Half Day Present';
      case 5:
        return 'Mark Half Day Present';
      case 6:
        return 'Other';
      case 7:
        return 'Other';
      default:
        return '';
    }
  }

  // String getColumnName(int index) {
  //   switch (index) {
  //     case 0:
  //       return 'S.no';
  //     case 1:
  //       return 'Student Name';
  //     case 2:
  //       return 'Class';
  //     case 3:
  //       return 'Section';
  //     case 4:
  //       return 'Mark Full Day Present';
  //     case 5:
  //       return '';
  //     case 6:
  //       return 'Mark Half Day Present';
  //     case 7:
  //       return '';
  //     case 8:
  //       return 'Other';
  //     case 9:
  //       return '';
  //     default:
  //       return '';
  //   }
  // }

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
}
