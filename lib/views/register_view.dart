import 'package:emailpos/widgets/custome_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: Container(
      height: double.maxFinite,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login2.jpg'),
              fit: BoxFit.cover)),
      child: Center(
        child: Container(
          height: 250,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomeInput(
                    controller: emailController,
                    labelText: "Enter email",
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                CustomeInput(
                    obscureText: true,
                    controller: passwordController,
                    labelText: "Enter password",
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text("Sign in?")),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade600),
                              elevation: MaterialStateProperty.all(0)),
                          onPressed: () {},
                          child: Text(
                            "Sign in",
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: Colors.white),
                          )),
                    )
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    ));
  }
}
