class UserModel {
  String? idUser;
  String? nameUser;
  String? email;
  String? mobile;
  String? codeVerfiy;
  String? fkCountry;
  String? typeAdministration;
  String? typeLevel;
  String? fkRegoin;
  String? nameCountry;
  String? nameRegoin;
  String? name_level;

  UserModel({
    required this.idUser,
    required this.nameUser,
    required this.email,
    required this.mobile,
    required this.codeVerfiy,
    required this.fkCountry,
    required this.typeAdministration,
    required this.typeLevel,
    required this.fkRegoin,
    required this.nameCountry,
    required this.nameRegoin,
    this.name_level
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      idUser: jsonData['id_user'],
      nameUser: jsonData['nameUser'],
      email: jsonData['email'],
      mobile: jsonData['mobile'],
      codeVerfiy: jsonData['code_verfiy'],
      fkCountry: jsonData['fk_country'],
      typeAdministration: jsonData['type_administration'],
      typeLevel: jsonData['type_level'],
      fkRegoin: jsonData['fk_regoin'],
      nameCountry: jsonData['nameCountry'],
      nameRegoin: jsonData['name_regoin'],
      name_level: jsonData['name_level'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
     _data['id_user']=idUser;
     _data['nameUser']=nameUser;
     _data['email']=email;
     _data['mobile']=mobile;
     _data['code_verfiy']=codeVerfiy;
     _data['fk_country']=fkCountry;
     _data['type_administration']=typeAdministration;
     _data['type_level']=typeLevel;
     _data['fk_regoin']=fkRegoin;
     _data['nameCountry']=nameCountry;
     _data['name_regoin']=nameRegoin;
     _data['name_level']=name_level;
    return _data;
  }
}