class ClientModel {
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
    return _data;
  }

}