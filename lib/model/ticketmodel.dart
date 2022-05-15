class TicketModel {
  TicketModel({
    required this.idTicket,
    required this.fkClient,
    required this.typeProblem,
    required this.detailsProblem,
    required this.notesTicket,
    required this.typeTicket,
    required this.fkUserOpen,
    required this.fkUserClose,
    required this.fkUserRecive,
    required this.dateOpen,
    required this.dateClose,
    required this.dateRecive,
    required this.clientType,
    this.dateAssign,
    required this.nameClient,
    required this.nameEnterprise,
    required this.nameRegoin,
    required this.nameuseropen,
    required this.nameuserrecive,
    required this.nameuserclose,
    required this.fk_country,
     this.nameusertransfer,
     this.fkusertrasfer,

  });
  late final String idTicket;
  late final String fkClient;
  late final String typeProblem;
  late final String? detailsProblem;
  late final String? notesTicket;
  late final String typeTicket;
  late final String? fkUserOpen;
  late final String? fkUserClose;
  late final String? fkUserRecive;
  late final String dateOpen;
  late final String? dateClose;
  late final String? dateRecive;
  late final String clientType;
  late final String? dateAssign;
  late final String nameClient;
  late final String nameEnterprise;
  late final String nameRegoin;
  late final String nameuseropen;
  late final String? nameuserrecive;
  late final String? nameuserclose;
  late final String fk_country;
  late final String? nameusertransfer;
  late final String? fkusertrasfer;

  TicketModel.fromJson(Map<String, dynamic> json){
    idTicket = json['id_ticket'];
    fkClient = json['fk_client'];
    typeProblem = json['type_problem'];
    detailsProblem = json['details_problem'];
    notesTicket = json['notes_ticket'];
    typeTicket = json['type_ticket'];
    fkUserOpen = json['fk_user_open'];
    fkUserClose = json['fk_user_close'];
    fkUserRecive = json['fk_user_recive'];
    dateOpen = json['date_open'];
    dateClose = json['date_close'];
    dateRecive = json['date_recive'];
    clientType = json['client_type'];
    dateAssign = json['dateAssign'];
    nameClient = json['name_client'];
    nameEnterprise = json['name_enterprise'];
    nameRegoin = json['name_regoin'];
    nameuseropen = json['nameuseropen'];
    nameuserrecive = json['nameuserrecive'];
    nameuserclose = json['nameuserclose'];
    fk_country = json['fk_country'];
    nameusertransfer = json['nameusertransfer'];
    fkusertrasfer = json['fkusertrasfer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_ticket'] = idTicket;
    _data['fk_client'] = fkClient;
    _data['type_problem'] = typeProblem;
    _data['details_problem'] = detailsProblem;
    _data['notes_ticket'] = notesTicket;
    _data['type_ticket'] = typeTicket;
    _data['fk_user_open'] = fkUserOpen;
    _data['fk_user_close'] = fkUserClose;
    _data['fk_user_recive'] = fkUserRecive;
    _data['date_open'] = dateOpen;
    _data['date_close'] = dateClose;
    _data['date_recive'] = dateRecive;
    _data['client_type'] = clientType;
    _data['date_assign'] = dateAssign;
    _data['name_client'] = nameClient;
    _data['name_enterprise'] = nameEnterprise;
    _data['name_regoin'] = nameRegoin;
    _data['nameuseropen'] = nameuseropen;
    _data['nameuserrecive'] = nameuserrecive;
    _data['nameuserclose'] = nameuserclose;
    _data['fk_country'] = fk_country;
    _data['nameusertransfer'] = nameusertransfer;
    _data['fkusertrasfer'] = fkusertrasfer;
    return _data;
  }
}