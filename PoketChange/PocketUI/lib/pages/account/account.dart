// ignore_for_file: library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // ignore: prefer_typing_uninitialized_variables
  var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: const Text(
          'Account',
          style: black18BoldTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameWithImageEdit(),
                height20Space,
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'Change mPin & thumb impression',
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: const NearByBanks(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Nearby Banks',
                  ),
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: const NearByATMs(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Nearby ATMs',
                  ),
                ),
                heightSpace,
                height5Space,
                const Text(
                  'ABOUT',
                  style: black12RegularTextStyle,
                ),
                heightSpace,
                height5Space,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: const Privacypolicy(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Privacy Policy',
                  ),
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: const TermOfUse(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Terms of use',
                  ),
                ),
                heightSpace,
                height5Space,
                const Text(
                  'APP',
                  style: black12RegularTextStyle,
                ),
                heightSpace,
                height5Space,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: const Support(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Support',
                  ),
                ),
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'Report a Bug',
                ),
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'App Version 1.0',
                ),
                height20Space,
                logoutLink(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  nameWithImageEdit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/user/user_9.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widthSpace,
            const Text(
              'Ellison Perry',
              style: black16BoldTextStyle,
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            result = await Navigator.push(
              context,
              PageTransition(
                duration: const Duration(milliseconds: 500),
                type: PageTransitionType.rightToLeft,
                child: const EditProfile(),
              ),
            );
          },
          child: Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: const Icon(
              Icons.edit,
              size: 24.0,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  logoutLink() {
    return InkWell(
      onTap: () => sureToLogoutDialog(),
      child: const Row(
        children: [
          Icon(
            Icons.exit_to_app,
            color: redColor,
            size: 22.0,
          ),
          widthSpace,
          Text(
            'Logout',
            style: red14MediumTextStyle,
          ),
        ],
      ),
    );
  }

  sureToLogoutDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(fixPadding),
                ),
              ),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(fixPadding * 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'You sure want to logout?',
                          style: black16BoldTextStyle,
                        ),
                        height20Space,
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: cancelOrLogout(
                                    selectionText: 'Cancel', isCancel: true),
                              ),
                            ),
                            width20Space,
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignIn(),
                                    ),
                                  );
                                },
                                child: cancelOrLogout(
                                    selectionText: 'Logout', isCancel: false),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  cancelOrLogout({selectionText, isCancel}) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: fixPadding - 5.0),
      decoration: BoxDecoration(
        color: (isCancel) ? whiteColor : primaryColor,
        border: (isCancel) ? Border.all(color: primaryColor) : const Border(),
        borderRadius: BorderRadius.circular(fixPadding),
      ),
      child: Text(
        selectionText,
        style: (isCancel) ? black14MediumTextStyle : white14MediumTextStyle,
      ),
    );
  }

  accountFunctionalities({settingTitle}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingTitle,
              style: black14MediumTextStyle,
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: blackColor,
              size: 16.0,
            ),
          ],
        ),
        heightSpace,
        Container(
          height: 1.0,
          color: greyColor,
        ),
      ],
    );
  }
}
