import 'dart:io';

import 'package:flutter/material.dart';
import '../data/models/post_model.dart';
import '../data/services/api_service.dart';

enum FeedState { initial, loading, loaded, error }
enum ErrorType { network, server, unknown }
class FeedProvider extends ChangeNotifier {
  List<PostModel> posts = [];
  FeedState state = FeedState.initial;
  ErrorType errorType = ErrorType.unknown;
  String errorMessage = '';
  bool hasMore = true;
  int skip = 0;
  bool isFetchingMore = false;


  Future<void> fetchPosts() async {
    state = FeedState.loading;
    posts = [];
    skip = 0;
    hasMore = true;
    notifyListeners();

    try {
      final result = await ApiService.fetchPosts(skip: 0);
      posts = result['posts'];
      hasMore = result['hasMore'];
      skip = 10;
      state = FeedState.loaded;
    } on SocketException {
      errorType = ErrorType.network;
      state = FeedState.error;
    } on HttpException {
      errorType = ErrorType.server;
      state = FeedState.error;
    } catch (e) {
      errorType = ErrorType.unknown;
      state = FeedState.error;
    }

    notifyListeners();
  }

  Future<void> fetchMorePosts() async {
    if (isFetchingMore || !hasMore) return;

    isFetchingMore = true;
    notifyListeners();

    try {
      final result = await ApiService.fetchPosts(skip: skip);
      posts.addAll(result['posts']);
      hasMore = result['hasMore'];
      skip += 10;
    }on SocketException {
      errorType = ErrorType.network;
    } catch (e) {
      errorType = ErrorType.unknown;
    }

    isFetchingMore = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await fetchPosts();
  }
}