import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart' as slider;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:iroots/newscreens/customcalender.dart';
import 'package:iroots/src/controller/home/admin/admin_home_controller.dart';
import 'package:iroots/src/modal/dashboardModalClass.dart';
import 'package:iroots/src/ui/dashboard/admin/admin_coscholastic/admin_coscholastic_screen.dart';
import 'package:iroots/src/ui/dashboard/admin/admin_report_card/admin_report_card_screen.dart';
import 'package:iroots/src/ui/dashboard/admin/fill_marks/admin_fill_marks.dart';
import 'package:iroots/src/ui/dashboard/admin/home/slidmeimage.dart';
import 'package:iroots/src/ui/dashboard/attendance/admin/admin_attendence.dart';

import 'package:iroots/src/ui/dashboard/homework/admin/admin_homework.dart';
import 'package:iroots/src/ui/dashboard/reports/staff_report_card.dart';
import 'package:iroots/src/ui/dashboard/staff/home/staff_home_screen.dart';
import 'package:iroots/src/utility/const.dart';
import 'package:iroots/src/utility/util.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

//meadmindashboard
class AdminHomePageScreen extends StatefulWidget {
  const AdminHomePageScreen({super.key});

  @override
  State<AdminHomePageScreen> createState() => _AdminHomePageScreenState();
}

