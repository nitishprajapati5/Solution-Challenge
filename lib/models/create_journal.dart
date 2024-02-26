// class create_journal {
//   String token;
//   Data data;

//   create_journal({this.token, this.data});

//   create_journal.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String createdById;
//   String createdByName;
//   String journalType;
//   String journalContent;
//   bool isDisabled;

//   Data(
//       {this.createdById,
//       this.createdByName,
//       this.journalType,
//       this.journalContent,
//       this.isDisabled});

//   Data.fromJson(Map<String, dynamic> json) {
//     createdById = json['createdById'];
//     createdByName = json['createdByName'];
//     journalType = json['journalType'];
//     journalContent = json['journalContent'];
//     isDisabled = json['isDisabled'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['createdById'] = this.createdById;
//     data['createdByName'] = this.createdByName;
//     data['journalType'] = this.journalType;
//     data['journalContent'] = this.journalContent;
//     data['isDisabled'] = this.isDisabled;
//     return data;
//   }
// }
