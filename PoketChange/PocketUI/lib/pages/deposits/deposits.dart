// ignore_for_file: library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';
import 'package:PocketChn/widget/column_builder.dart';

class Deposits extends StatefulWidget {
  const Deposits({super.key});

  @override
  _DepositsState createState() => _DepositsState();
}

class _DepositsState extends State<Deposits> {
  final pendingDepositsList = [
    {
      'depositToNumber': '0325 2365 1478',
      'amount': '689.0',
      'accountType': 'Savings',
      'dateAndTime': '14 April 2021 | 11:12 AM',
    },
    {
      'depositToNumber': '5987 4562 3258',
      'amount': '878.0',
      'accountType': 'Current',
      'dateAndTime': '19 March 2021 | 11:12 AM',
    },
  ];
  final completeDepositsList = [
    {
      'depositToNumber': '0325 2365 1478',
      'amount': '512.0',
      'accountType': 'Savings',
      'dateAndTime': '12 Feb 2021 | 11:12 AM',
    },
  ];
  double? height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 1.0,
        title: const Text(
          'Deposits',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              newDepositButton(),
              depositsText(titleText: 'Pending Deposits'),
              pendingDeposits(),
              heightSpace,
              depositsText(titleText: 'Completed Deposits'),
              completeDeposits(),
            ],
          ),
        ],
      ),
    );
  }

  depositsText({titleText}) {
    return Padding(
      padding: const EdgeInsets.only(left: fixPadding * 2.0),
      child: Text(
        titleText,
        style: black16BoldTextStyle,
      ),
    );
  }

  completeDeposits() {
    return ColumnBuilder(
      itemCount: completeDepositsList.length,
      itemBuilder: (context, index) {
        final pending = completeDepositsList[index];
        return Container(
          margin: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding,
            fixPadding * 2.0,
            fixPadding,
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
            borderRadius: BorderRadius.circular(fixPadding),
          ),
          child: depositsInfo(
            accountNumber: pending['depositToNumber'],
            accountType: pending['accountType'],
            amount: pending['amount'],
            dateAndTime: pending['dateAndTime'],
            isPending: false,
          ),
        );
      },
    );
  }

  pendingDeposits() {
    return ColumnBuilder(
      itemCount: pendingDepositsList.length,
      itemBuilder: (context, index) {
        final pending = pendingDepositsList[index];
        return Container(
          margin: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding,
            fixPadding * 2.0,
            fixPadding,
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
            borderRadius: BorderRadius.circular(fixPadding),
          ),
          child: depositsInfo(
            accountNumber: pending['depositToNumber'],
            accountType: pending['accountType'],
            amount: pending['amount'],
            dateAndTime: pending['dateAndTime'],
            isPending: true,
          ),
        );
      },
    );
  }

  depositsInfo({accountNumber, accountType, amount, dateAndTime, isPending}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deposit to',
                    style: grey12RegularTextStyle,
                  ),
                  height5Space,
                  Text(
                    accountNumber,
                    style: black14MediumTextStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account type',
                    style: grey12RegularTextStyle,
                  ),
                  height5Space,
                  Text(
                    '$accountType account',
                    style: black14MediumTextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Amount',
                    style: grey12RegularTextStyle,
                  ),
                  height5Space,
                  Text(
                    '\$$amount',
                    style: black14MediumTextStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date & Time',
                    style: grey12RegularTextStyle,
                  ),
                  height5Space,
                  Text(
                    dateAndTime,
                    style: black14MediumTextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: fixPadding - 5.0),
          decoration: BoxDecoration(
            color: (isPending) ? redColor : greenColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(fixPadding),
              bottomRight: Radius.circular(fixPadding),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (isPending) ? Icons.av_timer : Icons.check,
                size: 20.0,
                color: whiteColor,
              ),
              widthSpace,
              Text(
                (isPending) ? 'Pending' : 'Completed',
                style: white14MediumTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  newDepositButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: const NewDeposits(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0,
          vertical: fixPadding * 2.0,
        ),
        padding: const EdgeInsets.symmetric(vertical: fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: whiteColor,
              size: 20.0,
            ),
            widthSpace,
            Text(
              'New deposit',
              style: white16BoldTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
