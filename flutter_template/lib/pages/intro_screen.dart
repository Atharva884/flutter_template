import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/pages/auth/sign_in.dart';
import 'package:flutter_template/utils/helpers/helper.dart';
import 'package:flutter_template/widgets/intros/intro_page_1.dart';
import 'package:flutter_template/widgets/intros/intro_page_2.dart';
import 'package:flutter_template/widgets/intros/intro_page_3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  // controller to keep track of the which page we're on
  final PageController _controller = PageController();
  bool onLastPage = false;
  bool hideSkip = true;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Helper.isDarkMode(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
                if (index == 2) {
                  hideSkip = false;
                } else {
                  hideSkip = true;
                }
              });
            },
            children: [
              IntroPage1(isDarkMode: isDarkMode),
              IntroPage2(isDarkMode: isDarkMode),
              IntroPage3(isDarkMode: isDarkMode),
            ],
          ),

          // dot indicators
          Container(
            alignment: const Alignment(0, 0.90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip

                hideSkip
                    ? GestureDetector(
                        onTap: () {
                          _controller.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Text(
                          "Skip",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      )
                    : const SizedBox.shrink(),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: SlideEffect(
                    dotColor: Colors.grey,
                    activeDotColor: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),

                // done
                onLastPage
                    ? IconButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool("isVisited", true);

                          Navigator.pushReplacement(context,
                              CupertinoPageRoute(builder: (context) {
                            return const SignInPage();
                          }));
                        },
                        icon: const Icon(
                          Icons.check,
                          size: 30,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        icon: const Icon(
                          Icons.chevron_right,
                          size: 30,
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
