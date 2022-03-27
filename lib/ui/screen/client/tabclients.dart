import 'package:crm_smart/ui/widgets/cardClient.dart';
import 'package:flutter/cupertino.dart';

class tabclients extends StatelessWidget {
  const tabclients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build tabview');
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cardClient(),
            ));
          }),
    );
  }
}
