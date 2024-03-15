import 'package:bloc/bloc.dart';
import '../data/model/model.dart';
import '../data/repo/repo.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.homerepo) : super(PostsInitial());
  final HomeRepo homerepo;

  // Fetch posts
  PostsModel? postsModel ;
  Future<void> fetchPosts() async {
    emit(PostsLoading());
    var result = await homerepo.FetchPosts();
    result.fold(
          (failure) {
            emit(postfailure(errMessage: failure.errMessage));
            print ( failure.errMessage);
          },
        (posts) {
            print("sucess cubit");
          postsModel =posts;
          emit(postsucess(postsModel:posts));
        },
    );
  }
}
