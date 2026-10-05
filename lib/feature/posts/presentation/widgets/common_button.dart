import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/core/theme/app_color.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback thumbUpOnpressed;
  final IconData thumbUpIcon;
  final int thumbUpCount;
  final VoidCallback commentOnPressed;
  final IconData commentIcon;
  final int commentCount;
  final VoidCallback favoriteOnPressed;
  final IconData favoriteIcon;
  final int favoriteCount;
  final VoidCallback bookmarkOnPressed;
  final IconData bookmarkIcon;

  const CommonButton({
    super.key,
    required this.thumbUpOnpressed,
    this.thumbUpIcon = Icons.thumb_up_alt_outlined,
    this.thumbUpCount = 0,
    required this.commentOnPressed,
    this.commentIcon = Icons.chat_bubble_outline,
    this.commentCount = 0,
    required this.favoriteOnPressed,
    this.favoriteIcon = Icons.favorite,
    required this.favoriteCount,
    required this.bookmarkOnPressed,
    this.bookmarkIcon = Icons.bookmark_border,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: thumbUpOnpressed,
          icon: Icon(thumbUpIcon, size: 20),
        ),
        Text('$thumbUpCount'),
        const SizedBox(width: 12),
        IconButton(
          onPressed: commentOnPressed,
          icon: Icon(commentIcon, size: 20),
        ),
        Text('$commentCount'),
        const SizedBox(width: 12),
        IconButton(
          onPressed: favoriteOnPressed,
          icon: Icon(favoriteIcon, size: 20, color: AppColors.error),
        ),
        Text('$favoriteCount'),
        const Spacer(),
        IconButton(
          onPressed: bookmarkOnPressed,
          icon: Icon(bookmarkIcon, size: 20),
        ),
      ],
    );
  }
}
