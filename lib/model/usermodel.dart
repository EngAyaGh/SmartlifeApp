class UserModel {
  UserModel({
     this.idUser,
     this.nameUser,
     this.email,
     this.mobile,
     this.codeVerfiy,
     this.fkCountry,
     this.typeAdministration,

     this.typeLevel,
    this.fkRegoin,
     //this.nameCountry,
    this.nameRegoin,
  });
    String? idUser;
    String? nameUser;
    String? email;
    String? mobile;
    String? codeVerfiy;
    String? fkCountry;
    String? typeAdministration;
    String? typeLevel;
    int? fkRegoin;
    //String? nameCountry;
    String? nameRegoin;

  UserModel.fromJson(Map<String, dynamic> json){
    idUser = json['id_user'];
    nameUser = json['nameUser'];
    email = json['email'];
    mobile = json['mobile'];
    codeVerfiy = json['code_verfiy'];
    fkCountry = json['fk_country'];
    typeAdministration = json['type_administration'];
    typeLevel = json['type_level'];
    fkRegoin = json['fk_regoin'];;
    //nameCountry = json['nameCountry'];
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

    _data['name_regoin'] = nameRegoin;
    return _data;
  }
}