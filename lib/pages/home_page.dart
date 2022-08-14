import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deque/model/user_model.dart';
import 'package:deque/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 180,
              child: Image.asset(
                "assets/images/logo.svg",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Welcome back',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '${loggedInUser.firstname} ${loggedInUser.lastname}',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
            ),
            Text(
              '${loggedInUser.email}',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            ActionChip(
              label: Text('Logout'),
              onPressed: (() {
                logout(context);
              }),
              backgroundColor: Colors.deepPurpleAccent,
            ),
          ],
        ),
      )),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => LoginPage())));
  }
}
