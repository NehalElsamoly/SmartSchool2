import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/commentWidget.dart'; 
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/reactsposts.dart';

class CommentsPost extends StatelessWidget {
  const CommentsPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                "25",
                style: Styles.style18.copyWith(
                  fontSize: 20.sp,
                  color: texttitlecontent,
                ),
              ),
             const Spacer(
                flex: 1,
              ),
              Icon(
                Icons.call_made,
                color: texttitlecontent,
                size: 20.sp,
              ),
             const Spacer(
                flex: 1,
              ),
              GestureDetector(
                child: Text(
                  "Reactes",
                  style: Styles.style18.copyWith(
                    fontSize: 20.sp,
                    color: titlecolor,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ReactsPost();
                      },
                    ),
                  );
                },
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
            SingleComment(
              imageauther: preson,
              auther: "Mostafa",
              comment:
                  "School staff will listen to and work closely with parents to make sure your child feels safe and protected in the school environment.",
            ),
            SingleComment(
              imageauther: preson,
              auther: "Ahmed",
              comment: "School staff will listen to and work closely.",
            ),
            SingleComment(
              imageauther: preson,
              auther: "Mohmed",
              comment:
                  "School staff will listen to and work closely with parents to make sure your child feels safe and protected in the school environment. School staff will listen to and work closely with parents to make sure your child feels safe and protected in the school environment. School staff will listen to and work closely with parents to make sure your child feels safe and protected in the school environment.",
            ),
            SingleComment(
              imageauther: preson,
              auther: "Mostafa",
              comment:
                  "School staff will listen to and work closely with parents to make sure your child feels safe and protected in the school environment.",
            ),
            SingleComment(
              imageauther: preson,
              auther: "Mostafa",
              comment: "School staff will listen to and work closely.",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Add your comment',
            hintStyle: const TextStyle(
              color: kprimarycolor,
            ),
            suffixIcon: const Icon(
              Icons.send,
              color: kprimarycolor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: textcontent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: textcontent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
