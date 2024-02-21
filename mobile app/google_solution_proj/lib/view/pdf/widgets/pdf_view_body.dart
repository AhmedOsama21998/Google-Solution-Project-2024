import 'package:flutter/material.dart';
import 'package:google_solution_proj/config/assets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewBody extends StatefulWidget {
  const PdfViewBody({super.key});

  @override
  State<PdfViewBody> createState() => _PdfViewBodyState();
}

class _PdfViewBodyState extends State<PdfViewBody> {
  late PdfViewerController pdfViewerController;
  @override
  void initState() {
    pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.zoom_in),
              onPressed: () {
                pdfViewerController.zoomLevel = 1.25;
              },
            ),
          ],
        ),
        body: SfPdfViewer.asset(
          AssetData.crops,
          controller: pdfViewerController,
        ),
      ),
    );
  }
}
