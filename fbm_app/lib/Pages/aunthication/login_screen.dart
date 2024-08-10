import "package:fbm_app/Pages/aunthication/signup_screen.dart";
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children:[ 
              SizedBox(height: 60,),
              const  Text(
                "Log in ",
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
                        labelText:" Password ",
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


                     },
                     style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 39, 101, 176),
                      padding: EdgeInsets.symmetric(horizontal: 85,vertical: 15)
                     ),
                    
                    child: Text(
                      "Login"
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
                  
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>SignupScreen()));

                  },
                   child: const Text(
                    "Don\'t have an Account? Register Here",
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