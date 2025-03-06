import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Login Form',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 2, 109, 142),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Image.asset('assets/images/logo.png')),
            Text(
              'Login',
              style: GoogleFonts.inter(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: SizedBox(
                width: 300,
                height: 35,
                child: TextField(
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'example@email.com',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Icon(CupertinoIcons.mail, color: Colors.teal[800]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none, // Remove default border
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: SizedBox(
                width: 300,
                height: 35,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Icon(CupertinoIcons.lock, color: Colors.teal[800]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none, // Remove default border
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 36),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.cyan,
                  elevation: 4,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Adjusts to content size
                  mainAxisAlignment: MainAxisAlignment.center, // Centers content
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8), // Space between text and icon
                    Icon(CupertinoIcons.arrow_right, color: Colors.white),
                  ],
                ),
              ),

            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 20,
                    endIndent: 10,
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 10,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton.icon(
                label: Text(
                  'Sign in',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                icon: Icon(Icons.login),
                style: TextButton.styleFrom(
                    minimumSize: Size(300, 36),
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 2, 109, 142),
                    elevation: 4,
                    side: BorderSide(color: Colors.blue, width: 2),
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)))),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
