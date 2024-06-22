import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants/image_strings.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key, required this.isDarkMode});
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: "Push Notification &\n",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  letterSpacing: 1.2,
                ),
            children: [
              TextSpan(
                text: "Reminders",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      letterSpacing: 1.2,
                    ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          AppImages.intro2,
          height: 300,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    );
  }
}
