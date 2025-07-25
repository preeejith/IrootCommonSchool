// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Column(
//             children: [
//               // Top Header Section
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF4169E1), Color(0xFF6A5ACD)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     const CircleAvatar(
//                       radius: 30,
//                       backgroundImage: NetworkImage(
//                         'https://cdn-icons-png.flaticon.com/512/219/219983.png',
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Emma Watson',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Class XII   Roll No. 2099',
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               // Tabs
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                   ),
//                 ),
//                 child: TabBar(
//                   labelColor: Colors.blue,
//                   unselectedLabelColor: Colors.black54,
//                   indicatorColor: Colors.blue,
//                   tabs: const [
//                     Tab(text: 'Basic Details'),
//                     Tab(text: 'Academic Info'),
//                     Tab(text: 'Accounts'),
//                   ],
//                 ),
//               ),

//               // TabBarView Content
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     // Basic Details Tab
//                     SingleChildScrollView(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         children: [
//                           _buildTextField(
//                               'Date Of Birth (as per Birth certificate)'),
//                           _buildTextField('Gender'),
//                           _buildTextField('Blood Group'),
//                           _buildTextField('Address'),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('City')),
//                               const SizedBox(width: 10),
//                               Expanded(child: _buildTextField('State')),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('Postal Code')),
//                               const SizedBox(width: 10),
//                               Expanded(child: _buildTextField('Country')),
//                             ],
//                           ),
//                           _buildTextField('Nationality'),
//                           _buildTextField('Transport Facility'),
//                           Row(
//                             children: [
//                               Expanded(child: _buildTextField('Class')),
//                               const SizedBox(width: 10),
//                               Expanded(child: _buildTextField('Section')),
//                             ],
//                           ),
//                           _buildTextField('Community'),
//                           const SizedBox(height: 24),
//                           const Divider(thickness: 1),
//                           const SizedBox(height: 10),
//                           const Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Father’s Detail',
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           _buildTextField("Father's Name"),
//                           _buildTextField('Email'),
//                           _buildTextField('Occupation'),
//                           _buildTextField('Mobile'),
//                           const SizedBox(height: 24),
//                           const Divider(thickness: 1),
//                           const SizedBox(height: 10),
//                           const Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Mother’s Detail',
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           _buildTextField("Mother's Name"),
//                           _buildTextField('Email'),
//                           _buildTextField('Occupation'),
//                           _buildTextField('Mobile'),
//                         ],
//                       ),
//                     ),

//                     // Academic Info Tab Placeholder
//                     const Center(child: Text("Academic Info (Coming Soon)")),

//                     // Accounts Tab Placeholder
//                     const Center(child: Text("Accounts Info (Coming Soon)")),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String hint) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: TextFormField(
//         decoration: InputDecoration(
//           hintText: hint,
//           filled: true,
//           fillColor: const Color(0xFFF6F6F6),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         ),
//       ),
//     );
//   }
// }

//////last
library;

// import 'package:flutter/material.dart';
// import 'package:iroots/src/modal/attendance/new/studentlistmodel.dart';

// class ProfileScreen extends StatefulWidget {
//   final StudentProfileListModel? studentProfileListModel;
//   final int? index;

