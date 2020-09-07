
import 'package:flutter/material.dart';
import 'package:my_mess_book_app/app/toggle_user.dart';
import 'package:provider/provider.dart';
import 'package:my_mess_book_app/app/home_page.dart';
import 'package:my_mess_book_app/app/sign_in/sign_in_page.dart';
import 'package:my_mess_book_app/services/auth.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return ToggleUser();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
