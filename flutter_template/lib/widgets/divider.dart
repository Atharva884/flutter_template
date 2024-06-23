import 'package:flutter/material.dart';
import 'package:flutter_template/utils/helpers/helper.dart';
import '../utils/constants/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Helper.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: isDarkMode ? AppColors.darkGrey : AppColors.grey,
            indent: 50,
            endIndent: 10,
            thickness: 0.5,
          ),
        ),
        Text(
          "Or Sign In With",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey,
              ),
        ),
        Flexible(
          child: Divider(
            color: isDarkMode ? AppColors.darkGrey : AppColors.grey,
            indent: 10,
            endIndent: 50,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
