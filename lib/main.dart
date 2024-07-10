import 'package:appwrite_bloc_todo/core/locators/locator.dart';
import 'package:appwrite_bloc_todo/core/routes/routes.dart';
import 'package:appwrite_bloc_todo/core/theme/app_theme.dart';
import 'package:appwrite_bloc_todo/core/utils/app_strings.dart';
import 'package:appwrite_bloc_todo/features/auth/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RegisterCubit(),
        ),
      ],
      child: const MyApp(),
    ),
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.darkThemeMode,
      routerConfig: router,
    );
  }
}
