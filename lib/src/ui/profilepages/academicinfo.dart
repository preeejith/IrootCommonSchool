// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iroots/bloc/mainbloc.dart';

// class AcademicInfoTab extends StatefulWidget {
//   const AcademicInfoTab({super.key});

//   @override
//   State<AcademicInfoTab> createState() => _AcademicInfoTabState();
// }

// class _AcademicInfoTabState extends State<AcademicInfoTab> {
//   final Color primaryColor = const Color(0xFF307AFD);
//   final List<String> years = ['2020', '2021', '2022', '2023', 'All'];
//   String selectedYear = 'All';

//   final List<Map<String, dynamic>> attendance = [
//     {
//       'batch': '2020',
//       'class': 'XI',
//       'section': 'BLUE',
//       'days': 277,
//       'percent': '81.70%'
//     },
//     {
//       'batch': '2021',
//       'class': 'XII',
//       'section': 'BLUE',
//       'days': 187,
//       'percent': '78.70%'
//     },
//     {
//       'batch': '2022',
//       'class': 'XII',
//       'section': 'BLUE',
//       'days': 274,
//       'percent': '80.70%'
//     }
//   ];

//   final List<Map<String, dynamic>> marks = [
//     {
//       'batch': '2020',
//       'class': 'XI',
//       'section': 'BLUE',
//       'term': 'Term - II',
//       'total': 788
//     },
//     {
//       'batch': '2021',
//       'class': 'XII',
//       'section': 'BLUE',
//       'term': 'Term - I',
//       'total': 978
//     },
//     {
//       'batch': '2022',
//       'class': 'XII',
//       'section': 'BLUE',
//       'term': 'Term - II',
//       'total': 989
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: BlocBuilder<MainBloc, MainState>(
//         builder: (context, state) {
//           if (state is GettingAcademicProfile) {
//             return CircularProgressIndicator();
//           } else if (state is AcademicProfileSuccess) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Year Filter Buttons

//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: years.map((year) {
//                       final bool isSelected = selectedYear == year;
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
//                         child: ChoiceChip(
//                           label: Text(year),
//                           selected: isSelected,
//                           onSelected: (_) =>
//                               setState(() => selectedYear = year),
//                           selectedColor: primaryColor,
//                           labelStyle: TextStyle(
//                               color: isSelected ? Colors.white : Colors.black),
//                           backgroundColor: Colors.grey[200],
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),

//                 // Row(
//                 //   children: years.map((year) {
//                 //     final bool isSelected = selectedYear == year;
//                 //     return Padding(
//                 //       padding: const EdgeInsets.symmetric(horizontal: 2.0),
//                 //       child: ChoiceChip(
//                 //         label: Text(year),
//                 //         selected: isSelected,
//                 //         onSelected: (_) => setState(() => selectedYear = year),
//                 //         selectedColor: primaryColor,
//                 //         labelStyle: TextStyle(
//                 //             color: isSelected ? Colors.white : Colors.black),
//                 //         backgroundColor: Colors.grey[200],
//                 //       ),
//                 //     );
//                 //   }).toList(),
//                 // ),
//                 const SizedBox(height: 20),
//                 const Text('Attendance',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 _buildTable(
//                     headers: ['Batch', 'Class', 'Section', 'Days', '%'],
//                     data: attendance),
//                 const SizedBox(height: 20),
//                 const Text('Marks',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 _buildTable(
//                     headers: ['Batch', 'Class', 'Section', 'Term', 'Total'],
//                     data: marks),
//               ],
//             );
//           } else {
//             return SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildTable(
//       {required List<String> headers,
//       required List<Map<String, dynamic>> data}) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         children: [
//           Container(
//             color: primaryColor,
//             child: Row(
//               children: headers
//                   .map((header) => _buildCell(header, isHeader: true))
//                   .toList(),
//             ),
//           ),
//           ...data
//               .where((entry) =>
//                   selectedYear == 'All' || entry['batch'] == selectedYear)
//               .map(
//                 (row) => Row(
//                   children: headers
//                       .map((key) =>
//                           _buildCell(row[key.toLowerCase()]?.toString() ?? ''))
//                       .toList(),
//                 ),
//               ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCell(String text, {bool isHeader = false}) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           border: Border(right: BorderSide(color: Colors.grey[300]!)),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//             color: isHeader ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:iroots/src/modal/attendance/new/academicprofileinfomodel.dart';

class AcademicInfoTab extends StatefulWidget {
  const AcademicInfoTab({super.key});

  @override
  State<AcademicInfoTab> createState() => _AcademicInfoTabState();
}

