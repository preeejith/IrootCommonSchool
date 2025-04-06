import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iroots/src/controller/homework/student/student_homework_controller.dart';
import 'package:iroots/src/modal/homework/getHomeworkModalClass.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';

//studenthomework
class StudentHomeworkScreen extends StatelessWidget {
  const StudentHomeworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: StudentHomeWorkController(),
        builder: (logic) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ConstClass.dashBoardColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppUtil.customText(
                      text: "Homework",
                      style: const TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: SvgPicture.asset(
                          "assets/icons/homework_icons/icon_homework_filter.svg",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      onTap: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       backgroundColor: const Color.fromARGB(
                        //           255, 254, 255, 255), // Light blue theme
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10)),
                        //       title: Text(
                        //         "Reminder",
                        //         style: TextStyle(
                        //             color: Colors.blue[900],
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //       content: SizedBox(
                        //         height: 98,
                        //         child: Column(
                        //           children: [
                        //             ClipRRect(
                        //               borderRadius: BorderRadius.circular(12),
                        //               child: Container(
                        //                 color: const Color.fromARGB(
                        //                     255, 171, 213, 54),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Text(
                        //                     "2222",
                        //                     style: TextStyle(
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //             Text(
                        //               "Please note this transaction number for any future reference or clarification.",
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontSize: 14,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       actions: [
                        //         TextButton(
                        //           onPressed: () {
                        //             // Navigator.of(context).pop();
                        //             // BlocProvider.of<MainBloc>(context)
                        //             //     .add(GetStudentFeeList());
                        //             // BlocProvider.of<MainBloc>(context)
                        //             //     .add(GetStudentTotalamount());
                        //             // Fluttertoast.showToast(
                        //             //     msg: "Transaction successfully completed.");
                        //             // _closeWebView(context, "Transaction Success");
                        //             // // Call your delete function here
                        //           },
                        //           child: Text("Ok",
                        //               style: TextStyle(color: Colors.red)),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
                      },
                    ),
                  ],
                ),
              ),
              body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Obx(() {
                    if (logic.homeWorkProgress.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (logic.isHomeWorkDataFound.value) {
                      return ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: logic.getHomeworkDataList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {},
                              child: buildHomeworkWidget(
                                  logic.getHomeworkDataList[index], context));
                        },
                      );
                    } else {
                      return AppUtil.noDataFound("No Homework Data Found");
                    }
                  })),
            ));
  }

  Widget buildHomeworkWidget(
      GetHomeWorkData homeworkModal, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 234, 234),

        border: Border.all(
          color: Colors.blue, // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10), // Optional: Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF1F5F9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: homeworkModal.subjectName != null
                      ? AppUtil.customText(
                          text: homeworkModal.subjectName,
                          style: TextStyle(
                              color: ConstClass.themeColor,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 10),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            // AppUtil.customText(
            //   text: homeworkModal.newAssignment,
            //   style: const TextStyle(
            //       color: Color(0xff0F172A),
            //       fontFamily: 'Open Sans',
            //       fontWeight: FontWeight.w700,
            //       fontSize: 14),
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title: ",
                  style: const TextStyle(
                      color: Color(0xff64748B),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    homeworkModal.assignMentName.toString(),
                    style: const TextStyle(
                        color: Colors.green,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        // decoration: TextDecoration.underline,
                        fontSize: 14),
                  ),
                )
                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 2,
                //   child: Text(
                //     homeworkModal.assignMentName.toString(),
                //     style: const TextStyle(
                //         color: Colors.green,
                //         fontFamily: 'Open Sans',
                //         fontWeight: FontWeight.w700,
                //         // decoration: TextDecoration.underline,
                //         fontSize: 14),
                //   ),
                // )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            rowTextWidget("Created Date:", homeworkModal.createdDate),
            const SizedBox(
              height: 5,
            ),
            rowTextWidget("Submission Date:", homeworkModal.submittedDate),
            const SizedBox(
              height: 5,
            ),
            rowTextWidget("Class Name:", homeworkModal.classs),
            const SizedBox(
              height: 5,
            ),
            // rowTextWidget("Last Submission Date", homeworkModal.submittedDate),
            // const SizedBox(
            //   height: 5,
            // ),
            // rowTextWidget("Class Name", homeworkModal.className),
            // const SizedBox(
            //   height: 5,
            // ),
          ],
        ),
      ),
    );
  }

  Widget rowTextWidget(String titleKey, String? titleValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppUtil.customText(
          text: titleKey,
          style: const TextStyle(
              color: Color(0xff64748B),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 13),
        ),
        AppUtil.customText(
          text: titleValue,
          style: const TextStyle(
              color: Color(0xff334155),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
      ],
    );
  }
  // Widget rowTextWidget(String titleKey, String? titleValue) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       AppUtil.customText(
  //         text: titleKey,
  //         style: const TextStyle(
  //             color: Color(0xff64748B),
  //             fontFamily: 'Open Sans',
  //             fontWeight: FontWeight.w400,
  //             fontSize: 12),
  //       ),
  //       AppUtil.customText(
  //         text: titleValue,
  //         style: const TextStyle(
  //             color: Color(0xff334155),
  //             fontFamily: 'Open Sans',
  //             fontWeight: FontWeight.w600,
  //             fontSize: 12),
  //       ),
  //     ],
  //   );
  // }
}
