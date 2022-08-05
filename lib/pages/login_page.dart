import 'package:deque/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Loginpf extends StatefulWidget {
  const Loginpf({Key? key}) : super(key: key);
  @override
  State<Loginpf> createState() => _LoginpfState();
}

class _LoginpfState extends State<Loginpf> {

  String name = "";
  bool ChangeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async
  {
    // if(_formKey.currentState!.validate())
    {
    //   setState(() {
    //     ChangeButton = false;
    //   });
    // }

    // else{
      // 
      setState(() {
      ChangeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeroute);
      setState(() {
        ChangeButton = false;
                  });
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Image.network('https://www.shahucollegelatur.org.in/Activity%20portal/img/login.gif',fit: BoxFit.cover,),

              SizedBox(height: 10.0,),
              Text("Welcome $name,",
              style: TextStyle(
                fontSize: 30,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 29.00,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 38.0,horizontal: 29.0),
                child: Column(children: [TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Username"),

                    validator: (Value)
                    {
                      if (Value!.isEmpty) {
                        return null;
                      }

                      return "Username cannot be empty";

                    },


                    onChanged: (value){
                      name = value;
                      setState(() {
                      });
                    },
                ),
                
                SizedBox(height: 10.00,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Input Password"),

                    validator: (Value)
                    {
                      if (Value!.isEmpty) {
                        return null;
                      }

                      return "Password cannnot be empty";

                    },  
                ),
        
                SizedBox(height: 80.00,),
                
                
                Material(
                   child: InkWell(
                    onTap: () =>moveToHome(context),
                     child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                 
                      width: ChangeButton?50 : 100,
                      height: 50,
                      alignment: Alignment.center,
                   
                      child: ChangeButton?Icon(Icons.done, color: Colors.white,):Text("Login",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                   
                      ),
                      
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        // shape: ChangeButton?BoxShape.circle:BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(ChangeButton ? 50 : 8)
                      ),
                     ),
                   ),
                 ),
        
                // ElevatedButton(onPressed: () {
        
                //   Navigator.pushNamed(context, MyRoutes.homeroute);
                  
                // }, child: Text("Login"))
        
                
                ],),
              )
              ],
        
          ),
        ),
      ));
  }
}