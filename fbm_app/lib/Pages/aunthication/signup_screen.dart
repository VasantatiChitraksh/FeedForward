import "package:fbm_app/Pages/aunthication/login_screen.dart";
import "package:fbm_app/Pages/methods/common_methods.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";


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
    }
    else { // register the user
    }

  }


  @override
  Widget build(BuildContext context) 
  {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:[ 
              SizedBox(height: 60,),
              const  Text(
                "Create a User\'s Acoounts",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
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
                        labelStyle: TextStyle(fontSize: 14), 
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 40,),

                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText:"Email id  ",
                        labelStyle: TextStyle(fontSize: 14), 
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
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
                        labelStyle: TextStyle(fontSize: 14), 
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    
                    const SizedBox(height: 40,),

                     TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText:"Contact number ",
                        labelStyle: TextStyle(fontSize: 14), 
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),  
  
                    const SizedBox(height: 40,),

                    ElevatedButton(
                      onPressed: () 
                      {
                        //signUpFormValidation();

                     },
                     style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 39, 101, 176),
                      padding: EdgeInsets.symmetric(horizontal: 85,vertical: 15)
                     ),
                    
                    child: Text(
                      "Sign Up"
                    ),
                    ),

                    ],
                  )
                  
                  ),
              

                //textbutton
                SizedBox(height: 30,),

                TextButton(
                  onPressed: ()
                  {
                  
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));

                  },
                   child: const Text(
                    "Already have an Account? Login Here",
                    style: TextStyle(
                      color: Colors.cyan,
                    ),
                   ))
            ]
          )
      ),
      ),
    );
  }
}