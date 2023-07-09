import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Functions/navigation.dart';
import 'package:test/core/Theme/color_constant.dart';

class PDFScreen extends StatefulWidget {
  final String pdfUrl;
  const PDFScreen({super.key, required this.pdfUrl});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  bool _isLoading = true;
  String? _pdfPath;

  @override
  void initState() {
    super.initState();
    _loadFromUrl();
  }

  Future<void> _loadFromUrl() async {
    try {
      final response = await http.get(Uri.parse(widget.pdfUrl));
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/mypdf.pdf');
      await file.writeAsBytes(response.bodyBytes);
      if (mounted) {
        setState(() {
          _pdfPath = file.path;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: _pdfPath!,
            ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'Invoice PDF',
        style: TextStyle(
          fontSize: AppSize(context).mediumText3,
          color: AppColors.whiteColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: const SizedBox(),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: AppSize(context).mediumText3,
                    color: AppColors.whiteColor1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
