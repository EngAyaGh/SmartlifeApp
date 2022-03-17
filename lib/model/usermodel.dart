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
    );
  }
}