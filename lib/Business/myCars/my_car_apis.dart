// import 'dart:developer';

// import 'package:test/core/Api/http_request.dart';
// import 'package:test/core/Strings/end_points.dart';
// import 'package:test/core/model/my_car_model.dart';

// class MyCarsApis {
//   static MyCarsModel? myCarsModel;

//   // * Get All Data My Cars
//   static Future getAllDataForDashboard() async {
//     try {
//       final response = await HttpHelper.getData(
//         query: EndPoints.myCar,
//         token:
//             'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6IkFzYUF1dG9zQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2F1dGhlbnRpY2F0aW9uIjoiNTgiLCJwcmltYXJ5c2lkIjoiMjAiLCJuYmYiOjE2ODg5MDE3MDQsImV4cCI6MTc1MjA2MDEwNCwiaWF0IjoxNjg4OTAxNzA0fQ.OUiPy3e5BgVgsz7p7dBxKlVUL3DEcRVsxB2XBM_8YhE',
//       );

//       log('getAllDataForDashboard() [ Status ] : ${response.statusCode} ');

//       final body = json.decode(response.body);
//       if (response.statusCode == 200) {
//         myCarsModel = MyCarsModel.fromJson(body);
//         if (myCarsModel != null) {

//         } else {
//           log('Somthing Error');
//         }
//       } else {
//         log('Somthing Error');
//       }
//     } catch (e) {
//       log('getAllDataForDashboard() [ Error ] : $e ');
//     }
//   }
// }