class _AdminHomePageScreenState extends State<AdminHomePageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MainBloc>(context).add(GetAdminDashboard());
  }

  @override
  Widget build(BuildContext context) {
    // final slider.CarouselController controller = slider.CarouselController();

    return GetBuilder(
      init: AdminHomeController(),
      builder: (logic) => Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return Container(
                color: const Color(0xffF1F5F9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // topBarWidget(),
                    // const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: academicYearWidget(logic),
                    ),
                    const SizedBox(height: 5),
                    // imageCarousel(),
                    dataCarousel(context),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12.0, right: 12, top: 5),
                      child: Divider(
                        height: 15,
                        color: Colors.grey,
                      ),
                    ),
                    // CarouselDemo(),
                    const SizedBox(height: 10),
                    studentReportWidget(),
                    const SizedBox(height: 10),
                    // _Grid(),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.white,
                        height: 390,
                        width: 400,
                        child: CalendarWidget(
                          // year: 2025,
                          // month: 1,
                          holidays: [
                            DateTime(2025, 1, 26),
                            // DateTime(2024, 2, 2)
                          ],
                          leaves: [
                            // DateTime(2025, 1, 22),
                            // DateTime(2024, 2, 22)
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: calenderBottomItemsWidget2(),
                    ),
                    // _buildCalendarMonth(logic),
                    const SizedBox(height: 10),
                    // lineChartWidget(logic),
                    // const SizedBox(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget customRowWidget(String text, String textValue, Color color) {
    final double attendancePercentage = 0.75;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: color,
                      radius: 5,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  AppUtil.customText(
                    text: textValue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  AppUtil.customText(
                    text: text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  // const SizedBox(width: 5),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: AppUtil.customText(
                      text: "Students ",
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  customDropDown(AdminHomeController? logic, String? hintText,
      List<String> yearList, void Function(String) onChanged, String? value) {
    return DropdownButtonFormField<String>(
      icon: SvgPicture.asset(
        "assets/icons/arrowdown_icon.svg",
        height: 20,
        width: 20,
      ),
      value: value,
      items: yearList.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: AppUtil.customText(
            text: item,
            style: const TextStyle(
              color: Color(0xff0F172A),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        );
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
    );
  }

  customDropDown1(AdminHomeController? logic, List<String> yearList,
      void Function(String) onChanged, String? value) {
    return DropdownButtonFormField<String>(
      icon: SvgPicture.asset(
        "assets/icons/arrowdown_icon.svg",
        height: 14,
        width: 14,
      ),
      value: value,
      style: TextStyle(
        color: ConstClass.themeColor,
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
        fontSize: 10,
      ),
      items: yearList.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: AppUtil.customText(
            text: "Last $item Years",
            style: const TextStyle(
              color: Color(0xff0F172A),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        onChanged(newValue!);
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }

  Widget dataCarousel(BuildContext context) {
    final dashboardData = context.read<MainBloc>().adminDashboardModel.data;

    final List<Map<String, dynamic>> cardData = [
      {
        "title": "Total Students",
        "value": "${dashboardData?.totalStudents ?? 0}",
        "subtitle": "Active Enrollments",
        "icon": Icons.school,
        "color": const Color(0xFF6C5CE7),
        "bgColor": const Color(0xFFF8F7FF),
      },
      {
        "title": "New Admissions",
        "value": "${dashboardData?.newAdmission ?? 0}",
        "subtitle": "This Month",
        "icon": Icons.person_add,
        "color": const Color(0xFF00B894),
        "bgColor": const Color(0xFFF0FDF9),
      },
      {
        "title": "Total Staff",
        "value": "${dashboardData?.totalStaff ?? 0}",
        "subtitle": "Teaching & Non-Teaching",
        "icon": Icons.group,
        "color": const Color(0xFFE17055),
        "bgColor": const Color(0xFFFFF5F3),
      },
      {
        "title": "Absent Students",
        "value": "${dashboardData?.absentStudent ?? 0}",
        "subtitle": "Today",
        "icon": Icons.person_off,
        "color": const Color(0xFFFF6B6B),
        "bgColor": const Color(0xFFFFF0F0),
      },
      {
        "title": "Fee Collection",
        "value":
            "₹${dashboardData?.totalFeeCollect?.toStringAsFixed(2) ?? '0.00'}",
        "subtitle": "Total Collected",
        "icon": Icons.account_balance_wallet,
        "color": const Color(0xFF0984E3),
        "bgColor": const Color(0xFFF0F8FF),
      },
      {
        "title": "Today's Collection",
        "value":
            "₹${dashboardData?.todayFeeCollection?.toStringAsFixed(2) ?? '0.00'}",
        "subtitle": "Daily Revenue",
        "icon": Icons.money,
        "color": const Color(0xFFFD79A8),
        "bgColor": const Color(0xFFFFF5F8),
      },
      {
        "title": "Transfer Certificates",
        "value": "${dashboardData?.tc ?? 0}",
        "subtitle": "Issued",
        "icon": Icons.description,
        "color": const Color(0xFF74B9FF),
        "bgColor": const Color(0xFFF0F7FF),
      },
      {
        "title": "New Teachers",
        "value": "${dashboardData?.newJoinTeacher ?? 0}",
        "subtitle": "Recently Joined",
        "icon": Icons.how_to_reg,
        "color": const Color(0xFF55A3FF),
        "bgColor": const Color(0xFFF5F9FF),
      },
    ];

    return SizedBox(
      height: 200,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          aspectRatio: 16 / 9,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          viewportFraction: 0.95,
          autoPlayCurve: Curves.easeInOutCubic,
        ),
        items: cardData.map((data) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width * 3,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      data['bgColor'],
                      data['bgColor'].withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: data['color'].withOpacity(0.15),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                  border: Border.all(
                    color: data['color'].withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    // Background circle
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: data['color'].withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: data['color'].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  data['icon'],
                                  color: data['color'],
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['title'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    Text(
                                      data['subtitle'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                data['value'],
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: data['color'],
                                  letterSpacing: -1,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: data['color'].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.trending_up,
                                      size: 12,
                                      color: data['color'],
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "Live",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: data['color'],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: data['color'].withOpacity(0.1),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.7,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: data['color'],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  // Widget imageCarousel() {
  Widget studentReportWidget() {
    final double attendancePercentage = 0.75;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      child: Card(
        color: Color(0xff69A6FE),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppUtil.customText(
                text: "Student Report",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customRowWidget("Pass", "1500", const Color(0XFF70D976)),
                      customRowWidget("Fail", "300", const Color(0XFFFF7474)),
                    ],
                  ),
                  CircularPercentIndicator(
                    radius: 55.0, // Size of the circle
                    lineWidth: 12.0, // Thickness of the progress line
                    percent: attendancePercentage, // Value between 0.0 to 1.0
                    center: Text(
                      "${(attendancePercentage * 100).toStringAsFixed(1)}%",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    progressColor: const Color.fromARGB(
                        255, 134, 228, 137), // Progress bar color
                    backgroundColor: Colors.red, // Background color
                    circularStrokeCap:
                        CircularStrokeCap.round, // Round stroke cap
                    animation: true, // Animate progress
                    animationDuration: 1000, // Duration in milliseconds
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget academicYearWidget(AdminHomeController logic) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppUtil.customText(
            textAlign: TextAlign.center,
            text: "Academics year",
            style: const TextStyle(
              color: Color(0xff0F172A),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 0.4,
            child: customDropDown(logic, "Select Year", logic.yearList,
                (newValue) {
              logic.selectedYear = newValue;
            }, logic.selectedYear),
          ),
        ],
      ),
    );
  }

  // Widget studentAndTeacherWidget() {
  Widget topBarWidget() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
      color: ConstClass.themeColor,
      width: Get.width,
      height: 35,
      child: AppUtil.customText(
        textAlign: TextAlign.center,
        text: "",
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget studentAndTeacherCardWidget() {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF6EDD74),
                    ),
                    child: Image.asset(
                      "assets/icons/graduation.png",
                      width: 22,
                      height: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppUtil.customText(
                        text: "Total Students",
                        style: const TextStyle(
                          color: Color(0xff334155),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      AppUtil.customText(
                        text: "1500",
                        style: const TextStyle(
                          color: Color(0xff334155),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
            const SizedBox(height: 8),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "New Admission : ",
                      style: TextStyle(
                        color: Color(0xff64748B),
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: "1480",
                          style: TextStyle(
                            color: Color(0xff334155),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 10),
                  const VerticalDivider(
                    endIndent: 2,
                    indent: 2,
                    color: Color(0xff94A3B8),
                    thickness: 1,
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: const TextSpan(
                      text: "Absent : ",
                      style: TextStyle(
                        color: Color(0xff64748B),
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: "20",
                          style: TextStyle(
                            color: Color(0xff334155),
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarMonth(AdminHomeController logic) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => TableCalendar(
                calendarBuilders: CalendarBuilders(
                  holidayBuilder: (context, date, events) {
                    if (date.month == 1 && date.day == 26) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red, // Highlight color
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return null;
                    }
                  },
                ),
                eventLoader: (date) => logic.getEventsForDay(date),
                locale: 'en_US',
                firstDay: DateTime(DateTime.now().year - 5),
                lastDay: DateTime(DateTime.now().year + 5),
                calendarFormat: CalendarFormat.month,
                rangeSelectionMode: logic.rangeSelectionMode.value,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                headerVisible: true,
                headerStyle: const HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: Color(0xff0F172A),
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  isTodayHighlighted: true,
                  todayTextStyle: const TextStyle(
                      color: Color(0xff64748B),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  todayDecoration: BoxDecoration(
                    color: const Color(0XFFD0E3FF),
                    borderRadius: BorderRadius.circular(
                      28,
                    ),
                    border: Border.all(
                      color: const Color(0XFF1575FF),
                      width: 0.9,
                    ),
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Color(0xff64748B),
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                rowHeight: 28,
                focusedDay: logic.focusedDay.value,
                rangeStartDay: logic.rangeStart,
                rangeEndDay: logic.rangeEnd,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(logic.selectedDay, selectedDay)) {
                    logic.focusedDay.value = focusedDay;
                    logic.selectedDay = selectedDay;
                    logic.rangeSelectionMode.value =
                        RangeSelectionMode.toggledOn;
                  }
                },
                onRangeSelected: (start, end, focusedDay) {
                  logic.focusedDay.value = focusedDay;
                  logic.rangeEnd = end;
                  logic.rangeStart = start;
                  logic.rangeSelectionMode.value = RangeSelectionMode.toggledOn;
                },
                onPageChanged: (focusedDay) {
                  logic.focusedDay.value = focusedDay;
                },
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: const Color(0xffE2E8F0),
              height: 1.0,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              width: Get.width,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: calenderBottomItemsWidget2(),
            ),
          ],
        ),
      ),
    );
  }

  Widget lineChartWidget(AdminHomeController logic) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppUtil.customText(
                    textAlign: TextAlign.center,
                    text: "Student Performance",
                    style: const TextStyle(
                      color: Color(0xff0F172A),
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF1F5F9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: SizedBox(
                      width: 0.2,
                      height: 40,
                      child: customDropDown1(logic, logic.lineChartList,
                          (newValue) {
                        logic.selectedLastYear = newValue;

                        logic.selectYear();
                      }, logic.selectedLastYear),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: Get.width,
                height: 200,
                // child: Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: LineChart(
                //     logic.sampleData1,
                //     swapAnimationCurve: Curves.easeInOutQuart,
                //     swapAnimationDuration: const Duration(milliseconds: 250),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget calenderBottomItemsWidget2() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 145,
                  color: const Color.fromARGB(255, 153, 225, 155),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: AppUtil.customText(
                        text: "Regional Holiday",
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
              ),
            ],
          ),
          const SizedBox(width: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 145,
                  color: const Color.fromARGB(255, 214, 159, 241),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: AppUtil.customText(
                        text: "National Holiday",
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
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 145,
                  color: const Color.fromARGB(255, 251, 177, 143),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: AppUtil.customText(
                        text: "Reminders",
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
              ),
            ],
          ),
          const SizedBox(width: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 145,
                  color: const Color.fromARGB(255, 142, 151, 245),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: AppUtil.customText(
                        text: "My Leaves",
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
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 10),
    ],
  );
}

/// Grid Class

class _Grid extends StatelessWidget {
  _Grid({super.key});

  final List<DashBoardModal> staffAcademicList = [
    DashBoardModal(
      title: "Fill Attendance",
      // image: "assets/icons/academicIcons/academics_attendance_icon.svg",
      image: "assets/new/attendance1.png",
    ),
    DashBoardModal(
      title: "Fill Marks",
      // image: "assets/icons/staff_icons/staff_fill_marks_icon.svg",
      image: "assets/new/exam1.png",
    ),
    DashBoardModal(
      title: "Fill Co-Scholastic",
      // image: "assets/icons/academicIcons/academics_fill_co_scholastic.svg",
      image: "assets/new/library1.png",
    ),
    DashBoardModal(
      title: "Homework",
      // image: "assets/icons/academicIcons/academics_home_icon.svg",
      image: "assets/new/homework1.png",
    ),
    DashBoardModal(
      title: "Time Table",
      // image: "assets/icons/academicIcons/academics_time_table_icon.svg",
      image: "assets/new/timetable1.png",
    ),
    DashBoardModal(
      title: "Payroll",
      // image: "assets/icons/staff_icons/staff_payroll_icon.svg",
      image: "assets/new/payment1.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppUtil.customText(
                text: "Academics",
                style: const TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(() => const AcademicsFullScreen());
                },
                child: AppUtil.customText(
                  text: "View All",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ConstClass.themeColor,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: staffAcademicList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.to(() => const AdminAttendanceScreen());
                      break;
                    case 1:
                      Get.to(() => const AdminFillMarksScreen(
                            fromAdmin: true,
                          ));

                      break;
                    case 2:
                      Get.to(() => const AdminCoScholasticScreen(
                            fromAdmin: true,
                          ));
                      break;
                    case 3:
                      Get.to(() => const AdminHomeworkScreen());
                      break;

                    case 4:
                      Get.to(() => AdminReportCardScreen());
                      break;

                    default:
                      break;
                  }
                },
                child: buildAcademicWidget(staffAcademicList[index], context),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 6 / 3.2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
          ),
        ),
      ],
    );
  }
}
