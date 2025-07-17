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
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "My Profile",
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
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Top Header with Profile Info
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.blueAccent, width: 2),
                          ),
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/219/219983.png'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Emma Watson',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Class XII • Roll No. 2099',
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
                        indicatorColor: const Color.fromARGB(255, 5, 54, 201),
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
                                '11-11-2000'),
                            _buildDisplayField('Gender', 'Female'),
                            _buildDisplayField('Blood Group', 'B+'),
                            _buildDisplayField(
                                'Address', 'Lorem Ipsum Dummy Text'),
                            Row(
                              children: [
                                Expanded(
                                    child: _buildDisplayField('City', 'Dummy')),
                                const SizedBox(width: 12),
                                Expanded(
                                    child:
                                        _buildDisplayField('State', 'Dummy')),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: _buildDisplayField(
                                        'Postal Code', '45887')),
                                const SizedBox(width: 12),
                                Expanded(
                                    child:
                                        _buildDisplayField('Country', 'Dummy')),
                              ],
                            ),
                            _buildDisplayField('Nationality', 'Indian'),
                            _buildDisplayField('Transport Facility', 'Yes'),
                            Row(
                              children: [
                                Expanded(
                                    child: _buildDisplayField('Class', 'XII')),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: _buildDisplayField('Section', 'C')),
                              ],
                            ),
                            _buildDisplayField('Community', 'Yes'),
                            const SizedBox(height: 32),
                            _buildSectionHeader('Father\'s Details'),
                            const SizedBox(height: 16),
                            _buildDisplayField(
                                "Father's Name", 'Andrew Watson'),
                            _buildDisplayField("Email", 'andrew7357@gmail.com'),
                            _buildDisplayField("Occupation", 'Business Man'),
                            _buildDisplayField("Mobile", '9876-876-879'),
                            const SizedBox(height: 32),
                            _buildSectionHeader('Mother\'s Details'),
                            const SizedBox(height: 16),
                            _buildDisplayField("Mother's Name", 'Leena Watson'),
                            _buildDisplayField("Email", 'leena5467@gmail.com'),
                            _buildDisplayField("Occupation", 'Housewife'),
                            _buildDisplayField("Mobile", '5678-878-986'),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),

                      // Academic Info Tab
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Academic Info",
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
          // Padding(
          //   padding: const EdgeInsets.only(left: 4, bottom: 6),
          //   child: Text(
          //     label,
          //     style: const TextStyle(
          //       fontSize: 13,
          //       color: Colors.black87,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  // height: 1,
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
                          Text(
                            label,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            value,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   height: 1,
              //   color: Color(0xff307AFD),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
