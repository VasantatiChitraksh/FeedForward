import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends StatelessWidget
 {
  String massagetext;
  

  LoadingDialog({super.key, required this.massagetext,});

  @override
  Widget build(BuildContext context) 
  {
    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      backgroundColor: Colors.black45,
      child: Container(
        margin: const EdgeInsets.all(17),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black38,
           borderRadius: BorderRadius.circular(8),
        ),

        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [

              const SizedBox(width: 7),

             const CircularProgressIndicator(
                valueColor:  AlwaysStoppedAnimation<Color>(Colors.white10),
                ),

                 const SizedBox(width: 8), 

                 Text(
                  massagetext,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),

                 )


            ],
          ),
        ),
      ),
    );
  }
}