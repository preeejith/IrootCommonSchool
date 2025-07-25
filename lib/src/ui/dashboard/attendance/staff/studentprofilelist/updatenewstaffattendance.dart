// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:iroots/src/controller/attendance/staff/staff_updateattendance.dart';
// import 'package:iroots/src/controller/home/staff/staff_home_controller.dart';
// import 'package:iroots/src/modal/home/staff/staffDetails.dart';
// import 'package:iroots/src/ui/dashboard/attendance/admin/admin_view_attendence.dart';
// import 'package:iroots/src/ui/dashboard/attendance/staff/update_staff_attendence.dart';

// import 'package:iroots/src/utility/const.dart';
// import 'package:iroots/src/utility/util.dart';

// //meupdatestudentAttendancereal
// class StaffUpdateAttendanceScreen extends StatefulWidget {
//   final bool? fromAdmin;
//   final StaffDetail? staffDetail;

//   const StaffUpdateAttendanceScreen({
//     super.key,
//     this.fromAdmin,
//     this.staffDetail,
//   });

//   @override
//   State<StaffUpdateAttendanceScreen> createState() =>
//       _StaffAttendanceScreenState();
// }

// class _StaffAttendanceScreenState extends State<StaffUpdateAttendanceScreen> {
//   final DateTime _selectedDate = DateTime.now();
//   final GetStorage box = Get.put(GetStorage());
//   final staffHomeWorkController = Get.put(StaffHomeController());

//   String? accessToken;

//   @override
//   void initState() {
//     accessToken = box.read("accessToken");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       init: StaffUpdateAttendanceController(),
//       builder: (logic) => Scaffold(
//           appBar: AppBar(
//               elevation: 0,
//               backgroundColor: ConstClass.dashBoardColor,
//               title: AppUtil.customText(
//                 text: "Update Student Attendance",
//                 style: const TextStyle(
//                     fontFamily: 'Open Sans',
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                     fontSize: 16),
//               ),
//               actions: []),
//           body: SingleChildScrollView(
//             child: Container(
//               color: const Color(0xffF1F5F9),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     customDropDown(
//                       "Select Staff",
//                       logic.staffHomeWorkController.staffDetail == null
//                           ? ""
//                           : logic.staffHomeWorkController.staffDetail.value
//                                   .name ??
//                               "",
//                     ),
//                     const SizedBox(height: 10),
//                     Obx(() {
//                       // Set default class based on available data
//                       if (logic.selectedClass.value.isEmpty) {
//                         String defaultClass =
//                             logic.staffHomeWorkController.dataItemName == ""
//                                 ? ""
//                                 : logic.staffHomeWorkController.dataItemName
//                                     .toString();
//                         logic.selectedClass.value = defaultClass;
//                       }

//                       return customDropDown55(
//                         context,
//                         "Select Class",
//                         logic.selectedClass.value.isEmpty
//                             ? null
//                             : logic.selectedClass.value,
//                         logic.staffHomeWorkController.staffClassListModel
//                                 ?.data ??
//                             [],
//                         (selectedValue) async {
//                           // Show loading indicator for section dropdown
//                           logic.isSectionLoading.value = true;

//                           logic.selectedClass.value = selectedValue;
//                           // Clear section when class changes
//                           logic.selectedSection.value = '';
//                           logic.selectedSectionId.value = '';
//                           logic.sectionList.clear();

//                           // Store class ID for API calls
//                           if (logic.staffHomeWorkController.staffClassmodel
//                                   ?.data !=
//                               null) {
//                             try {
//                               final classData = logic.staffHomeWorkController
//                                   .staffClassListModel!.data!
//                                   .firstWhere((item) =>
//                                       item.dataListItemName == selectedValue);
//                               logic.selectedClassId.value =
//                                   classData.dataListItemId.toString();

//                               // Fetch sections for selected class
//                               await logic.fetchSections(
//                                   logic.staffHomeWorkController.staffDetail
//                                       .value.staffid
//                                       .toString(),
//                                   logic.selectedClassId.value);

//                               // Force update all related observables
//                               logic.sectionList.refresh();
//                               logic.selectedSection.refresh();
//                               logic.selectedSectionId.refresh();

