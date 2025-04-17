import 'package:chat_scoler_app/bloc/auth/auth_bloc.dart';
import 'package:chat_scoler_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_scoler_app/cubits/cubit/auth_cubit.dart';
import 'package:chat_scoler_app/firebase_options.dart';
import 'package:chat_scoler_app/simple_bloc_observe.dart';
import 'package:chat_scoler_app/views/chat_view.dart';
import 'package:chat_scoler_app/views/login_view.dart';
import 'package:chat_scoler_app/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserve();
  runApp(ChatScolerApp());
}

class ChatScolerApp extends StatelessWidget {
  const ChatScolerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        routes: {
          LoginView.id: (context) => LoginView(),
          RegisterView.id: (context) => RegisterView(),
          ChatView.id: (context) => ChatView(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.id,
      ),
    );
  }
}
