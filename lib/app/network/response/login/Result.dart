import 'UserContext.dart';

class Result {
  Result({
      this.uid, 
      this.isSystem, 
      this.isAdmin, 
      this.userContext, 
      this.db, 
      this.name, 
      this.username, 
      this.partnerDisplayName, 
      this.companyId, 
      this.partnerId, 
      this.dbuuid, 
      this.warning, 
      this.expirationDate, 
      this.sessionId, 
      this.odoobotInitialized, 
      this.ocnTokenKey, 
      this.fcmProjectId, 
      this.inboxAction,});

  Result.fromJson(dynamic json) {
    uid = json['uid'];
    isSystem = json['is_system'];
    isAdmin = json['is_admin'];
    userContext = json['user_context'] != null ? UserContext.fromJson(json['user_context']) : null;
    db = json['db'];
    name = json['name'];
    username = json['username'];
    partnerDisplayName = json['partner_display_name'];
    companyId = json['company_id'];
    partnerId = json['partner_id'];
    dbuuid = json['dbuuid'];
    warning = json['warning'];
    expirationDate = json['expiration_date'];
    sessionId = json['session_id'];
    odoobotInitialized = json['odoobot_initialized'];
    ocnTokenKey = json['ocn_token_key'];
    fcmProjectId = json['fcm_project_id'];
    inboxAction = json['inbox_action'];
  }
  int? uid;
  bool? isSystem;
  bool? isAdmin;
  UserContext? userContext;
  String? db;
  String? name;
  String? username;
  String? partnerDisplayName;
  int? companyId;
  int? partnerId;
  String? dbuuid;
  String? warning;
  String? expirationDate;
  String? sessionId;
  bool? odoobotInitialized;
  bool? ocnTokenKey;
  String? fcmProjectId;
  int? inboxAction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['is_system'] = isSystem;
    map['is_admin'] = isAdmin;
    if (userContext != null) {
      map['user_context'] = userContext?.toJson();
    }
    map['db'] = db;
    map['name'] = name;
    map['username'] = username;
    map['partner_display_name'] = partnerDisplayName;
    map['company_id'] = companyId;
    map['partner_id'] = partnerId;
    map['dbuuid'] = dbuuid;
    map['warning'] = warning;
    map['expiration_date'] = expirationDate;
    map['session_id'] = sessionId;
    map['odoobot_initialized'] = odoobotInitialized;
    map['ocn_token_key'] = ocnTokenKey;
    map['fcm_project_id'] = fcmProjectId;
    map['inbox_action'] = inboxAction;
    return map;
  }

}