import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  bool _isVisible = false;
  bool _isConfVisible = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Register"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/register.png"),
                  fit: BoxFit.cover)),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: SingleChildScrollView(
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).

              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 30, top: 50),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white),
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
                              decoration: InputDecoration(
                                  hintText: "Enter your name",
                                  labelText: "Name",
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
                                obscureText: !_isVisible,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: _isVisible
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off)),
                                    hintText: "Enter your Password",
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter your Password";
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                                obscureText: !_isConfVisible,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isConfVisible = !_isConfVisible;
                                          });
                                        },
                                        icon: _isConfVisible
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off)),
                                    hintText: "Enter your Confirm Password",
                                    labelText: "Confirm Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter your Confirm Password";
                                  }
                                  return null;
                                }),
                            Container(
                              padding: EdgeInsets.only(left: 140.0, top: 30.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.blueAccent)),
                                child: Text(
                                  'Sign-up',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    final Snackbar = SnackBar(
                                        content: Text("Submitting Form"));
                                  }
                                },
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 74, top: 15),
                                child: Text(
                                  "Already  have a account",
                                  style: TextStyle(fontSize: 22),
                                )),
                            Container(
                              padding: EdgeInsets.only(left: 150),
                              child: TextButton(
                                child: Text(
                                  "Log-in",
                                  style: TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, "login");
                                },
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
