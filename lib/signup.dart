import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  var email , password , username;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signup() async {
    var formdata = formstate.currentState;
    formdata?.save();
    if(formdata!.validate()){
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            desc: "'The password provided is too weak.'",
            descTextStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
            title: "Error",
            titleTextStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w700),
            animType: AnimType.rightSlide,
            autoHide: Duration(seconds: 3),
            borderSide: BorderSide(width: 10,color: Colors.red),
          )..show();
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }

    }
    print("inValid");
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: SingleChildScrollView(
         child:Column(
           children: [
             SizedBox(
               height: 100,
             ),
             Center(
              child: CircleAvatar(radius:100 ,backgroundImage: AssetImage(
                "images/images.jpg"
              ),),
             ),
             Container(
              child: Form(
                key: formstate,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "username",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 20),
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                        validator: (val){
                          if(val!.length>10){
                            return "Pleser must the username less than 10 letters";
                          }
                          if(val!.length<4){
                            return "please must the username more than 4 letters";
                          }
                          return null;
                        },

                        onSaved: (val){
                          username=val;
                        },
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 20),
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                        validator: (val){
                          if(val!.length>100){
                            return "Pleser must the email less than 100 letters";
                          }

                          return null;
                        },

                        onSaved: (val){
                          email=val;
                        },

                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "password",
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 20),
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                        validator: (val){
                          if(val!.length>100){
                            return "Pleser must the password name less than 100 letters";
                          }
                          return null;
                        },
                        onSaved: (val){
                          password=val;
                        },
                      )),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text("  If you hava account"),
                        SizedBox(width: 10,),
                        InkWell(child: Text("Click here",style: TextStyle(color:Colors.deepPurple),),)
                      ],
                    ),
                  )
                ],
              ),
               ),
             ),
             SizedBox(height:20,),
             ElevatedButton(onPressed: ()async{
               var user = await signup();
               print(user);
             }, child:Text("SignUp"))
           ],
         ),
       ),
     );
  }
}
