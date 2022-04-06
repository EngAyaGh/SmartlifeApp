class ReasonModel {
  ReasonModel({
    required this.idReason,
    required this.nameReason,
  });
  late final String idReason;
  late final String nameReason;

  ReasonModel.fromJson(Map<String, dynamic> json){
    idReason = json['id_reason'];
    nameReason = json['name_reason'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_reason'] = idReason;
    _data['name_reason'] = nameReason;
    return _data;
  }
}