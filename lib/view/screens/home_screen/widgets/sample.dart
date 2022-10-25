// import 'package:flaunt_ecommenrce/view/constants/constants.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class SGridViewWidget extends StatelessWidget {
//   const SGridViewWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Container(
//         height: height,
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         child: MasonryGridView.count(
//           itemCount: 6,
//           crossAxisCount: 2,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//           itemBuilder: (context, index) {
//             return image(index);
//           },
//         ));
//   }
// }

// Widget image(int index) => Container(
//       clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage(
//               "assets/images/onboarding7.png",
//             ),
//             fit: BoxFit.cover),
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.red,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             width: 200,
//             height: (index % 5 + 1) * 100,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//             ),
//             child: Column(
//               children: [Text("data"), Text("data")],
//             ),
//           ),
//         ],
//       ),
//     );

// //  Stack(
// //               children: [
// //                 Container(
// //                   height: height * .3,
// //                   width: width / 2,
// //                   decoration: BoxDecoration(
// //                     image: DecorationImage(
// //                         image: AssetImage("assets/images/onboarding7.png"),
// //                         fit: BoxFit.cover),
// //                     borderRadius: BorderRadius.circular(20),
// //                     color: Colors.red,
// //                   ),
// //                 ),
// //                 Positioned(bottom: -10, child: Text("data"))
// //               ],
// //             )
