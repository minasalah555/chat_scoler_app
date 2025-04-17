import 'package:chat_scoler_app/bloc/auth/auth_bloc.dart';
import 'package:chat_scoler_app/constents.dart';
import 'package:chat_scoler_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_scoler_app/helpers/show_snack_message.dart';
import 'package:chat_scoler_app/views/chat_view.dart';
import 'package:chat_scoler_app/views/register_view.dart';
import 'package:chat_scoler_app/widgets/custem_button_widget.dart';
import 'package:chat_scoler_app/widgets/custem_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  LoginView();
  static String id = 'LoginView';

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatView.id, arguments: email);
        } else if (state is LoginFailure) {
          showSnackMessage(context, 'Email or password is incorrect');
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: globalKey,
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  SizedBox(height: 100, child: Image.asset(kLogo)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scoler Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CutumTextFieldWidget(
                    title: 'Email',
                    onTap: (data) {
                      email = data;
                    },
                    validater: (data) {
                      if (data!.isEmpty) {
                        return 'Field is required';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CutumTextFieldWidget(
                    obscureText: true,
                    title: 'Password',
                    onTap: (data) {
                      password = data;
                    },
                    validater: (data) {
                      if (data?.isEmpty?? true) {
                        return 'Field is required';
                      }
                    },
                  ),

                  const SizedBox(height: 15),

                  CustemButtonWidget(
                    title: 'LOGIN',
                    onTap: () async {
                      if (globalKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(
                          context,
                        ).add(LoginEvent(email: email!, password: password!));
                      } else {
                        showSnackMessage(context, 'error in Enter data');
                      }
                    },
                  ),
                  SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You don't have acount?  ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterView.id);
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
