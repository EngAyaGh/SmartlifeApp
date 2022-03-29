class InvoiceModel {
  InvoiceModel({
     this.idInvoice,
     this.dateCreate,
     this.typePay,
     this.renewYear,
     this.typeInstallation,
     this.imageRecord,
     this.fkIdClient,
     this.fkIdUser,
     this.amountPaid,
     this.notes,
     this.nameUser,
     this.nameClient,
     this.products,
     this.total
  });
    String? idInvoice;
    String? dateCreate;
    String? typePay;
    String? renewYear;
    String? typeInstallation;
    String? imageRecord;
    String? fkIdClient;
    String? fkIdUser;
    String? amountPaid;
    String? notes;
    String? nameUser;
    String? nameClient;
    String? total;
    List<ProductsInvoice>? products;

  InvoiceModel.fromJson(Map<String, dynamic> json){
    idInvoice = json['id_invoice'];
    dateCreate = json['date_create'];
    typePay = json['type_pay'];
    renewYear = json['renew_year'];
    typeInstallation = json['type_installation'];
    imageRecord = json['image_record'];
    fkIdClient = json['fk_idClient'];
    fkIdUser = json['fk_idUser'];
    amountPaid = json['amount_paid'];
    notes = json['notes'];
    nameUser = json['nameUser'];
    nameClient = json['name_client'];
    total = json['total'];
    products = List.from(json['products']).map((e)=>ProductsInvoice.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_invoice'] = idInvoice;
    _data['date_create'] = dateCreate;
    _data['type_pay'] = typePay;
    _data['renew_year'] = renewYear;
    _data['type_installation'] = typeInstallation;
    _data['image_record'] = imageRecord;
    _data['fk_idClient'] = fkIdClient;
    _data['fk_idUser'] = fkIdUser;
    _data['amount_paid'] = amountPaid;
    _data['notes'] = notes;
    _data['nameUser'] = nameUser;
    _data['name_client'] = nameClient;
    _data['total'] = total;

    _data['products'] = products!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductsInvoice {
  ProductsInvoice({
     this.idInvoiceProduct,
     this.fkIdInvoice,
     this.fkProduct,
     this.amount,
     this.price,
     this.taxtotal,
     this.rateAdmin,
     this.rateUser,
     this.idProduct,
     this.nameProduct,
     this.priceProduct,
     this.type,
     this.fkCountry,
     this.fkConfig,
  });
  late final String? idInvoiceProduct;
  late final String? fkIdInvoice;
  late final String? fkProduct;
  late final String? amount;
  late final String? price;
  late final String? taxtotal;
  late final String? rateAdmin;
  late final String? rateUser;
  String? idProduct;
  String? nameProduct;
  late final String? priceProduct;
  String? type;
  late final String? fkCountry;
  String? fkConfig;

  ProductsInvoice.fromJson(Map<String, dynamic> json){
    idInvoiceProduct = json['id_invoice_product'];
    fkIdInvoice = json['fk_id_invoice'];
    fkProduct = json['fk_product'];
    amount = json['amount'];
    price = json['price'];
    taxtotal = json['taxtotal'];;
    rateAdmin = json['rate_admin'];
    rateUser = json['rateUser'];
    idProduct = json['id_product'];
    nameProduct = json['nameProduct'];
    priceProduct = json['priceProduct'];
    type = json['type'];
    fkCountry = json['fk_country'];
    fkConfig = json['fk_config'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_invoice_product'] = idInvoiceProduct;
    _data['fk_id_invoice'] = fkIdInvoice;
    _data['fk_product'] = fkProduct;
    _data['amount'] = amount;
    _data['price'] = price;
    _data['taxtotal'] = taxtotal;
    _data['rate_admin'] = rateAdmin;
    _data['rateUser'] = rateUser;
    _data['id_product'] = idProduct;
    _data['nameProduct'] = nameProduct;
    _data['priceProduct'] = priceProduct;
    _data['type'] = type;
    _data['fk_country'] = fkCountry;
    _data['fk_config'] = fkConfig;
    return _data;
  }
}