part of 'news_feed_bloc.dart';

abstract class NewsFeedEvent extends Equatable {
  const NewsFeedEvent();

  @override
  List<Object> get props => [];
}

class Blog_Detail extends NewsFeedEvent {
  String id;
  var context;

  Blog_Detail({required this.id, required this.context});
}

class Load_NewsFeed extends NewsFeedEvent {}
