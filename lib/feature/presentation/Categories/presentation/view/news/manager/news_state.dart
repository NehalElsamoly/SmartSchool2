

import '../data/model/modelnews.dart';

abstract class NewaState {}

// Initial state
class NewsInitial extends NewaState {}

// Loading state
class NewsLoading extends NewaState {}

// Success state
class Newssucess extends NewaState {
  final NewsModel newsModel;

  Newssucess({required this.newsModel});
}

// Failure state
class Newsfailure extends NewaState {
  final String errMessage;

  Newsfailure({required this.errMessage});
}
