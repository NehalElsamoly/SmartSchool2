import 'package:bloc/bloc.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/news/data/repo/repo.dart';
import '../data/model/modelnews.dart';
import '../data/repo/repo.dart';
import '../data/repo/repo.dart';
import '../data/repo/repo.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewaState> {
  NewsCubit(this.newsRepo) : super(NewsInitial());
  final NewsRepo newsRepo;

  // Fetch posts
  NewsModel? newsModel ;
  Future<void> fetchNews() async {
    emit(NewsLoading());
    var result = await newsRepo.FetchNews();
    print("error cubot");
    result.fold(
          (failure) {
        emit(Newsfailure(errMessage: failure.errMessage));
        print("cubit error");
        print ( failure.errMessage);
      },
          (posts) {
        print("sucess cubit");
        newsModel =posts;
        emit(Newssucess(newsModel:posts));
      },
    );
  }
}
