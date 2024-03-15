import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

import '../news/manager/news_cubit.dart';
import '../news/manager/news_state.dart';

class NewsContent extends StatelessWidget {
  NewsContent({
    super.key,
    this.image,
    this.title,
    this.description,
  });

  String? image;
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit, NewaState>(
        listener: (context, state) {

    },
    builder: (context, state) {
    if (state is NewsLoading) {
    return Center(
    child: CircularProgressIndicator(),
    );
    } else if (state is Newssucess) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title??"",
            style: Styles.style16.copyWith(
              fontWeight: FontWeight.w600,
              color: text,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  description??"",
                  style: Styles.style12.copyWith(
                    color: text,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    image??"",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    } else {
      return Center(child: Container(child: Text("no data")));
    }
    });
  }
}


