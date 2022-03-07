class UserModel {
  UserModel({
    required this.idUser,
    required this.nameUser,
    required this.email,
    required this.mobile,
    required this.codeVerfiy,
    required this.fkCountry,
    required this.typeAdministration,

    required this.typeLevel,
    this.fkRegoin,
    required this.nameCountry,
    this.nameRegoin,
  });
  late final String idUser;
  late final String nameUser;
  late final String email;
  late final String mobile;
  late final String codeVerfiy;
  late final String fkCountry;
  late final String typeAdministration;
  late final String typeLevel;
  late final Null fkRegoin;
  late final String nameCountry;
  late final Null nameRegoin;

  UserModel.fromJson(Map<String, dynamic> json){
    idUser = json['id_user'];
    nameUser = json['nameUser'];
    email = json['email'];
    mobile = json['mobile'];
    codeVerfiy = json['code_verfiy'];
    fkCountry = json['fk_country'];
    typeAdministration = json['type_administration'];
    typeLevel = json['type_level'];
    fkRegoin = null;
    nameCountry = json['nameCountry'];
    nameRegoin = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_user'] = idUser;
    _data['nameUser'] = nameUser;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['code_verfiy'] = codeVerfiy;
    _data['fk_country'] = fkCountry;
    _data['type_administration'] = typeAdministration;
    _data['type_level'] = typeLevel;
    _data['fk_regoin'] = fkRegoin;
    _data['nameCountry'] = nameCountry;
    _data['name_regoin'] = nameRegoin;
    return _data;
  }
}