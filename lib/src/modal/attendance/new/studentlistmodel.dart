class StudentProfileListModel {
  List<Data>? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  StudentProfileListModel(
      {this.data, this.msg, this.responseCode, this.additionalData});

  StudentProfileListModel.fromJson(Map<String, dynamic> json) {
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
  num? serialNumber;
  num? studentID;
  num? batchId;

  String? scholarNo;
  String? name;
  String? lastName;
  String? school;
  String? fatherName;
  String? motherName;
  String? fMobile;
  String? fResidentialAddress;
  String? adharNo;
  String? feMail;
  String? classs;
  String? section;
  String? castName;
  String? category;
  String? religion;
  String? gender;
  String? dob;
  num? currentYear;
  String? parentEmail;
  String? bloodGroup;
  String? city;
  String? state;
  String? pincode;
  String? admissionDate;
  String? promotionDate;
  String? sssmIdNumber;
  String? bankAccount;
  String? bankName;
  String? bankACHolder;
  String? bankIFSC;
  String? subjects;
  String? optionalSubjects;
  String? applicationNumber;
  String? apaarId;
  String? perEduNumber;
  num? totalRecords;
  num? totalDaysPresent;
  num? paidAmount;
  num? percentage;
  String? profilePicture;

  Data(
      {this.serialNumber,
      this.studentID,
      this.scholarNo,
      this.batchId,
      this.name,
      this.lastName,
      this.school,
      this.fatherName,
      this.motherName,
      this.fMobile,
      this.fResidentialAddress,
      this.adharNo,
      this.feMail,
      this.classs,
      this.section,
      this.castName,
      this.category,
      this.religion,
      this.gender,
      this.dob,
      this.currentYear,
      this.parentEmail,
      this.bloodGroup,
      this.city,
      this.state,
      this.pincode,
      this.admissionDate,
      this.promotionDate,
      this.sssmIdNumber,
      this.bankAccount,
      this.bankName,
      this.bankACHolder,
      this.bankIFSC,
      this.subjects,
      this.optionalSubjects,
      this.applicationNumber,
      this.apaarId,
      this.perEduNumber,
      this.totalRecords,
      this.totalDaysPresent,
      this.paidAmount,
      this.percentage,
      this.profilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    serialNumber = json['serialNumber'];
    studentID = json['studentID'];
    batchId = json['batchId'];
    scholarNo = json['scholarNo'];
    name = json['name'];
    lastName = json['last_Name'];
    school = json['school'];
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    fMobile = json['fMobile'];
    fResidentialAddress = json['fResidentialAddress'];
    adharNo = json['adharNo'];
    feMail = json['feMail'];
    classs = json['class'];
    section = json['section'];
    castName = json['castName'];
    category = json['category'];
    religion = json['religion'];
    gender = json['gender'];
    dob = json['dob'];
    currentYear = json['currentYear'];
    parentEmail = json['parentEmail'];
    bloodGroup = json['bloodGroup'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    admissionDate = json['admissionDate'];
    promotionDate = json['promotion_Date'];
    sssmIdNumber = json['sssmIdNumber'];
    bankAccount = json['bankAccount'];
    bankName = json['bankName'];
    bankACHolder = json['bankACHolder'];
    bankIFSC = json['bankIFSC'];
    subjects = json['subjects'];
    optionalSubjects = json['optionalSubjects'];
    applicationNumber = json['applicationNumber'];
    apaarId = json['apaarId'];
    perEduNumber = json['perEduNumber'];
    totalRecords = json['totalRecords'];
    totalDaysPresent = json['totalDaysPresent'];
    paidAmount = json['paidAmount'];
    percentage = json['percentage'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serialNumber'] = serialNumber;
    data['studentID'] = studentID;
    data['scholarNo'] = scholarNo;
    data['name'] = name;
    data['last_Name'] = lastName;
    data['school'] = school;
    data['fatherName'] = fatherName;
    data['motherName'] = motherName;
    data['fMobile'] = fMobile;
    data['fResidentialAddress'] = fResidentialAddress;
    data['adharNo'] = adharNo;
    data['feMail'] = feMail;
    data['class'] = classs;
    data['section'] = section;
    data['castName'] = castName;
    data['category'] = category;
    data['religion'] = religion;
    data['gender'] = gender;
    data['dob'] = dob;
    data['currentYear'] = currentYear;
    data['parentEmail'] = parentEmail;
    data['bloodGroup'] = bloodGroup;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['admissionDate'] = admissionDate;
    data['promotion_Date'] = promotionDate;
    data['sssmIdNumber'] = sssmIdNumber;
    data['bankAccount'] = bankAccount;
    data['bankName'] = bankName;
    data['bankACHolder'] = bankACHolder;
    data['bankIFSC'] = bankIFSC;
    data['subjects'] = subjects;
    data['optionalSubjects'] = optionalSubjects;
    data['applicationNumber'] = applicationNumber;
    data['apaarId'] = apaarId;
    data['perEduNumber'] = perEduNumber;
    data['totalRecords'] = totalRecords;
    data['totalDaysPresent'] = totalDaysPresent;
    data['paidAmount'] = paidAmount;
    data['percentage'] = percentage;
    data['profilePicture'] = profilePicture;
    return data;
  }
}
