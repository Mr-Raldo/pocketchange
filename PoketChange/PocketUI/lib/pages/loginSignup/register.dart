// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:typed_data';
import 'package:PocketChn/pages/others/others.dart';
import 'package:PocketChn/pages/screens.dart';

import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Uint8List? _image;

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }
    // ignore: avoid_print
    print('No image selected');
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmpinController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
              height20Space,
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2023/08/tiktok-no-profile-picture.png'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              height20Space,
              customerNameTextField(),
              height20Space,
              customerLastNameTextField(),
              height20Space,
              customerDOBTextField(),
              height20Space,
              customerIDTextField(),
              height20Space,
              genderTextField(),
              height20Space,
              customerAddressTextField(),
              height20Space,
              customerEmailTextField(),
              height40Space,
              customerPhoneTextField(),
              height20Space,
              mPinTextField(),
              height20Space,
              confirmPinTextField(),
              height20Space,
              countinueButton(),
              height20Space,
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  'Already registered?',
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
    return Stack(
      children: [
        Container(
          height: 100.0,
          decoration: const BoxDecoration(
              // color: blackColor,
              // image: DecorationImage(
              //   image: AssetImage('assets/banking.png'),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: Container(
            color: blackColor.withOpacity(0.46),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pocket Change',
                  style: white36BoldTextStyle,
                ),
                Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: const Others(),
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

  customerPhoneTextField() {
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
        controller: phoneController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Phone Number',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerIDTextField() {
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
        controller: idController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'ID Number',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerNameTextField() {
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
        controller: nameController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Name',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerLastNameTextField() {
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
        controller: lastnameController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Last Name',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerDOBTextField() {
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
        controller: dobController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Date of Birth',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerAddressTextField() {
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
        controller: addressController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Address',
          border: InputBorder.none,
        ),
      ),
    );
  }

  customerEmailTextField() {
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
        controller: emailController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Email',
          border: InputBorder.none,
        ),
      ),
    );
  }

  genderTextField() {
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
        controller: genderController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Gender',
          border: InputBorder.none,
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
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Enter mPin',
          border: InputBorder.none,
        ),
      ),
    );
  }

  confirmPinTextField() {
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
        controller: confirmpinController,
        decoration: InputDecoration(
          hintStyle: black14MediumTextStyle,
          hintText: 'Confirm mPin',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