//   const ProfileScreen({super.key, this.studentProfileListModel, this.index});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: const Text(
//             "My Profile",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           centerTitle: true,
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 5, 54, 201),
//                   Color.fromARGB(255, 55, 99, 231),
//                   Color.fromARGB(255, 143, 130, 227),
//                 ],
//                 // begin: Alignment.topLeft,
//                 // end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           iconTheme: const IconThemeData(color: Colors.white),
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               // Top Header with Profile Info
//               Container(
//                 width: double.infinity,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 5, 54, 201),
//                       Color.fromARGB(255, 55, 99, 231),
//                       Color.fromARGB(255, 143, 130, 227)
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 19.0),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border:
//                                 Border.all(color: Colors.blueAccent, width: 2),
//                           ),
//                           child: const CircleAvatar(
//                             radius: 35,
//                             backgroundImage: NetworkImage(
//                                 'https://cdn-icons-png.flaticon.com/512/219/219983.png'),
//                           ),
//                         ),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 widget.studentProfileListModel!
//                                     .data![widget.index!].name
//                                     .toString(),
//                                 // 'Emma Watson',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 'Class XII • Roll No. 2099',
//                                 style: TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // Tab Bar Section
//               Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 5, 54, 201),
//                       Color.fromARGB(255, 55, 99, 231),
//                       Color.fromARGB(255, 143, 130, 227)
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey[50],
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 8),
//                       TabBar(
//                         labelColor: const Color.fromARGB(255, 5, 54, 201),
//                         unselectedLabelColor: Colors.black54,
//                         indicatorColor: const Color.fromARGB(255, 5, 54, 201),
//                         indicatorWeight: 3,
//                         labelStyle: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         unselectedLabelStyle: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         tabs: const [
//                           Tab(text: 'Basic Details'),
//                           Tab(text: 'Academic Info'),
//                           Tab(text: 'Accounts'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // TabBarView Content
//               Expanded(
//                 child: Container(
//                   color: Colors.grey[50],
//                   child: TabBarView(
//                     children: [
//                       // BASIC DETAILS TAB
//                       SingleChildScrollView(
//                         padding: const EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildDisplayField(
//                                 'Date Of Birth (as per Birth certificate)',
//                                 '11-11-2000'),
//                             _buildDisplayField('Gender', 'Female'),
//                             _buildDisplayField('Blood Group', 'B+'),
//                             _buildDisplayField(
//                                 'Address', 'Lorem Ipsum Dummy Text'),
//                             Row(
//                               children: [
//                                 Expanded(
//                                     child: _buildDisplayField('City', 'Dummy')),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                     child:
//                                         _buildDisplayField('State', 'Dummy')),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                     child: _buildDisplayField(
//                                         'Postal Code', '45887')),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                     child:
//                                         _buildDisplayField('Country', 'Dummy')),
//                               ],
//                             ),
//                             _buildDisplayField('Nationality', 'Indian'),
//                             _buildDisplayField('Transport Facility', 'Yes'),
//                             Row(
//                               children: [
//                                 Expanded(
//                                     child: _buildDisplayField('Class', 'XII')),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                     child: _buildDisplayField('Section', 'C')),
//                               ],
//                             ),
//                             _buildDisplayField('Community', 'Yes'),
//                             const SizedBox(height: 32),
//                             _buildSectionHeader('Father\'s Details'),
//                             const SizedBox(height: 16),
//                             _buildDisplayField(
//                                 "Father's Name", 'Andrew Watson'),
//                             _buildDisplayField("Email", 'andrew7357@gmail.com'),
//                             _buildDisplayField("Occupation", 'Business Man'),
//                             _buildDisplayField("Mobile", '9876-876-879'),
//                             const SizedBox(height: 32),
//                             _buildSectionHeader('Mother\'s Details'),
//                             const SizedBox(height: 16),
//                             _buildDisplayField("Mother's Name", 'Leena Watson'),
//                             _buildDisplayField("Email", 'leena5467@gmail.com'),
//                             _buildDisplayField("Occupation", 'Housewife'),
//                             _buildDisplayField("Mobile", '5678-878-986'),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),

