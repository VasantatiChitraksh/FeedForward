import "package:fbm_app/Pages/HomePages/Homepage.dart";
import "package:fbm_app/Pages/authentication/login_screen.dart";
import "package:fbm_app/Pages/methods/common_methods.dart";
import "package:fbm_app/Widgets/loading_dialog.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import 'package:cloud_firestore/cloud_firestore.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> 
{

  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  int role =2;
 CommonMethods cMethods = CommonMethods();
 

  signUpFormValidation() {

    if(usernameTextEditingController.text.trim().length < 3){
      cMethods.displaysnackBar("Your name must be atleast 3 or more characters.", context);
    }
    else if(phoneTextEditingController.text.trim().length <8) {
      cMethods.displaysnackBar("Your number must be atleast 8 or more characters.", context);
    }
    else if (!emailTextEditingController.text.contains("@")){
      cMethods.displaysnackBar("Please write valid email", context);
    }
    else if (passwordTextEditingController.text.trim().length < 6) {
      cMethods.displaysnackBar("Your password must be atlest 6 or more characters.", context);
    }else if (role == 2) {
      cMethods.displaysnackBar("Select your role as User or Restaunt.", context);
    }
    else {  
      registernewUser();
    }

  }
    registernewUser()async
    {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => LoadingDialog(massagetext: "Adding your Account. . ."),
      );


      final User? userFirebase = (
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
          // ignore: body_might_complete_normally_catch_error
          ).catchError((errormessage){
            Navigator.pop(context);
            cMethods.displaysnackBar(errormessage.toString(), context);
          })
      ).user;

      if (!context.mounted) return;
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      DocumentReference userReference = FirebaseFirestore.instance.collection("users").doc(userFirebase!.uid);

      Map <String, dynamic>userMap = 
      {  
        "name": usernameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(), 
        "contactnum": phoneTextEditingController.text.trim(),
        "address": addressTextEditingController.text.trim(),
        "id":userFirebase.uid,
        "role": role,
        "blockstatus": "no", 
      };

     // userReference.set(userMap);
      //Navigator.push( context , MaterialPageRoute(builder: (c)=>const LoginScreen()));
      await userReference.set(userMap);
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (c) =>  Homepage(userDetails: userMap)),
      );
   }

  @override
  Widget build(BuildContext context) 
  {
    return  Scaffold(
      body: Container( 
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage ('assets/login4.png'),
            fit: BoxFit.cover,
            ),
        ), 
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:[ 
              SizedBox(height: 60,),
              const  Text(
                "Create an User\'s Acoounts",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                   fontStyle: FontStyle.italic,
                  
                ),
                ),
                //Text feilds + button 
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [


                    TextField(
                      controller: usernameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText:"User Name ",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 18), 
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 40,),

                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText:"Email id  ",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 18), 
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),  

                    const SizedBox(height: 40,),

                     TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText:"User Password ",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 18), 
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    
                    const SizedBox(height: 40,),

                     TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText:"Contact number ",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 18), 
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),  
  
                    const SizedBox(height: 40,),
                     TextField(
                      controller: addressTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText:"Address ",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 18), 
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ), 
                    const SizedBox(height: 40,),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<int>(value: 0, groupValue: role, onChanged: (int? value){
                          setState(() {
                            role =value!;
                          });
                        },
                         activeColor: Colors.purple,
                        ),
                        const Text(
                          "user",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                        SizedBox( height: 30,),
                        Radio(value: 1, groupValue: role, onChanged: (int? value){
                          setState(() {
                            role = value!;
                          });
                        },
                         activeColor: Colors.purple,
                        ),
                        const Text(
                          "Restaurant",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: () 
                      {
                        signUpFormValidation();

                     },
                     style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 85,vertical: 15)
                     ),
                    
                    child: Text(
                      "Sign Up",
                       style: TextStyle(
                       color: Colors.white,fontSize: 14 
                      ),
                    ),
                    ),

                    ],
                  )
                  
                  ),
              

                //textbutton
                SizedBox(height: 1,),

                TextButton(
                  onPressed: ()
                  {
                  
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));

                  },
                   child: const Text(
                    "Already have an Account? Login Here",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 18,
                    ),
                   )),
                   SizedBox(height: 200),
            ]
          )
      ),
      ),
      ),
    );
  }
}