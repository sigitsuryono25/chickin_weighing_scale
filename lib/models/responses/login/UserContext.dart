class UserContext {
  UserContext({
      this.lang, 
      this.tz, 
      this.uid,});

  UserContext.fromJson(dynamic json) {
    lang = json['lang'];
    tz = json['tz'];
    uid = json['uid'];
  }
  String? lang;
  String? tz;
  int? uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lang'] = lang;
    map['tz'] = tz;
    map['uid'] = uid;
    return map;
  }

}