import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/services/stories.dart';

class PreviewScreen extends StatefulWidget {
  final String imgPath;

  PreviewScreen({this.imgPath});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  bool status;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.file(
                  File(widget.imgPath),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0
                  ),
                  width: double.infinity,
                  height: 60.0,
                  color: primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                          color: primaryGrey,
                          onPressed: () async {
                            final bytes =
                                File(widget.imgPath).readAsBytesSync();
                            String caption = 'Travelling Nepal: once is not en';
                            String uploadedBy = 'Traveller';
                            String location = 'Kathmandu';
                            String imageBase64 =
                                'data:image/png;base64,' + base64Encode(bytes);
                            String coordinate =
                                '{ lat: 27.7172, lng: 85.3240 }';
                            String filename = widget.imgPath.split('/').last;
                            String type = 'story';

                            status = await StoriesService.addStories({
                              'caption': caption,
                              'uploadedBy': uploadedBy,
                              'location': location,
                              'coordinate': coordinate,
                              'filename': filename,
                              'imageBase64': imageBase64,
                              'type': type
                            });
                            
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              SizedBox(width: 4.0),
                              Text('Upload',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }
}
