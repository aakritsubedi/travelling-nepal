import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlightTable extends StatelessWidget {
  final List arrivals;
  final List departure;

  FlightTable({this.arrivals, this.departure});

  Container getTable(data) {
    List<TableRow> tableRows = new List<TableRow>();

    data.forEach((item) {
      tableRows.add(TableRow(children: [
        TableCell(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item['FlightNumber'] ?? '-'),
        )),
        TableCell(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item['OrigDest'] ?? '-', overflow: TextOverflow.ellipsis,),
        )),
        TableCell(child: Column(
          children: [
            SizedBox(height:2.0),
            Text('STD: ${item['STASTD_DATE'].split(" ")[1].substring(0,5)}' ?? '-'),
            SizedBox(height:1.0),
            Text('ETD: ${item['ETAETD_date'].split(" ")[1].substring(0,5)}' ?? '-'),
            SizedBox(height:1.0),
          ],
        )),
        TableCell(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item['FlightStatus'] ?? '-'),
        ))
      ]));
    });

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Table(
          border: TableBorder.all(width: 1.0, color: Colors.grey[300]),
          children: [
            TableRow(children: [
              TableCell(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Flight'),
              )),
              TableCell(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Origin'),
              )),
              TableCell(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Schedule'),
              )),
              TableCell(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Status'),
              ))
            ]),
            ...tableRows
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Text('Arrival',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        getTable(arrivals),
        Text('Departure',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        getTable(departure)
      ],
    ));
  }
}
