import 'package:flutter/material.dart';
import 'package:toktik/domain/models/video_post.dart';
import 'package:toktik/presentation/widgets/videoplayer/fullsreen_player.dart';
import 'package:toktik/presentation/widgets/videoplayer/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videoPosts;

  const VideoScrollableView({super.key, required this.videoPosts});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videoPosts.length,
      itemBuilder: (context, index) {
        VideoPost videoPost = videoPosts[index];

        return Stack(
          children: [
            // Video Player + Gradiente
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption, 
                videoUrl: videoPost.videoUrl,
              ),
            ),

            // Botones
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons(
                  video: videoPost,
                  isVideoLiked: videoPost.isVideoLiked,
                  onPressed: () {
                    videoPost.isVideoLiked = !videoPost.isVideoLiked;
                  },
                )),
          ],
        );
      },
    );
  }
}
