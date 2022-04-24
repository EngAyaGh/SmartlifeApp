import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/search/search_mv.dart';
import 'package:flutter/material.dart';

class search_widget extends StatelessWidget {
  search_widget(this.hint, this.list, {Key? key}) : super(key: key);
  String hint='';
  List<dynamic> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
               Radius.circular(5),
          )),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.black,
            ),
            title: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (pattern) async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => productSearchView(
                        pattern, list))); //.search(productName: pattern);
//changeScreen(context, ProductSearchScreen());
              },
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
