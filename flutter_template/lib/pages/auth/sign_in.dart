import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/pages/auth/sign_up.dart';
import 'package:flutter_template/utils/constants/app_colors.dart';
import 'package:flutter_template/utils/constants/image_strings.dart';
import 'package:flutter_template/utils/constants/sizes.dart';
import 'package:flutter_template/utils/helpers/helper.dart';
import 'package:flutter_template/widgets/divider.dart';
import 'package:flutter_template/widgets/social_icons.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

final _formKey = GlobalKey<FormState>();

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool val = true;
  bool hidePass = false;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Helper.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.appBarHeight,
            bottom: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace,
            left: AppSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Image(
                image: AssetImage(
                  isDarkMode ? AppImages.lightAppLogo : AppImages.darkAppLogo,
                ),
                height: 120,
              ),

              const SizedBox(
                height: AppSizes.lg,
              ),

              Text(
                "Welcome back,",
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(
                height: AppSizes.sm,
              ),

              Text(
                "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey
                          : Colors.black,
                    ),
              ),

              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              // Form Section
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "E-mail is required";
                        } else if (Helper.emailRegex.hasMatch(value) == false) {
                          return "Provide valid email address";
                        }
                        return null;
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                        prefixIcon: Icon(CupertinoIcons.mail),
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: !hidePass ? true : false,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(CupertinoIcons.padlock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePass = !hidePass;
                            });
                          },
                          icon: Icon(
                            hidePass
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSizes.sm,
              ),

              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: val,
                        onChanged: (value) {
                          setState(() {
                            val = value!;
                          });
                        },
                      ),
                      Text(
                        "Remember me",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.error,
                        ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform sign in
                    }
                  },
                  child: const Text(
                    "Sign In",
                  ),
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Create Account",
                  ),
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              // Divider
              const CustomDivider(),

              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              // Social Media Icons
              const SocialIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
