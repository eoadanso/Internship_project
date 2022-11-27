import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nalo_project/widget/text_input_field.dart';
import 'package:http/http.dart' as http;

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({Key? key,
  }) : super(key: key);

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  bool isLoading = false;


  @override
  void dispose() {
    super.dispose();
    numberController.dispose();
    messageController.dispose();
  }

  Future<http.Response> postRequest () async {
    setState(() {
      isLoading = true;
    });

    var url ='https://sms.nalosolutions.com/smsbackend/clientapi/Resl_Nalo/send-message/';

    Map data = {
      'username': "eoadanso",
      'password': "Ericofire1",
      'msisdn': numberController.text,
      'message': messageController.text,
      'sender_id': "Erico150",
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body
    );
    if(response.statusCode == 200){
            setState(() {
              isLoading = false;
            });
           ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Center(
                   child: Text(response.body,style: const TextStyle(fontSize: 20),)),
                 backgroundColor: Colors.green,
                 behavior: SnackBarBehavior.floating,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
                 duration: const Duration(seconds: 4),
                 margin: EdgeInsets.only(
                     bottom: MediaQuery.of(context).size.height -155,
                     top: 60,
                     right: 20,
                     left: 20
                 ),
               ));
    }else if(response.statusCode == 500){
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Center(
               child: Text(response.body,style: const TextStyle(fontSize: 20),)),
            backgroundColor: Colors.redAccent,
             behavior: SnackBarBehavior.floating,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10),
             ),
             duration: const Duration(seconds: 4),
             margin: EdgeInsets.only(
                 bottom: MediaQuery.of(context).size.height -145,
                 top: 60,
                 right: 20,
                 left: 20
             ),
           ));
    }else if(response.statusCode == 400){
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content:  Center(
               child: Text(response.body,style: const TextStyle(fontSize: 20),)),
            backgroundColor: Colors.redAccent,
             behavior: SnackBarBehavior.floating,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
             ),
             duration: const Duration(seconds: 4),
             margin: EdgeInsets.only(
               bottom: MediaQuery.of(context).size.height -155,
               top: 60,
               right: 20,
               left: 20
             ),
           ));
    }
    setState(() {
      isLoading = false;
    });

    print("${response.statusCode}");
    print("${response.body}");
    print(data);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 170,),
            Stack(
              children: const [
                Image(image: AssetImage("assets/nalo.webp"),
                width: 150,
                  height: 50,
                  fit: BoxFit.cover,
                )
              ],
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                readOnly: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "**********",
                  hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                  labelText: "Password",
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(Icons.password_sharp),
                  ),
                  focusedBorder: inputBorder,
                  border: inputBorder,
                  filled: true,
                  enabledBorder: inputBorder,
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "eoadanso",
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        labelText: "Username",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(Icons.person),
                        ),
                      focusedBorder: inputBorder,
                      border: inputBorder,
                      filled: true,
                      enabledBorder: inputBorder,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Erico150",
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                        labelText: "Sender ID",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(Icons.send_time_extension_rounded),
                        ),
                      focusedBorder: inputBorder,
                      border: inputBorder,
                      filled: true,
                      enabledBorder: inputBorder,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ))
                ],
              ),
            ),
            TextInputField(
              textEditingController: numberController,
              textInputType: TextInputType.number,
              hintText: "Enter the number here",
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25
              ),
              child: TextFormField(
                controller: messageController,
                maxLines: 4,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Enter your message here",
                  focusedBorder: inputBorder,
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(Icons.message),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: postRequest,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)
                        ),
                      ),
                      color: Colors.blue
                  ),
                  child: ! isLoading ?
                  const Text("Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white ),
                  ): const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
