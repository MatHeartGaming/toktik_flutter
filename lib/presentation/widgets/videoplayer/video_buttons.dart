import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/domain/models/video_post.dart';
import 'package:toktik/helpers/human_formats.dart';

class VideoButtons extends StatelessWidget {
  final bool isVideoLiked;
  final VoidCallback onPressed;
  final VideoPost video;

  const VideoButtons(
      {super.key,
      required this.video,
      this.isVideoLiked = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onPressed,
          child: ElasticInRight(
          delay: const Duration(milliseconds: 600),
            child: _CustomIconButton(
                value: video.likes,
                icon: isVideoLiked ? Icons.favorite : Icons.favorite_border,
                iconColor: Colors.red),
          ),
        ),

        const SizedBox(height: 20,),

        ElasticInRight(
          delay: const Duration(milliseconds: 300),
          child: _CustomIconButton(
              value: video.views,
              icon: Icons.remove_red_eye_outlined,
              iconColor: Colors.white),
        ),

        const SizedBox(height: 20,),

          ElasticInRight(
            child: SpinPerfect(
              infinite: true,
              duration: const Duration(seconds: 5),
              child: const _CustomIconButton(
                value: 0,
                icon: Icons.play_circle_outline,
                iconColor: Colors.white),
            ),
          ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? color;

  const _CustomIconButton({required this.value, required this.icon, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            // ignore: prefer_const_constructors
            icon: Icon(
              icon,
              color: color,
              size: 30,
            )),
        if(value > 0) Text(HumanFormats.humanReadableNumber(value.toDouble())),
      ],
    );
  }
}
