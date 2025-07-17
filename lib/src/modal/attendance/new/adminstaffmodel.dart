// class AdminStaffListModel {
//   List<Data>? data;
//   String? msg;
//   String? responseCode;
//   String? additionalData;

//   AdminStaffListModel(
//       {this.data, this.msg, this.responseCode, this.additionalData});

//   AdminStaffListModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     msg = json['msg'];
//     responseCode = json['responseCode'];
//     additionalData = json['additionalData'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['msg'] = this.msg;
//     data['responseCode'] = this.responseCode;
//     data['additionalData'] = this.additionalData;
//     return data;
//   }
// }

// class Data {
//   int? stafId;
//   Null? uin;
//   Null? date;
//   String? name;
//   String? gender;
//   int? ageInWords;
//   String? dob;
//   Null? pob;
//   Null? nationality;
//   String? religion;
//   String? qualification;
//   String? workExperience;
//   Null? motherTongue;
//   String? category;
//   Null? bloodGroup;
//   Null? medicalHistory;
//   String? address;
//   String? contact;
//   String? email;
//   String? besicSallery;
//   Null? perksSallery;
//   String? grossSallery;
//   String? lastOrganizationofEmployment;
//   Null? noofYearsattheLastAssignment;
//   Null? relievingLetter;
//   Null? performanceLetter;
//   Null? file;
//   Null? otherDetails;
//   String? empId;
//   Null? otherLanguages;
//   String? empDate;
//   String? formalitiesCheck;
//   String? addedDate;
//   String? modifiedDate;
//   int? currentYear;
//   String? ip;
//   String? userId;
//   bool? isDeleted;
//   int? createBy;
//   String? insertBy;
//   Null? designation;
//   String? fatherOrHusbandName;
//   Null? mothersName;
//   String? mariedStatus;
//   Null? children;
//   String? besicSallery1;
//   Null? perksSallery1;
//   String? grossSallery1;
//   Null? caste;
//   Null? dateofReliving;
//   Null? adharNo;
//   Null? adharFile;
//   String? panNo;
//   Null? panFile;
//   Null? staffSignatureFile;
//   Null? bankAcno;
//   String? batchName;
//   String? employeeCode;
//   String? bankName;
//   Null? accountNo;
//   Null? ifscCode;
//   String? employeeDesignation;
//   int? employeeAccountId;
//   Null? employeeAccountName;
//   int? categoryId;
//   Null? staffCategoryName;
//   Null? uan;

//   Data(
//       {this.stafId,
//       this.uin,
//       this.date,
//       this.name,
//       this.gender,
//       this.ageInWords,
//       this.dob,
//       this.pob,
//       this.nationality,
//       this.religion,
//       this.qualification,
//       this.workExperience,
//       this.motherTongue,
//       this.category,
//       this.bloodGroup,
//       this.medicalHistory,
//       this.address,
//       this.contact,
//       this.email,
//       this.besicSallery,
//       this.perksSallery,
//       this.grossSallery,
//       this.lastOrganizationofEmployment,
//       this.noofYearsattheLastAssignment,
//       this.relievingLetter,
//       this.performanceLetter,
//       this.file,
//       this.otherDetails,
//       this.empId,
//       this.otherLanguages,
//       this.empDate,
//       this.formalitiesCheck,
//       this.addedDate,
//       this.modifiedDate,
//       this.currentYear,
//       this.ip,
//       this.userId,
//       this.isDeleted,
//       this.createBy,
//       this.insertBy,
//       this.designation,
//       this.fatherOrHusbandName,
//       this.mothersName,
//       this.mariedStatus,
//       this.children,
//       this.besicSallery1,
//       this.perksSallery1,
//       this.grossSallery1,
//       this.caste,
//       this.dateofReliving,
//       this.adharNo,
//       this.adharFile,
//       this.panNo,
//       this.panFile,
//       this.staffSignatureFile,
//       this.bankAcno,
//       this.batchName,
//       this.employeeCode,
//       this.bankName,
//       this.accountNo,
//       this.ifscCode,
//       this.employeeDesignation,
//       this.employeeAccountId,
//       this.employeeAccountName,
//       this.categoryId,
//       this.staffCategoryName,
//       this.uan});

