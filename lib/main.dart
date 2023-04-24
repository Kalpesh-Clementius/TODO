import 'package:flutter/material.dart';
import 'package:myapp/widgets/home.dart';

import 'package:myapp/widgets/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "signup": (context) => MyRegister(),
        "login": (context) => MyApp(),
        "home": (context) => Home()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isvisiblelity = false;

  final _formkey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 30, top: 150),
                  child: Text(
                    'Login page',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.blue),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 10),
                    child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: myController,
                              decoration: InputDecoration(
                                  hintText: "Enter your username",
                                  labelText: "UserName",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter your name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Enter your Email",
                                    labelText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter your Email";
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                                obscureText: !_isvisiblelity,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isvisiblelity = !_isvisiblelity;
                                          });
                                        },
                                        icon: _isvisiblelity
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off)),
                                    hintText: "Enter your Password",
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Your Password";
                                  }
                                  return null;
                                }),
                            Container(
                              padding: EdgeInsets.only(left: 140.0, top: 50.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.blueAccent)),
                                child: Text(
                                  'Login-In',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    final Snackbar = SnackBar(
                                        content: Text("Submitting Form"));
                                        
                                    Navigator.pushNamed(context, "home");
                                  }
                                },
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 90, top: 15),
                                child: Text(
                                  "Don't have a account",
                                  style: TextStyle(fontSize: 22),
                                )),
                            Container(
                              padding: EdgeInsets.only(left: 140),
                              child: TextButton(
                                child: Text(
                                  "Sign-Up",
                                  style: TextStyle(fontSize: 18),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, "signup");
                                },
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          ),
        ));
  }
}
