import 'package:chat_scoler_app/constents.dart';
import 'package:chat_scoler_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_scoler_app/cubits/cubit/auth_cubit.dart';
import 'package:chat_scoler_app/cubits/cubit/auth_state.dart';
import 'package:chat_scoler_app/views/chat_view.dart';
import 'package:chat_scoler_app/widgets/custem_button_widget.dart';
import 'package:chat_scoler_app/widgets/custem_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chat_scoler_app/helpers/show_snack_message.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static String id = 'RegisterView';

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatView.id, arguments: email);
        } else if (state is RegisterFailure) {
          showSnackMessage(context, state.errMessage);
          isLoading = false;
        }
      },
      builder:
          (context, state) => ModalProgressHUD(
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
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CutumTextFieldWidget(
                        obscureText: false,
                        title: 'Email',
                        onTap: (value) {
                          email = value;
                        },
                        validater: (value) {
                          if (value!.isEmpty) {
                            return 'field is required';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      CutumTextFieldWidget(
                        title: 'Password',
                        onTap: (value) {
                          password = value;
                        },
                        validater: (value) {
                          if (value!.isEmpty) {
                            return 'field is required';
                          }
                        },
                      ),
                      const SizedBox(height: 15),

                      CustemButtonWidget(
                        title: 'REGISTER',
                        onTap: () async {
                          if (globalKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(
                              context,
                            ).registerUser(email: email!, password: password!);
                          } else {
                            showSnackMessage(
                              context,
                              'Empty Data Please Enter Valied-data',
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "already have Acount?  ",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
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