//   Data.fromJson(Map<String, dynamic> json) {
//     stafId = json['stafId'];
//     uin = json['uin'];
//     date = json['date'];
//     name = json['name'];
//     gender = json['gender'];
//     ageInWords = json['ageInWords'];
//     dob = json['dob'];
//     pob = json['pob'];
//     nationality = json['nationality'];
//     religion = json['religion'];
//     qualification = json['qualification'];
//     workExperience = json['workExperience'];
//     motherTongue = json['motherTongue'];
//     category = json['category'];
//     bloodGroup = json['bloodGroup'];
//     medicalHistory = json['medicalHistory'];
//     address = json['address'];
//     contact = json['contact'];
//     email = json['email'];
//     besicSallery = json['besicSallery'];
//     perksSallery = json['perksSallery'];
//     grossSallery = json['grossSallery'];
//     lastOrganizationofEmployment = json['lastOrganizationofEmployment'];
//     noofYearsattheLastAssignment = json['noofYearsattheLastAssignment'];
//     relievingLetter = json['relievingLetter'];
//     performanceLetter = json['performanceLetter'];
//     file = json['file'];
//     otherDetails = json['otherDetails'];
//     empId = json['empId'];
//     otherLanguages = json['otherLanguages'];
//     empDate = json['empDate'];
//     formalitiesCheck = json['formalitiesCheck'];
//     addedDate = json['addedDate'];
//     modifiedDate = json['modifiedDate'];
//     currentYear = json['currentYear'];
//     ip = json['ip'];
//     userId = json['userId'];
//     isDeleted = json['isDeleted'];
//     createBy = json['createBy'];
//     insertBy = json['insertBy'];
//     designation = json['designation'];
//     fatherOrHusbandName = json['fatherOrHusbandName'];
//     mothersName = json['mothersName'];
//     mariedStatus = json['mariedStatus'];
//     children = json['children'];
//     besicSallery1 = json['besicSallery1'];
//     perksSallery1 = json['perksSallery1'];
//     grossSallery1 = json['grossSallery1'];
//     caste = json['caste'];
//     dateofReliving = json['dateofReliving'];
//     adharNo = json['adharNo'];
//     adharFile = json['adharFile'];
//     panNo = json['panNo'];
//     panFile = json['panFile'];
//     staffSignatureFile = json['staffSignatureFile'];
//     bankAcno = json['bankAcno'];
//     batchName = json['batchName'];
//     employeeCode = json['employeeCode'];
//     bankName = json['bankName'];
//     accountNo = json['accountNo'];
//     ifscCode = json['ifscCode'];
//     employeeDesignation = json['employeeDesignation'];
//     employeeAccountId = json['employeeAccountId'];
//     employeeAccountName = json['employeeAccountName'];
//     categoryId = json['categoryId'];
//     staffCategoryName = json['staffCategoryName'];
//     uan = json['uan'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['stafId'] = this.stafId;
//     data['uin'] = this.uin;
//     data['date'] = this.date;
//     data['name'] = this.name;
//     data['gender'] = this.gender;
//     data['ageInWords'] = this.ageInWords;
//     data['dob'] = this.dob;
//     data['pob'] = this.pob;
//     data['nationality'] = this.nationality;
//     data['religion'] = this.religion;
//     data['qualification'] = this.qualification;
//     data['workExperience'] = this.workExperience;
//     data['motherTongue'] = this.motherTongue;
//     data['category'] = this.category;
//     data['bloodGroup'] = this.bloodGroup;
//     data['medicalHistory'] = this.medicalHistory;
//     data['address'] = this.address;
//     data['contact'] = this.contact;
//     data['email'] = this.email;
//     data['besicSallery'] = this.besicSallery;
//     data['perksSallery'] = this.perksSallery;
//     data['grossSallery'] = this.grossSallery;
//     data['lastOrganizationofEmployment'] = this.lastOrganizationofEmployment;
//     data['noofYearsattheLastAssignment'] = this.noofYearsattheLastAssignment;
//     data['relievingLetter'] = this.relievingLetter;
//     data['performanceLetter'] = this.performanceLetter;
//     data['file'] = this.file;
//     data['otherDetails'] = this.otherDetails;
//     data['empId'] = this.empId;
//     data['otherLanguages'] = this.otherLanguages;
//     data['empDate'] = this.empDate;
//     data['formalitiesCheck'] = this.formalitiesCheck;
//     data['addedDate'] = this.addedDate;
//     data['modifiedDate'] = this.modifiedDate;
//     data['currentYear'] = this.currentYear;
//     data['ip'] = this.ip;
//     data['userId'] = this.userId;
//     data['isDeleted'] = this.isDeleted;
//     data['createBy'] = this.createBy;
//     data['insertBy'] = this.insertBy;
//     data['designation'] = this.designation;
//     data['fatherOrHusbandName'] = this.fatherOrHusbandName;
//     data['mothersName'] = this.mothersName;
//     data['mariedStatus'] = this.mariedStatus;
//     data['children'] = this.children;
//     data['besicSallery1'] = this.besicSallery1;
//     data['perksSallery1'] = this.perksSallery1;
//     data['grossSallery1'] = this.grossSallery1;
//     data['caste'] = this.caste;
//     data['dateofReliving'] = this.dateofReliving;
//     data['adharNo'] = this.adharNo;
//     data['adharFile'] = this.adharFile;
//     data['panNo'] = this.panNo;
//     data['panFile'] = this.panFile;
//     data['staffSignatureFile'] = this.staffSignatureFile;
//     data['bankAcno'] = this.bankAcno;
//     data['batchName'] = this.batchName;
//     data['employeeCode'] = this.employeeCode;
//     data['bankName'] = this.bankName;
//     data['accountNo'] = this.accountNo;
//     data['ifscCode'] = this.ifscCode;
//     data['employeeDesignation'] = this.employeeDesignation;
//     data['employeeAccountId'] = this.employeeAccountId;
//     data['employeeAccountName'] = this.employeeAccountName;
//     data['categoryId'] = this.categoryId;
//     data['staffCategoryName'] = this.staffCategoryName;
//     data['uan'] = this.uan;
//     return data;
//   }
// }


