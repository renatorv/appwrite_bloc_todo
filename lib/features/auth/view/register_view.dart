import 'package:appwrite_bloc_todo/core/routes/route_names.dart';
import 'package:appwrite_bloc_todo/core/utils/custom_snackbar.dart';
import 'package:appwrite_bloc_todo/core/utils/full_screen_dialog_loader.dart';
import 'package:appwrite_bloc_todo/features/auth/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/utils/app_images_url.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/validation_rules.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _registerFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailNameController = TextEditingController();
  final _passwordNameController = TextEditingController();
  bool isPasswordVisible = false;

  clearText() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailNameController.clear();
    _passwordNameController.clear();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailNameController.dispose();
    _passwordNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  FullScreenDialogLoader.show(context);
                } else if (state is RegisterSuccess) {
                  clearText();
                  FullScreenDialogLoader.cancel(context);
                  CustomSnackbar.showSuccess(context, AppStrings.accountCreated);
                  context.goNamed(RouteNames.login);
                } else if (state is RegisterError) {
                  CustomSnackbar.showError(context, state.error);
                }
              },
              builder: (context, state) {
                return Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      Image.asset(
                        AppImagesUrl.logo,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _firstNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return AppStrings.required;
                          }
                          return null;
                        },
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        hintText: AppStrings.firstName,
                        suffix: null,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: _lastNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return AppStrings.required;
                          }
                          return null;
                        },
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        hintText: AppStrings.lastName,
                        suffix: null,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: _emailNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return AppStrings.required;
                          } else if (!ValidationRules.emailValidation.hasMatch(val)) {
                            return AppStrings.provideValidEmail;
                          }
                          return null;
                        },
                        keyBoardType: TextInputType.emailAddress,
                        obscureText: false,
                        hintText: AppStrings.email,
                        suffix: null,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: _passwordNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return AppStrings.required;
                          }
                          return null;
                        },
                        keyBoardType: TextInputType.visiblePassword,
                        obscureText: !isPasswordVisible,
                        hintText: AppStrings.password,
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          child: Icon(
                            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RoundedElevatedButton(
                        buttonText: AppStrings.register,
                        onPressed: () {
                          if (_registerFormKey.currentState!.validate()) {
                            context.read<RegisterCubit>().register(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailNameController.text,
                                password: _passwordNameController.text);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
