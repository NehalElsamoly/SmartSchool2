import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/appbar_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/bottom_naviagetion_bar.dart';

class VisionView extends StatefulWidget {
  const VisionView({super.key});

  @override
  State<VisionView> createState() => _VisionViewState();
}

class _VisionViewState extends State<VisionView> {
  final myitems = [
    ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(slide),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(slide),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(slide),
    ),
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingView(),
        title: const TitleAppBarView(),
        titleTextStyle: const TextStyle(
          fontSize: 15,
        ),
        actions: [
          SvgPicture.asset(
            logoIc,
            height: 80,
          ),
        ],
      ),
      backgroundColor: textbutton,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                SvgPicture.asset(
                  vision,
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(
                  "Vision",
                  style: Styles.style30.copyWith(
                    color: titlecolor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height / 4,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 10),
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                ),
                items: myitems,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AnimatedSmoothIndicator(
                activeIndex: myCurrentIndex,
                count: myitems.length,
                effect:const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 10,
                  dotColor: dotColor,
                  activeDotColor: kprimarycolor,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Vision International School, is an English medium, Co-Educational School, that was founded in the year 2008. The school has around 2500 students and has quickly become one of the most reputed schools in the area. The sprawling 3 acres campus of our school comprises a 100000 sq. ft. built up area and a 2 acres Sports & Games Ground. There are three buildings equipped with all the amenities to facilitate all round development for our students. The campus has a lot of open space which is lined with trees and plants to enhance the serenity. This state-of -the-art infrastructure makes VIS the most befitting place to joyously spend ones SCHOOL LIFE !! Our system of imparting education employs a healthy amalgamation of traditional methods and modern techniques. We strive to make school life.",
                style: Styles.style14.copyWith(
                  color: text,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviatonBar()
    );
  }
}
//