class AdminStaffListModel {
  List<Data>? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  AdminStaffListModel(
      {this.data, this.msg, this.responseCode, this.additionalData});

  AdminStaffListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    msg = json['msg'];
    responseCode = json['responseCode'];
    additionalData = json['additionalData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['responseCode'] = responseCode;
    data['additionalData'] = additionalData;
    return data;
  }
}

class Data {
  int? stafId;
  Null uin;
  Null date;
  String? name;
  String? gender;
  int? ageInWords;
  String? dob;
  Null pob;
  Null nationality;
  String? religion;
  String? qualification;
  String? workExperience;
  Null motherTongue;
  String? category;
  Null bloodGroup;
  Null medicalHistory;
  String? address;
  String? contact;
  String? email;
  Null besicSallery;
  Null perksSallery;
  Null grossSallery;
  Null lastOrganizationofEmployment;
  Null noofYearsattheLastAssignment;
  Null relievingLetter;
  Null performanceLetter;
  String? file;
  Null otherDetails;
  String? empId;
  Null otherLanguages;
  String? empDate;
  String? formalitiesCheck;
  String? addedDate;
  String? modifiedDate;
  int? currentYear;
  String? ip;
  String? userId;
  bool? isDeleted;
  int? createBy;
  String? insertBy;
  Null designation;
  String? fatherOrHusbandName;
  Null mothersName;
  String? mariedStatus;
  String? children;
  Null besicSallery1;
  Null perksSallery1;
  Null grossSallery1;
  Null caste;
  Null dateofReliving;
  String? adharNo;
  Null adharFile;
  String? panNo;
  Null panFile;
  String? staffSignatureFile;
  Null bankAcno;
  String? batchName;
  String? employeeCode;
  Null bankName;
  Null accountNo;
  Null ifscCode;
  String? employeeDesignation;
  int? employeeAccountId;
  Null employeeAccountName;
  int? categoryId;
  Null staffCategoryName;
  Null uan;

