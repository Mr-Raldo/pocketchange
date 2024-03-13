import 'package:PocketChn/pages/screens.dart';
import 'package:PocketChn/pages/signup_controller.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController pinController = TextEditingController();

  String verificationID = "";
  DateTime? currentBackPressTime;
  @override
  void initState() {
    super.initState();
  }

  void phoneAuthentication(String phoneNo) {
    SignUpController.instance.phoneAuthentication(phoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              bankXWithImage(),
              height40Space,
              const Text(
                'Sign in your account',
                style: black14MediumTextStyle,
              ),
              height20Space,
              customerIdTextField(),
              height20Space,
              mPinTextField(),
              height40Space,
              ElevatedButton(
                onPressed: () {
                  getOtp;
                },
                child: Text('Continue'),
              ),
              height40Space,
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.rightToLeft,
                    child: const Register(),
                  ),
                ),
                child: Text(
                  'New user?',
                  style: black16MediumTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bankXWithImage() {
    return Container(
      height: 200.0,
      decoration: const BoxDecoration(
        color: blackColor,
        image: DecorationImage(
          image: AssetImage('assets/banking.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: blackColor.withOpacity(0.46),
        alignment: Alignment.center,
        child: const Text(
          'Pocket Change',
          style: white36BoldTextStyle,
        ),
      ),
    );
  }

  getOtp() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: "+263${phonecontroller.text}",
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) {
          setState(() {});
          print(verificationFailed);
        },
        codeSent: (verificationID, resendingToken) async {
          setState(() {
            this.verificationID = verificationID;
          });
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OTPCode()));
        },
        codeAutoRetrievalTimeout: (verificationID) async {});
    // Navigator.of(context)
    //.push(MaterialPageRoute(builder: (context) => OtpScreen()));
  }

  countinueButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: const Home(),
        ),
      ),
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

  customerIdTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding + 5.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        controller: phonecontroller,
        onChanged: (value) {
          setState(() {
            phonecontroller.text = value;
          });
        },
        decoration: InputDecoration(
          prefix: Text("+263",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              )),
          hintStyle: black14MediumTextStyle,
          hintText: 'Phone number',
          border: InputBorder.none,
          suffixIcon: phonecontroller.text.length > 9
              ? Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  mPinTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding + 5.0,
        vertical: fixPadding - 6.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        style: black14MediumTextStyle,
        controller: pinController,
        onChanged: (value) {
          setState(() {
            pinController.text = value;
          });
        },
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Enter Pin',
          border: InputBorder.none,
          suffixIcon: pinController.text.length > 3
              ? Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
