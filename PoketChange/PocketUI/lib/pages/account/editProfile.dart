// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController =
      TextEditingController(text: 'Ellison Perry');
  TextEditingController emailController =
      TextEditingController(text: 'ellison@test.com');
  TextEditingController phoneController =
      TextEditingController(text: '123456789');
  TextEditingController passwordController =
      TextEditingController(text: '0987654321');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 1.0,
        title: const Text(
          'Edit Profile',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageChange(),
                height20Space,
                heightSpace,
                nameTextField(),
                height20Space,
                emailTextField(),
                height20Space,
                phoneTextField(),
                height20Space,
                passwordTextField(),
                height20Space,
                saveButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  saveButton() {
    return InkWell(
      onTap: () => Navigator.pop(
        context,
        nameController.text,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(fixPadding - 5.0),
        ),
        child: const Text(
          'Save',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  passwordTextField() {
    return TextField(
      cursorColor: primaryColor,
      style: black14MediumTextStyle,
      controller: passwordController,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: const InputDecoration(
        labelText: 'Password',
        labelStyle: black12MediumTextStyle,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
        contentPadding: EdgeInsets.all(fixPadding + 1.0),
        isDense: true,
      ),
    );
  }

  phoneTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      cursorColor: primaryColor,
      style: black14MediumTextStyle,
      controller: phoneController,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        labelStyle: black12MediumTextStyle,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
        contentPadding: EdgeInsets.all(fixPadding + 1.0),
        isDense: true,
      ),
    );
  }

  emailTextField() {
    return TextField(
      cursorColor: primaryColor,
      style: black14MediumTextStyle,
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        labelStyle: black12MediumTextStyle,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
        contentPadding: EdgeInsets.all(fixPadding + 1.0),
        isDense: true,
      ),
    );
  }

  nameTextField() {
    return TextField(
      cursorColor: primaryColor,
      style: black14MediumTextStyle,
      controller: nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        labelStyle: black12MediumTextStyle,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
        contentPadding: EdgeInsets.all(fixPadding + 1.0),
        isDense: true,
      ),
    );
  }

  imageChange() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 160.0,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: width - fixPadding * 4.0,
            alignment: Alignment.center,
            child: Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/user/user_9.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: width - fixPadding * 4.0,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => chooseOptionBottomSheet(),
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 140.0,
                  padding:
                      const EdgeInsets.symmetric(vertical: fixPadding * 0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.orange,
                    border: Border.all(
                      width: 2.0,
                      color: whiteColor,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 16.0,
                        color: whiteColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Change',
                        style: white12MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  chooseOptionBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: fixPadding,
            horizontal: fixPadding + 5.0,
          ),
          child: Wrap(
            children: [
              Column(
                children: [
                  const Center(
                    child: Text(
                      'Choose Option',
                      style: black16BoldTextStyle,
                    ),
                  ),
                  heightSpace,
                  Container(
                    height: 1.0,
                    color: greyColor,
                  ),
                  heightSpace,
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: chooseFromCameraOrGallery(
                      icon: Icons.camera_alt,
                      optionText: 'Camera',
                    ),
                  ),
                  heightSpace,
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: chooseFromCameraOrGallery(
                      icon: Icons.photo_album,
                      optionText: 'Upload from gallery',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  chooseFromCameraOrGallery({icon, optionText}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: blackColor,
        ),
        width5Space,
        Text(
          optionText,
          style: black14MediumTextStyle,
        ),
      ],
    );
  }
}
