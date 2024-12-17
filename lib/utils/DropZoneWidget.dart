import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:nepalibussiness/model/file_DataModel.dart';

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<File_Data_Model> onDroppedFile;

  const DropZoneWidget({Key? key, required this.onDroppedFile})
      : super(key: key);
  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final widgetWidth = screenWidth * 0.8; // 80% of screen width
    final widgetHeight = screenHeight * 0.3; // 30% of screen height

    return Center(
      child: Container(
        width: widgetWidth,
        height: widgetHeight,
        child: buildDecoration(
          child: Stack(
            children: [
              DropzoneView(
                onCreated: (controller) => this.controller = controller,
                onDropFile: UploadedFile,
                onHover: () => setState(() => highlight = true),
                onLeave: () => setState(() => highlight = false),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size:
                            widgetHeight * 0.4, 
                        color: Colors.white,
                      ),
                      Text(
                        'Drop Files Here',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widgetHeight * 0.1, 
                        ),
                      ),
                      SizedBox(
                        height: widgetHeight * 0.05, 
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final events = await controller.pickFiles();
                          if (events.isEmpty) return;
                          UploadedFile(events.first);
                        },
                        icon: Icon(
                          Icons.search,
                          size: widgetHeight * 0.1, 
                        ),
                        label: Text(
                          'Choose File',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                widgetHeight * 0.08, 
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor:
                              highlight ? Colors.blue : Colors.green.shade300,
                          shape: const RoundedRectangleBorder(),
                        ),
                      )
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

  Future UploadedFile(dynamic event) async {
    final name = event.name;

    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    final droppedFile =
        File_Data_Model(name: name, mime: mime, bytes: byte, url: url);

    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = highlight ? Colors.blue : Colors.green;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: colorBackground,
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.white,
          strokeWidth: 3,
          dashPattern: [8, 4],
          radius: const Radius.circular(10),
          padding: EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
