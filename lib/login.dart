import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var email ,password;

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
                child: Column(
                  children: [
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
                          Text("If you haven't account"),
                          SizedBox(width: 10,),
                          InkWell(child: Text("Click here",style: TextStyle(color:Colors.deepPurple),),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child:Text("login"))
          ],
        ),
      ),
    );
  }
}
