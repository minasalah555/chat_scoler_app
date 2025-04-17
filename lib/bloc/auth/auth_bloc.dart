import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: event.email,
                password: event.password,
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
    });
  }

  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   print(transition);
  //   super.onTransition(transition);
  // }
}
