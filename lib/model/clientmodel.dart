class ClientModel {
  ClientModel({
    required this.idClients,
    required this.nameClient,
    required this.nameEnterprise,
    required this.typeJob,
    this.city,
    required this.location,
    required this.fkRegoin,
    required this.dateCreate,
    this.typeClient,
    required this.fkUser,
    required this.dateTransfer,
    required this.mobile,
    required this.dateChangetype,
    required this.reasonChange,
    this.reasonTransfer,
    required this.nameCountry,
    required this.nameRegoin,
    required this.nameUser,
  });
  late final String idClients;
  late final String nameClient;
  late final String nameEnterprise;
  late final String typeJob;
  late final Null city;
  late final String location;
  late final String fkRegoin;
  late final String dateCreate;
  late final Null typeClient;
  late final String fkUser;
  late final String dateTransfer;
  late final String mobile;
  late final String dateChangetype;
  late final String reasonChange;
  late final Null reasonTransfer;
  late final String nameCountry;
  late final String nameRegoin;
  late final String nameUser;

  ClientModel.fromJson(Map<String, dynamic> json){
    idClients = json['id_clients'];
    nameClient = json['name_client'];
    nameEnterprise = json['name_enterprise'];
    typeJob = json['type_job'];
    city = null;
    location = json['location'];
    fkRegoin = json['fk_regoin'];
    dateCreate = json['date_create'];
    typeClient = null;
    fkUser = json['fk_user'];
    dateTransfer = json['date_transfer'];
    mobile = json['mobile'];
    dateChangetype = json['date_changetype'];
    reasonChange = json['reason_change'];
    reasonTransfer = null;
    nameCountry = json['nameCountry'];
    nameRegoin = json['name_regoin'];
    nameUser = json['nameUser'];
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
    _data['name_regoin'] = nameRegoin;
    _data['nameUser'] = nameUser;
    return _data;
  }
}