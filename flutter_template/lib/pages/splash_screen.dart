import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/pages/intro_screen.dart';
import 'package:flutter_template/utils/constants/image_strings.dart';
import 'package:flutter_template/utils/helpers/helper.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    validateUser();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Helper.isDarkMode(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isDarkMode
                  ? Image.asset(
                      AppImages.lightAppLogo,
                      height: 400,
                    )
                  : Image.asset(
                      AppImages.darkAppLogo,
                      height: 400,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void validateUser() {
    Timer(const Duration(milliseconds: 3500), () async {
      // Example code for user validation
      // You can uncomment and modify this part based on your logic
      // var result = await SharedPreferences.getInstance();
      // bool? data = result.getBool("isloggedIn");
      // String? role = result.getString("role");
      // bool? isVisited = result.getBool("isVisited");

      // if (isVisited != null && isVisited == true) {
      //   if (data != null && data == true) {
      //     // Role Based login Functionality
      //     if (role == "user") {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //         return const UserDashboard();
      //       }));
      //     } else if (role == "organizer") {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //         return const OrganizerDashboard();
      //       }));
      //     } else if (role == "recycler") {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //         return const RecyclerHomePage();
      //       }));
      //     }
      //   } else {
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //       return const SignInPage();
      //     }));
      //   }
      // } else {
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //     return const IntroScreen();
      //   }));
      // }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const IntroScreen();
      }));
    });
  }
}
