import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_login/screens/login_screen.dart';
import 'package:student_login/screens/splash_screen.dart';

// Defining Custom Colors
Color primary = Color(0xff072227);
Color secondary = Color(0xff35858B);
Color primaryLight = Color(0xff4FBDBA);
Color secondaryLight = Color(0xffAEFEFF);

// Custom Color Defining for ThemeData
class pallette {
  static const MaterialColor primary =
      const MaterialColor(0xff072227, const <int, Color>{});
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Login Application",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new splash_screen()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showAlertDialog(context);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage("images/logo.png"),
                width: 105,
                height: 105,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "Welcome to\nStudent Login Portal",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: ButtonTheme(
                  minWidth: 200,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: primary,
                    child: Text("Logout",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      logout(context);
                      Fluttertoast.showToast(msg: "Logged Out!");
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "A sutdent login/register application\n"
                    "with firebase authentication",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Creating a Logout Function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => login_screen()));
  }
}

// Creating an Alert Dialog for the Info button in App Bar
showAlertDialog(BuildContext context) {
  // Setting up the button
  Widget okButton = TextButton(
    child: Text("Ok"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // Set up the Alert Dialog
  AlertDialog alertDialog = AlertDialog(
    title: Text("Student Login Application"),
    content: Text(
        "This is the simple Student login application with firebase authentication\n"
        "\nDeveloped by\n"
        "Ruban Gino Singh - URK20CS2001\n"
        "Joewin Sam - URK20CS1054\n"
        "Magrin Fenisha - URK20CS1042\n"
        "Jerusha - URK20CS1035\n"),
    actions: [okButton],
  );

  // Show the Dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
