
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sample extends StatefulWidget {
  @override
  _sampleState createState() => _sampleState();
}

class _sampleState extends State<sample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomModalSheet'),
      ),
      body: InkWell(
          child: TextField(
            decoration: InputDecoration(
              enabled: false,
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Icon(Icons.add),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Icon(Icons.favorite_border_rounded),
              ),
            ),
          ),
          onTap: () {
            _showBottomSheet(context);
          }),
    );
  }

  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [false, false, false];
    super.initState();
    focusToggle = [focusNodeButton1, focusNodeButton2, focusNodeButton3];
  }

  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  late List<FocusNode> focusToggle;

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();
    focusNodeButton3.dispose();
    super.dispose();
  }

  _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                  height: 250,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: ToggleButtons(
                            // borderColor: Colors.black,
                            fillColor: Colors.white,
                            borderWidth: 4,
                            selectedBorderColor: Colors.pink,
                            selectedColor: Colors.pinkAccent,
                            splashColor: Colors.deepOrange[400],
                            focusNodes: focusToggle,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'you',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'me',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'them',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                for (int i = 0; i < isSelected.length; i++) {
                                  isSelected[i] = i == index;
                                }
                                print(isSelected[index].toString());
                              });
                            },
                            isSelected: isSelected,
                          ),
                        ),
                      ]));
            },
          );
        });
  }
}