import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/appbar_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/bottom_naviagetion_bar.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/categories_list_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingView(),
        title: const TitleAppBarView(),
        titleTextStyle: TextStyle(
          fontSize: 15.sp,
        ),
        actions: [
          SvgPicture.asset(
            logoIc,
            height: 80,
          )
        ],
      ),
      body: const Categories(),
      bottomNavigationBar: const BottomNaviatonBar(),
    );
  }
}


 
   
// Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//          const   SizedBox(
//               height: 20,
//             ),
//           const  Text(
//               'New Posts',
//               style: TextStyle(
//                 color: Color(0xff777A95),
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//            const SizedBox(
//               height: 20,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color:const Color(0xffF5F5F5),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(children: [
//                 Row(
//                   children: [
//                     Image.asset(preson),
//                    const Spacer(),
//                   const  Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Mostafa Ali',
//                           style: TextStyle(
//                             color: Color(0xff777A95),
//                           ),
//                         ),
//                         Text(
//                           'Mostafa.zahra@gmail.com',
//                           style: TextStyle(color: Color(0xffA0A2B3)),
//                         ),
//                         Spacer(
//                           flex: 3,
//                         )
//                       ],
//                     ),
//                   ],
//                 )
//               ]),
//             )
//           ],
//         ),
//       ),