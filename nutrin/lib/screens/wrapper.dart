import 'package:flutter/material.dart';
import 'package:mobileapp/model/user.dart';
import 'package:mobileapp/screens/main/bottomnav.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'package:mobileapp/services/database.dart';
import 'package:mobileapp/model/tracker.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return StreamProvider<Tracker>.value(
        value: DatabaseService(uid: user.uid).tracker,
        child: NavigationBar(),
      );
    }
  }
}
