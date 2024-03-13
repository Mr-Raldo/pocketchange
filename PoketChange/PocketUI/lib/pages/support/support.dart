// ignore_for_file: library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: const Text(
          'Support',
          style: black18BoldTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              children: [
                nameTextField(),
                height20Space,
                emailTextField(),
                height20Space,
                messageTextField(),
                height20Space,
                submitButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  submitButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: fixPadding + 5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(fixPadding),
        ),
        child: const Text(
          'Submit',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  messageTextField() {
    return const TextField(
      cursorColor: primaryColor,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Write here',
        hintStyle: grey14MediumTextStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        contentPadding: EdgeInsets.all(fixPadding),
      ),
    );
  }

  emailTextField() {
    return const TextField(
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: grey14MediumTextStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        contentPadding: EdgeInsets.all(fixPadding),
      ),
    );
  }

  nameTextField() {
    return const TextField(
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: 'Name',
        hintStyle: grey14MediumTextStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        contentPadding: EdgeInsets.all(fixPadding),
      ),
    );
  }
}
