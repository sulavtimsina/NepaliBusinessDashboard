import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/filecontroller.dart';
import 'package:nepalibussiness/model/file_DataModel.dart';
import 'package:dotted_border/dotted_border.dart';

class DropZoneWidget extends StatelessWidget {
  DropZoneWidget({Key? key}) : super(key: key);

  final FileController fileController = Get.find<FileController>();
  final Rx<DropzoneViewController?> dropzoneController =
      Rx<DropzoneViewController?>(null);
  final RxBool highlight = false.obs;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: Obx(() {
        return Container(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.3,
          child: buildDecoration(
            highlight: highlight.value,
            child: Stack(
              children: [
                DropzoneView(
                  onCreated: (controller) =>
                      dropzoneController.value = controller,
                  onDropFile: UploadedFile,
                  onHover: () => highlight.value = true,
                  onLeave: () => highlight.value = false,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: screenSize.height * 0.1,
                        color: Colors.white,
                      ),
                      const Text(
                        'Drop Files Here',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final events =
                              await dropzoneController.value?.pickFiles();
                          if (events != null && events.isNotEmpty) {
                            UploadedFile(events.first);
                          }
                        },
                        icon: const Icon(Icons.search),
                        label: const Text('Choose File'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> UploadedFile(dynamic event) async {
    if (dropzoneController.value == null) return;

    final name = event.name;
    final mime = await dropzoneController.value!.getFileMIME(event);
    final byte = await dropzoneController.value!.getFileSize(event);
    final url = await dropzoneController.value!.createFileUrl(event);

    final droppedFile =
        File_Data_Model(name: name, mime: mime, bytes: byte, url: url);
    fileController.setFile(droppedFile);

    highlight.value = false;
  }

  Widget buildDecoration({required bool highlight, required Widget child}) {
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
