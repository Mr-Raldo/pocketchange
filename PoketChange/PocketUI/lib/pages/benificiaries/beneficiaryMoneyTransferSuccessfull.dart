// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';

class BeneficiaryTransferSuccessfull extends StatefulWidget {
  const BeneficiaryTransferSuccessfull({super.key});

  @override
  _BeneficiaryTransferSuccessfullState createState() =>
      _BeneficiaryTransferSuccessfullState();
}

class _BeneficiaryTransferSuccessfullState
    extends State<BeneficiaryTransferSuccessfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool key) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomBar(),
            ),
          );
        },
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 50.0,
                padding: const EdgeInsets.only(
                  left: fixPadding * 2.0,
                  right: fixPadding * 2.0,
                  bottom: fixPadding * 2.0,
                  top: fixPadding * 5.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        doneSign(),
                        heightSpace,
                        const Center(
                          child: Text(
                            'Transfer successfully..!',
                            style: black16MediumTextStyle,
                          ),
                        ),
                        height20Space,
                        transferDetails(
                          title: 'Transfer to',
                          value: 'Amara Smith',
                        ),
                        height20Space,
                        transferDetails(
                          title: 'From',
                          value: 'Saving | 0325 2365 1475',
                        ),
                        height20Space,
                        transferDetails(
                          title: 'Date & Time',
                          value: '18 April, 2021 | 11:45 AM',
                        ),
                        height20Space,
                        transferDetails(
                          title: 'Amount',
                          value: '\$1045.00 USD',
                        ),
                        height20Space,
                        transferDetails(
                          title: 'Payment mode',
                          value: 'Beneficiary money transfer',
                        ),
                        height20Space,
                        transferDetails(
                          title: 'Remark',
                          value: 'Hospital Bill.',
                        ),
                      ],
                    ),
                    backToHomeButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  doneSign() {
    return Center(
      child: Container(
        width: 75.0,
        height: 75.0,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check,
          color: whiteColor,
          size: 40.0,
        ),
      ),
    );
  }

  backToHomeButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Back to Home',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  transferDetails({title, value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: grey14RegularTextStyle,
        ),
        Text(
          value,
          style: black16MediumTextStyle,
        ),
      ],
    );
  }
}
