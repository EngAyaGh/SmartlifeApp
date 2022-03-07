import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/widgets/bottomnavigatorbar.dart';
import 'package:crm_smart/ui/widgets/tabar.dart';
import 'package:crm_smart/ui/widgets/tabview.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class client_dashboard extends StatefulWidget {
  const client_dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _client_dashboard();
}
  class _client_dashboard extends State<client_dashboard> with TickerProviderStateMixin{

    Widget _switchcaseBody(int _selectedIndex){
      var _selectedView;
      switch(_selectedIndex){
        case 0:
          _selectedView=customtabview();
          break;
        case 1:
          _selectedView=Icon(
            Icons.camera,
            size: 150,
          );
          break;
        case 2:
          _selectedView=    Icon(
            Icons.chat,
            size: 150,
          );
          break;
      }
      return _selectedView;
    }
    PreferredSizeWidget _switchcaseAppBar(int _selectedIndex){
    var _selectedView;
    switch(_selectedIndex){
      case 0:
          _selectedView=AppBar( backgroundColor: Colors.white,
          elevation: 0,
          bottom: customtabBar(),);
        break;
      case 1:
        _selectedView=AppBar();
        break;
      case 2:
        _selectedView=AppBar();
        break;
    }
    return _selectedView;
  }

    @override
    Widget build(BuildContext context) {
      print('build tabbar');
      int _tabBarIndex = 0;
      TabController _tabcontroller=TabController(length: 3, vsync: this);
      return DefaultTabController(
      length: 3,
      child:Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
           margin: EdgeInsets.only(bottom: 20,top: 20),
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20,right: 20),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabcontroller,
              indicatorColor: kMainColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              //isScrollable: true,
              tabs: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('120',
                      style: TextStyle(
                      color: _tabBarIndex == 0 ? kMainColor : kUnActiveColor,
                      fontSize: _tabBarIndex == 0 ? 10 : null,
                          height:0.2,
                          fontWeight: FontWeight.bold,
                          //decoration: TextDecoration.underline,
                          //decorationThickness: 2,

                          decorationStyle: TextDecorationStyle.double
                    ),),
                    //Icon(Icons.category,color: kMainColor,),
                    SizedBox(width: 5,),
                    Text(
                      'المشتركين',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _tabBarIndex == 0 ?kMainColor : kUnActiveColor,
                        fontSize: _tabBarIndex == 0 ? 14 : null,
                      ),
                    ),
                  ],
                ),
                Text(
                  'قيد الموافقة',
                  style: TextStyle(
                    //color: _tabBarIndex == 1 ? Colors.black : kUnActiveColor,
                    //fontSize: _tabBarIndex == 1 ? 16 : null,
                  ),
                ),
                Text(
                  'قيد الاشتراك',
                  style: TextStyle(
                    //color: _tabBarIndex == 2 ? Colors.black : kUnActiveColor,
                    //fontSize: _tabBarIndex == 2 ? 16 : null,
                  ),
                ),
              ],
            ),
          ),
            Container(
              margin: EdgeInsets.only(bottom: 1),
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height*0.6,
              child: TabBarView(
                controller: _tabcontroller,
                children: <Widget>[
                  tabclients(),
                  Icon(Icons.description),
                  Icon(Icons.add),
                ],
              ),
            )

          ],
        ),
      //  appBar: _switchcaseAppBar(0),

       // body:_switchcaseBody(0),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kMainColor,
      onPressed: (){},
      tooltip: 'إضافة عميل',
      child: Icon(Icons.add),
        ),
      ),
      );
    }
  }