//                               // Update the controller to trigger GetBuilder
//                               logic.update();
//                             } catch (e) {
//                               logic.selectedClassId.value = '';
//                               print('Error in class selection: $e');
//                             } finally {
//                               // Hide loading indicator
//                               logic.isSectionLoading.value = false;
//                             }
//                           }
//                           print("Selected Class: $selectedValue");
//                         },
//                         isClass: true,
//                       );
//                     }),
//                     const SizedBox(height: 10),
//                     Obx(() {
//                       return customDropDown55(
//                         context,
//                         "Select Section",
//                         logic.selectedSection.value.isEmpty
//                             ? null
//                             : logic.selectedSection.value,
//                         logic.sectionList,
//                         (selectedValue) {
//                           logic.selectedSection.value = selectedValue;
//                           // Store section ID for API calls
//                           if (logic.sectionList.isNotEmpty) {
//                             try {
//                               final sectionData = logic.sectionList.firstWhere(
//                                   (item) =>
//                                       item['sectionName'] == selectedValue);
//                               logic.selectedSectionId.value =
//                                   sectionData['sectionId'].toString();
//                             } catch (e) {
//                               logic.selectedSectionId.value = '';
//                               print('Error finding section: $e');
//                             }
//                           }
//                           print("Selected Section: $selectedValue");
//                         },
//                         isClass: false,
//                         isLoading:
//                             logic.isSectionLoading.value, // Add loading state
//                       );
//                     }),
//                     const SizedBox(height: 10),
//                     AppUtil.customText(
//                       text: "Select Date",
//                       style: const TextStyle(
//                           fontFamily: 'Open Sans',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14),
//                     ),
//                     const SizedBox(height: 5),
//                     customOutlinedButton(
//                         OutlinedButton.styleFrom(
//                           side: const BorderSide(
//                               width: 1.0, color: Color(0xff94A3B8)),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 0, vertical: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               AppUtil.customText(
//                                 text: logic.formatDate(),
//                                 style: const TextStyle(
//                                     color: Color(0xff0F172A),
//                                     fontFamily: 'Open Sans',
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14),
//                               ),
//                               SvgPicture.asset(
//                                 "assets/icons/calendar_icon.svg",
//                                 height: 20,
//                                 width: 20,
//                               )
//                             ],
//                           ),
//                         ), () {
//                       logic.pickDateDialog(context);
//                     }),
//                     const SizedBox(height: 10),
//                     Obx(() {
//                       if (logic.showProgress.value) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else {
//                         return SizedBox(
//                           width: Get.width,
//                           child: customOutlinedButton(
//                               OutlinedButton.styleFrom(
//                                 side: const BorderSide(
//                                     width: 1.0, color: Color(0xff94A3B8)),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 0, vertical: 10),
//                                 child: AppUtil.customText(
//                                   text: "Show",
//                                   style: const TextStyle(
//                                       color: Color(0xff1575FF),
//                                       fontFamily: 'Open Sans',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 16),
//                                 ),
//                               ), () {
//                             if (logic.staffHomeWorkController
//                                     .isclassteacherany ==
//                                 false) {
//                               Fluttertoast.showToast(
//                                   msg:
//                                       "Don't have the permission for mark attendance");
//                             } else {
//                               String classId =
//                                   logic.selectedClassId.value.isNotEmpty
//                                       ? logic.selectedClassId.value
//                                       : logic.staffHomeWorkController.dataItemId
//                                           .toString();

//                               String sectionId =
//                                   logic.selectedSectionId.value.isNotEmpty
//                                       ? logic.selectedSectionId.value
//                                       : logic.staffHomeWorkController
//                                               .staffClassmodel!.data!
//                                               .firstWhere(
//                                                 (item) =>
//                                                     item.isClassTeacher == true,
//                                                 // orElse: () => null,
//                                               )
//                                               .sectionId
//                                               .toString() ??
//                                           "";

