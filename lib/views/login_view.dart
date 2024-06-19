import 'package:flutter/material.dart';

import '../viewmodels/login_viewmodel.dart';
import 'hotel_list_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel model = LoginViewModel();

  @override
  void initState() {
    super.initState();
  }

  Widget loginText(BuildContext context) {
    return const Text(
      "Welcome!",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  Widget loginDescriptionText(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "This application provides detailed information about hotels. Please sign in using your social media profiles to access its features.",
        style: TextStyle(
          fontSize: 18,
          color: Colors.blueGrey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget loginIcons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
              onPressed: () async {
                await model.signInWithGoogle();
                if (model.isLoggedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HotelListView(),
                    ),
                  );
                }
              },
              icon: Image.asset(
                'assets/icons/google.png',
                width: 40,
                height: 40,
              ),
              label: const Text(
                'Sign in with Google',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/facebook.png',
                width: 40,
                height: 40,
              ),
              label: const Text(
                'Sign in with Facebook',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/apple.png',
                width: 40,
                height: 40,
              ),
              label: const Text(
                'Sign in with Apple',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/outlook.png',
                width: 40,
                height: 40,
              ),
              label: const Text(
                'Sign in with Outlook',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget mainBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          loginText(context),
          const SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: loginDescriptionText(context),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 300,
            child: loginIcons(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: mainBody(context),
      ),
    );
  }
}
