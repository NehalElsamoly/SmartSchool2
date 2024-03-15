import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/anouncment.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/guideline_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/news/news_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/postes_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/vision_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/categories_list_view_item.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            "Categories",
            style: Styles.style30.copyWith(
              color: titlecolor,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 40,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorTextField,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsView()));
                    },
                    child: CategoriesListItems(itemtitle: "News", icon: news)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PostsView()));
                    },
                    child:
                        CategoriesListItems(itemtitle: "Posts", icon: posts)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnouncmentView()));
                    },
                    child: CategoriesListItems(
                        itemtitle: "Anouncment", icon: anouncment)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GuideLineView()));
                    },
                    child: CategoriesListItems(
                        itemtitle: "GuideLines", icon: guidelines)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VisionView()));
                    },
                    child:
                        CategoriesListItems(itemtitle: "Vision", icon: vision)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
              ]),
        )
      ],
    );
  }
}
