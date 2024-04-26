import 'dart:ui';

import 'package:country_picker/country_picker.dart';
import 'package:delivery_panel/provider/auth_provider.dart';
import 'package:delivery_panel/utils/utils.dart';
import 'package:delivery_panel/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "India",
      e164Key: "");

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length)
    );


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Column(

              children: [
                SizedBox(height: 50,),
                Container(
                  width: 200,
                  height: 200,

                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade50,
                  ),
                  child: Image.asset("assets/image2.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Add your phone Number. We'll send you a verification code",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.purple,
                  controller: phoneController,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                  onChanged: (value){
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Phone Number",
                      hintStyle:  TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: 500
                                ),
                                onSelect: (value){
                              setState(() {
                                selectedCountry = value;
                              });
                                });
                          },
                          child: Text("${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),),
                        ),
                      ),
                    suffixIcon: phoneController.text.length> 9 ? Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                      ),
                      child: const Icon(Icons.done,
                      color: Colors.white,
                      size: 20,),
                    ) : null,
                  ),
                ),
                const SizedBox(height: 20,),



                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(text: "Login",
                  onPressed: ()  => sendPhoneNumber(),),

                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber (){
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context , "+${selectedCountry.phoneCode}$phoneNumber");
  }


}
