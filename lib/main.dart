import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/themes/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasoruce_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = LocalVideosDataSource();
    final repository =
        VideoPostsRepositoryImplementation(videosDataSource: dataSource);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                DiscoverProvider(videoRepository: repository)..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
