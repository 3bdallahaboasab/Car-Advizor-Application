import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Functions/image_cropper_screen.dart';
import 'package:test/core/Functions/image_picker_class.dart';
import 'package:test/core/Functions/navigation.dart';
import 'package:test/core/Image/app_image.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/addCar/presentation/pages/add_manual_screen.dart';
import 'package:test/features/addCar/presentation/pages/camera_screen.dart';
import 'package:test/features/addCar/presentation/widgets/widget_or_line.dart';
import 'package:test/features/widget/widget_button.dart';
import 'package:test/features/widget/widget_dilog.dart';
import 'package:test/features/widget/widget_text_from_filds.dart';
import 'package:test/layout_screen.dart';
// import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';

class AddCarScreen extends StatefulWidget {
  final String? path;
  const AddCarScreen({super.key, this.path});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  TextEditingController search = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    if (widget.path != null && widget.path != '') {
      final InputImage inputImage = InputImage.fromFilePath(widget.path!);
      processImage(inputImage);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize(context).width * 0.05,
          vertical: AppSize(context).height * 0.02),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Title & Note
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Write the VIN Number ',
                style: TextStyle(
                  fontSize: AppSize(context).smallText1,
                  color: AppColors.blackColor1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 3),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => WidgetDailog.customShowDailog(
                        descriptions:
                            'The Car/s vehicle identification number (VIN) is the identifying code for a SPECIFIC automobaile',
                        context: context,
                        title: ''),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.info_outline,
                    color: AppColors.blackColor1,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: AppSize(context).height * 0.02),
          // * Search
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: WidgetTextField(
                  'EX : 4Y1SL65848Z411439',
                  radius: 10,
                  controller: search,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    onPressed: () {
                      showMenu();
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.whiteColor1,
                    )),
              )
            ],
          ),
          SizedBox(height: AppSize(context).height * 0.02),
          // * Find
          isLoading == true
              ? const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                )
              : WidgetButton(
                  title: 'Find',
                  radius: 10,
                  height: AppSize(context).height * 0.06,
                ),
          const WidgetOrDivider(),
          // * Add Manual
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Write the VIN Number ',
                style: TextStyle(
                  fontSize: AppSize(context).smallText1,
                  color: AppColors.blackColor1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 3),
              InkWell(
                onTap: () => Navigator.push(
                    context, rightToLeft(const AddManualScreen())),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Text(
                    'Add manual',
                    style: TextStyle(
                      fontSize: AppSize(context).smallText3,
                      color: AppColors.blackColor1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
          // * Image
          SizedBox(
            height: AppSize(context).height * 0.5,
            width: double.infinity,
            child: Image(image: AppImage.addCar),
          )
        ],
      ),
    );
  }

  void showMenuSelectImage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.only(bottom: 20),
            elevation: 0.0,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: AppSize(context).width * 0.9,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        highlightColor: AppColors.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_outlined,
                              size: 20,
                              color: AppColors.indigoColor,
                            ),
                            SizedBox(width: AppSize(context).width * 0.02),
                            Text(
                              'Select a picture from gallery',
                              style: TextStyle(
                                fontSize: AppSize(context).smallText3,
                                color: AppColors.indigoColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        highlightColor: AppColors.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: AppColors.indigoColor,
                            ),
                            SizedBox(width: AppSize(context).width * 0.02),
                            Text(
                              'Take a picture from camera',
                              style: TextStyle(
                                fontSize: AppSize(context).smallText3,
                                color: AppColors.indigoColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  onTap: () => pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: AppSize(context).smallText3,
                          color: AppColors.indigoColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
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
        'Add Cars',
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

  void showMenu() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.only(bottom: 20),
            elevation: 0.0,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: AppSize(context).width * 0.9,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          pickImage(
                                  source: ImageSource.gallery, context: context)
                              .then((value) {
                            if (value != '') {
                              imageCropperView(value, context).then((value) {
                                if (value != '') {
                                  Navigator.pushReplacement(
                                      context,
                                      downToTop(AddCarScreen(
                                        path: value,
                                      )));
                                }
                              });
                            }
                          });
                        },
                        highlightColor: AppColors.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_outlined,
                              size: 20,
                              color: AppColors.indigoColor,
                            ),
                            SizedBox(width: AppSize(context).width * 0.02),
                            Text(
                              'Select a picture from gallery',
                              style: TextStyle(
                                fontSize: AppSize(context).smallText3,
                                color: AppColors.indigoColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          pickImage(
                                  source: ImageSource.camera, context: context)
                              .then((value) {
                            if (value != '') {
                              imageCropperView(value, context).then((value) {
                                if (value != '') {
                                  log('Image path : $value');
                                  Navigator.pushReplacement(
                                      context,
                                      downToTop(AddCarScreen(
                                        path: value,
                                      )));
                                }
                              });
                            }
                          });
                        },
                        highlightColor: AppColors.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: AppColors.indigoColor,
                            ),
                            SizedBox(width: AppSize(context).width * 0.02),
                            Text(
                              'Take a picture from camera',
                              style: TextStyle(
                                fontSize: AppSize(context).smallText3,
                                color: AppColors.indigoColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  onTap: () => pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: AppSize(context).smallText3,
                          color: AppColors.indigoColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  void processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    if (mounted) {
      setState(() {
        search.text = recognizedText.text;
      });
    }

    ///End loading state

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
