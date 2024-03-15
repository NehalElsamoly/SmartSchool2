part of 'posts_cubit.dart';

abstract class PostsState {}

// Initial state
class PostsInitial extends PostsState {}

// Loading state
class PostsLoading extends PostsState {}

// Success state
class postsucess extends PostsState {
  final PostsModel postsModel;

  postsucess({required this.postsModel});
}

// Failure state
class postfailure extends PostsState {
  final String errMessage;

   postfailure({required this.errMessage});
}
