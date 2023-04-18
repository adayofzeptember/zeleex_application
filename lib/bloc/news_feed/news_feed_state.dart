part of 'news_feed_bloc.dart';

class NewsFeedState extends Equatable {
  List newsfeed_data;
  dynamic news_info;
  int page;
  bool isLoading;
  int dataTotal;
  bool isAllDataLoaded;

  NewsFeedState(
      {required this.newsfeed_data,
      required this.isLoading,
      required this.page,
      this.news_info,
      required this.isAllDataLoaded,
      required this.dataTotal});

  NewsFeedState copyWith(
      {List? newsfeed_data,
      dynamic news_info,
      int? page,
      bool? isLoading,
      int? dataTotal,
      bool? isAllDataLoaded}) {
    return NewsFeedState(
        news_info: news_info ?? this.news_info,
        isAllDataLoaded: isAllDataLoaded ?? this.isAllDataLoaded,
        newsfeed_data: newsfeed_data ?? this.newsfeed_data,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading,
        dataTotal: dataTotal ?? this.dataTotal);
  }

  @override
  List<Object> get props =>
      [newsfeed_data, page, isLoading, dataTotal, isAllDataLoaded, news_info];
}
