import 'package:flutter/widgets.dart';
import 'package:travellingNepal/app.dart';

class ExplorerNavBar extends StatelessWidget {
  final List<String> menuItems;

  ExplorerNavBar({this.menuItems});

  Widget myMenu(item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryGrey,
          width: 0.5
        ),
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 28.0,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return myMenu(menuItems[index]);
          },
        ));
  }
}
