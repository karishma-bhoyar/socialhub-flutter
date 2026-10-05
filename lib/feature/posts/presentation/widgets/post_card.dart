import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/core/theme/app_color.dart';
import 'package:flutter_application_socialhub/core/theme/app_text_style.dart';
import 'package:flutter_application_socialhub/feature/posts/domain/entities/post_entity.dart';
import 'package:flutter_application_socialhub/feature/posts/presentation/widgets/common_button.dart';
import 'package:flutter_application_socialhub/feature/users/domain/entities/user_entity.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  final UserEntity user;

  const PostCard({super.key, required this.post, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    user.name[0].toUpperCase(),
                    style: AppTextStyle.body.copyWith(
                      color: AppColors.surface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            user.name,
                            style: AppTextStyle.body.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('2h', style: AppTextStyle.bodySecondary),
                        ],
                      ),

                      const SizedBox(height: 2),
                      Text(
                        '@${user.username}',
                        style: AppTextStyle.bodySecondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              post.title,
              style: AppTextStyle.body.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Text(post.body, style: AppTextStyle.bodySecondary),
            const SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/600/350',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            CommonButton(
              thumbUpCount: 24,
              thumbUpOnpressed: () {},
              commentCount: 12,
              commentOnPressed: () {},
              favoriteCount: 45,
              favoriteOnPressed: () {},
              bookmarkOnPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
