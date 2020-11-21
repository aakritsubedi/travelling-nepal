import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/models/aboutNepal.dart';

class AboutNepal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: aboutNepals.length,
        itemBuilder: (context, index) {
          var aboutNepal = aboutNepals[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width - 30,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 35.0,
                  child: Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                        color: primaryWhite,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          App.getText(
                              '${aboutNepal.name} ',
                              primaryBlack,
                              22.0,
                              true,
                              null,
                              null,
                              1.2),
                          App.getText('${aboutNepal.description} ',
                              primaryGrey, 14.0, false, null, null, null),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 8.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                        height: 170.0,
                        width: MediaQuery.of(context).size.width - 100,
                        image: NetworkImage(aboutNepal.imageUrl),
                        fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
