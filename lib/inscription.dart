import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

//final _scaffoldKey_inscription = GlobalKey<ScaffoldState>();

var nom_field_inscri = TextEditingController();
var prenom_field_inscri = TextEditingController();
var password_field_inscri = TextEditingController();
var phone_field_inscri = TextEditingController();
var email_field_inscri = TextEditingController();

void main() => runApp(Inscription());



class Inscription extends StatefulWidget {
  @override
  _mainState createState() => _mainState();
}


class _mainState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffe84c3d),Color(0xffe84c3d),Color(0xffde696e),Color(0xfff9a867) ])

      ),

      child: Scaffold(
        //key:_scaffoldKey_inscription,




        backgroundColor: Colors.transparent,

        resizeToAvoidBottomPadding: true,

        body: Container(

            color: Colors.transparent,


            child: new Stack(

              fit: StackFit.expand,

              children: <Widget>[

                Column(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,


                  children: <Widget>[



                    Expanded(

                      child: Container(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset("assets/image_02.png",width: 300,),

                          ],

                        ),

                      ),
                    ),




                  ],
                ),

                SingleChildScrollView(
                  child: Container(

                    child: Column(
                      children: <Widget>[



                        /***********************************************/
                        Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 0.0),
                          child: CardContent(context),
                        ),


                        //ForgotContent(),

                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        /***********************************************/




                      ],
                    ),
                  ),
                ),




              ],
            )

        ),

      ),
    );
  }



}
Widget LOGOContent() {
  return Container(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset("assets/compta_logo_icon_grey.png",width: 120,),
      ],

    ),
  );
}

final _formKey = GlobalKey<FormState>();

Widget CardContent(BuildContext context)

{
  return new Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 20.0,top: 20),



    child: Padding(
      padding: EdgeInsets.only(left: 0.0, right: 16.0, top: 16.0 , bottom: 20),

      child: Form(
        key: _formKey,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            LOGOContent(),


            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
              Text("Inscription",
                  style: TextStyle( color: Color(0xff3c3a3e),fontSize: 30.0, fontFamily: "FredokaOne-Regular" , fontWeight: FontWeight.w500,)

              ),
            ],),

            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 20,
              style: TextStyle(fontSize: 14),
              validator: nom_validator,
              controller:nom_field_inscri,
              decoration: InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFffffff), width: 2.0),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF28abe3), width: 2.0),
                  ),
                  prefixIcon: Icon(FontAwesomeIcons.user,color: Colors.white),
                  hintText: "Nom",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14.0)),
            ),

            TextFormField(
              maxLength: 20,
              style: TextStyle(fontSize: 14),
              validator: prenom_validator,
              controller:prenom_field_inscri,
              decoration: InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFffffff), width: 2.0),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF28abe3), width: 2.0),
                  ),
                  prefixIcon: Icon(FontAwesomeIcons.user,color: Colors.white),
                  hintText: "Prénom",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14.0)),
            ),

            SizedBox(
              height: 5,
            ),

            TextFormField(
              maxLength: 20,
              controller: password_field_inscri,
              validator: password_validator,
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFffffff), width: 2.0),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF28abe3), width: 2.0),
                  ),
                  prefixIcon: Icon(FontAwesomeIcons.key,color: Colors.white,),
                  hintText: "Mot de passe",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14.0)),
            ),

            SizedBox(
              height: 5,
            ),

            TextFormField(
              maxLength: 20,
              obscureText: true,
              validator: confirm_password_validator,
              decoration: InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFffffff), width: 2.0),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF28abe3), width: 2.0),
                  ),
                  prefixIcon: Icon(FontAwesomeIcons.key,color: Colors.white,),
                  hintText: "Confirmer mot de passe",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14.0)),
            ),


            SizedBox(
              height: 5,
            ),

            TextFormField(
              maxLength: 30,
              controller:email_field_inscri,
              validator: validateEmail,
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFffffff), width: 2.0),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF28abe3), width: 2.0),
                  ),
                  prefixIcon: Icon(FontAwesomeIcons.envelope,color: Colors.white),
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14.0)),
            ),
            SizedBox(
              height: 5,
            ),

            TextFormField(
              maxLength: 10,
              controller:phone_field_inscri,
              validator: phone_validator,
              obscureText: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFffffff), width: 2.0),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF28abe3), width: 2.0),
                  ),
                  prefixIcon: Icon(FontAwesomeIcons.phone,color: Colors.white),
                  hintText: "Téléphone",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14.0)),
            ),


            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[



                Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 12.0),

                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF28abe3),
                        Color(0xFF28abe3)
                      ]),
                      borderRadius: BorderRadius.circular(6.0),
                      ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                        if(_formKey.currentState.validate()){
                          signup_methode(context);

                        }

                      },
                      child: Center(
                        child: Text("S'inscrire",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins-Bold",
                                fontSize: 16,
                                letterSpacing: 1.0)),
                      ),
                    ),
                  ),


                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    GestureDetector(
                        child: Text("Se connecter",
                            style: TextStyle( color: Colors.black87,fontSize: 18.0, fontFamily: "FredokaOne-Regular" , fontWeight: FontWeight.w400,decoration: TextDecoration.underline)

                        ),
                        onTap: () {
                          print("aaaa");
                          Navigator.pop(context);

                        }),

                  ],
                ),






              ],
            ),

          ],
        ),
      ),
    ),
  );

}

Widget horizontalLine() => Padding(
  padding: EdgeInsets.symmetric(horizontal: 10.0),
  child: Container(
    width: 20,
    height: 1.5,
    color: Colors.white,
  ),
);


Future signup_methode(BuildContext context) async {
}

String nom_validator(String value) {

  if (value.isEmpty) {
    return 'Entrer un nom valide';
  }
  else{
    return null;}
}

String prenom_validator(String value) {

  if (value.isEmpty) {
    return 'Entrer un prénom valide';
  }
  else{
    return null;}
}

String phone_validator(String value) {

  if (value.isEmpty) {
    return 'Entrer numero de téléphone valide';
  }
  else{
    return null;}
}


String password_validator(String value) {
  if (value.isEmpty) {
    return 'Entrer une mot de passe valide';
  }
  else{
    return null;}
}

String confirm_password_validator(String value) {
  if (value!=password_field_inscri.text) {
    return 'La confirmation du mot de passe ne correspond pas';
  }
  else{
    return null;}
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Entrer un e-mail valide';
  else
    return null;
}


