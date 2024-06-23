import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants/sizes.dart';
import 'package:flutter_template/utils/helpers/helper.dart';
import 'package:flutter_template/widgets/divider.dart';
import 'package:flutter_template/widgets/social_icons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final _formKey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage> {
  bool hidePass = false;
  bool val = true;

  // Text Editing Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.appBarHeight,
            right: AppSizes.defaultSpace,
            left: AppSizes.defaultSpace,
            bottom: AppSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                  size: 30,
                ),
              ),

              const SizedBox(
                height: AppSizes.lg,
              ),

              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              // Form Section
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First name is required";
                              }
                              return null;
                            },
                            controller: _firstNameController,
                            keyboardType: TextInputType.name,
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: "First Name",
                              prefixIcon: Icon(CupertinoIcons.person_fill),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSizes.defaultSpace,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last name is required";
                              }
                              return null;
                            },
                            controller: _lastNameController,
                            keyboardType: TextInputType.name,
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: "Last Name",
                              prefixIcon: Icon(CupertinoIcons.person_fill),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username is required";
                        }
                        return null;
                      },
                      controller: _usernameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(CupertinoIcons.person_add_solid),
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwInputFields,
                    ),
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
                        prefixIcon: Icon(CupertinoIcons.mail_solid),
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Phone number is required";
                        } else if (Helper.phoneRegex.hasMatch(value) == false) {
                          return "Provide valid phone number";
                        }
                        return null;
                      },
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Phone number",
                        prefixIcon: Icon(CupertinoIcons.phone_fill),
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
                height: AppSizes.spaceBtwSections,
              ),

              // Row(
              //   children: [
              //     Checkbox(
              //       value: val,
              //       onChanged: (value) {
              //         setState(() {
              //           val = value!;
              //         });
              //       },
              //     ),
              //     Text.rich(
              //       TextSpan(
              //         text: "I agree to ",
              //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              //               color: Colors.grey,
              //             ),
              //         children: [
              //           TextSpan(
              //             text: " Privacy Policy ",
              //             style:
              //                 Theme.of(context).textTheme.bodyMedium!.copyWith(
              //                       decoration: TextDecoration.underline,
              //                     ),
              //           ),
              //           TextSpan(
              //             text: " and ",
              //             style:
              //                 Theme.of(context).textTheme.bodyMedium!.copyWith(
              //                       color: Colors.grey,
              //                     ),
              //           ),
              //           TextSpan(
              //             text: " Terms of use ",
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .bodyMedium!
              //                 .copyWith(decoration: TextDecoration.underline),
              //           ),
              //         ],
              //       ),
              //       style: Theme.of(context).textTheme.bodyMedium,
              //     ),
              //   ],
              // ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform sign up
                    }
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
