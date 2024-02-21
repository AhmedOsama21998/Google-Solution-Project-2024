import 'package:flutter/material.dart';
import 'package:google_solution_proj/view/pdf/widgets/pdf_view_body.dart';

class PdfView extends StatefulWidget {
  const PdfView({super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return const PdfViewBody();
  }
}
