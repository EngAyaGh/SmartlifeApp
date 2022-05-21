class CommunicationModel {
  CommunicationModel({
    required this.idCommunication,
    required this.fkClient,
    required this.fkUser,
    required this.dateCommunication,
    this.result,
    this.notes,
    required this.rate,
    required this.typeCommuncation,
    required this.numberWrong,
    required this.clientRepeat,
    required this.dateNext,
    required this.nameEnterprise,
    required this.nameUser,
    required this.id_invoice,
    required this.date_create,
  });
  late final String idCommunication;
  late final String fkClient;
  late final String fkUser;
  late final String dateCommunication;
  late final String? result;
  late final String? notes;
  late final String? rate;
  late final String? typeCommuncation;
  late final String? numberWrong;
  late final String? clientRepeat;
  late final String? dateNext;
  late final String nameEnterprise;
  late final String nameUser;
  late final String id_invoice;
  late final String date_create;

  CommunicationModel.fromJson(Map<String, dynamic> json){
    idCommunication = json['id_communication'];
    fkClient = json['fk_client'];
    fkUser = json['fk_user'];
    dateCommunication = json['date_communication'];
    result = json['result'];;
    notes = json['notes'];;
    rate = json['rate'];
    typeCommuncation = json['type_communcation'];
    numberWrong = json['number_wrong'];
    clientRepeat = json['client_repeat'];
    dateNext = json['date_next'];
    nameEnterprise = json['name_enterprise'];
    nameUser = json['nameUser'];
    id_invoice = json['id_invoice'];
    date_create = json['date_create'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_communication'] = idCommunication;
    _data['fk_client'] = fkClient;
    _data['fk_user'] = fkUser;
    _data['date_communication'] = dateCommunication;
    _data['result'] = result;
    _data['notes'] = notes;
    _data['rate'] = rate;
    _data['type_communcation'] = typeCommuncation;
    _data['number_wrong'] = numberWrong;
    _data['client_repeat'] = clientRepeat;
    _data['date_next'] = dateNext;
    _data['name_enterprise'] = nameEnterprise;
    _data['nameUser'] = nameUser;
    _data['id_invoice'] = id_invoice;
    _data['date_create'] = date_create;
    return _data;
  }
}