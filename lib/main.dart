
// import 'package:flutter/material.dart';





// class TwoContainersWithClipPath extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Top container with custom ClipPath shape
//           ClipPath(
//             clipper: BottomCircleClipper(),
//             child: Container(
//               height: 300,
//               decoration:BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(20)
                
//               ),
              
//               child: Center(
//                 child: Text(
//                   'Top Container',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Bottom container
//           Expanded(
//             child: Container(
//               color: Colors.grey[200],
//               child: Center(
//                 child: Text(
//                   'Bottom Container',
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom clipper for circular shape at the bottom
// class BottomCircleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final Path path = Path();
//     path.lineTo(0, size.height);
//     path.lineTo(30, size.height);
//      path.arcToPoint(
//       Offset(40, size.height-10),
//       radius: Radius.circular(300), // Adjust radius for rounding outside
//       clockwise: false,
//     );
    
//     //  path.arcToPoint(
//     //   Offset(40, size.height-10),
//     //   radius: Radius.circular(100), // Adjust radius for rounding outside
//     //   clockwise: false,
//     // );
//        path.quadraticBezierTo(
//       70,
//       size.height - 30, // Extend inside radius
//       100, 
//       size.height-10,
//     );    
    
//     //    path.quadraticBezierTo(
//     //   65,
//     //   size.height -10, // Extend inside radius
//     //   100, 
//     //   size.height-10,
//     // );


//      path.arcToPoint(
//       Offset(100, size.height-10),
//       radius: Radius.circular(100), // Adjust radius for rounding outside
//       clockwise: false,
//     );
//      path.arcToPoint(
//       Offset(110, size.height),
//       radius: Radius.circular(100), // Adjust radius for rounding outside
//       clockwise: false,
//     );
//     // path.lineTo(40, size.height-10);
//     //  path.arcToPoint(Offset(40, size.height-50),
//     //  radius: Radius.circular(50)
//     //  );// Move to bottom left
//     //  path.lineTo(120, size.height-50);
//     // path.lineTo(120, size.height);
//     path.arcToPoint(
//       Offset(size.width, size.height ), // Create a circular arc
// //       radius: Radius.circular(10),
// //       clockwise: true,
//     );
//     path.lineTo(size.width, 0); // Move to top right
//     path.close(); // Close the path
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller.dart';

class LocationView extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Location Using GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  locationController.locationMessage.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                locationController.getCurrentLocation();
              },
              child: Text("Get Current Location"),
            ),
          ],
        ),
      ),
    );
  }
}



void main() => runApp(MaterialApp(home: LocationView()));
