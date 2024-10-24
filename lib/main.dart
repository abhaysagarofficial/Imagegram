import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'customWidgets/photoBooth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for web and mobile platforms
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDp988jFxJDrBlelw7q3kfh3wHR5rTOib0",
        authDomain: "imagegram-356ca.firebaseapp.com",
        projectId: "imagegram-356ca",
        storageBucket: "imagegram-356ca.appspot.com",
        messagingSenderId: "621545575805",
        appId: "1:621545575805:web:2781c1c46a080e50ea6814",
        measurementId: "G-5S24Q41002",
      ),
    );
  } else {
    await Firebase.initializeApp(); // This automatically uses GoogleService-Info.plist for iOS
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTitle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.black),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Icon(Icons.account_circle_outlined, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 150,
            color: Colors.grey[200],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    child: Icon(Icons.account_circle_sharp, size: 100),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Photobooth();
              },
            ),
          ),
        ],
      ),
    );
  }
}
