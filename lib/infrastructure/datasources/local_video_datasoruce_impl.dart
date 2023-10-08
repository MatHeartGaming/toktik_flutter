import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/models/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class LocalVideosDataSource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((v) => LocalVideoModel.fromJson(v).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
