import 'package:emailpos/providers/auth_provider.dart';
import 'package:emailpos/views/login_view.dart';
import 'package:emailpos/views/main_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthCker extends ConsumerWidget {
  const AuthCker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) return const MainHomePage();
          return const LoginView();
        },
        error: (error, stacktrace) => Text(error.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
