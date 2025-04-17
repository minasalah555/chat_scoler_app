import 'package:chat_scoler_app/cubits/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> sigininWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: '${e.code.toString()} '));
        print('user-not-found');
      } else if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: '${e.code.toString()}'));
        print('wrong-password');
      } else {
        print('something went Wrong');
        emit(LoginFailure(errMessage: 'something went Wrong '));
      }
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(RegisterFailure(errMessage: '${e.code.toString()} '));
        print('user-not-found');
      } else if (e.code == 'wrong-password') {
        emit(RegisterFailure(errMessage: '${e.code.toString()}'));
        print('wrong-password');
      } else {
        print('something went Wrong');
        emit(RegisterFailure(errMessage: 'Both email password is wrong '));
      }
    }
  }

  // @override
  // void onChange(Change<AuthState> change) {
  //   super.onChange(change);
  //   print(change);
  // }
}
