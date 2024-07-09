import 'package:appwrite_bloc_todo/core/locators/locator.dart';
import 'package:appwrite_bloc_todo/data/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final AuthRepository _authRepository = locator<AuthRepository>();

  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    final response = await _authRepository.register(firstName: firstName, lastName: lastName, email: email, password: password);

    response.fold(
      (failure) => emit(RegisterError(error: failure.message)),
      (user) => emit(
        RegisterSuccess(),
      ),
    );
  }
}
