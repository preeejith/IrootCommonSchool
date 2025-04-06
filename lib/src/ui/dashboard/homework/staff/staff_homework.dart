import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:iroots/src/controller/homework/staff/staff_homework_controller.dart';
import 'package:iroots/src/modal/homework/getHomeworkModalClass.dart';
import 'package:iroots/src/ui/dashboard/homework/staff/create_homework.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';

//mehomework
class StaffHomeworkScreen extends StatelessWidget {
  const StaffHomeworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: StaffHomeWorkController(),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: SvgPicture.asset(
                        "assets/icons/homework_icons/icon_homework_filter.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color(0xff1575FF),
                onPressed: () {
                  Get.to(() => CreateHomeworkScreen());
                },
                // isExtended: true,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
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
                        itemBuilder: (contextcontext, index) {
                          return InkWell(
                              onTap: () {},
                              child: buildHomeworkWidget(logic,
                                  logic.getHomeworkDataList[index], context));
                        },
                      );
                    } else {
                      return AppUtil.noDataFound("No Homework Data Found");
                    }
                  })),
            ));
  }

  Widget rowTextWidget(String titleKey, String? titleValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppUtil.customText(
          text: titleKey,
          style: const TextStyle(
              color: Color.fromARGB(255, 16, 18, 21),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              fontSize: 12.5),
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

  Widget buildHomeworkWidget(
      logic, GetHomeWorkData homeworkModal, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 234, 234),

            border: Border.all(
              color: Colors.blue, // Border color
              width: 1.0, // Border width
            ),
            borderRadius:
                BorderRadius.circular(10), // Optional: Rounded corners
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
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
                            : const SizedBox()),
                    InkWell(
                      child: Icon(
                        Icons.delete,
                        color: const Color.fromARGB(255, 77, 72, 72),
                        size: 19,
                      ),
                      onTap: () {
                        _showDeleteDialog(logic, context,
                            homeworkModal.assignmentId.toString());
                        print(homeworkModal.assignmentId);
                      },
                    )
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
                  ],
                ),
                // SizedBox(
                //     width: MediaQuery.of(context).size.width / 4,
                //     child: rowTextWidget(
                //         "Home Work Title", homeworkModal.assignMentName)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(logic, BuildContext context, String? assignmentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<MainBloc, MainState>(
          listenWhen: (previous, current) =>
              current is DeletingHomeWork ||
              current is HomeWorkDeleteSuccess ||
              current is HomeWorkFailed,
          listener: (context, state) {
            if (state is HomeWorkDeleteSuccess) {
              logic.getHomeWork();
              Navigator.pop(context);
            } else if (state is HomeWorkFailed) {
              logic.getHomeWork();
              Navigator.pop(context);
            }
          },
          buildWhen: (previous, current) => current is DeletingHomeWork,
          builder: (context, state) {
            return AlertDialog(
              backgroundColor: Colors.blue[50], // Light blue theme
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                "Delete Homework",
                style: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.bold),
              ),
              content: Text(
                "Do you want to delete this  Assignment?",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("No", style: TextStyle(color: Colors.blue[900])),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<MainBloc>(context)
                        .add(HomeWorkDelete(assignmentId: assignmentId));
                    // Navigator.pop(context);
                    print("Deleted Homework ID: $assignmentId");

                    logic.getHomeWork();
                    // Call your delete function here
                  },
                  child: state is DeletingHomeWork
                      ? CircularProgressIndicator()
                      : Text("Yes", style: TextStyle(color: Colors.red)),
                ),
              ],
            );
          },
        );
      },
    );
  }
  /*Widget buildHomeworkWidget(StaffHomeworkModal homeworkModal) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0).w,
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
                  child: AppUtil.customText(
                    text: homeworkModal.subjectName,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: ConstClass.themeColor,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp),
                  ),
                ),
                homeworkModal.completed == 0
                    ? const SizedBox()
                    : homeworkModal.completed == 1
                        ? allCompletedRowWidget()
                        : notsubmitRowWidget()
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            AppUtil.customText(
              text: homeworkModal.topicName,
              style: TextStyle(
                  color: const Color(0xff0F172A),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            rowTextWidget("Last Submission Date", homeworkModal.lastSubDate),
            SizedBox(
              height: 5.h,
            ),
            rowTextWidget("Class Name", homeworkModal.className),
            SizedBox(
              height: 5.h,
            ),
            rowTextWidget("Student(s)", homeworkModal.students),
          ],
        ),
      ),
    );
  }*/

  Widget notsubmitRowWidget() {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/homework_icons/icon_not_sub.svg",
          height: 12,
          width: 12,
        ),
        const SizedBox(
          width: 5,
        ),
        AppUtil.customText(
          text: "2 Stud. not submitted",
          style: const TextStyle(
              color: Color(0xffE11D48),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
              fontSize: 10),
        )
      ],
    );
  }
}

Widget allCompletedRowWidget() {
  return Row(
    children: [
      SvgPicture.asset(
        "assets/icons/homework_icons/completed_checkBox.svg",
        height: 12,
        width: 12,
      ),
      const SizedBox(
        width: 5,
      ),
      AppUtil.customText(
        text: "All Completed",
        style: const TextStyle(
            color: Color(0xff0DB166),
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w400,
            fontSize: 10),
      )
    ],
  );
}
