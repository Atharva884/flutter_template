import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/utils/constants/image_strings.dart';

class IntroPage1 extends ConsumerStatefulWidget {
  const IntroPage1({super.key, required this.isDarkMode});
  final bool isDarkMode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroPage1State();
}

class _IntroPage1State extends ConsumerState<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: "Easy Shopping &\n",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  letterSpacing: 1.2,
                ),
            children: [
              TextSpan(
                text: "Payments",
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
          AppImages.intro1,
          color: widget.isDarkMode ? Colors.white : Colors.black,
          height: 300,
        ),
      ],
    );
  }
}
