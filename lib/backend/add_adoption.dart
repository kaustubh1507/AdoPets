import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../reusable_widget/reusable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../utils/color_utils.dart';
import '../Screens/home.dart';
import '../reusable_widget/reusable_widget.dart';
import '../Screens/signin.dart';

class addSponsor extends StatefulWidget {
  const addSponsor({super.key});

  @override
  State<addSponsor> createState() => _addSponsorState();
}

class _addSponsorState extends State<addSponsor> {
  //Map
  @override
  TextEditingController _emailTextController= TextEditingController();
  TextEditingController _userNameTextController= TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  //TextEditingController _reviewTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _breedTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("ADD ADOPTION", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height *0.2, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Your Name", Icons.person_outline,false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email id", Icons.email,false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Contact Number", Icons.phone,false, _phoneNumberTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Doggy's Breed", Icons.type_specimen,false, _breedTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Doggy's Age", Icons.numbers,false, _ageTextController),
                const SizedBox(
                  height: 20,
                ),
                // reusableTextField("Enter Previous Sponsorship Experience", Icons.text_format,false, _reviewTextController),
                // const SizedBox(
                //   height: 20,
                // ),
                addSponsorButton(context, (){
                  Map<String,String> data ={
                    'Name': _userNameTextController.text,
                    'Email': _emailTextController.text,
                    'Contact': _phoneNumberTextController.text,
                    'Breed': _breedTextController.text,
                    'Age': _ageTextController.text,
                    //'Review': _reviewTextController.text,
                  };
                  FirebaseFirestore.instance.collection("Adoptions").add(data).then((value){
                    print("Created New Sponsor");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  }).onError((error, stackTrace){
                    print("Error ${error.toString()}");
                  });
                  // FirebaseAuth.instance.createUserWithEmailAndPassword(
                  //   email: _emailTextController.text, 
                  //   password: _passwordTextController.text
                  // ).then((value){
                  //   print("Created New Sponsor");
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  // }).onError((error, stackTrace) {
                  //   print("Error ${error.toString()}");
                  // });
                  
                })
              ],
            ),     
          ),
        ),
      ),
    );
  }
}
