// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:async';
import 'package:PocketChn/pages/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPCode extends StatefulWidget {
  const OTPCode({super.key});

  @override
  _OTPCodeState createState() => _OTPCodeState();
}

class _OTPCodeState extends State<OTPCode> {
  // OTPCode
  TextEditingController otpcontroller = TextEditingController();

  get verificationID => null;

  get _auth => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bankXWithImage(),
              height20Space,
              enterOTPHint(),
              height20Space,
              // Place code here,
              // Enter OTP into Form
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: TextField(
                    controller: otpcontroller,
                    decoration: InputDecoration(
                      labelText: "Enter OTP",
                      labelStyle: TextStyle(fontSize: 19),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    ),
                  ),
                ),
              ),
              // Button Verify(),
              height20Space,
              ElevatedButton(
                  onPressed: () {
                    AuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationID,
                            smsCode: otpcontroller.text);
                    signin(phoneAuthCredential);
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Colors.yellow[700],
                      padding:
                          EdgeInsets.symmetric(horizontal: 152, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 20,
                      ))),
              // countinueButton(),
              height20Space,
              resendText(),
            ],
          ),
        ],
      ),
    );
  }

  enterOTPHint() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Text(
        'Enter OTP sent on your registered mobile number',
        textAlign: TextAlign.center,
        style: black14MediumTextStyle,
      ),
    );
  }

  resendText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        children: [
          Text(
            'Didn’t receive otp code! ',
            style: grey14MediumTextStyle,
          ),
          Text(
            'Resend',
            style: black18BoldTextStyle,
          ),
        ],
      ),
    );
  }

  bankXWithImage() {
    return Stack(
      children: [
        Container(
          height: 200.0,
          decoration: const BoxDecoration(
            color: blackColor,
            image: DecorationImage(
              image: AssetImage('assets/banking.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            color: blackColor.withOpacity(0.46),
            child: const Text(
              'Pocket Change',
              style: white36BoldTextStyle,
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            iconSize: 24.0,
            color: whiteColor,
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ],
    );
  }

  countinueButton() {
    return InkWell(
      onTap: () => showProgress(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        padding: const EdgeInsets.symmetric(
          vertical: fixPadding + 4.0,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Continue',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  showProgress() {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(fixPadding),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: fixPadding * 2.0),
            child: Wrap(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 45.0,
                        height: 45.0,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(primaryColor),
                          strokeWidth: 3.0,
                        ),
                      ),
                      height20Space,
                      heightSpace,
                      Text(
                        'Please wait..',
                        style: grey12MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ),
      ),
    );
  }

  void signin(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }
}
