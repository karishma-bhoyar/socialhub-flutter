import 'package:flutter/widgets.dart';
import 'package:flutter_application_socialhub/core/theme/app_color.dart';
import 'package:flutter_application_socialhub/core/theme/app_text_style.dart';

class PostFilter extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  const PostFilter({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });
  static const List<String> filters = ["All Posts", "Following", "Trending"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),

        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final filter = filters[index];
          return GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.surface,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  filter,
                  style: AppTextStyle.body.copyWith(
                    color: isSelected
                        ? AppColors.surface
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
