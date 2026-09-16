import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/core/theme/app_color.dart';
import 'package:flutter_application_socialhub/core/widgets/app_text_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            hintText: 'Search posts...',
            prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.close, size: 20, color: AppColors.textSecondary),
            ),
          ),
        ),
        SizedBox(width: 8),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined, size: 24),
          ),
        ),
      ],
    );
  }
}
