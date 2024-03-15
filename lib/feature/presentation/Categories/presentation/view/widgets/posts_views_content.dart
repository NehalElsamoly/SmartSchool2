import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/comments.dart';

import '../../../manager/posts_cubit.dart';

class PostViewContent extends StatelessWidget {
  const PostViewContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
 var cubit=   context.read<PostsCubit>();

    return  BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PostsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is postsucess) {
            return  SizedBox(
              height: MediaQuery.of(context).size.height, // Specify a height here
              child: ListView.builder(
                  itemCount: context.read<PostsCubit>().postsModel!.posts!.length,
                  //context.read<PostsCubit>().fetchPosts().
                  itemBuilder: (context, index) {
                    var post = state.postsModel.posts![index];
                    // Build your UI for each post here
                    return Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(color: colorTextField),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Image.asset(
                           post.photos![0]!.name!,
                             // preson,
                              height: MediaQuery.of(context).size.height / 21,
                              width: MediaQuery.of(context).size.width / 10,
                              fit: BoxFit.fill,
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mostafa Ali',
                                  style: Styles.style12.copyWith(
                                    color: texttitlecontent,
                                  ),
                                ),
                                Text(
                                  'Mostafa.zahra@gmail.com',
                                  style: Styles.style12.copyWith(
                                    color: textcontent,
                                  ),
                                )
                              ],
                            ),
                            Spacer(
                              flex: 4,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Text(
                            "School staff will listen to and work closely with parents to make sure your child feels safe and protected in the school environment.",
                            style: Styles.style12.copyWith(
                              color: text,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: textbutton,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  bottomLeft: Radius.circular(12.0),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: kprimarycolor,
                                  size: 30.sp,
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: MediaQuery.of(context).size.width / 70,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: textbutton,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return CommentsPost();
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.comment,
                                  color: kprimarycolor,
                                  size: 30.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ],
                      ),
                    )
                    );
                  },
                ),
            );
            }

          else {
              return Center(child: Container(
               child: Text("no data")
              ));
            }
          });

  }
}




