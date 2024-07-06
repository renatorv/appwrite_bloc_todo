import 'package:appwrite_bloc_todo/core/utils/app_strings.dart';

class Failure {
  final String message;

  Failure([
    this.message = AppStrings.internetNotFound,
  ]);
}
