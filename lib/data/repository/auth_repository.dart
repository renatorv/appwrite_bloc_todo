import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_bloc_todo/core/error/server_exception.dart';
import 'package:appwrite_bloc_todo/core/locators/locator.dart';
import 'package:appwrite_bloc_todo/core/utils/app_strings.dart';
import 'package:appwrite_bloc_todo/core/utils/appwrite_constants.dart';
import 'package:appwrite_bloc_todo/data/provider/appwrite_prodiver.dart';
import 'package:fpdart/fpdart.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/error/failure.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, User>> register({
    required String firstName,
    required String lastrName,
    required String email,
    required String password,
  });
}

class AuthRepository implements IAuthRepository {
  final AppwriteProdiver _appWriteProvider = locator<AppwriteProdiver>();
  final InternetConnectionChecker _internetConnectionChecker = locator<InternetConnectionChecker>();
  @override
  Future<Either<Failure, User>> register({
    required String firstName,
    required String lastrName,
    required String email,
    required String password,
  }) async {
    try {
      if (await _internetConnectionChecker.hasConnection) {
        User user = await _appWriteProvider.account!.create(
          userId: ID.unique(),
          email: email,
          password: password,
          name: '$firstName $lastrName',
        );
        await _appWriteProvider.database!.createDocument(
            databaseId: AppwriteConstants.databaseId,
            collectionId: AppwriteConstants.userCollectionId,
            documentId: user.$id,
            data: {
              "id": user.$id,
              "first_name": firstName,
              "last_name": lastrName,
              "full_name": "$firstName $lastrName",
              "email": email,
            });

        return right(user);
      } else {
        return left(Failure(AppStrings.internetNotFound));
      }
    } on AppwriteException catch (e) {
      return left(Failure(e.message!));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
