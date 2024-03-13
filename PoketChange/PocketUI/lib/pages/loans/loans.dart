// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:animated/animated.dart';
import 'package:PocketChn/pages/screens.dart';

class Loans extends StatefulWidget {
  const Loans({super.key});

  @override
  _LoansState createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  bool scaled = false;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 80),
      () => setState(() {
        scaled = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 1.0,
        title: const Text(
          'Pocket Share',
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
            padding: const EdgeInsets.symmetric(
              vertical: fixPadding * 2.0,
              horizontal: fixPadding * 2.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loanTypesCards(
                  loanType: 'Home Loan',
                  number: '1356 8795 7857 9856',
                  dueAmount: '69,000.00',
                  emiAmount: '912.00',
                ),
                height20Space,
                loanTypesCards(
                  loanType: 'Car Loan',
                  number: '1658 9875 1245 9534',
                  dueAmount: '25000.00',
                  emiAmount: '345.00',
                ),
                height20Space,
                const Text(
                  'Available offers',
                  style: black16BoldTextStyle,
                ),
                heightSpace,
                businessLoan(),
                height20Space,
                educationLoan(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  educationLoan() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: const BusinessLoan(),
        ),
      ),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/education-loan.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              blurRadius: 4.0,
              color: greyColor.withOpacity(0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  businessLoan() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: const BusinessLoan(),
        ),
      ),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/business-loan.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              blurRadius: 4.0,
              color: greyColor.withOpacity(0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  loanTypesCards({loanType, number, dueAmount, emiAmount}) {
    return Animated(
      value: scaled ? 1 : 0.5,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
      builder: (context, child, animation) => Transform.scale(
        scale: animation.value,
        child: child,
      ),
      child: Container(
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fixPadding),
          image: const DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(fixPadding),
          decoration: BoxDecoration(
            color: blackColor.withOpacity(0.40),
            borderRadius: BorderRadius.circular(fixPadding),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loanType,
                        style: white14BoldTextStyle,
                      ),
                      height5Space,
                      Text(
                        number,
                        style: white14MediumTextStyle,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.rightToLeft,
                        child: LoanStatement(
                          loanType: loanType,
                          number: number,
                          dueAmount: dueAmount,
                          emiAmount: emiAmount,
                        ),
                      ),
                    ),
                    child: const Text(
                      'View statement',
                      style: white12RegularTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Due Amount',
                        style: white12RegularTextStyle,
                      ),
                      height5Space,
                      Text(
                        '\$$dueAmount',
                        style: white16MediumTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'EMI',
                        style: white12RegularTextStyle,
                      ),
                      height5Space,
                      Text(
                        '\$$emiAmount',
                        style: white16MediumTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
