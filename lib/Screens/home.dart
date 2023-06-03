import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Screens/signin.dart';
import '../backend/add_adoption.dart';
import '../backend/display_adoption.dart';
import '../reusable_widget/reusable_widget.dart';
import '../utils/color_utils.dart';
import '../reusable_widget/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ado-Pets"),
        backgroundColor: Colors.purple,
      ),
      drawer: const NavBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, 40, 20, 0
            ),
            child: Column(
              children: <Widget>[
                slide(context),
                //logoWidget("assets/images/logo1.png"),
                Image.asset(
                  "assets/images/logo1.png",
                  fit: BoxFit.fitWidth,
                  width: 240,
                  height: 220,
                
  //  color: Colors.white,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text("Ado-Pets is a Web Service and a Mobile Application that aims towards minimizing Pet Adoption hassle. The main motto of our website is to create an ecosystem between Adoptive parents and our pawtastic friends and not only reduce the street dog menace but also provide for them a stable shelter. This can be achieved with the help of Pet Adoption agencies and willing adoptive parents. \n\nOn Ado-Pets we hope you get the best experience.",
                    style: TextStyle(color:Colors.black, fontWeight: FontWeight.w900,fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                ),
                
              ],
            ),
          ) 
        ),
      ),
    );
  }
}