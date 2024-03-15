import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/appbar_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/bottom_naviagetion_bar.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/posts_views_content.dart';

import '../../manager/posts_cubit.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsCubit>().fetchPosts();
  }
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 23,
              ),
              Text(
                'New Posts',
                style: Styles.style18.copyWith(
                  color: texttitlecontent,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
             const PostViewContent(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNaviatonBar(),
    );
  }
}


