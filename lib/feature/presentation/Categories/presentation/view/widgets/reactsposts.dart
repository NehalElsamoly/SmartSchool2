import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

class ReactsPost extends StatelessWidget {
  const ReactsPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textbutton,
      appBar: AppBar(
        backgroundColor: textbutton,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                "People who reacted",
                style:
                    Styles.style18.copyWith(color: titlecolor, fontSize: 20.sp),
              ),
              const Spacer(
                flex: 8,
              ),
              Icon(
                Icons.thumb_up_alt_rounded,
                color: kprimarycolor,
                size: 20.sp,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: colorTextField,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        preson,
                        height: MediaQuery.of(context).size.height / 21,
                        width: MediaQuery.of(context).size.width / 10,
                        fit: BoxFit.cover,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mostafa Maher',
                              style: Styles.style16
                                  .copyWith(color: texttitlecontent)),
                          Text(
                            'Mostafa2003@gmail.com',
                            style: Styles.style14.copyWith(
                                color: textcontent,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
