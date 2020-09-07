import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_mess_book_app/app/home_page.dart';
import 'package:my_mess_book_app/common_widgets/HexaClr.dart';
import 'package:my_mess_book_app/common_widgets/custom_raised_button.dart';

class ToggleUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50,),
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset("images/logo.png"),
              ),
            ),
            SizedBox(height: 100,),
            CustomRaisedButton(
              child: Text("Join mess",style: TextStyle(fontSize: 20,color: Colors.black),),
              color: Colors.white,
              borderRadius: 20,
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>HomePage())
                );
              },
            ),
            SizedBox(height: 20,),
            CustomRaisedButton(
              child: Text("Create mess",style: TextStyle(fontSize: 20,color: Colors.black),),
              color: Colors.white,
              borderRadius: 20,
              onPressed: (){},
            ),
          ],
        ),
      ),
      backgroundColor: HexColor("#000033"),
    );
  }
}