class _AcademicInfoTabState extends State<AcademicInfoTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final Color primaryColor = const Color(0xFF307AFD);
  String selectedYear = 'All';
  List<String> years = ['All'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) =>
            current is GettingAcademicProfile ||
            current is AcademicProfileSuccess,
        builder: (context, state) {
          if (state is GettingAcademicProfile) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AcademicProfileSuccess) {
            // Extract unique years from all data sources
            _updateYearsList(state.academicProfileInfoModel);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Year Filter Buttons
                _buildYearFilter(),
                const SizedBox(height: 20),

                // Attendance Section
                if (state.academicProfileInfoModel!.data?.attendanceSummaries
                        ?.isNotEmpty ==
                    true)
                  _buildAttendanceSection(state
                      .academicProfileInfoModel!.data!.attendanceSummaries!),

                // Test Percentages Section
                if (state.academicProfileInfoModel!.data?.testPercentages
                        ?.isNotEmpty ==
                    true) ...[
                  const SizedBox(height: 20),
                  _buildTestPercentagesSection(
                      state.academicProfileInfoModel!.data!.testPercentages!),
                ],

                // Co-Scholastic Results Section
                if (state.academicProfileInfoModel!.data?.coScholasticResults
                        ?.isNotEmpty ==
                    true) ...[
                  const SizedBox(height: 20),
                  _buildCoScholasticSection(state
                      .academicProfileInfoModel!.data!.coScholasticResults!),
                ],
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void _updateYearsList(AcademicProfileInfoModel? model) {
    Set<String> uniqueYears = {'All'};

    // Extract years from attendance summaries
    model!.data?.attendanceSummaries?.forEach((item) {
      if (item.batchName != null) {
        uniqueYears.add(item.batchName!);
      }
    });

    // Extract years from test percentages
    model.data?.testPercentages?.forEach((item) {
      if (item.batchName != null) {
        uniqueYears.add(item.batchName!);
      }
    });

    // Extract years from co-scholastic results
    model.data?.coScholasticResults?.forEach((item) {
      if (item.batchName != null) {
        uniqueYears.add(item.batchName!);
      }
    });

    years = uniqueYears.toList();

    // Ensure selected year is valid
    if (!years.contains(selectedYear)) {
      selectedYear = 'All';
    }
  }

  Widget _buildYearFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: years.map((year) {
          final bool isSelected = selectedYear == year;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: ChoiceChip(
              label: Text(year),
              selected: isSelected,
              onSelected: (_) => setState(() => selectedYear = year),
              selectedColor: primaryColor,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              backgroundColor: Colors.grey[200],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAttendanceSection(List<AttendanceSummaries> attendanceData) {
    final filteredData = _filterAttendanceData(attendanceData);

    if (filteredData.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Attendance',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildAttendanceTable(filteredData),
      ],
    );
  }

  Widget _buildTestPercentagesSection(List<TestPercentages> testData) {
    final filteredData = _filterTestData(testData);

    if (filteredData.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Marks',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildTestTable(filteredData),
      ],
    );
  }

  Widget _buildCoScholasticSection(List<CoScholasticResults> coScholasticData) {
    final filteredData = _filterCoScholasticData(coScholasticData);

    if (filteredData.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Co-Scholastic Activities',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildCoScholasticTable(filteredData),
      ],
    );
  }

  List<AttendanceSummaries> _filterAttendanceData(
      List<AttendanceSummaries> data) {
    if (selectedYear == 'All') return data;
    return data.where((item) => item.batchName == selectedYear).toList();
  }

  List<TestPercentages> _filterTestData(List<TestPercentages> data) {
    if (selectedYear == 'All') return data;
    return data.where((item) => item.batchName == selectedYear).toList();
  }

  List<CoScholasticResults> _filterCoScholasticData(
      List<CoScholasticResults> data) {
    if (selectedYear == 'All') return data;
    return data.where((item) => item.batchName == selectedYear).toList();
  }

  Widget _buildAttendanceTable(List<AttendanceSummaries> data) {
    const headers = ['Batch', 'Total Days', 'Present Days', 'Attendance %'];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          // Header
          Container(
            color: primaryColor,
            child: Row(
              children: headers
                  .map((header) => _buildCell(header, isHeader: true))
                  .toList(),
            ),
          ),
          // Data rows
          ...data.map((item) => Row(
                children: [
                  _buildCell(item.batchName ?? 'N/A'),
                  _buildCell(item.totalDays?.toString() ?? '0'),
                  _buildCell(item.presentDays?.toString() ?? '0'),
                  _buildCell('${item.attendancePercent?.toString() ?? '0'}%'),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildTestTable(List<TestPercentages> data) {
    const headers = ['Batch', 'Term ID', 'Percentage', 'Grade'];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          // Header
          Container(
            color: primaryColor,
            child: Row(
              children: headers
                  .map((header) => _buildCell(header, isHeader: true))
                  .toList(),
            ),
          ),
          // Data rows
          ...data.map((item) => Row(
                children: [
                  _buildCell(item.batchName ?? 'N/A'),
                  _buildCell(item.termId?.toString() ?? 'N/A'),
                  _buildCell(
                      '${item.percentage?.toStringAsFixed(2) ?? '0.00'}%'),
                  _buildCell(item.grade ?? 'N/A'),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildCoScholasticTable(List<CoScholasticResults> data) {
    const headers = ['Batch', 'Activity', 'Grade'];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          // Header
          Container(
            color: primaryColor,
            child: Row(
              children: headers
                  .map((header) => _buildCell(header, isHeader: true))
                  .toList(),
            ),
          ),
          // Data rows
          ...data.map((item) => Row(
                children: [
                  _buildCell(item.batchName ?? 'N/A'),
                  _buildCell(item.title ?? 'N/A'),
                  _buildCell(item.obtainedGrade ?? 'N/A'),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildCell(String text, {bool isHeader = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey[300]!)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: isHeader ? Colors.white : Colors.black,
            fontSize: isHeader ? 14 : 13,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
