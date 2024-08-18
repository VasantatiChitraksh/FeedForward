import "package:cloud_firestore/cloud_firestore.dart";
import "package:fbm_app/Pages/HomePages/Homepage.dart";
import "package:fbm_app/Pages/authentication/signup_screen.dart";
import "package:fbm_app/Pages/methods/common_methods.dart";
import "package:fbm_app/Widgets/loading_dialog.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

   CommonMethods cMethods = CommonMethods();


   signInFormValidation() {

    
    if (!emailTextEditingController.text.contains("@")){
      cMethods.displaysnackBar("Please write valid email", context);
    }
    else if (passwordTextEditingController.text.trim().length < 6) {
      cMethods.displaysnackBar("Your password must be atlest 6 or more characters.", context);
    }
    else {  
      loginuser();
    }
   }

    loginuser() async 
    {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => LoadingDialog(massagetext: "logging in your Account. . ."),
      );

      final User? userFirebase = (
         await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
          // ignore: body_might_complete_normally_catch_error
          ).catchError((errormessage)
          // ignore: body_might_complete_normally_catch_error
          {
            Navigator.pop(context);
            cMethods.displaysnackBar(errormessage.toString(), context);
          })
      ).user;

       if (!context.mounted) return;
      // ignore: use_build_context_synchronously
        Navigator.pop(context);


        if (userFirebase != null) {

          DocumentReference userReference = FirebaseFirestore.instance.collection("users").doc(userFirebase.uid);

          DocumentSnapshot snapshot=   await userReference.get();
           Map <String,dynamic>userdi = snapshot.data() as Map <String,dynamic > ;

            if (snapshot.exists) {

              if ((snapshot.data() as Map)["blockstatus"] == "no") {
                    
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>Homepage( userDetails:userdi)));

              }else {
                
                FirebaseAuth.instance.signOut();
                cMethods.displaysnackBar("user has been blocked ", context);
              }

            }else {

              FirebaseAuth.instance.signOut();
              cMethods.displaysnackBar("user doesn't exixt, signup", context);
            }

          


        }

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage ('assets/login4.png'),
            fit: BoxFit.cover,
            ),
        ),
        child:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:[ 
              SizedBox(height: 60),
              const  Text(
                "Log in ",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  
                  
                ),
                ),
                //Text feilds + button 
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [


                    

                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText:"Email id  ",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18), 
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),  

                    const SizedBox(height: 60),

                     TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText:" Password ",
                        labelStyle: TextStyle( color: Colors.white,fontSize: 18), 
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    
                    
  
                    const SizedBox(height: 60),

                   /* Row(
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
                    ),*/
                    SizedBox(height: 30,),

                    ElevatedButton(
                      onPressed: () 
                      {
                        signInFormValidation();

                     },
                     style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 85,vertical: 15)
                     ),
                    
                    child: Text(
                      "Login",
                      style: TextStyle(
                       color: Colors.white,fontSize: 14 
                      ),
                      

                    )
                    ,
                    ),

                    ],
                  )
                  
                  ),
              

                //textbutton
                SizedBox(height: 80),

                TextButton(
                  onPressed: ()
                  {
                  
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>SignupScreen()));

                  },
                   child: const Text(
                    "Don\'t have an Account? Register Here",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 18,
                    ),
                   )),
                  SizedBox(height: 260),
            ]
          )
      ),
      ),
     ),
    );
  }
}
