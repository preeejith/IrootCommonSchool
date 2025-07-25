import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:iroots/src/ui/profilepages/profilepage.dart';

class AdminStudentProfileList extends StatefulWidget {
  const AdminStudentProfileList({super.key});

  @override
  State<AdminStudentProfileList> createState() => _StudentProfileListState();
}

class _StudentProfileListState extends State<AdminStudentProfileList> {
  String selectedAcademicYear = "2024-2025";
  String? selectedClass;
  String? selectedSection;
  String? selectedClassId;
  String? selectedSectionId;

  int selectedBatchId = 21;
  @override
  void initState() {
    // BlocProvider.of<MainBloc>(context).add(GetStudentProfile());
    BlocProvider.of<MainBloc>(context).add(GettingAdminClassList());
    // BlocProvider.of<MainBloc>(context).add(GettingStaffClassSectionList());
    // BlocProvider.of<MainBloc>(context).add(GetStudentProfileList());

    super.initState();
  }

  // Sample student data - replace with your actual data source
  void _showAcademicYearDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Select Academic Year',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: SizedBox(
            width: double.minPositive,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: selectedAcademicYear,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: context.read<MainBloc>().academicYears.map((year) {
                      return DropdownMenuItem<String>(
                        value: year['batchName'],
                        child: Text(
                          year['batchName'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedAcademicYear = newValue;
                          // Find and set the corresponding batchId
                          final selectedBatch =
                              context.read<MainBloc>().academicYears.firstWhere(
                                    (year) => year['batchName'] == newValue,
                                  );
                          selectedBatchId = selectedBatch['batchId'];
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _applyFilters() {
    // Implement your filter logic here
    // You can use selectedAcademicYear, selectedClass, selectedSection
    // to filter your data or make API calls

    print('Applied Filters:');
    print('Academic Year: $selectedAcademicYear');
    print('Class: $selectedClass');
    print('Section: $selectedSection');

    // Example: Refresh data with selected filters
    // context.read<MainBloc>().add(LoadDataWithFilters(
    //   academicYear: selectedAcademicYear,
    //   className: selectedClass,
    //   sectionName: selectedSection,
    // ));
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return AlertDialog(
              title: const Text(
                'Select Filters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: SizedBox(
                width: double.minPositive,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Academic Year Dropdown
                    // const Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     'Academic Year',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 8),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 12),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey.shade300),
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: DropdownButton<String>(
                    //     value: selectedAcademicYear,
                    //     isExpanded: true,
                    //     underline: const SizedBox(),
                    //     hint: const Text('Select Academic Year'),
                    //     items:
                    //         context.read<MainBloc>().academicYears.map((year) {
                    //       return DropdownMenuItem<String>(
                    //         value: year['batchName'],
                    //         child: Text(
                    //           year['batchName'],
                    //           style: const TextStyle(fontSize: 16),
                    //         ),
                    //       );
                    //     }).toList(),
                    //     onChanged: null, // This disables the dropdown
                    //   ),

                    //   // DropdownButton<String>(
                    //   //   value: selectedAcademicYear,
                    //   //   isExpanded: true,
                    //   //   underline: const SizedBox(),
                    //   //   hint: const Text('Select Academic Year'),
                    //   //   items:
                    //   //       context.read<MainBloc>().academicYears.map((year) {
                    //   //     return DropdownMenuItem<String>(
                    //   //       value: year['batchName'],
                    //   //       child: Text(
                    //   //         year['batchName'],
                    //   //         style: const TextStyle(fontSize: 16),
                    //   //       ),
                    //   //     );
                    //   //   }).toList(),
                    //   //   onChanged: (String? newValue) {
                    //   //     // if (newValue != null) {
                    //   //     //   setState(() {
                    //   //     //     selectedAcademicYear = newValue;
                    //   //     //     // Find and set the corresponding batchId
                    //   //     //     final selectedBatch = context
                    //   //     //         .read<MainBloc>()
                    //   //     //         .academicYears
                    //   //     //         .firstWhere(
                    //   //     //           (year) => year['batchName'] == newValue,
                    //   //     //         );
                    //   //     //     selectedBatchId = selectedBatch['batchId'];
                    //   //     //   });
                    //   //     // }
                    //   //     // BlocProvider.of<MainBloc>(context)
                    //   //     //     .add(RefrestEvent());
                    //   //   },
                    //   // ),
                    // ),

                    const SizedBox(height: 16),

                    // Class Dropdown
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Class',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: selectedClass,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text('Select Class'),
                        items: context
                            .read<MainBloc>()
                            .adminClassListModel
                            .data!
                            .map((classItem) {
                          return DropdownMenuItem<String>(
                            value: classItem.dataListItemName.toString(),
                            child: Text(
                              classItem.dataListItemName.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedClass = newValue;
                              // Find and set the corresponding classId if needed
                              final selectedClassItem = context
                                  .read<MainBloc>()
                                  .adminClassListModel
                                  .data!
                                  .firstWhere(
                                    (classItem) =>
                                        classItem.dataListItemName.toString() ==
                                        newValue,
                                  );
                              BlocProvider.of<MainBloc>(context).add(
                                  GettingAdminClassSectionList(
                                      classId: selectedClassItem.dataListItemId
                                          .toString()));
                              context
                                      .read<MainBloc>()
                                      .classlistIddropdownvalue =
                                  selectedClassItem.dataListItemId.toString();
                              selectedClassId = selectedClassItem.dataListItemId
                                  .toString(); // Assuming this field exists
                            });
                            BlocProvider.of<MainBloc>(context)
                                .add(RefrestEvent());
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Section Dropdown
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Section',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: selectedSection,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text('Select Section'),
                        items: context
                            .read<MainBloc>()
                            .adminClassSectionModel!
                            .data!
                            .map((sectionItem) {
                          return DropdownMenuItem<String>(
                            value: sectionItem.dataListItemId.toString(),
                            child: Text(
                              sectionItem.dataListItemName.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedSection = newValue;
                              // Find and set the corresponding sectionId if needed
                              final selectedSectionItem = context
                                  .read<MainBloc>()
                                  .adminClassSectionModel!
                                  .data!
                                  .firstWhere(
                                    (sectionItem) =>
                                        sectionItem.dataListItemId.toString() ==
                                        newValue,
                                  );

                              context
                                      .read<MainBloc>()
                                      .classsectionIdlistdropdownvalue =
                                  selectedSectionItem.dataListItemId.toString();
                              selectedSectionId = selectedSectionItem
                                  .dataListItemId
                                  .toString(); // Assuming this field exists
                            });
                            BlocProvider.of<MainBloc>(context)
                                .add(RefrestEvent());
                            BlocProvider.of<MainBloc>(context)
                                .add(RefrestEvent());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<MainBloc>(context).add(
                        GetAdminStudentProfile(
                            classId: context
                                .read<MainBloc>()
                                .classlistIddropdownvalue,
                            sectionId: context
                                .read<MainBloc>()
                                .classsectionIdlistdropdownvalue,
                            batchId: context
                                .read<MainBloc>()
                                .selectedBatchId
                                .toString()));
                    // Apply filters logic here
                    _applyFilters();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Students Profile",
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
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              _showFilterDialog();
              // Implement filter functionality
            },
          ),
        ],
      ),
      body: BlocConsumer<MainBloc, MainState>(
        listenWhen: (previous, current) =>
            current is ClassAdminListSuccess ||
            current is ClassStaffSectionListSuccess,
        listener: (context, state) {
          if (state is ClassAdminListSuccess) {
            BlocProvider.of<MainBloc>(context)
                .add(GettingAdminClassSectionList(classId: state.classId));
          } else if (state is ClassStaffSectionListSuccess) {
            BlocProvider.of<MainBloc>(context).add(GetAdminStudentProfile());
          }
        },
        buildWhen: (previous, current) =>
            current is GettingStudentProfile ||
            current is StudentProfileListSuccess ||
            current is StudentProflieListFailed ||
            current is StudentProfileListError,
        // current is RefreshPrvState ||
        // current is RefreshState,
        builder: (context, state) {
          if (state is StudentProfileListSuccess) {
            return context.read<MainBloc>().studentProfileListModel == null
                ? Center(child: CircularProgressIndicator())
                : context.read<MainBloc>().studentProfileListModel.data == null
                    ? Center(child: CircularProgressIndicator())
                    : context
                            .read<MainBloc>()
                            .studentProfileListModel
                            .data!
                            .isEmpty
                        ? Center(child: Text("No Data Found"))
                        : Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF307AFD),
                                  Color(0xFF704FEE),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                // context.read<MainBloc>().staffSectionListModel ==
                                //         null
                                //     ? SizedBox.shrink()
                                //     : context
                                //             .read<MainBloc>()
                                //             .staffSectionListModel!
                                //             .data!
                                //             .isEmpty
                                //         ? SizedBox.shrink()
                                //         : Text(context
                                //             .read<MainBloc>()
                                //             .staffSectionListModel!
                                //             .data![0]
                                //             .sectionName
                                //             .toString()),
                                // context.read<MainBloc>().staffClassListModel ==
                                //         null
                                //     ? SizedBox.shrink()
                                //     : context
                                //             .read<MainBloc>()
                                //             .staffClassListModel!
                                //             .data!
                                //             .isEmpty
                                //         ? SizedBox.shrink()
                                //         : Text(context
                                //             .read<MainBloc>()
                                //             .staffClassListModel!
                                //             .data![0]
                                //             .dataListItemName
                                //             .toString()),
                                // Header section
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total Students: ${context.read<MainBloc>().studentProfileListModel.data!.length}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: _showAcademicYearDialog,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "Academic Year 2025-26",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          color: const Color.fromARGB(
                                              255, 227, 212, 212),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${context.read<MainBloc>().studentProfileListModel.data![0].classs}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "|  Section: ${context.read<MainBloc>().studentProfileListModel.data![0].section}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Students list
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF5F7FA),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: ListView.builder(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 20, 16, 16),
                                      itemCount: context
                                          .read<MainBloc>()
                                          .studentProfileListModel
                                          .data!
                                          .length,
                                      itemBuilder: (context, index) {
                                        return _buildStudentCard(index);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
          } else {
            return Center(child: CircularProgressIndicator());
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
