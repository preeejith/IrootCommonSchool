import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:iroots/src/ui/profilepages/profilepage.dart';

class StudentOwnProfile extends StatefulWidget {
  const StudentOwnProfile({super.key});

  @override
  State<StudentOwnProfile> createState() => _StudentProfileListState();
}

class _StudentProfileListState extends State<StudentOwnProfile> {
  String selectedAcademicYear = "2024-2025";
  String? selectedClass;
  String? selectedSection;
  String? selectedClassId;
  String? selectedSectionId;

  int selectedBatchId = 21;
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetStudentProfile());
    // BlocProvider.of<MainBloc>(context).add(GettingStaffClassList());
    // _navtopreofile();

    super.initState();
  }

  // Sample student data - replace with your actual data source
  // void _showAcademicYearDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'Select Academic Year',
  //           style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //         content: SizedBox(
  //           width: double.minPositive,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 12),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(color: Colors.grey.shade300),
  //                   borderRadius: BorderRadius.circular(8),
  //                 ),
  //                 child: DropdownButton<String>(
  //                   value: selectedAcademicYear,
  //                   isExpanded: true,
  //                   underline: const SizedBox(),
  //                   items: context.read<MainBloc>().academicYears.map((year) {
  //                     return DropdownMenuItem<String>(
  //                       value: year['batchName'],
  //                       child: Text(
  //                         year['batchName'],
  //                         style: const TextStyle(fontSize: 16),
  //                       ),
  //                     );
  //                   }).toList(),
  //                   onChanged: (String? newValue) {
  //                     if (newValue != null) {
  //                       setState(() {
  //                         selectedAcademicYear = newValue;
  //                         // Find and set the corresponding batchId
  //                         final selectedBatch =
  //                             context.read<MainBloc>().academicYears.firstWhere(
  //                                   (year) => year['batchName'] == newValue,
  //                                 );
  //                         selectedBatchId = selectedBatch['batchId'];
  //                       });
  //                       Navigator.of(context).pop();
  //                     }
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Cancel'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _applyFilters() {
  //   // Implement your filter logic here
  //   // You can use selectedAcademicYear, selectedClass, selectedSection
  //   // to filter your data or make API calls

  //   print('Applied Filters:');
  //   print('Academic Year: $selectedAcademicYear');
  //   print('Class: $selectedClass');
  //   print('Section: $selectedSection');

  //   // Example: Refresh data with selected filters
  //   // context.read<MainBloc>().add(LoadDataWithFilters(
  //   //   academicYear: selectedAcademicYear,
  //   //   className: selectedClass,
  //   //   sectionName: selectedSection,
  //   // ));
  // }

  // void _showFilterDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return BlocBuilder<MainBloc, MainState>(
  //         builder: (context, state) {
  //           return AlertDialog(
  //             title: const Text(
  //               'Select Filters',
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             content: SizedBox(
  //               width: double.minPositive,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   // Academic Year Dropdown
  //                   // const Align(
  //                   //   alignment: Alignment.centerLeft,
  //                   //   child: Text(
  //                   //     'Academic Year',
  //                   //     style: TextStyle(
  //                   //       fontSize: 14,
  //                   //       fontWeight: FontWeight.w500,
  //                   //       color: Colors.grey,
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   // const SizedBox(height: 8),
  //                   // Container(
  //                   //   padding: const EdgeInsets.symmetric(horizontal: 12),
  //                   //   decoration: BoxDecoration(
  //                   //     border: Border.all(color: Colors.grey.shade300),
  //                   //     borderRadius: BorderRadius.circular(8),
  //                   //   ),
  //                   //   child: DropdownButton<String>(
  //                   //     value: selectedAcademicYear,
  //                   //     isExpanded: true,
  //                   //     underline: const SizedBox(),
  //                   //     hint: const Text('Select Academic Year'),
  //                   //     items:
  //                   //         context.read<MainBloc>().academicYears.map((year) {
  //                   //       return DropdownMenuItem<String>(
  //                   //         value: year['batchName'],
  //                   //         child: Text(
  //                   //           year['batchName'],
  //                   //           style: const TextStyle(fontSize: 16),
  //                   //         ),
  //                   //       );
  //                   //     }).toList(),
  //                   //     onChanged: null, // This disables the dropdown
  //                   //   ),

  //                   //   // DropdownButton<String>(
  //                   //   //   value: selectedAcademicYear,
  //                   //   //   isExpanded: true,
  //                   //   //   underline: const SizedBox(),
  //                   //   //   hint: const Text('Select Academic Year'),
  //                   //   //   items:
  //                   //   //       context.read<MainBloc>().academicYears.map((year) {
  //                   //   //     return DropdownMenuItem<String>(
  //                   //   //       value: year['batchName'],
  //                   //   //       child: Text(
  //                   //   //         year['batchName'],
  //                   //   //         style: const TextStyle(fontSize: 16),
  //                   //   //       ),
  //                   //   //     );
  //                   //   //   }).toList(),
  //                   //   //   onChanged: (String? newValue) {
  //                   //   //     // if (newValue != null) {
  //                   //   //     //   setState(() {
  //                   //   //     //     selectedAcademicYear = newValue;
  //                   //   //     //     // Find and set the corresponding batchId
  //                   //   //     //     final selectedBatch = context
  //                   //   //     //         .read<MainBloc>()
  //                   //   //     //         .academicYears
  //                   //   //     //         .firstWhere(
  //                   //   //     //           (year) => year['batchName'] == newValue,
  //                   //   //     //         );
  //                   //   //     //     selectedBatchId = selectedBatch['batchId'];
  //                   //   //     //   });
  //                   //   //     // }
  //                   //   //     // BlocProvider.of<MainBloc>(context)
  //                   //   //     //     .add(RefrestEvent());
  //                   //   //   },
  //                   //   // ),
  //                   // ),

  //                   const SizedBox(height: 16),

  //                   // Class Dropdown
  //                   const Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: Text(
  //                       'Class',
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w500,
  //                         color: Colors.grey,
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 8),
  //                   Container(
  //                     padding: const EdgeInsets.symmetric(horizontal: 12),
  //                     decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.grey.shade300),
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     child: DropdownButton<String>(
  //                       value: selectedClass,
  //                       isExpanded: true,
  //                       underline: const SizedBox(),
  //                       hint: const Text('Select Class'),
  //                       items: context
  //                           .read<MainBloc>()
  //                           .staffClassListModel!
  //                           .data!
  //                           .map((classItem) {
  //                         return DropdownMenuItem<String>(
  //                           value: classItem.dataListItemName.toString(),
  //                           child: Text(
  //                             classItem.dataListItemName.toString(),
  //                             style: const TextStyle(fontSize: 16),
  //                           ),
  //                         );
  //                       }).toList(),
  //                       onChanged: (String? newValue) {
  //                         if (newValue != null) {
  //                           setState(() {
  //                             selectedClass = newValue;
  //                             // Find and set the corresponding classId if needed
  //                             final selectedClassItem = context
  //                                 .read<MainBloc>()
  //                                 .staffClassListModel!
  //                                 .data!
  //                                 .firstWhere(
  //                                   (classItem) =>
  //                                       classItem.dataListItemName.toString() ==
  //                                       newValue,
  //                                 );
  //                             BlocProvider.of<MainBloc>(context).add(
  //                                 GettingStaffClassSectionList(
  //                                     classId: selectedClassItem.dataListItemId
  //                                         .toString()));
  //                             context
  //                                     .read<MainBloc>()
  //                                     .classlistIddropdownvalue =
  //                                 selectedClassItem.dataListItemId.toString();
  //                             selectedClassId = selectedClassItem.dataListItemId
  //                                 .toString(); // Assuming this field exists
  //                           });
  //                           BlocProvider.of<MainBloc>(context)
  //                               .add(RefrestEvent());
  //                         }
  //                       },
  //                     ),
  //                   ),

  //                   const SizedBox(height: 16),

  //                   // Section Dropdown
  //                   const Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: Text(
  //                       'Section',
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w500,
  //                         color: Colors.grey,
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 8),
  //                   Container(
  //                     padding: const EdgeInsets.symmetric(horizontal: 12),
  //                     decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.grey.shade300),
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     child: DropdownButton<String>(
  //                       value: selectedSection,
  //                       isExpanded: true,
  //                       underline: const SizedBox(),
  //                       hint: const Text('Select Section'),
  //                       items: context
  //                           .read<MainBloc>()
  //                           .staffSectionListModel!
  //                           .data!
  //                           .map((sectionItem) {
  //                         return DropdownMenuItem<String>(
  //                           value: sectionItem.sectionName.toString(),
  //                           child: Text(
  //                             sectionItem.sectionName.toString(),
  //                             style: const TextStyle(fontSize: 16),
  //                           ),
  //                         );
  //                       }).toList(),
  //                       onChanged: (String? newValue) {
  //                         if (newValue != null) {
  //                           setState(() {
  //                             selectedSection = newValue;
  //                             // Find and set the corresponding sectionId if needed
  //                             final selectedSectionItem = context
  //                                 .read<MainBloc>()
  //                                 .staffSectionListModel!
  //                                 .data!
  //                                 .firstWhere(
  //                                   (sectionItem) =>
  //                                       sectionItem.sectionName.toString() ==
  //                                       newValue,
  //                                 );

  //                             context
  //                                     .read<MainBloc>()
  //                                     .classsectionIdlistdropdownvalue =
  //                                 selectedSectionItem.sectionId.toString();
  //                             selectedSectionId = selectedSectionItem.sectionId
  //                                 .toString(); // Assuming this field exists
  //                           });
  //                           BlocProvider.of<MainBloc>(context)
  //                               .add(RefrestEvent());
  //                         }
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text('Cancel'),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   BlocProvider.of<MainBloc>(context).add(
  //                       GetStudentProfileList(
  //                           classId: context
  //                               .read<MainBloc>()
  //                               .classlistIddropdownvalue,
  //                           sectionId: context
  //                               .read<MainBloc>()
  //                               .classsectionIdlistdropdownvalue,
  //                           batchId: context
  //                               .read<MainBloc>()
  //                               .selectedBatchId
  //                               .toString()));
  //                   // Apply filters logic here
  //                   _applyFilters();
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text('Apply'),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF307AFD),
        elevation: 0,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.search, color: Colors.white),
          //   onPressed: () {
          //     // Implement search functionality
          //   },
          // ),
          // IconButton(
          //   icon: const Icon(Icons.filter_list, color: Colors.white),
          //   onPressed: () {
          //     // _showFilterDialog();
          //     // Implement filter functionality
          //   },
          // ),
        ],
      ),
      body: BlocConsumer<MainBloc, MainState>(
        buildWhen: (previous, current) =>
            current is StudentProfileListSuccess ||
            current is GettingStudentProfile ||
            current is StudentProflieListFailed ||
            current is StudentProfileListError,
        builder: (context, state) {
          if (state is GettingStudentProfile) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Data Not Found"));
          }
        },
        listenWhen: (previous, current) => current is StudentProfileListSuccess,
        listener: (context, state) {
          if (state is StudentProfileListSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                        index: 0,
                        studentProfileListModel:
                            context.read<MainBloc>().studentProfileListModel)));
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add new student functionality
      //   },
      //   backgroundColor: const Color(0xFF307AFD),
      //   child: const Icon(Icons.add, color: Colors.white),
      // ),
    );
  }

  Widget _buildStudentCard(int index) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return context.read<MainBloc>().studentProfileListModel == null
            ? SizedBox.shrink()
            : context.read<MainBloc>().studentProfileListModel.data!.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                    index: index,
                                    studentProfileListModel: context
                                        .read<MainBloc>()
                                        .studentProfileListModel)));
                        // _navigateToDetailView(student);
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            // Gender-based avatar
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: context
                                              .read<MainBloc>()
                                              .studentProfileListModel
                                              .data![index]
                                              .gender ==
                                          'Female'
                                      ? [
                                          Colors.pink.withOpacity(0.8),
                                          Colors.purple.withOpacity(0.8),
                                        ]
                                      : [
                                          const Color(0xFF307AFD)
                                              .withOpacity(0.8),
                                          const Color(0xFF704FEE)
                                              .withOpacity(0.8),
                                        ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Icon(
                                  context
                                              .read<MainBloc>()
                                              .studentProfileListModel
                                              .data![index]
                                              .gender ==
                                          'Female'
                                      ? Icons.person_2
                                      : Icons.person,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Student details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Student name
                                  Text(
                                    context
                                        .read<MainBloc>()
                                        .studentProfileListModel
                                        .data![index]
                                        .name
                                        .toString(),
                                    // student['name'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2D3748),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  // Father's name
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.family_restroom,
                                        size: 14,
                                        color: Colors.grey[600],
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          "Father: ${context.read<MainBloc>().studentProfileListModel.data![index].fatherName.toString() ?? 'N/A'}",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  // Student ID and Scholar No
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.badge,
                                        size: 14,
                                        color: Colors.grey[600],
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "ID: ${context.read<MainBloc>().studentProfileListModel.data![index].studentID.toString()} | Scholar: ${context.read<MainBloc>().studentProfileListModel.data![index].scholarNo.toString()}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  // Father's mobile
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: 14,
                                        color: Colors.grey[600],
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        context
                                                .read<MainBloc>()
                                                .studentProfileListModel
                                                .data![index]
                                                .fMobile
                                                .toString() ??
                                            'No contact',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color(0xFF307AFD),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Arrow icon
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
      },
    );
  }

  void _navigateToDetailView(Map<String, dynamic> student) {
    // TODO: Navigate to detailed student profile view (to be implemented)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Detailed view for ${student['name']} - Coming Soon!"),
        backgroundColor: const Color(0xFF307AFD),
      ),
    );
  }
}