  Data(
      {this.stafId,
      this.uin,
      this.date,
      this.name,
      this.gender,
      this.ageInWords,
      this.dob,
      this.pob,
      this.nationality,
      this.religion,
      this.qualification,
      this.workExperience,
      this.motherTongue,
      this.category,
      this.bloodGroup,
      this.medicalHistory,
      this.address,
      this.contact,
      this.email,
      this.besicSallery,
      this.perksSallery,
      this.grossSallery,
      this.lastOrganizationofEmployment,
      this.noofYearsattheLastAssignment,
      this.relievingLetter,
      this.performanceLetter,
      this.file,
      this.otherDetails,
      this.empId,
      this.otherLanguages,
      this.empDate,
      this.formalitiesCheck,
      this.addedDate,
      this.modifiedDate,
      this.currentYear,
      this.ip,
      this.userId,
      this.isDeleted,
      this.createBy,
      this.insertBy,
      this.designation,
      this.fatherOrHusbandName,
      this.mothersName,
      this.mariedStatus,
      this.children,
      this.besicSallery1,
      this.perksSallery1,
      this.grossSallery1,
      this.caste,
      this.dateofReliving,
      this.adharNo,
      this.adharFile,
      this.panNo,
      this.panFile,
      this.staffSignatureFile,
      this.bankAcno,
      this.batchName,
      this.employeeCode,
      this.bankName,
      this.accountNo,
      this.ifscCode,
      this.employeeDesignation,
      this.employeeAccountId,
      this.employeeAccountName,
      this.categoryId,
      this.staffCategoryName,
      this.uan});

