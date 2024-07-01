// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:service/config/palette.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../config/models/job.dart';
// import 'company_profile_screen.dart';
// class JobDetailScreen extends StatelessWidget {
//   final Job job;
//
//   JobDetailScreen({required this.job});
//
//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _showApplyOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text(
//                 'Apply for ${job.company}',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               ListTile(
//                 leading: Icon(Icons.web),
//                 title: Text('Apply on Company Website'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _launchURL(job.applyUrl);
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.email),
//                 title: Text('Apply via Email'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _launchURL('mailto:hr@${job.company}.com'); // Assuming an email structure
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.upload_file),
//                 title: Text('Upload Resume'),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//                   if (result != null) {
//                     PlatformFile file = result.files.first;
//                     // Implement file upload functionality here, e.g., upload to a server or save locally
//                     print('Picked file: ${file.name}, size: ${file.size}');
//                   } else {
//                     // User canceled the picker
//                   }
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Palette.facebookColor,
//         title: Text("About the Opportunity"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(15),
//                           child: Image.asset(
//                             'assets/images/car.jpg',
//                             height: 150,
//                             width: 350,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         job.company,
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         job.location,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         job.salary,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.green,
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         job.description,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Palette.facebookColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (ctx) => CompanyProfileScreen(url: job.companyProfileUrl),
//                     ));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                     child: Text(
//                       'View Company Profile',
//                       style: TextStyle(fontSize: 16,color: Colors.black),
//
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 70),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Palette.facebookColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () => _showApplyOptions(context),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                     child: Text(
//                       'Apply Now',
//                       style: TextStyle(fontSize: 16,color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CompanyProfileScreen extends StatelessWidget {
//   final String url;
//
//   CompanyProfileScreen({required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Company Profile"),
//       ),
//       body: Center(
//         child: Text("Company profile page for URL: $url"),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service/config/palette.dart';
import 'package:service/jop/JobListPage.dart';
import 'package:service/screens/detail/componant/body.dart';

import '../../config/palette.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({super.key, required Job job});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.facebookColor,
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: kBackgroundColor,
      elevation: 0.0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icon/back.svg"),
        onPressed: () {Navigator.pop(context);},
      ),
      title: Text("Back".toUpperCase(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
      actions:<Widget> [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icon/cart_with_item.svg")),
        )
      ],


    );
  }
}
