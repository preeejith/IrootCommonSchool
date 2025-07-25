import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iroots/bloc/bloclocalstorage/prefmanager.dart';
import 'package:iroots/bloc/blocmodels/AdminModels/admindashboardmodel.dart';
import 'package:iroots/bloc/blocmodels/adminexmpublishmodel.dart';
import 'package:iroots/bloc/blocmodels/currentversionmodel.dart';
import 'package:iroots/bloc/blocmodels/dashboardstudentmodel.dart';
import 'package:iroots/bloc/blocmodels/getclasslistmodel.dart';
import 'package:iroots/bloc/blocmodels/homeworkdeletemodel.dart';
import 'package:iroots/bloc/blocmodels/merchentdetailsmodel.dart';
import 'package:iroots/bloc/blocmodels/paymentcapturemodel.dart';
import 'package:iroots/bloc/blocmodels/paymentinputresponsemodel.dart';
import 'package:iroots/bloc/blocmodels/shopdetailsmodel.dart';
import 'package:iroots/bloc/blocmodels/studentfeelistmodel.dart';
import 'package:iroots/bloc/blocmodels/studentreportcardmodel.dart';
import 'package:iroots/bloc/blocserver/serverhelper.dart';
import 'package:iroots/newscreens/studentattendancemodel.dart';
import 'package:iroots/src/modal/attendance/new/academicprofileinfomodel.dart';
import 'package:iroots/src/modal/attendance/new/adminclasslistmodel.dart';
import 'package:iroots/src/modal/attendance/new/adminsectionlistmodel.dart';
import 'package:iroots/src/modal/attendance/new/staffclasslistmodel.dart';
import 'package:iroots/src/modal/attendance/new/staffsectionlistmodel.dart';
import 'package:iroots/src/modal/attendance/new/studentlistmodel.dart';

class MainBloc extends Bloc<MainEvents, MainState> {
  ShopDetailedModel shopDetailedModel = ShopDetailedModel();
  StudentFeeListModel studentFeeListModel = StudentFeeListModel();

  StudentProfileListModel studentProfileListModel = StudentProfileListModel();
  AcademicProfileInfoModel academicProfileInfoModel =
      AcademicProfileInfoModel();
  StudentAttendanceModel studentAttendanceModel = StudentAttendanceModel();
  PreparePaymentRepsonseModel preparePaymentRepsonseModel =
      PreparePaymentRepsonseModel();
  AdminExmPublishDetailsModel adminExmPublishDetailsModel =
      AdminExmPublishDetailsModel();
  StudReportCardModel studReportCardModel = StudReportCardModel();
  StudReportCardModel studReportCardModelunit2 = StudReportCardModel();
  DashboardProfileModel dashboardProfileModel = DashboardProfileModel();
  ClassListModel classListModel = ClassListModel();
  MerchentDetailsModel merchentDetailsModel = MerchentDetailsModel();
  HomeWorkDeleteModel homeWorkDeleteModel = HomeWorkDeleteModel();
  CaptureModel captureModel = CaptureModel();
  CurrentVersionModel currentVersionModel = CurrentVersionModel();
  AdminDashboardModel adminDashboardModel = AdminDashboardModel();
  int selectedBatchId = 22;
  String? classdropdownvalue = "";
  String? classlistdropdownvalue = "";
  String? classlistIddropdownvalue = "";
  String? adminclasslistdropdownvalue = "";
  String? adminlistIddropdownvalue = "";

  String? classsectionlistdropdownvalue = "";
  String? latestversion = "0";
  bool? term1exmhpn = false;
  bool? term2exmhpn = false;
  bool? term3exmhpn = false;
  String? studentclass = "";
  String? studentIdnew = "";
  String? studentSection = "";
  String? studentrollnumber = "";
  double attendancepercentage = 1.0;
  String? merchentId = "";
  String? encryptKey = "";
  String? decryptKey = "";
  String? paymentpassword = "";
  StaffClassListModel? staffClassListModel = StaffClassListModel();
  StaffSectionListModel? staffSectionListModel = StaffSectionListModel();
  AdminClassSectionModel? adminClassSectionModel = AdminClassSectionModel();

  StudReportCardModel studReportCardModelunit3 = StudReportCardModel();
  AdminClassListModel adminClassListModel = AdminClassListModel();

  String? classsectionIdlistdropdownvalue;
  double totalfeeamount = 0;
  String? nameStudent;
  String feeHeading = "";
  String feeId = "";
  String? classId = "";
  String? currentDropDate = "2025";
  String? currenStarttDropDate = "2024";

  final List<Map<String, dynamic>> academicYears = [
    {"batchId": 1, "batchName": "2022-2023"},
    {"batchId": 20, "batchName": "2023-2024"},
    {"batchId": 21, "batchName": "2024-2025"},
    {"batchId": 22, "batchName": "2025-2026"},
  ];

  MainBloc() : super(LoginInitial()) {
    on<GetStudentFeeList>(getStudentfeelist);
    on<GetStudentProfileList>(getStudentProfileList);

    on<GetAdminStudentProfile>(getAdminStudentProfile);
    on<GetStudentProfile>(getStudentProfile);
    on<GetAcademicProfile>(getAcademicProfile);
    on<GettingStaffClassSectionList>(gettingStaffClassSectionList);
    on<GettingStaffClassList>(gettingStaffClassList);
    on<GettingAdminClassList>(gettingAdminClassList);
    on<GetStudentGradeCard>(getStudentGradeCard);
    on<GetStudentTotalamount>(getStudentTotalamount);
    on<GetStudentAttendance>(getStudentAttendance);
    on<GetPreparePayment>(getPreparePayment);
    on<GetAdminExmPublishDetails>(getAdminExmPublishDetails);
    on<GetDashboardStudentData>(getDashboardStudentData);
    on<GetMerchentData>(getMerchentData);
    on<GettingAdminClassSectionList>(gettingAdminClassSectionList);

    on<GetCapturePaymentResponse>(getCapturePaymentResponse);
    on<GetClassList>(getClassList);
    on<GetAdminDashboard>(getAdminDashboard);

    on<GetCurrentVersion>(getCurrentVersion);
    on<HomeWorkDelete>(homeWorkDelete);
    on<UpdateClassDropdownValue>(updateClassDropdownValue);
    on<RefrestEvent>((event, emit) async {
      emit(RefreshPrvState());
      emit(RefreshState());
    });
  }

