import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class authWithNumber extends GetxController{
  FirebaseAuth auth=FirebaseAuth.instance;
  TextEditingController number= TextEditingController();

void SignUpWithNumber() async{
try{
await auth.verifyPhoneNumber(
  phoneNumber: '+923474738363', 
  
  verificationCompleted: (PhoneAuthCredential credential){
    print(credential);
  },
   verificationFailed: (FirebaseAuthException e){
    print(e);
   },
    codeSent: (String verficationId, int? resendToken){
    },
     codeAutoRetrievalTimeout: (String verificationId){},
     );
}
catch (ex){
  print (ex);
     }
  }
}