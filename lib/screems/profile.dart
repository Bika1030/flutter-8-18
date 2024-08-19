import 'package:flutter/material.dart';
import 'package:movie_app/screems/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   bool ilLogged =false;

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}