// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:PocketChn/pages/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  DateTime? currentBackPressTime;

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      bottomNavigationBar: Material(
        elevation: 2.0,
        child: SizedBox(
          height: (Platform.isIOS) ? 100.0 : 80.0,
          child: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getBottomBarItem(0, Icons.account_balance, 'Banking'),
                  getBottomBarItem(1, Icons.notifications, 'Notifications'),
                  getBottomBarItem(2, Icons.person, 'Account'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool key) {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
        },
        child: (currentIndex == 0)
            ? const Home()
            : (currentIndex == 1)
                ? const Notifications()
                : const Account(),
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
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  getBottomBarItem(int index, icon, String text) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      focusColor: primaryColor,
      onTap: () {
        changeIndex(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 21.0,
              color: (currentIndex == index) ? primaryColor : greyColor,
            ),
            height5Space,
            Text(
              text,
              style: (currentIndex == index)
                  ? primaryColor10RegularTextStyle
                  : grey10RegularTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
