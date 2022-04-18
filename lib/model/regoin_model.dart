


class RegoinModel{
  late String? id, fk_country,nameCountry,currency;
 late String name_regoin;
  RegoinModel({
    this.id, required this.name_regoin,
    this.fk_country,
    this.nameCountry,this.currency});

  factory RegoinModel.fromJSON(Map<String, dynamic> json){
    return RegoinModel(
        id:json["id_regoin"],
        name_regoin: json["name_regoin"],
        fk_country: json["fk_country"],
        nameCountry:json["nameCountry"],
        currency:json["currency"]

    );
  }
}