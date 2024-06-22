import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants/image_strings.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key, required this.isDarkMode});
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: "Fast Delivery At\n",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  letterSpacing: 1.2,
                ),
            children: [
              TextSpan(
                text: "Door Step",
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
          AppImages.intro3,
          height: 300,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    );
  }
}
