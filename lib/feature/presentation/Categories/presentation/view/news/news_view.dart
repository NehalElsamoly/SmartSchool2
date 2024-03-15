import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/appbar_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/bottom_naviagetion_bar.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/top_news_views.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/news_views_content.dart';

import 'manager/news_cubit.dart';
import 'manager/news_state.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override

  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewaState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is NewsLoading || context.read<NewsCubit>().newsModel==null ) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Newssucess) {
            return Scaffold(
                backgroundColor: textbutton,
                appBar: AppBar(
                  backgroundColor: textbutton,
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
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 30,
                      padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                      margin: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top News",
                            style: Styles.style18.copyWith(
                              fontWeight: FontWeight.w500,
                              color: texttitlecontent,
                            ),
                          ),
                          Text(
                            "View all",
                            style: Styles.style18.copyWith(
                              fontWeight: FontWeight.w400,
                              color: textcontent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                     // width: 200,
                      child: ListView.builder(
                      //  scrollDirection: Axis.vertical,
                        itemCount: state.newsModel?.categories?.length ?? 0,
                        itemBuilder: (context, index) {
                          final category = state.newsModel?.categories?[index];
                          if (category == null) {
                            print("error catogries");
                            return SizedBox.shrink(); // or display a placeholder widget
                          }
                         else {
                            return NewsContent(
                              title: category.photo??"",
                              description: category.name ?? '',
                              image: category?.news?.first?.photos?.first.name ?? '',
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Protection",
                        style: Styles.style30.copyWith(
                          fontWeight: FontWeight.w500,
                          color: texttitlecontent,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                       // scrollDirection: Axis.vertical,
                        itemCount: state.newsModel?.categories?.length ?? 0,
                        itemBuilder: (context, index) {
                          final category = state.newsModel?.categories?[index];
                          if (category == null) {
                            print("error catogries");
                      
                            return SizedBox.shrink(); // or display a placeholder widget
                          }
                          return NewsContent(
                            title: category.name??"",
                            description: category.name ?? '',
                            image: category?.news?.first?.photos?.first.name ?? '',
                          );
                        },
                      ),
                    ),
                    // child: ListView.builder(
                    //   scrollDirection: Axis.vertical,
                    //   itemCount: state.newsModel?.categories?.length ?? 0,
                    //   itemBuilder: (context, index) {
                    //     return ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: NeverScrollableScrollPhysics(),
                    //       itemCount: state.newsModel?.categories![index].news?.length ?? 0,
                    //       itemBuilder: (context, newsIndex) {
                    //         return NewsContent(
                    //           title: state.newsModel?.categories![index].news![newsIndex].title ?? '',
                    //           description: state.newsModel?.categories![index].news![newsIndex].content ?? '',
                    //           image: state.newsModel?.categories![index].news![newsIndex].photos[0].name ?? '',
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),

                  ],
                ),
                bottomNavigationBar: const BottomNaviatonBar());
          } else {
            return Center(child: Container(child: Text("no data")));
          }
        });
  }
}
