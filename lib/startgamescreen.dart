import 'package:calculator/board_screen.dart';
import 'package:flutter/material.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  static const String routeName='/';


  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  //String?player1name;
  //String?player2name;
  var formKey = GlobalKey<FormState>();
  var Player1NameController=TextEditingController();
  var Player2NameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Let's Gooo",style: TextStyle(color: Colors.yellow,fontSize: 30,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child:Padding(
            padding: const EdgeInsets.all(13),
            child: SingleChildScrollView(
              child: Column(
              
                children: [
              
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Container(
                      height: 300,
                     width: double.infinity,
                      child: Image.asset("images/1.jpeg",fit: BoxFit.cover,),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: Player1NameController,
                    validator: (input){
                      if(input==null||input.trim().isEmpty){
                        return "Please enter your name";
                      }
                      if(input.trim().length<4){
                        return "Name should be at least 4 chars";
                      }
                    return null;

                    },


    // onChanged: (input){
                    // player1name = input;

                    decoration: InputDecoration(
                      label: Text("Player1",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              
                    border:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(24),
                    ),
              
                      enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.circular(24),
                      ),
              
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
              
                  SizedBox(height: 30,),
              
                  TextFormField(
                    controller:Player2NameController ,
                    validator: (input){
                      if(input==null||input.trim().isEmpty){
                        return "Please enter your name";
                      }
                      if(input.trim().length<4){
                        return "Name should be at least 4 chars";
                      }
                      return null;

                    },

                    // onChanged: (input){
                    //   player2name=input;
                    // },
                    decoration: InputDecoration(
                      label: Text("Player2",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              
                      border:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.circular(24),
                      ),
              
                      enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.circular(24),
                      ),
              
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60,),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    ),
    onPressed: () {
    navigate();
    },
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 25),
    child: Text(
    "Start Game",
    style: TextStyle(color: Colors.yellow, fontSize: 20),
    ),
    ),
    ),
                  SizedBox(height: 10,),
                  Text("Released by hossam"),
]
    ),
      ),
    )
)
      )
    );
  }
  void navigate(){
    if(formKey.currentState!.validate()== false){
      return;
    }
    Navigator.of(context).pushNamed(
      BoardScreen.routeName,
      arguments: StartGameArgs(
        player1Name: Player1NameController.text?? '',
        player2Name: Player2NameController.text?? '',
      ),
    );
  }
}
class StartGameArgs{
  String player1Name;
  String player2Name;
StartGameArgs({required this.player1Name,required this.player2Name});
}
