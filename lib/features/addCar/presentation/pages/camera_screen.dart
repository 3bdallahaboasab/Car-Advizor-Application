// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:test/core/Functions/app_size.dart';
// import 'package:test/core/Functions/image_cropper_screen.dart';
// import 'package:test/core/Functions/navigation.dart';

// import 'package:test/core/Theme/color_constant.dart';
// import 'package:test/features/addCar/presentation/pages/add_car_screen.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   Future<void>? _initializeControllerFuture;
//   File? photo;

//   bool isPhotoSelected = false;
//   late List<CameraDescription> cameras;
//   late CameraController controller;
//   bool loading = false;

//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//   }

//   Future<void> initializeCamera() async {
//     if (mounted) {
//       setState(() {
//         loading = true;
//       });
//     }
//     cameras = await availableCameras();
//     controller = CameraController(cameras[0], ResolutionPreset.medium);
//     await controller.initialize();
//     if (mounted) {
//       setState(() {
//         loading = false;
//       });
//     }
//     _initializeControllerFuture = controller.initialize();
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.blackColor1,
//         leading: Container(
//             margin: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: AppColors.whiteColor1,
//               borderRadius: BorderRadius.circular(1000000),
//             ),
//             child: IconButton(
//                 onPressed: () {
//                   pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: AppColors.blackColor1,
//                   size: 20,
//                 ))),
//       ),
//       backgroundColor: AppColors.blackColor1,
//       body: SafeArea(
//           child: Center(
//         child: loading == true
//             ? const SizedBox(
//                 width: 40,
//                 height: 40,
//                 child: CircularProgressIndicator(),
//               )
//             : Column(
//                 children: [
//                   SizedBox(height: AppSize(context).height * 0.3),
//                   SizedBox(
//                     width: AppSize(context).width * 0.9,
//                     height: AppSize(context).height * 0.2,
//                     child: AspectRatio(
//                       aspectRatio: controller.value.aspectRatio,
//                       child: CameraPreview(controller),
//                     ),
//                   ),
//                   SizedBox(height: AppSize(context).height * 0.1),
//                   InkWell(
//                     onTap: () {
//                       _capturePhoto();
//                     },
//                     borderRadius: BorderRadius.circular(10000),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10000),
//                       ),
//                       elevation: 20,
//                       child: Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                           color: AppColors.whiteColor1,
//                           borderRadius: BorderRadius.circular(10000),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//       )),
//     );
//   }

//   Future<void> _capturePhoto() async {
//     try {
//       await _initializeControllerFuture;

//       final image = await controller.takePicture();

//       setState(() {
//         photo = File(image.path);
//         isPhotoSelected = true;
//       });

//       imageCropperView(photo!.path, context).then((value) {
//         if (value != '') {
//           Navigator.pushReplacement(
//               context,
//               downToTop(AddCarScreen(
//                 path: value,
//               )));
//         }
//       });
//     } catch (e) {
//       print('Error capturing photo: $e');
//     }
//   }
// }
