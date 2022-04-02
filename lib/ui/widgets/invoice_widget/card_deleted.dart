

import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:flutter/material.dart';

class card_deleted extends StatelessWidget {
  card_deleted({required this.card, Key? key}) : super(key: key);
  DeletedinvoiceModel card;
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {

    return Container(
    height: 50,
    color: Colors.amber[colorCodes[1]],
    child: Center(child: Text(card.nameEnterprise.toString())),
  );
  }
}
