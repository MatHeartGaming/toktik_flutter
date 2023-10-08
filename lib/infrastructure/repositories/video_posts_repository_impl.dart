import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/models/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImplementation implements VideoPostRepository {
  final VideoPostDatasource videosDataSource;

  VideoPostsRepositoryImplementation({required this.videosDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }
}
