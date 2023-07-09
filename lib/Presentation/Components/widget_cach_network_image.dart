import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WidgetCachNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit? boxFit;
  const WidgetCachNetworkImage({
    Key? key,
    required this.image,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:   [
          SizedBox(
            width: 12,
            height: 12,
            child: Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
          ),
        ],
      ),
      errorWidget: (context, url, error) =>const  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:   [
          Center(
            child: Icon(
              Icons.error,
              size: 20.0,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class CustomCachNetworkImage extends StatelessWidget {
//   final String image;
//   const CustomCachNetworkImage({
//     Key? key,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//         imageUrl: image,
//         imageBuilder: (context, imageProvider) => Container(
//             decoration: BoxDecoration(
//                 image:
//                     DecorationImage(image: imageProvider, fit: BoxFit.fill))),
//         placeholder: (context, url) => Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Center(child: CircularProgressIndicator()),
//               ],
//             ),
//         errorWidget: (context, url, error) => Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Center(
//                       child: Icon(Icons.error,
//                           size: 40.0, color: Colors.redAccent))
//                 ]));
//   }
// }

// class Custom2CachNetworkImage extends StatelessWidget {
//   final String image;
//   const Custom2CachNetworkImage({
//     Key? key,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//         imageUrl: image.replaceAll('majarreh.', ''),
//         // 'https://assets.ajio.com/medias/sys_master/root/20220121/DwGv/61ea58afaeb2695cdd2436ee/-473Wx593H-461575169-maroon-MODEL.jpg',
//         imageBuilder: (context, imageProvider) => Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: imageProvider, fit: BoxFit.contain))),
//         placeholder: (context, url) => Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Center(child: CircularProgressIndicator()),
//               ],
//             ),
//         errorWidget: (context, url, error) => Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Center(
//                       child: Icon(Icons.error,
//                           size: 40.0, color: Colors.redAccent))
//                 ]));
//   }
// }

// class Custom3CachNetworkImage extends StatelessWidget {
//   final String image;
//   const Custom3CachNetworkImage({
//     Key? key,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//         imageUrl: image.replaceAll('majarreh.', ''),
//         // 'https://assets.ajio.com/medias/sys_master/root/20220121/DwGv/61ea58afaeb2695cdd2436ee/-473Wx593H-461575169-maroon-MODEL.jpg',
//         imageBuilder: (context, imageProvider) => Container(
//             decoration: BoxDecoration(
//                 image:
//                     DecorationImage(image: imageProvider, fit: BoxFit.cover))),
//         placeholder: (context, url) => Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Center(child: CircularProgressIndicator()),
//               ],
//             ),
//         errorWidget: (context, url, error) => Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Center(
//                       child: Icon(Icons.error,
//                           size: 40.0, color: Colors.redAccent))
//                 ]));
//   }
// }
