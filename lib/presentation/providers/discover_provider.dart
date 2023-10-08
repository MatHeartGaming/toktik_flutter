import 'package:flutter/material.dart';
import 'package:toktik/domain/models/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  
  final VideoPostRepository videoRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoRepository});
  


  Future<void> loadNextPage() async {
    videos = await videoRepository.getTrendingVideosByPage(0);
    initialLoading = false;

    notifyListeners();
  }
}
