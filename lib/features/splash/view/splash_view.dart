import 'package:appwrite_bloc_todo/core/routes/route_names.dart';
import 'package:appwrite_bloc_todo/core/utils/app_images_url.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.goNamed(RouteNames.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImagesUrl.logo,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
