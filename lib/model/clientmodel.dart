import 'package:crm_smart/Repository/cache_repo.dart';

class ClientModel extends CacheRepository{
  ClientModel({
     this.idClients,
     this.nameClient,
     this.nameEnterprise,
     this.typeJob,
     this.city,
     this.location,
     this.fkRegoin,
     this.dateCreate,
     this.typeClient,
     this.fkUser,
     this.dateTransfer,
     this.mobile,
     this.dateChangetype,
     this.reasonChange,
     this.reasonTransfer,
     this.nameCountry,

     this.nameUser,
    this.name_regoin,

    this.date_price,
    this.offer_price,
    this.desc_reason,
    this.user_do,
    this.value_back,
    this.iduser_approve,
    this.	isApprove,
  });
  late final String? idClients;
  late final String? nameClient;
  late final String? nameEnterprise;
  late final String? typeJob;
  late final String? city;
  late final String? location;
  late final String? fkRegoin;
  late final String? dateCreate;
  late final String? typeClient;
  late final String? fkUser;
  late final String? dateTransfer;
  late final String? mobile;
  late final String? dateChangetype;
  late final String? reasonChange;
  late final String? reasonTransfer;
  late final String? nameCountry;

  late final String? nameUser;
  late final String? name_regoin;

  late final String? offer_price;
  late final String? date_price;

  late final String? user_do;
  late final String? desc_reason;//منسحب
  late final String? value_back;
  late final String? iduser_approve;
  late final String? 	isApprove;

  ClientModel.fromJson(Map<String, dynamic> json){
    idClients = json['id_clients'];
    nameClient = json['name_client'];
    nameEnterprise = json['name_enterprise'];
    typeJob = json['type_job'];
    city = json['city'];
    location = json['location'];
    fkRegoin = json['fk_regoin'];
    dateCreate = json['date_create'];
    typeClient = json['type_client'];
    fkUser = json['fk_user'];
    dateTransfer = json['date_transfer'];
    mobile = json['mobile'];
    dateChangetype = json['date_changetype'];
    reasonChange = json['reason_change'];
    reasonTransfer = json['reason_transfer'];
    nameCountry = json['nameCountry'];
    nameUser = json['nameUser'];
    name_regoin = json['name_regoin'];
    /////////////////////////////
    offer_price=json['offer_price'];
    date_price=json['date_price'];

    user_do = json['user_do'];
    desc_reason=json['desc_reason'];
    value_back=json['value_back'];
    iduser_approve=json['iduser_approve'];
    isApprove=json['isApprove'];
  }

  Map<String, dynamic> toJson() {
     final _data = <String, dynamic>{};
    _data['id_clients'] = idClients;
    _data['name_client'] = nameClient;
    _data['name_enterprise'] = nameEnterprise;
    _data['type_job'] = typeJob;
    _data['city'] = city;
    _data['location'] = location;
    _data['fk_regoin'] = fkRegoin;
    _data['date_create'] = dateCreate;
    _data['type_client'] = typeClient;
    _data['fk_user'] = fkUser;
    _data['date_transfer'] = dateTransfer;
    _data['mobile'] = mobile;
    _data['date_changetype'] = dateChangetype;
    _data['reason_change'] = reasonChange;
    _data['reason_transfer'] = reasonTransfer;
    _data['nameCountry'] = nameCountry;
    _data['name_regoin'] = name_regoin;
    _data['nameUser'] = nameUser;

     _data['offer_price'] = offer_price;
     _data['date_price'] = date_price;

     _data['user_do'] = user_do;
     _data['desc_reason'] = desc_reason;
     _data['value_back'] = value_back;
     _data['iduser_approve'] = iduser_approve;
     _data['isApprove'] = 	isApprove;
    return _data;
  }

}