//                       // Academic Info Tab
//                       Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.school_outlined,
//                               size: 64,
//                               color: Colors.grey[400],
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               "Academic Info",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               "Coming Soon",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[500],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       // Accounts Tab
//                       Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.account_balance_outlined,
//                               size: 64,
//                               color: Colors.grey[400],
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               "Accounts Info",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               "Coming Soon",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[500],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [
//             Color.fromARGB(255, 5, 54, 201),
//             Color.fromARGB(255, 55, 99, 231),
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Widget _buildDisplayField(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.only(left: 4, bottom: 6),
//           //   child: Text(
//           //     label,
//           //     style: const TextStyle(
//           //       fontSize: 13,
//           //       color: Colors.black87,
//           //       fontWeight: FontWeight.w500,
//           //     ),
//           //   ),
//           // ),
//           Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Container(
//                   width: double.infinity,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                   // height: 1,
//                   color: Color(0xff307AFD),
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 2.0),
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 14),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.grey.shade300),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.shade200,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             label,
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: Colors.black87,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Text(
//                             value,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.black87,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // Container(
//               //   width: double.infinity,
//               //   height: 1,
//               //   color: Color(0xff307AFD),
//               // )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:iroots/src/modal/attendance/new/studentlistmodel.dart';
import 'package:iroots/src/ui/profilepages/academicinfo.dart';

class ProfileScreen extends StatefulWidget {
  final StudentProfileListModel? studentProfileListModel;
  final int? index;

  const ProfileScreen({super.key, this.studentProfileListModel, this.index});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Helper method to get student data
  Data? get studentData =>
      widget.studentProfileListModel?.data?[widget.index ?? 0];

  // Helper method to safely get string value
  String getStringValue(String? value, [String defaultValue = 'N/A']) {
    return value?.isNotEmpty == true ? value! : defaultValue;
  }

  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetAcademicProfile(
        studnetId: widget
            .studentProfileListModel!.data![widget.index!].studentID
            .toString(),
        batchId: widget.studentProfileListModel!.data![widget.index!].batchId.toString()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            " ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 5, 54, 201),
                  Color.fromARGB(255, 55, 99, 231),
                  Color.fromARGB(255, 143, 130, 227),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: studentData == null
              ? Center(child: Text("No Data Found"))
              : Column(
                  children: [
                    // Top Header with Profile Info
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 5, 54, 201),
                            Color.fromARGB(255, 55, 99, 231),
                            Color.fromARGB(255, 143, 130, 227)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 19.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 2),
                                ),
                                child: CircleAvatar(
                                  radius: 35,
                                  child: ClipOval(
                                    child:
                                        //     Image.network(
                                        //   'https://nirmalaujjain.lumensof.in/WebsiteImages/StudentPhoto/logo1.png',
                                        // )

                                        Image.network(
                                      'https://nirmalaujjain.lumensof.in/WebsiteImages/StudentPhoto/logo1.png',
                                      fit: BoxFit.cover,
                                      width: 70,
                                      height: 70,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        // Fallback to default image on any error (including SSL)
                                        return Image.network(
                                          'https://cdn-icons-png.flaticon.com/512/219/219983.png',
                                          fit: BoxFit.cover,
                                          width: 70,
                                          height: 70,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            // Ultimate fallback to icon if both images fail
                                            return Icon(
                                              Icons.person,
                                              size: 35,
                                              color: Colors.grey,
                                            );
                                          },
                                        );
                                      },
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     shape: BoxShape.circle,
                              //     border:
                              //         Border.all(color: Colors.blueAccent, width: 2),
                              //   ),
                              //   child: CircleAvatar(
                              //     radius: 35,
                              //     backgroundImage: NetworkImage(getStringValue(
                              //         'https://nirmalaujjain.lumensof.in/WebsiteImages/StudentPhoto/logo1.png'
                              //         // studentData?.profilePicture,
                              //         // 'https://cdn-icons-png.flaticon.com/512/219/219983.png'

                              //         )),
                              //   ),
                              // ),
                              SizedBox(width: 16),
                              // Text(studentData!.profilePicture.toString()),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      getStringValue(
                                          studentData?.name, 'Student Name'),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${getStringValue(studentData?.classs, 'N/A')} • Section ${getStringValue(studentData?.section, 'N/A')}',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Tab Bar Section
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 5, 54, 201),
                            Color.fromARGB(255, 55, 99, 231),
                            Color.fromARGB(255, 143, 130, 227)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            TabBar(
                              labelColor: const Color.fromARGB(255, 5, 54, 201),
                              unselectedLabelColor: Colors.black54,
                              indicatorColor:
                                  const Color.fromARGB(255, 5, 54, 201),
                              indicatorWeight: 3,
                              labelStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              unselectedLabelStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              tabs: const [
                                Tab(text: 'Basic Details'),
                                Tab(text: 'Academic Info'),
                                Tab(text: 'Accounts'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // TabBarView Content
                    Expanded(
                      child: Container(
                        color: Colors.grey[50],
                        child: TabBarView(
                          children: [
                            // BASIC DETAILS TAB
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDisplayField(
                                      'Date Of Birth (as per Birth certificate)',
                                      getStringValue(studentData?.dob)),
                                  _buildDisplayField('Gender',
                                      getStringValue(studentData?.gender)),
                                  _buildDisplayField('Blood Group',
                                      getStringValue(studentData?.bloodGroup)),
                                  _buildDisplayField(
                                      'Address',
                                      getStringValue(
                                          studentData?.fResidentialAddress)),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: _buildDisplayField(
                                              'City',
                                              getStringValue(
                                                  studentData?.city))),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: _buildDisplayField(
                                              'State',
                                              getStringValue(
                                                  studentData?.state))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: _buildDisplayField(
                                              'Postal Code',
                                              getStringValue(
                                                  studentData?.pincode))),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: _buildDisplayField('Country',
                                              'India')), // Default as not in model
                                    ],
                                  ),
                                  _buildDisplayField('Nationality',
                                      'Indian'), // Default as not in model
                                  _buildDisplayField('Transport Facility',
                                      'N/A'), // Not in model
                                  Row(
                                    children: [
                                      Expanded(
                                          child: _buildDisplayField(
                                              'Class',
                                              getStringValue(
                                                  studentData?.classs))),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: _buildDisplayField(
                                              'Section',
                                              getStringValue(
                                                  studentData?.section))),
                                    ],
                                  ),
                                  _buildDisplayField('Community',
                                      getStringValue(studentData?.category)),
                                  // _buildDisplayField('Scholar No.',
                                  //     getStringValue(studentData?.scholarNo)),
                                  // _buildDisplayField('Religion',
                                  //     getStringValue(studentData?.religion)),
                                  // _buildDisplayField('Caste',
                                  //     getStringValue(studentData?.castName)),
                                  // _buildDisplayField('Aadhar No.',
                                  //     getStringValue(studentData?.adharNo)),
                                  const SizedBox(height: 32),
                                  _buildSectionHeader('Father\'s Details'),
                                  const SizedBox(height: 16),
                                  _buildDisplayField("Father's Name",
                                      getStringValue(studentData?.fatherName)),
                                  _buildDisplayField("Email",
                                      getStringValue(studentData?.feMail)),
                                  _buildDisplayField(
                                      "Occupation", 'N/A'), // Not in model
                                  _buildDisplayField("Mobile",
                                      getStringValue(studentData?.fMobile)),
                                  const SizedBox(height: 32),
                                  _buildSectionHeader('Mother\'s Details'),
                                  const SizedBox(height: 16),
                                  _buildDisplayField("Mother's Name",
                                      getStringValue(studentData?.motherName)),
                                  _buildDisplayField("Email",
                                      getStringValue(studentData?.parentEmail)),
                                  _buildDisplayField(
                                      "Occupation", 'N/A'), // Not in model
                                  _buildDisplayField("Mobile",
                                      'N/A'), // Mother's mobile not in model
                                  const SizedBox(height: 32),
                                  // _buildSectionHeader('Academic Details'),
                                  // const SizedBox(height: 16),
                                  // _buildDisplayField("School",
                                  //     getStringValue(studentData?.school)),
                                  // _buildDisplayField(
                                  //     "Admission Date",
                                  //     getStringValue(
                                  //         studentData?.admissionDate)),
                                  // _buildDisplayField(
                                  //     "Promotion Date",
                                  //     getStringValue(
                                  //         studentData?.promotionDate)),
                                  // _buildDisplayField(
                                  //     "Current Year",
                                  //     studentData?.currentYear?.toString() ??
                                  //         'N/A'),
                                  // _buildDisplayField("Subjects",
                                  //     getStringValue(studentData?.subjects)),
                                  // _buildDisplayField(
                                  //     "Optional Subjects",
                                  //     getStringValue(
                                  //         studentData?.optionalSubjects)),
                                  // _buildDisplayField(
                                  //     "Application Number",
                                  //     getStringValue(
                                  //         studentData?.applicationNumber)),
                                  // _buildDisplayField("APAAR ID",
                                  //     getStringValue(studentData?.apaarId)),
                                  // const SizedBox(height: 32),
                                  // _buildSectionHeader('Bank Details'),
                                  // const SizedBox(height: 16),
                                  // _buildDisplayField("Bank Account",
                                  //     getStringValue(studentData?.bankAccount)),
                                  // _buildDisplayField("Bank Name",
                                  //     getStringValue(studentData?.bankName)),
                                  // _buildDisplayField(
                                  //     "Account Holder",
                                  //     getStringValue(
                                  //         studentData?.bankACHolder)),
                                  // _buildDisplayField("IFSC Code",
                                  //     getStringValue(studentData?.bankIFSC)),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),

                            // Academic Info Tab

                            AcademicInfoTab(),
                            // Center(
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.school_outlined,
                            //         size: 64,
                            //         color: Colors.grey[400],
                            //       ),
                            //       const SizedBox(height: 16),
                            //       Text(
                            //         "Academic Info",
                            //         style: TextStyle(
                            //           fontSize: 18,
                            //           fontWeight: FontWeight.w600,
                            //           color: Colors.grey[600],
                            //         ),
                            //       ),
                            //       const SizedBox(height: 8),
                            //       Text(
                            //         "Coming Soon",
                            //         style: TextStyle(
                            //           fontSize: 14,
                            //           color: Colors.grey[500],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            // Accounts Tab
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.account_balance_outlined,
                                    size: 64,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Accounts Info",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Coming Soon",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 5, 54, 201),
            Color.fromARGB(255, 55, 99, 231),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildDisplayField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  color: Color(0xff307AFD),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              label,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