  Future<FutureOr<void>> getStudentTotalamount(
      GetStudentTotalamount event, Emitter<MainState> emit) async {
    try {
      feeHeading = "";
      feeId = "";
      totalfeeamount = 0; // Initialize the totalfeeamount
      // Initialize an empty string for the fee headings
      if (studentFeeListModel.feeDetails != null) {
        for (int i = 0; i < studentFeeListModel.feeDetails!.length; i++) {
          if (studentFeeListModel.feeDetails![i].checkboxvalue == true) {
            // Add the fee value to the total
            totalfeeamount += double.parse(
                studentFeeListModel.feeDetails![i].feeValue.toString());

            // Concatenate the fee heading to the string (with a comma separator)
            if (feeHeading.isNotEmpty) {
              feeHeading += ","; // Add a comma between items
            }
            feeHeading += studentFeeListModel.feeDetails![i].feeName.toString();
            if (feeId.isNotEmpty) {
              feeId += ",";
            }
            feeId += studentFeeListModel.feeDetails![i].feeId.toString();
          }
        }
      }

      // You can now use feeHeading, which will have the comma-separated fee headings
      print("Total Fee Amount: $totalfeeamount");
      print("Fee Headings: $feeHeading");
      print("Fee Headings: $feeId");
      // Emit the state (can include both totalfeeamount and feeHeading if needed)
      emit(Gettingstudentamount());
    } catch (e) {
      emit(StudentFeeAmountError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getStudentAttendance(
      GetStudentAttendance event, Emitter<MainState> emit) async {
    try {
      var token = await PrefManager.getToken();
      String? sstudntId = "";
      String? classsId = "";
      String? sessionId = "";
      emit(GettingStudentAttendance());

      String jsonString1 = await PrefManager.getAdditionalInfo();

      String jsonstring2 = jsonString1;

      List<dynamic> studentList = jsonDecode(jsonstring2);

      sstudntId = studentList[0]["StudentRegisterId"].toString();
      classId = studentList[0]["ClassId"].toString();
      sessionId = studentList[0]["SectionId"].toString();
      print(sstudntId);
      print(classId);
      print(sessionId);
      Map data = {
        // "id": event.shopId,
      };
      studentAttendanceModel =
          StudentAttendanceModel.fromJson(await ServerHelper.ohYespost(
              'Dashboard/StudentsDashBoardAttendanceDetails?startDate=2025-01-01&endDate=2025-12-01&classId=$classId&sectionId=$sessionId&fromYear=$currenStarttDropDate&toYear=$currentDropDate&studentId=$studentIdnew',

              // 'Dashboard/StudentsDashBoardAttendanceDetails?startDate=2023-01-01&endDate=2024-01-01&classId=205&sectionId=24&fromYear=2023&toYear=2023&studentId=1215',
              data,
              token));
      if (studentAttendanceModel.responseCode == "200") {
        emit(StudentAttendanceSuccess());
      } else if (studentAttendanceModel.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(StudentAttendanceFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(StudentAttendanceError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getPreparePayment(
      GetPreparePayment event, Emitter<MainState> emit) async {
    try {
      emit(GettingReadyPaymentLoading());

      String jsonString1 = await PrefManager.getAdditionalInfo();

      String jsonstring2 = jsonString1;

      // "[{\"StudentRegisterId\":5826,\"ApplicationNumber\":\"2143\",\"Uin\":\"e9640888-c4e4-4599-a578-7719b0df8941\",\"Date\":null,\"Name\":\"STUTI \",\"Class\":null,\"Section\":null,\"Gender\":\"Female\",\"Rte\":null,\"Medium\":\"ENGLISH\",\"Caste\":null,\"AgeInWords\":0,\"Dob\":\"04-Jun-2010\",\"Pob\":\"UJJAIN\",\"Nationality\":\"INDIAN\",\"Religion\":null,\"MotherTongue\":\"HINDI\",\"Category\":\"General\",\"BloodGroup\":null,\"MedicalHistory\":null,\"Hobbies\":null,\"Sports\":null,\"OtherDetails\":null,\"ProfileAvatar\":null,\"MarkForIdentity\":null,\"AdharNo\":\"385208903564\",\"AdharFile\":null,\"OtherLanguages\":null,\"IsApplyforTc\":false,\"IsApplyforAdmission\":false,\"IsApprove\":191,\"IsActive\":false,\"IsInsertFromAd\":null,\"IsAdmissionPaid\":null,\"AddedDate\":\"2024-07-06T00:00:00\",\"ModifiedDate\":\"2024-07-06T00:00:00\",\"Ip\":\"198.12.225.42\",\"UserId\":\"2575\",\"IsDeleted\":false,\"CreateBy\":0,\"CurrentYear\":2024,\"InsertBy\":null,\"BatchName\":null,\"Email\":null,\"LastStudiedSchoolName\":null,\"ParentsEmail\":\"suvidhaelectronic.ujjain@gmail.com\",\"ClassId\":205,\"SectionId\":24,\"LastName\":\" PATHAK\",\"BatchId\":21,\"BatchName1\":null,\"BloodGroupId\":0,\"ReligionId\":176,\"CastId\":252,\"CategoryId\":27,\"ClassName\":null,\"SectionName\":null,\"Transport\":null,\"TransportOptions\":null,\"Mobile\":null,\"AdmissionFeePaid\":null,\"City\":null,\"State\":null,\"Pincode\":null,\"AddedYear\":\"2024\",\"RegistrationDate\":\"16/06/2016\",\"IsEmailsent\":false,\"PromotionDate\":\"06/07/2024\",\"PromotionYear\":\"2024\",\"EmailSendDate\":null,\"EmailSend\":0,\"GradeDivision\":\"7th - GREEN\",\"House\":\"\",\"Hostel\":\"\",\"Status\":\"Active\",\"SssmidNumber\":\"176772821\",\"Role\":\"Parent\",\"Designation\":\"\",\"IsRtestudent\":\"\",\"IsInDayCare\":\"No\",\"FamilySssmid\":\"39326060\",\"BankAccount\":null,\"BankName\":null,\"BankAcholder\":null,\"BankIfsc\":null,\"Subjects\":\"English Lit., Hindi, Mathematics, Computer, G.K., Moral Science, Sanskrit, Drawing, SUPW, English Lang., History & Civics, Geography, Physics, Chemistry, Biology\",\"OptionalSubjects\":\"\",\"School\":\"Nirmala Convent School\",\"IsUserLoggedIn\":\"User Logged-In\",\"LastLoginDate\":\"04-Dec-2020\",\"RollNo\":null,\"ScholarNo\":null}]";

      // Decode the JSON string into a List
      List<dynamic> studentList = jsonDecode(jsonstring2);
      var token = await PrefManager.getToken();
      // Extract the ApplicationNumber from the first element (assuming the structure remains consistent)
      String applicationNumber = studentList[0]["ApplicationNumber"];
      num studentId = studentList[0]["StudentRegisterId"];
      num classId = studentList[0]["ClassId"];
      String parentsEmail = studentList[0]["ParentsEmail"];
      nameStudent = studentList[0]["Name"];
      classId = studentList[0]["ClassId"];

      print("Application Number: $applicationNumber");

      Map data = {
        "studentId": studentIdnew.toString(),
        "class": classId.toString(),
        "category": "",
        "tcBal": totalfeeamount.toInt().toString(),
        "feeHeadings": feeId.toString(),
        "feeheadingamt": totalfeeamount.toInt().toString(),
        "concessionAmt": 0,
        "concession": 0,
        "dueFee": "0",
        "email": parentsEmail.toString(),
        "paymentGatewayName": "atom"
      };
      preparePaymentRepsonseModel = PreparePaymentRepsonseModel.fromJson(
          await ServerHelper.ohYespost('Paymet/PreapareInput/', data, token));
      if (preparePaymentRepsonseModel.data != null) {
        emit(PaymentInputResSuccess());
      } else if (preparePaymentRepsonseModel.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(PaymentResponFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(PaymentResponError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getAdminExmPublishDetails(
      GetAdminExmPublishDetails event, Emitter<MainState> emit) async {
    try {
      emit(GettingAdminExmPublishDetails());

      String jsonString1 = await PrefManager.getAdditionalInfo();

      String jsonstring2 = jsonString1;
      List<dynamic> studentList = jsonDecode(jsonstring2);
      var token = await PrefManager.getToken();

      String applicationNumber = studentList[0]["ApplicationNumber"];
      num studentId = studentList[0]["StudentRegisterId"];
      // num classId = studentList[0]["ClassId"];
      // String parentsEmail = studentList[0]["ParentsEmail"];
      num? batchId = studentList[0]["BatchId"];
      // num classId2 = studentList[0]["ClassId"];

      print("Application Number: $applicationNumber");

      adminExmPublishDetailsModel =
          AdminExmPublishDetailsModel.fromJson(await ServerHelper.getohYes(
        'Student/GetStudentCurrentYearResult?StudentId=${studentIdnew.toString()}&BatchId=${batchId.toString()}',
      ));
      if (adminExmPublishDetailsModel.data != null) {
        emit(AdminExmDetailsSuccess());
      } else if (adminExmPublishDetailsModel.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(AdminExmDetailsFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(AdminExmDetailsError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getClassList(
      GetClassList event, Emitter<MainState> emit) async {
    try {
      emit(GettingClassList());

      classListModel = ClassListModel.fromJson(
          await ServerHelper.post('Exam/GetClassList?staff_Id=119', ""));
      if (classListModel.data != null) {
        classdropdownvalue =
            classListModel.data![0].dataListItemName.toString();
        emit(ClassListSuccess());
      } else if (classListModel.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(ClassListFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(ClassListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> gettingStaffClassList(
      GettingStaffClassList event, Emitter<MainState> emit) async {
    try {
      String? staffId = await PrefManager.getStaffId();
      emit(GettingStafffClassList());

      staffClassListModel = StaffClassListModel.fromJson(
          await ServerHelper.post(
              'Exam/GetStaffClassList?staff_Id=$staffId', ""));
      if (staffClassListModel!.data != null) {
        classlistdropdownvalue =
            staffClassListModel!.data![0].dataListItemName.toString();
        classlistIddropdownvalue =
            staffClassListModel!.data![0].dataListItemId.toString();
        emit(ClassStaffListSuccess(
            classId: staffClassListModel!.data![0].dataListItemId.toString()));
      } else if (staffClassListModel!.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(ClassStaffFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(ClassStaffListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> gettingAdminClassList(
      GettingAdminClassList event, Emitter<MainState> emit) async {
    try {
      emit(GettingAdminnClassList());

      adminClassListModel = AdminClassListModel.fromJson(await ServerHelper.get(
        'Exam/DataItemList?Id=5',
      ));
      if (adminClassListModel.data != null) {
        classlistdropdownvalue =
            adminClassListModel.data![0].dataListItemName.toString();
        classlistIddropdownvalue =
            adminClassListModel.data![0].dataListItemId.toString();
        emit(ClassAdminListSuccess(
            classId: adminClassListModel.data![0].dataListItemId.toString()));
      } else if (adminClassListModel.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(ClassAdminFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(ClassAdminListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> gettingAdminClassSectionList(
      GettingAdminClassSectionList event, Emitter<MainState> emit) async {
    try {
      emit(GettingStafffClassSectionList());

      adminClassSectionModel =
          AdminClassSectionModel.fromJson(await ServerHelper.get(
        'Exam/DataItemList?Id=6',
      ));
      if (adminClassSectionModel!.data != null) {
        classsectionlistdropdownvalue =
            adminClassSectionModel!.data![0].dataListItemName.toString();
        classsectionIdlistdropdownvalue =
            adminClassSectionModel!.data![0].dataListItemId.toString();
        // classlistdropdownvalue =
        //     staffSectionListModel!.data![0].dataListItemName.toString();
        emit(ClassStaffSectionListSuccess());
      } else if (adminClassSectionModel!.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(ClassStaffSectionFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(ClassStaffSectionListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> gettingStaffClassSectionList(
      GettingStaffClassSectionList event, Emitter<MainState> emit) async {
    try {
      String? staffId = await PrefManager.getStaffId();
      emit(GettingStafffClassSectionList());

      staffSectionListModel =
          StaffSectionListModel.fromJson(await ServerHelper.get(
        'Exam/GetStaffSectionList?staffId=$staffId&classId=${event.classId}',
      ));
      if (staffSectionListModel!.data != null) {
        classsectionlistdropdownvalue =
            staffSectionListModel!.data![0].sectionName.toString();
        classsectionIdlistdropdownvalue =
            staffSectionListModel!.data![0].sectionId.toString();
        // classlistdropdownvalue =
        //     staffSectionListModel!.data![0].dataListItemName.toString();
        emit(ClassStaffSectionListSuccess());
      } else if (staffSectionListModel!.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(ClassStaffSectionFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(ClassStaffSectionListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getAdminDashboard(
      GetAdminDashboard event, Emitter<MainState> emit) async {
    try {
      emit(GettingAdminDashboard());

      adminDashboardModel = AdminDashboardModel.fromJson(
          await ServerHelper.post(
              'Dashboard/AdminDashBoard?RoleName=Administrator', ""));
      if (adminDashboardModel.data != null) {
        emit(AdminDashboardSuccess());
      } else if (adminDashboardModel.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(AdminDashboardFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(AdminDashboardError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getCurrentVersion(
      GetCurrentVersion event, Emitter<MainState> emit) async {
    try {
      emit(GettingVersion());

      currentVersionModel = CurrentVersionModel.fromJson(await ServerHelper.get(
        'Dashboard/MobileAppVersion',
      ));
      if (currentVersionModel.data != null) {
        emit(VersionSuccess());
        latestversion =
            currentVersionModel.data!.mobileApp![0].versionName.toString();
      } else if (currentVersionModel.responseCode != "200") {
        emit(VersionFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(VersionFailed(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> homeWorkDelete(
      HomeWorkDelete event, Emitter<MainState> emit) async {
    try {
      emit(DeletingHomeWork());

      homeWorkDeleteModel = HomeWorkDeleteModel.fromJson(
          await ServerHelper.post(
              'Exam/DeleteHomeWork?Id=${event.assignmentId}', ""));
      if (homeWorkDeleteModel.responseCode == "200") {
        Fluttertoast.showToast(msg: homeWorkDeleteModel.msg.toString());
        emit(HomeWorkDeleteSuccess());
      } else if (homeWorkDeleteModel.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(HomeWorkFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(HomeWorkFailed(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> updateClassDropdownValue(
      UpdateClassDropdownValue event, Emitter<MainState> emit) async {
    try {
      classdropdownvalue = event.newValue;
      emit(GettingClassList());
    } catch (e) {
      emit(ClassListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getDashboardStudentData(
      GetDashboardStudentData event, Emitter<MainState> emit) async {
    try {
      emit(GettingDashboardprofile());
      String jsonString1 = await PrefManager.getAdditionalInfo();
      String jsonstring2 = jsonString1;
      List<dynamic> studentList = jsonDecode(jsonstring2);
      var token = await PrefManager.getToken();

      String applicationNumber = studentList[0]["ApplicationNumber"];
      num studentId = studentList[0]["StudentRegisterId"];

      print("Application Number: $applicationNumber");

      dashboardProfileModel =
          DashboardProfileModel.fromJson(await ServerHelper.getohYes(
        'Paymet/GetStudnetDetails?ApplicatioNo=$applicationNumber',
      ));
      if (dashboardProfileModel.data != null) {
        emit(DashboardProfileSuccess());
        studentSection = dashboardProfileModel.data![0].section.toString();
        studentIdnew = dashboardProfileModel.data![0].studentId.toString();
        studentclass = dashboardProfileModel.data![0].classs.toString();
        studentrollnumber = dashboardProfileModel.data![0].rollNo.toString();
        String attendanceper =
            dashboardProfileModel.data![0].attendance.toString();
        List<String> parts = attendanceper.split("/");
        int attended = int.parse(parts[0]);
        int total = int.parse(parts[1]);
        double percentage = attended / total;
        String percentageString = percentage.toStringAsFixed(2);
        attendancepercentage = double.parse(percentageString.toString());
      } else if (dashboardProfileModel.responseCode != "200") {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(DashboardProfileFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(DashboardProfileError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getMerchentData(
      GetMerchentData event, Emitter<MainState> emit) async {
    try {
      emit(GettingMerchentDetails());

      merchentDetailsModel =
          MerchentDetailsModel.fromJson(await ServerHelper.getohYes(
        'Paymet/MarchentDetails',
      ));
      if (merchentDetailsModel.data != null) {
        merchentId = merchentDetailsModel.data!.marchentId.toString();
        encryptKey = merchentDetailsModel.data!.encryptKey.toString();
        decryptKey = merchentDetailsModel.data!.decryptKey.toString();
        paymentpassword = merchentDetailsModel.data!.password.toString();
        emit(MerchentDetailsSuccess());
      } else if (merchentDetailsModel.data == null) {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(MerchentDetailsFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(MerchentDetailsError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getCapturePaymentResponse(
      GetCapturePaymentResponse event, Emitter<MainState> emit) async {
    try {
      emit(GettingPreparepaymentcapture());
      String jsonString1 = await PrefManager.getAdditionalInfo();
      String jsonstring2 = jsonString1;
      List<dynamic> studentList = jsonDecode(jsonstring2);
      var token = await PrefManager.getToken();

      String applicationNumber = studentList[0]["ApplicationNumber"];
      num studentId = studentList[0]["StudentRegisterId"];

      print("Application Number: $applicationNumber");
      Map data = {
        "studentName": preparePaymentRepsonseModel.data!.studentName.toString(),
        "fatherName": preparePaymentRepsonseModel.data!.fatherName.toString(),
        "contact": preparePaymentRepsonseModel.data!.contact.toString(),
        "class": studentclass.toString(),
        "section": preparePaymentRepsonseModel.data!.section.toString(),
        "category": preparePaymentRepsonseModel.data!.category.toString(),
        "roleNumber": preparePaymentRepsonseModel.data!.roleNumber.toString(),
        "tcBal":
            // int.parse(
            //     preparePaymentRepsonseModel.data!.feeheadingamt!.toString()),
            preparePaymentRepsonseModel.data!.feeheadingamt.toString(),
        "studentid": preparePaymentRepsonseModel.data!.studentid.toString(),
        "feeHeadings": feeId.toString(),
        "feeheadingamt":
            preparePaymentRepsonseModel.data!.feeheadingamt!.toString(),
        // int.parse(
        //     preparePaymentRepsonseModel.data!.feeheadingamt!.toString()),
        "applicationNumber":
            preparePaymentRepsonseModel.data!.applicationNumber.toString(),
        "concession": preparePaymentRepsonseModel.data!.concession.toString(),
        "concessionAmt":
            preparePaymentRepsonseModel.data!.concessionAmt.toString(),
        "key": preparePaymentRepsonseModel.data!.key.toString(),
        "amount": preparePaymentRepsonseModel.data!.amount!.toString(),
        "currency": preparePaymentRepsonseModel.data!.currency.toString(),
        "ordedrId": preparePaymentRepsonseModel.data!.ordedrId.toString(),
        "trackID": preparePaymentRepsonseModel.data!.ordedrId.toString(),
        "email": preparePaymentRepsonseModel.data!.custEmail.toString(),
        "classdetails":
            preparePaymentRepsonseModel.data!.classdetails.toString(),
        "accountType": preparePaymentRepsonseModel.data!.accountType.toString(),
        "mobileNO": preparePaymentRepsonseModel.data!.mobileNO.toString(),
        "atomTokenId": event.atomId.toString(),
        "paymentid": event.atomId.toString(),
        "custEmail": preparePaymentRepsonseModel.data!.custEmail.toString(),
        "custMobile": preparePaymentRepsonseModel.data!.custMobile.toString(),
        "merchId": preparePaymentRepsonseModel.data!.merchId.toString(),
        "returnurl": preparePaymentRepsonseModel.data!.returnurl.toString(),
        "FeeeId": preparePaymentRepsonseModel.data!.paymentid.toString()
      };
      print(data);
      log(data.toString());
      captureModel = CaptureModel.fromJson(await ServerHelper.ohYespost(
        'Paymet/CapturePaymentResponse?paymentgatewayName=Atomic',
        data,
        token,
      ));
      if (captureModel.message != null) {
        emit(PaymentCaptureSuccess(message: captureModel.message));
      } else if (captureModel.message == null) {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(PaymentCaptureFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(PaymentCaptureError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getAdminStudentProfile(
      GetAdminStudentProfile event, Emitter<MainState> emit) async {
    try {
      studentProfileListModel = StudentProfileListModel();
      String jsonString1 = await PrefManager.getAdditionalInfo();

      // String jsonstring2 = jsonString1;

      // List<dynamic> studentList = jsonDecode(jsonstring2);

      // String sstudntId = studentList[0]["ApplicationNumber"].toString();
      // String classIdd = studentList[0]["ClassId"].toString();
      // String sessionId = studentList[0]["SectionId"].toString();
      emit(GettingStudentProfile());
      print("kjcbaskj");
      // log('Student/StudnetsDetails?BatchId=$selectedBatchId&classId=$classIdd&SectionId=$sessionId&StudentId=$sstudntId');
      // studentProfileListModel =
      //     StudentProfileListModel.fromJson(await ServerHelper.get(
      //   'Student/StudnetsDetails?BatchId=$selectedBatchId&classId=$classIdd&SectionId=$sessionId&StudentId=$sstudntId',
      // ));
      // studentProfileListModel =
      //     StudentProfileListModel.fromJson(await ServerHelper.get(
      //   'Student/StudnetsDetails?BatchId=22&classId=199&SectionId=24',
      // ));
      studentProfileListModel =
          StudentProfileListModel.fromJson(await ServerHelper.get(
        'Student/StudnetsDetails?BatchId=$selectedBatchId&classId=$classlistIddropdownvalue&SectionId=$classsectionIdlistdropdownvalue&StudentId=0',
      ));
      if (studentProfileListModel.data != null) {
        emit(StudentProfileListSuccess());
      } else if (studentProfileListModel.data == null) {
        emit(StudentProflieListFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(StudentProfileListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getStudentProfile(
      GetStudentProfile event, Emitter<MainState> emit) async {
    try {
      studentProfileListModel = StudentProfileListModel();
      String jsonString1 = await PrefManager.getAdditionalInfo();

      String jsonstring2 = jsonString1;

      List<dynamic> studentList = jsonDecode(jsonstring2);

      String sstudntId = studentList[0]["ApplicationNumber"].toString();
      String classIdd = studentList[0]["ClassId"].toString();
      String sessionId = studentList[0]["SectionId"].toString();
      emit(GettingStudentProfile());
      print("kjcbaskj");
      https: //nirmalaapi.lumensof.in/api/Student/StudnetsDetails?BatchId=22&classId=197&SectionId=23&StudentId=0&Application=3899
      log('Student/StudnetsDetails?BatchId=$selectedBatchId&classId=$classIdd&SectionId=$sessionId&Application=$sstudntId&StudentId=0');
      studentProfileListModel =
          StudentProfileListModel.fromJson(await ServerHelper.get(
        'Student/StudnetsDetails?BatchId=$selectedBatchId&classId=$classIdd&SectionId=$sessionId&Application=$sstudntId&StudentId=0',
      ));
      // studentProfileListModel =
      //     StudentProfileListModel.fromJson(await ServerHelper.get(
      //   'Student/StudnetsDetails?BatchId=22&classId=197&SectionId=23&StudentId=1692',
      // ));

      if (studentProfileListModel.data!.isNotEmpty) {
        emit(StudentProfileListSuccess());
      } else if (studentProfileListModel.data!.isEmpty) {
        emit(StudentProflieListFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(StudentProfileListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getAcademicProfile(
      GetAcademicProfile event, Emitter<MainState> emit) async {
    try {
      academicProfileInfoModel = AcademicProfileInfoModel();

      emit(GettingAcademicProfile());
      print("kjcbaskj");
      // https://nirmalaapi.lumensof.in/api/Student/StudnetsDetails?BatchId=22&classId=197&SectionId=23&StudentId=0&Application=3899
      log('Student/GetStudnetSummeryBatchWise?StudentId=${event.studnetId}&BatchId=${event.batchId}');
      academicProfileInfoModel =
          AcademicProfileInfoModel.fromJson(await ServerHelper.get(
        'Student/GetStudnetSummeryBatchWise?StudentId=1937&BatchId=21',
        // 'Student/GetStudnetSummeryBatchWise?StudentId=${event.studnetId}&BatchId=${event.batchId}',
      ));

      if (academicProfileInfoModel.data != null) {
        emit(AcademicProfileSuccess(
            academicProfileInfoModel: academicProfileInfoModel));
      } else if (academicProfileInfoModel.data == null) {
        emit(AcademicProfileFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(AcademicProfileError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getStudentProfileList(
      GetStudentProfileList event, Emitter<MainState> emit) async {
    try {
      studentProfileListModel = StudentProfileListModel();

      emit(GettingStudentProfile());
      print("kjcbaskj");
      log('Student/StudnetsDetails?BatchId=$selectedBatchId&classId=$classlistIddropdownvalue&SectionId=$classsectionIdlistdropdownvalue&StudentId=0');
      studentProfileListModel =
          StudentProfileListModel.fromJson(await ServerHelper.get(
        'Student/StudnetsDetails?BatchId=$selectedBatchId&classId=$classlistIddropdownvalue&SectionId=$classsectionIdlistdropdownvalue&StudentId=0',
      ));

      if (studentProfileListModel.data!.isNotEmpty) {
        emit(StudentProfileListSuccess());
      } else if (studentProfileListModel.data!.isEmpty) {
        emit(StudentProflieListFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(StudentProfileListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getStudentfeelist(
      GetStudentFeeList event, Emitter<MainState> emit) async {
    try {
      emit(GettingShopDetails());
      String jsonString1 = await PrefManager.getAdditionalInfo();

      String jsonstring2 = jsonString1;
      List<dynamic> studentList = jsonDecode(jsonstring2);
      var token = await PrefManager.getToken();

      String applicationNumber = studentList[0]["ApplicationNumber"];
      studentFeeListModel = StudentFeeListModel.fromJson(await ServerHelper.get(
        'Paymet/get-student-fees?applicationNumber=$applicationNumber',
      ));
      if (studentFeeListModel.feeDetails!.isNotEmpty) {
        // servicebookId = shopDetailedModel.services![0].sId.toString();
        totalfeeamount = 0;
        // double.parse(studentFeeListModel.totalAmount.toString());

        emit(StudentFeeListSuccess());
      } else if (studentFeeListModel.feeDetails!.isEmpty) {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(StudentFeeListFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(StudentFeeListError(error: "Invalid credentials"));
    }
  }

  Future<FutureOr<void>> getStudentGradeCard(
      GetStudentGradeCard event, Emitter<MainState> emit) async {
    try {
      emit(GettingProgressCard());

      String jsonString1 = await PrefManager.getAdditionalInfo();

      String jsonstring2 = jsonString1;
      List<dynamic> studentList = jsonDecode(jsonstring2);

      String applicationNumber = studentList[0]["ApplicationNumber"];
      // num studentId = studentList[0]["StudentRegisterId"];
      num classId2 = studentList[0]["ClassId"];
      // String parentsEmail = studentList[0]["ParentsEmail"];
      nameStudent = studentList[0]["Name"];
      num? classId22 = studentList[0]["ClassId"];
      num? batchId = studentList[0]["BatchId"];
      num? sessionId22 = studentList[0]["SectionId"];
      try {
        term1exmhpn = true;
        studReportCardModel =
            StudReportCardModel.fromJson(await ServerHelper.get(
          'Exam/PrintReportCardData?termId=1&batchId=$batchId&ClassId=${classId22.toString()}&SectionId=${sessionId22.toString()}&ApplicationNo=${applicationNumber.toString()}',
        ));
      } catch (e) {
        term1exmhpn = false;
        print("issue found");
      }
      try {
        term2exmhpn = true;
        studReportCardModelunit2 =
            StudReportCardModel.fromJson(await ServerHelper.get(
          'Exam/PrintReportCardData?termId=2&batchId=$batchId&ClassId=$classId22&SectionId=$sessionId22&ApplicationNo=$applicationNumber',
        ));
      } catch (e) {
        term2exmhpn = false;
      }
      try {
        term3exmhpn = true;
        studReportCardModelunit3 =
            StudReportCardModel.fromJson(await ServerHelper.get(
          'Exam/PrintReportCardData?termId=3&batchId=$batchId&ClassId=$classId22&SectionId=$sessionId22&ApplicationNo=$applicationNumber',
        ));
      } catch (w) {
        term3exmhpn = false;
      }
      //
      //    'Exam/PrintReportCardData?termId=2&batchId=21&ClassId=205&SectionId=24&ApplicationNo=2143',

      print(
          "Exam/PrintReportCardData?termId=3&batchId=$batchId&ClassId=$classId22&SectionId=$sessionId22&ApplicationNo=$applicationNumber");
      if (studReportCardModel.studentData != null) {
        emit(ProgressCardSuccess());
      } else if (studReportCardModel.studentData != null) {
        // Helper.showToast(msg: myqpadshoplistModel.message);
        emit(ProgressCardFailed(error: "Invalid credentials"));
      }
    } catch (e) {
      emit(StudentProgreessCardError(error: "Invalid credentials"));
    }
  }
}

class MainEvents {}

class VerifyPassword extends MainEvents {
  final String? name, password;

  VerifyPassword({this.name, this.password});
}

class GetStudentFeeList extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GetStudentFeeList(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetStudentProfileList extends MainEvents {
  final String? classId, sectionId, batchId, username, searchkeyword;

  GetStudentProfileList(
      {this.classId,
      this.sectionId,
      this.batchId,
      this.username,
      this.searchkeyword});
}

class GetAdminStudentProfile extends MainEvents {
  final String? classId, sectionId, batchId, username, searchkeyword;

  GetAdminStudentProfile(
      {this.classId,
      this.sectionId,
      this.batchId,
      this.username,
      this.searchkeyword});
}

class GetStudentProfile extends MainEvents {
  final String? classId, sectionId, batchId, username, searchkeyword;

  GetStudentProfile(
      {this.classId,
      this.sectionId,
      this.batchId,
      this.username,
      this.searchkeyword});
}

class GetAcademicProfile extends MainEvents {
  final String? classId, studnetId, batchId, username, searchkeyword;

  GetAcademicProfile(
      {this.classId,
      this.studnetId,
      this.batchId,
      this.username,
      this.searchkeyword});
}

class GettingStaffClassList extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GettingStaffClassList(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GettingAdminClassList extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GettingAdminClassList(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GettingStaffClassSectionList extends MainEvents {
  final String? classId, lon, userphone, username, searchkeyword;

  GettingStaffClassSectionList(
      {this.classId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetStudentGradeCard extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GetStudentGradeCard(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetStudentTotalamount extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GetStudentTotalamount(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetStudentAttendance extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GetStudentAttendance(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetPreparePayment extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GetPreparePayment(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetAdminExmPublishDetails extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GetAdminExmPublishDetails(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetCapturePaymentResponse extends MainEvents {
  final String? atomId, lon, userphone, username, searchkeyword;

  GetCapturePaymentResponse(
      {this.atomId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetClassList extends MainEvents {
  final String? atomId, lon, userphone, username, searchkeyword;

  GetClassList(
      {this.atomId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetAdminDashboard extends MainEvents {
  final String? atomId, lon, userphone, username, searchkeyword;

  GetAdminDashboard(
      {this.atomId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetCurrentVersion extends MainEvents {
  final String? atomId, lon, userphone, username, searchkeyword;

  GetCurrentVersion(
      {this.atomId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class HomeWorkDelete extends MainEvents {
  final String? assignmentId, lon, userphone, username, searchkeyword;

  HomeWorkDelete(
      {this.assignmentId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class RefrestEvent extends MainEvents {
  final double? lat, lon;

  RefrestEvent({this.lat, this.lon});
}

class UpdateClassDropdownValue extends MainEvents {
  final String? newValue, lon, userphone, username, searchkeyword;

  UpdateClassDropdownValue(
      {this.newValue,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetDashboardStudentData extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GetDashboardStudentData(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GetMerchentData extends MainEvents {
  final String? shopId, lon, userphone, username, searchkeyword;

  GetMerchentData(
      {this.shopId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class GettingAdminClassSectionList extends MainEvents {
  final String? classId, lon, userphone, username, searchkeyword;

  GettingAdminClassSectionList(
      {this.classId,
      this.lon,
      this.userphone,
      this.username,
      this.searchkeyword});
}

class MainState {}

class LoginInitial extends MainState {}

class Loading extends MainState {}

class Fething extends MainState {}

class LoginSuccess extends MainState {}

class GettingSlotList extends MainState {}

class StudentFeeListSuccess extends MainState {}

class StudentProfileListSuccess extends MainState {}

class AcademicProfileSuccess extends MainState {
  final AcademicProfileInfoModel? academicProfileInfoModel;

  AcademicProfileSuccess({this.academicProfileInfoModel});
}

class ProgressCardSuccess extends MainState {}

class StudentAttendanceSuccess extends MainState {}

class PaymentInputResSuccess extends MainState {}

class AdminExmDetailsSuccess extends MainState {}

class ClassListSuccess extends MainState {}

class ClassStaffListSuccess extends MainState {
  final String? classId;

  ClassStaffListSuccess({this.classId});
}

class ClassAdminListSuccess extends MainState {
  final String? classId;

  ClassAdminListSuccess({this.classId});
}

class ClassStaffSectionListSuccess extends MainState {}

class AdminDashboardSuccess extends MainState {}

class VersionSuccess extends MainState {}

class HomeWorkDeleteSuccess extends MainState {}

class DashboardProfileSuccess extends MainState {}

class MerchentDetailsSuccess extends MainState {}

class PaymentCaptureSuccess extends MainState {
  final String? message;

  PaymentCaptureSuccess({this.message});
}

class StudentFeeListError extends MainState {
  final String? error;

  StudentFeeListError({this.error});
}

class StudentProfileListError extends MainState {
  final String? error;

  StudentProfileListError({this.error});
}

class AcademicProfileError extends MainState {
  final String? error;

  AcademicProfileError({this.error});
}

class StudentProgreessCardError extends MainState {
  final String? error;

  StudentProgreessCardError({this.error});
}

class StudentAttendanceError extends MainState {
  final String? error;

  StudentAttendanceError({this.error});
}

class PaymentResponError extends MainState {
  final String? error;

  PaymentResponError({this.error});
}

class AdminExmDetailsError extends MainState {
  final String? error;

  AdminExmDetailsError({this.error});
}

class ClassListError extends MainState {
  final String? error;

  ClassListError({this.error});
}

class ClassStaffListError extends MainState {
  final String? error;

  ClassStaffListError({this.error});
}

class ClassAdminListError extends MainState {
  final String? error;

  ClassAdminListError({this.error});
}

class ClassStaffSectionListError extends MainState {
  final String? error;

  ClassStaffSectionListError({this.error});
}

class AdminDashboardError extends MainState {
  final String? error;

  AdminDashboardError({this.error});
}

class HomeWorkError extends MainState {
  final String? error;

  HomeWorkError({this.error});
}

class DashboardProfileError extends MainState {
  final String? error;

  DashboardProfileError({this.error});
}

class MerchentDetailsError extends MainState {
  final String? error;

  MerchentDetailsError({this.error});
}

class PaymentCaptureError extends MainState {
  final String? error;

  PaymentCaptureError({this.error});
}

class StudentFeeAmountError extends MainState {
  final String? error;

  StudentFeeAmountError({this.error});
}

class GettingShopDetails extends MainState {}

class GettingStudentProfile extends MainState {}

class GettingAcademicProfile extends MainState {}

class GettingProgressCard extends MainState {}

class GettingStudentAttendance extends MainState {}

class RefreshState extends MainState {}

class RefreshPrvState extends MainState {}

class GettingReadyPaymentLoading extends MainState {}

class GettingAdminExmPublishDetails extends MainState {}

class GettingClassList extends MainState {}

class GettingStafffClassList extends MainState {}

class GettingAdminnClassList extends MainState {}

class GettingStafffClassSectionList extends MainState {}

class GettingAdminDashboard extends MainState {}

class GettingVersion extends MainState {}

class DeletingHomeWork extends MainState {}

class GettingDashboardprofile extends MainState {}

class GettingMerchentDetails extends MainState {}

class GettingPreparepaymentcapture extends MainState {}

class GettingStudentAtte extends MainState {}

class Gettingstudentamount extends MainState {}

class StudentFeeListFailed extends MainState {
  final String? error;

  StudentFeeListFailed({this.error});
}

class StudentProflieListFailed extends MainState {
  final String? error;

  StudentProflieListFailed({this.error});
}

class AcademicProfileFailed extends MainState {
  final String? error;

  AcademicProfileFailed({this.error});
}

class ProgressCardFailed extends MainState {
  final String? error;

  ProgressCardFailed({this.error});
}

class StudentAttendanceFailed extends MainState {
  final String? error;

  StudentAttendanceFailed({this.error});
}

class PaymentResponFailed extends MainState {
  final String? error;

  PaymentResponFailed({this.error});
}

class AdminExmDetailsFailed extends MainState {
  final String? error;

  AdminExmDetailsFailed({this.error});
}

class ClassListFailed extends MainState {
  final String? error;

  ClassListFailed({this.error});
}

class ClassStaffFailed extends MainState {
  final String? error;

  ClassStaffFailed({this.error});
}

class ClassAdminFailed extends MainState {
  final String? error;

  ClassAdminFailed({this.error});
}

class ClassStaffSectionFailed extends MainState {
  final String? error;

  ClassStaffSectionFailed({this.error});
}

class AdminDashboardFailed extends MainState {
  final String? error;

  AdminDashboardFailed({this.error});
}

class VersionFailed extends MainState {
  final String? error;

  VersionFailed({this.error});
}

class HomeWorkFailed extends MainState {
  final String? error;

  HomeWorkFailed({this.error});
}

class DashboardProfileFailed extends MainState {
  final String? error;

  DashboardProfileFailed({this.error});
}

class MerchentDetailsFailed extends MainState {
  final String? error;

  MerchentDetailsFailed({this.error});
}

class PaymentCaptureFailed extends MainState {
  final String? error;

  PaymentCaptureFailed({this.error});
}

class GettingCatList extends MainState {}

class LoginError extends MainState {
  final String? error;

  LoginError({this.error});
}