  Data.fromJson(Map<String, dynamic> json) {
    stafId = json['stafId'];
    uin = json['uin'];
    date = json['date'];
    name = json['name'];
    gender = json['gender'];
    ageInWords = json['ageInWords'];
    dob = json['dob'];
    pob = json['pob'];
    nationality = json['nationality'];
    religion = json['religion'];
    qualification = json['qualification'];
    workExperience = json['workExperience'];
    motherTongue = json['motherTongue'];
    category = json['category'];
    bloodGroup = json['bloodGroup'];
    medicalHistory = json['medicalHistory'];
    address = json['address'];
    contact = json['contact'];
    email = json['email'];
    besicSallery = json['besicSallery'];
    perksSallery = json['perksSallery'];
    grossSallery = json['grossSallery'];
    lastOrganizationofEmployment = json['lastOrganizationofEmployment'];
    noofYearsattheLastAssignment = json['noofYearsattheLastAssignment'];
    relievingLetter = json['relievingLetter'];
    performanceLetter = json['performanceLetter'];
    file = json['file'];
    otherDetails = json['otherDetails'];
    empId = json['empId'];
    otherLanguages = json['otherLanguages'];
    empDate = json['empDate'];
    formalitiesCheck = json['formalitiesCheck'];
    addedDate = json['addedDate'];
    modifiedDate = json['modifiedDate'];
    currentYear = json['currentYear'];
    ip = json['ip'];
    userId = json['userId'];
    isDeleted = json['isDeleted'];
    createBy = json['createBy'];
    insertBy = json['insertBy'];
    designation = json['designation'];
    fatherOrHusbandName = json['fatherOrHusbandName'];
    mothersName = json['mothersName'];
    mariedStatus = json['mariedStatus'];
    children = json['children'];
    besicSallery1 = json['besicSallery1'];
    perksSallery1 = json['perksSallery1'];
    grossSallery1 = json['grossSallery1'];
    caste = json['caste'];
    dateofReliving = json['dateofReliving'];
    adharNo = json['adharNo'];
    adharFile = json['adharFile'];
    panNo = json['panNo'];
    panFile = json['panFile'];
    staffSignatureFile = json['staffSignatureFile'];
    bankAcno = json['bankAcno'];
    batchName = json['batchName'];
    employeeCode = json['employeeCode'];
    bankName = json['bankName'];
    accountNo = json['accountNo'];
    ifscCode = json['ifscCode'];
    employeeDesignation = json['employeeDesignation'];
    employeeAccountId = json['employeeAccountId'];
    employeeAccountName = json['employeeAccountName'];
    categoryId = json['categoryId'];
    staffCategoryName = json['staffCategoryName'];
    uan = json['uan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stafId'] = stafId;
    data['uin'] = uin;
    data['date'] = date;
    data['name'] = name;
    data['gender'] = gender;
    data['ageInWords'] = ageInWords;
    data['dob'] = dob;
    data['pob'] = pob;
    data['nationality'] = nationality;
    data['religion'] = religion;
    data['qualification'] = qualification;
    data['workExperience'] = workExperience;
    data['motherTongue'] = motherTongue;
    data['category'] = category;
    data['bloodGroup'] = bloodGroup;
    data['medicalHistory'] = medicalHistory;
    data['address'] = address;
    data['contact'] = contact;
    data['email'] = email;
    data['besicSallery'] = besicSallery;
    data['perksSallery'] = perksSallery;
    data['grossSallery'] = grossSallery;
    data['lastOrganizationofEmployment'] = lastOrganizationofEmployment;
    data['noofYearsattheLastAssignment'] = noofYearsattheLastAssignment;
    data['relievingLetter'] = relievingLetter;
    data['performanceLetter'] = performanceLetter;
    data['file'] = file;
    data['otherDetails'] = otherDetails;
    data['empId'] = empId;
    data['otherLanguages'] = otherLanguages;
    data['empDate'] = empDate;
    data['formalitiesCheck'] = formalitiesCheck;
    data['addedDate'] = addedDate;
    data['modifiedDate'] = modifiedDate;
    data['currentYear'] = currentYear;
    data['ip'] = ip;
    data['userId'] = userId;
    data['isDeleted'] = isDeleted;
    data['createBy'] = createBy;
    data['insertBy'] = insertBy;
    data['designation'] = designation;
    data['fatherOrHusbandName'] = fatherOrHusbandName;
    data['mothersName'] = mothersName;
    data['mariedStatus'] = mariedStatus;
    data['children'] = children;
    data['besicSallery1'] = besicSallery1;
    data['perksSallery1'] = perksSallery1;
    data['grossSallery1'] = grossSallery1;
    data['caste'] = caste;
    data['dateofReliving'] = dateofReliving;
    data['adharNo'] = adharNo;
    data['adharFile'] = adharFile;
    data['panNo'] = panNo;
    data['panFile'] = panFile;
    data['staffSignatureFile'] = staffSignatureFile;
    data['bankAcno'] = bankAcno;
    data['batchName'] = batchName;
    data['employeeCode'] = employeeCode;
    data['bankName'] = bankName;
    data['accountNo'] = accountNo;
    data['ifscCode'] = ifscCode;
    data['employeeDesignation'] = employeeDesignation;
    data['employeeAccountId'] = employeeAccountId;
    data['employeeAccountName'] = employeeAccountName;
    data['categoryId'] = categoryId;
    data['staffCategoryName'] = staffCategoryName;
    data['uan'] = uan;
    return data;
  }
}
