import '../constants.dart';

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
  String? currency;
  String? img_image = '';
  String? img_thumbnail = '';
  String? path = '';

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
     this.nameCountry,
     this.nameRegoin,
    this.name_level,
    this.currency,
    this.img_image,
    this.img_thumbnail,
    this.path,
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      idUser: jsonData['id_user'],
      nameUser: jsonData['nameUser'],
      email: jsonData['email'],
      mobile: jsonData['mobile'],
      codeVerfiy: jsonData!['code_verfiy'],
      fkCountry: jsonData['fk_country'],
      typeAdministration: jsonData['type_administration'],
      typeLevel: jsonData['type_level'],
      fkRegoin: jsonData['fk_regoin'],
      nameCountry: jsonData['nameCountry'],
      nameRegoin: jsonData['name_regoin'],
      name_level: jsonData['name_level'],
      currency: jsonData['currency'],
      img_image:jsonData['img_image'].toString().trim().isEmpty?jsonData['img_image']: urlimage+ jsonData['img_image'],
      img_thumbnail:urlimage+ jsonData['img_thumbnail'],
      path: jsonData['path'],
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
     _data['currency']=currency;
     _data['img_image']=img_image;
     _data['img_thumbnail']=img_thumbnail;
     _data['path']=path;
    return _data;
  }
  ///this method will prevent the override of toString
  String userAsString() {
    return "${this.nameUser}";
   // return '#${this.idUser} ${this.nameUser}';
  }

    ///this method will prevent the override of toString
    bool getfilteruser(String filter) {
      return this.nameUser.toString().contains(filter);
    }
  }