//                               logic.showNewwStudentAttendance(
//                                 classId,
//                                 sectionId,
//                               );
//                             }
//                           }),
//                         );
//                       }
//                     }),
//                     const SizedBox(height: 10),
//                     Obx(() {
//                       if (logic.isFirstTime.value) {
//                         return const SizedBox();
//                       } else if (logic.isDataFound.value) {
//                         return ConstrainedBox(
//                           constraints: const BoxConstraints(maxHeight: 255),
//                           child: Scrollbar(
//                             controller: logic.verticalScrollController,
//                             thickness: 8,
//                             radius: const Radius.circular(8),
//                             interactive: true,
//                             thumbVisibility: true,
//                             child: SingleChildScrollView(
//                               controller: logic.verticalScrollController,
//                               scrollDirection: Axis.vertical,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // Fixed columns (S.No and Name)
//                                   Table(
//                                     border: TableBorder.all(),
//                                     columnWidths: const {
//                                       0: FixedColumnWidth(60), // S.No width
//                                       1: FixedColumnWidth(150), // Name width
//                                     },
//                                     children: [
//                                       // Header row
//                                       TableRow(
//                                         decoration: BoxDecoration(
//                                           color: Colors.grey[200],
//                                         ),
//                                         children: [
//                                           TableCell(
//                                             child: Center(
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(9.0),
//                                                 child: AppUtil.customText(
//                                                   textAlign: TextAlign.center,
//                                                   text: getColumnName(0),
//                                                   style: const TextStyle(
//                                                     color: Color(0xff0F172A),
//                                                     fontFamily: 'Open Sans',
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 12,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           TableCell(
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(16.0),
//                                               child: AppUtil.customText(
//                                                 textAlign: TextAlign.center,
//                                                 text: getColumnName(1),
//                                                 style: const TextStyle(
//                                                   color: Color(0xff0F172A),
//                                                   fontFamily: 'Open Sans',
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 12,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       // Data rows
//                                       ...logic.dummyList
//                                           .asMap()
//                                           .entries
//                                           .map((entry) {
//                                         int index = entry.key;
//                                         var item = entry.value;
//                                         return TableRow(
//                                           children: [
//                                             TableCell(
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(14.0),
//                                                 child: Text(
//                                                   "${index + 1}",
//                                                   textAlign: TextAlign.center,
//                                                 ),
//                                               ),
//                                             ),
//                                             TableCell(
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 10.0, right: 10),
//                                                 child: Text(
//                                                   "${item.studentName}",
//                                                   maxLines: 2,
//                                                   textAlign: TextAlign.left,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       }),
//                                     ],
//                                   ),
//                                   // Scrollable columns (attendance marking)
//                                   Expanded(
//                                     child: Scrollbar(
//                                       controller:
//                                           logic.horizontalScrollController,
//                                       thickness: 6,
//                                       radius: const Radius.circular(8),
//                                       interactive: true,
//                                       thumbVisibility: true,
//                                       child: SingleChildScrollView(
//                                         controller:
//                                             logic.horizontalScrollController,
//                                         scrollDirection: Axis.horizontal,
//                                         child: Table(
//                                           border: TableBorder.all(),
//                                           defaultColumnWidth:
//                                               const FixedColumnWidth(100),
//                                           children: [
//                                             // Header row
//                                             TableRow(
//                                               decoration: BoxDecoration(
//                                                 color: Colors.grey[200],
//                                               ),
//                                               children: [
//                                                 TableCell(
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             left: 0.0,
//                                                             right: 0),
//                                                     child: AppUtil.customText(
//                                                       textAlign:
//                                                           TextAlign.center,
//                                                       text: getColumnName(2),
//                                                       style: const TextStyle(
//                                                         color:
//                                                             Color(0xff0F172A),
//                                                         fontFamily: 'Open Sans',
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                         fontSize: 12,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 TableCell(
//                                                   child: AppUtil.customText(
//                                                     textAlign: TextAlign.center,
//                                                     text: getColumnName(3),
//                                                     style: const TextStyle(
//                                                       color: Color(0xff0F172A),
//                                                       fontFamily: 'Open Sans',
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       fontSize: 12,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 TableCell(
//                                                   child: IconButton(
//                                                     onPressed: () {
//                                                       logic
//                                                           .markAllFullAttendance();
//                                                     },
//                                                     icon: logic.fullAttendance !=
//                                                                 null &&
//                                                             logic.fullAttendance!
//                                                                     .markFullDayAbsent ==
//                                                                 "True"
//                                                         ? const Icon(
//                                                             Icons.check_box)
//                                                         : const Icon(Icons
//                                                             .check_box_outline_blank),
//                                                     color:
//                                                         ConstClass.themeColor,
//                                                   ),
//                                                 ),
//                                                 TableCell(
//                                                   child: AppUtil.customText(
//                                                     textAlign: TextAlign.center,
//                                                     text: getColumnName(5),
//                                                     style: const TextStyle(
//                                                       color: Color(0xff0F172A),
//                                                       fontFamily: 'Open Sans',
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       fontSize: 12,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 TableCell(
//                                                   child: IconButton(
//                                                     onPressed: () {
//                                                       logic
//                                                           .markAllHalfAttendance();
//                                                     },
//                                                     icon: logic.halfAttendance !=
//                                                                 null &&
//                                                             logic.halfAttendance!
//                                                                     .markHalfDayAbsent ==
//                                                                 "True"
//                                                         ? const Icon(
//                                                             Icons.check_box)
//                                                         : const Icon(Icons
//                                                             .check_box_outline_blank),
//                                                     color:
//                                                         ConstClass.themeColor,
//                                                   ),
//                                                 ),
//                                                 TableCell(
//                                                   child: AppUtil.customText(
//                                                     textAlign: TextAlign.center,
//                                                     text: getColumnName(7),
//                                                     style: const TextStyle(
//                                                       color: Color(0xff0F172A),
//                                                       fontFamily: 'Open Sans',
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       fontSize: 12,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 TableCell(
//                                                   child: IconButton(
//                                                     onPressed: () {
//                                                       logic
//                                                           .markAllOthersAttendance();
//                                                     },
//                                                     icon: logic.othersAttendance !=
//                                                                 null &&
//                                                             logic.othersAttendance!
//                                                                     .others ==
//                                                                 "True"
//                                                         ? const Icon(
//                                                             Icons.check_box)
//                                                         : const Icon(Icons
//                                                             .check_box_outline_blank),
//                                                     color:
//                                                         ConstClass.themeColor,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             // Data rows
//                                             ...logic.dummyList
//                                                 .asMap()
//                                                 .entries
//                                                 .map((entry) {
//                                               int index = entry.key;
//                                               var item = entry.value;
//                                               return TableRow(
//                                                 children: [
//                                                   TableCell(
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text(
//                                                         "A",
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   TableCell(
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text(
//                                                         "A",
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   TableCell(
//                                                     child: IconButton(
//                                                       onPressed: () {
//                                                         logic
//                                                             .markFullAttendance(
//                                                                 item);
//                                                       },
//                                                       icon: item.markFullDayAbsent ==
//                                                               "True"
//                                                           ? const Icon(
//                                                               Icons.check_box)
//                                                           : const Icon(Icons
//                                                               .check_box_outline_blank),
//                                                       color:
//                                                           ConstClass.themeColor,
//                                                     ),
//                                                   ),
//                                                   TableCell(
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text(
//                                                         "H",
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   TableCell(
//                                                     child: IconButton(
//                                                       onPressed: () {
//                                                         logic
//                                                             .markHalfAttendance(
//                                                                 item);
//                                                       },
//                                                       icon: item.markHalfDayAbsent ==
//                                                               "True"
//                                                           ? const Icon(
//                                                               Icons.check_box)
//                                                           : const Icon(Icons
//                                                               .check_box_outline_blank),
//                                                       color:
//                                                           ConstClass.themeColor,
//                                                     ),
//                                                   ),
//                                                   TableCell(
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text(
//                                                         "O",
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   TableCell(
//                                                     child: IconButton(
//                                                       onPressed: () {
//                                                         logic
//                                                             .markOtherAttendance(
//                                                                 item);
//                                                       },
//                                                       icon: item.others ==
//                                                               "True"
//                                                           ? const Icon(
//                                                               Icons.check_box)
//                                                           : const Icon(Icons
//                                                               .check_box_outline_blank),
//                                                       color:
//                                                           ConstClass.themeColor,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               );
//                                             }),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       } else if (!logic.showProgress.value) {
//                         return Padding(
//                           padding: const EdgeInsets.all(50.0),
//                           child: AppUtil.noDataFound("No Data Found"),
//                         );
//                       } else {
//                         return const SizedBox();
//                       }
//                     }),
//                     Obx(() {
//                       if (logic.isDataFound.value) {
//                         return const SizedBox(height: 24);
//                       } else {
//                         return const SizedBox();
//                       }
//                     }),
//                     // SizedBox(
//                     //   width: Get.width,
//                     //   child: customOutlinedButton(
//                     //       OutlinedButton.styleFrom(
//                     //         backgroundColor: ConstClass.themeColor,
//                     //         side: BorderSide(
//                     //             width: 1.5, color: ConstClass.themeColor),
//                     //         shape: RoundedRectangleBorder(
//                     //           borderRadius: BorderRadius.circular(8.0),
//                     //         ),
//                     //       ),
//                     //       Padding(
//                     //         padding: const EdgeInsets.symmetric(
//                     //             horizontal: 0, vertical: 10),
//                     //         child: AppUtil.customText(
//                     //           text: "Update Students Attendence",
//                     //           style: const TextStyle(
//                     //               color: Colors.white,
//                     //               fontFamily: 'Open Sans',
//                     //               fontWeight: FontWeight.w600,
//                     //               fontSize: 14),
//                     //         ),
//                     //       ), () {
//                     //     if (logic.staffHomeWorkController.isclassteacherany ==
//                     //         false) {
//                     //       Fluttertoast.showToast(
//                     //           msg:
//                     //               "Don't have the permission for mark attendance");
//                     //     } else {
//                     //       Get.to(() => const UpdateStaffAttendanceScreen());
//                     //     }
//                     //   }),
//                     // ),
//                     const SizedBox(height: 10),
//                     // SizedBox(
//                     //   width: Get.width,
//                     //   child: customOutlinedButton(
//                     //       OutlinedButton.styleFrom(
//                     //         side: BorderSide(
//                     //             width: 1.5, color: ConstClass.themeColor),
//                     //         shape: RoundedRectangleBorder(
//                     //           borderRadius: BorderRadius.circular(8.0),
//                     //         ),
//                     //       ),
//                     //       Padding(
//                     //         padding: const EdgeInsets.symmetric(
//                     //             horizontal: 0, vertical: 10),
//                     //         child: AppUtil.customText(
//                     //           text: "View Students Attendance",
//                     //           style: const TextStyle(
//                     //               color: Color(0xff1575FF),
//                     //               fontFamily: 'Open Sans',
//                     //               fontWeight: FontWeight.w600,
//                     //               fontSize: 14),
//                     //         ),
//                     //       ), () {
//                     //     if (logic.staffHomeWorkController.isclassteacherany ==
//                     //         false) {
//                     //       Fluttertoast.showToast(
//                     //           msg:
//                     //               "Don't have the permission for mark attendance");
//                     //     } else {
//                     //       Get.to(() => const ViewAttendanceScreen());
//                     //     }
//                     //   }),
//                     // ),
//                     const SizedBox(height: 10),
//                     Obx(() {
//                       if (!logic.isDataFound.value) {
//                         return const SizedBox();
//                       } else if (logic.saveAttenShowProgress.value) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else {
//                         return SizedBox(
//                           width: Get.width,
//                           child: customOutlinedButton(
//                               OutlinedButton.styleFrom(
//                                 side: const BorderSide(
//                                     width: 1.5, color: Color(0xff0DB166)),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 0, vertical: 10),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SvgPicture.asset(
//                                       "assets/icons/save_icon.svg",
//                                       height: 16,
//                                       width: 16,
//                                     ),
//                                     const SizedBox(width: 5),
//                                     AppUtil.customText(
//                                       text: "Save",
//                                       style: const TextStyle(
//                                           color: Color(0xff0DB166),
//                                           fontFamily: 'Open Sans',
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14),
//                                     )
//                                   ],
//                                 ),
//                               ), () {
//                             logic.saveAttendance();
//                           }),
//                         );
//                       }
//                     }),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }

//   String getColumnName(int index) {
//     switch (index) {
//       case 0:
//         return 'S.no';
//       case 1:
//         return 'Student Name';
//       case 2:
//         return 'Mark Full Day Present';
//       case 3:
//         return '';
//       case 4:
//         return 'Mark Half Day Present';
//       case 5:
//         return 'Mark Half Day Present';
//       case 6:
//         return 'Other';
//       case 7:
//         return 'Other';
//       default:
//         return '';
//     }
//   }

//   Widget customDropDown55(
//     BuildContext? context,
//     String? title,
//     String? selectedValue,
//     List<dynamic> itemList,
//     Function(dynamic) onChanged, {
//     required bool isClass,
//     bool isLoading = false, // Add loading parameter
//   }) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AppUtil.customText(
//             text: title,
//             style: const TextStyle(
//                 fontFamily: 'Open Sans',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14),
//           ),
//           const SizedBox(height: 2),
//           SizedBox(
//             width: Get.width,
//             child: customOutlinedButton(
//               OutlinedButton.styleFrom(
//                 side: const BorderSide(width: 1, color: Color(0xff94A3B8)),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: isLoading
//                           ? Row(
//                               children: [
//                                 SizedBox(
//                                   width: 16,
//                                   height: 16,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         ConstClass.themeColor),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 AppUtil.customText(
//                                   text: "Loading...",
//                                   style: const TextStyle(
//                                       color: Color(0xff94A3B8),
//                                       fontFamily: 'Open Sans',
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14),
//                                 ),
//                               ],
//                             )
//                           : AppUtil.customText(
//                               text: selectedValue ??
//                                   "Select ${title?.replaceAll('Select ', '')}",
//                               style: TextStyle(
//                                   color: selectedValue != null
//                                       ? const Color(0xff0F172A)
//                                       : const Color(0xff94A3B8),
//                                   fontFamily: 'Open Sans',
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14),
//                             ),
//                     ),
//                     if (!isLoading)
//                       SvgPicture.asset(
//                         "assets/icons/arrowdown_icon.svg",
//                         height: 20,
//                         width: 20,
//                       ),
//                   ],
//                 ),
//               ),
//               isLoading
//                   ? () {} // Disable tap when loading
//                   : () => _showDropdownPopup(
//                       context!, title!, itemList, onChanged, isClass),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showDropdownPopup(
//     BuildContext context,
//     String title,
//     List<dynamic> itemList,
//     Function(dynamic) onChanged,
//     bool isClass,
//   ) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AppUtil.customText(
//                   text: title,
//                   style: const TextStyle(
//                       fontFamily: 'Open Sans',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 if (itemList.isEmpty)
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: AppUtil.customText(
//                       text: "No data available",
//                       style: const TextStyle(
//                           color: Color(0xff94A3B8),
//                           fontFamily: 'Open Sans',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14),
//                     ),
//                   )
//                 else
//                   ...itemList.map((item) {
//                     return ListTile(
//                       title: AppUtil.customText(
//                         text: isClass
//                             ? (item.dataListItemName ?? "")
//                             : (item['sectionName'] ?? ""),
//                         style: const TextStyle(
//                             color: Color(0xff0F172A),
//                             fontFamily: 'Open Sans',
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14),
//                       ),
//                       onTap: () {
//                         String selectedValue = isClass
//                             ? (item.dataListItemName ?? "")
//                             : (item['sectionName'] ?? "");
//                         onChanged(selectedValue);
//                         Navigator.pop(context);
//                       },
//                     );
//                   }),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget customOutlinedButton(
//       ButtonStyle buttonStyle, Widget widget, Function() onPressed) {
//     return OutlinedButton(
//       style: buttonStyle,
//       onPressed: onPressed,
//       child: widget,
//     );
//   }

//   DataCell datacell(String? text) {
//     return DataCell(AppUtil.customText(
//       textAlign: TextAlign.center,
//       text: text,
//       style: const TextStyle(
//           color: Color(0xff334155),
//           fontFamily: 'Open Sans',
//           fontWeight: FontWeight.w400,
//           fontSize: 12),
//     ));
//   }

//   Widget customDropDown(
//     String? title,
//     String? buttonValue,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AppUtil.customText(
//           text: title,
//           style: const TextStyle(
//               fontFamily: 'Open Sans',
//               fontWeight: FontWeight.w600,
//               fontSize: 14),
//         ),
//         const SizedBox(height: 2),
//         SizedBox(
//           width: Get.width,
//           child: customOutlinedButton(
//               OutlinedButton.styleFrom(
//                 side: const BorderSide(width: 1, color: Color(0xff94A3B8)),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     AppUtil.customText(
//                       text: buttonValue,
//                       style: const TextStyle(
//                           color: Color(0xff0F172A),
//                           fontFamily: 'Open Sans',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14),
//                     ),
//                     SvgPicture.asset(
//                       "assets/icons/arrowdown_icon.svg",
//                       height: 20,
//                       width: 20,
//                     ),
//                   ],
//                 ),
//               ),
//               () {}),
//         )
//       ],
//     );
//   }
// }
