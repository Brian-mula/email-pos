import 'package:emailpos/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Accounts extends ConsumerStatefulWidget {
  const Accounts({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountsState();
}

class _AccountsState extends ConsumerState<Accounts> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authenticationProvider);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/man.png"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              auth.currentUser!.email!,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: Colors.black54, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await authProvider.signOut();
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
