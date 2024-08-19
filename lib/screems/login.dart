

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onsubmit(){
      if(_formKey.currentState!.validate()){
        print("Амжилттай");
      }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let's sign you in.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("Welcome back.",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 30,
                    ),
                  ),
                  Text("You've been missed!.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                      validator: (value) {
                      if(value ==null || value.isEmpty){
                        return "Хоосон байж болохгүй";
                      }
                      return null;
                    },
                    controller: _phoneCtrl,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      label: Text("Утасны дугаар"),
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _passCtrl,
                    validator: (value) {
                      if(value ==null || value.isEmpty){
                        return "Хоосон байж болохгүй";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      label: Text("Нууц үг"),
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 54,
                child:ElevatedButton(
                  onPressed: _onsubmit, 
                  child: Text("Нэвтрэх", style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
         ),
      ),
    );
  }
}