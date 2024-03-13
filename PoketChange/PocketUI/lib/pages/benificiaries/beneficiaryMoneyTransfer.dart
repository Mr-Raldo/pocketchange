// ignore_for_file: file_names, prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';

class BeneficiaryMoneyTransfer extends StatefulWidget {
  final userPhoto;
  final name;
  const BeneficiaryMoneyTransfer({super.key, this.userPhoto, this.name});
  @override
  _BeneficiaryMoneyTransferState createState() =>
      _BeneficiaryMoneyTransferState();
}

class _BeneficiaryMoneyTransferState extends State<BeneficiaryMoneyTransfer> {
  var defaultAccountType = 'Saving';
  var defaultAccountNumber = '032523651475';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: const Text(
          'Beneficiary Money Transfer',
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
          userPhoto(),
          heightSpace,
          Center(
            child: Text(
              widget.name,
              style: black16MediumTextStyle,
            ),
          ),
          aboutTransfer(),
          transferDetails(),
          height5Space,
          countinueButton(),
        ],
      ),
    );
  }

  countinueButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.topToBottom,
          child: const BeneficiaryTransferSuccessfull(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(fixPadding * 2.0),
        padding: const EdgeInsets.symmetric(vertical: fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Countinue',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  aboutTransfer() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: fixPadding * 2.0,
            right: fixPadding * 2.0,
            top: fixPadding * 2.0,
          ),
          padding: const EdgeInsets.all(fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1.0,
                blurRadius: 4.0,
                color: greyColor.withOpacity(0.5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: whiteColor,
                      size: 30.0,
                    ),
                  ),
                  widthSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'From',
                        style: grey12RegularTextStyle,
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        defaultAccountNumber,
                        style: black16MediumTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              heightSpace,
              Text(
                '$defaultAccountType | Ellison Perry',
                style: black16MediumTextStyle,
              ),
              height5Space,
              const Text(
                'Balance: \$1,899',
                style: black16MediumTextStyle,
              ),
            ],
          ),
        ),
        Positioned(
          right: 30.0,
          top: 30.0,
          child: InkWell(
            onTap: () => changeInfo(),
            child: Row(
              children: [
                const Text(
                  'Change',
                  style: primaryColor12MediumTextStyle,
                ),
                width5Space,
                Container(
                  width: 16.0,
                  height: 16.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 14.0,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  changeInfo() {
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: fixPadding + 10.0,
                  right: fixPadding + 10.0,
                  top: fixPadding + 10.0,
                  bottom: fixPadding - 3.0,
                ),
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select account to transfer from',
                          style: primaryColor14MediumTextStyle,
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const CircleAvatar(
                            radius: 11.0,
                            backgroundColor: redColor,
                            child: Icon(
                              Icons.close,
                              color: whiteColor,
                              size: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    divider(),
                    selectAccount(type: 'Saving', number: '032523651475'),
                    divider(),
                    selectAccount(type: 'Current', number: '598745623258'),
                    divider(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  selectAccount({type, number}) {
    return InkWell(
      onTap: () {
        setState(() {
          defaultAccountType = type;
          defaultAccountNumber = number;
        });
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  color: whiteColor,
                  size: 30.0,
                ),
              ),
              width20Space,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ellison Perry',
                    style: black14BoldTextStyle,
                  ),
                  heightSpace,
                  Text(
                    'BankX | $type',
                    style: grey12RegularTextStyle,
                  ),
                ],
              ),
            ],
          ),
          Text(
            number,
            style: primaryColor14MediumTextStyle,
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      height: 1.0,
      color: greyColor,
    );
  }

  userPhoto() {
    return Container(
      margin: const EdgeInsets.only(top: fixPadding * 2.0),
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(widget.userPhoto),
        ),
      ),
    );
  }

  transferDetails() {
    return Container(
      margin: const EdgeInsets.only(
        left: fixPadding * 2.0,
        right: fixPadding * 2.0,
        top: fixPadding * 2.0,
      ),
      padding: const EdgeInsets.all(fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transfer Details',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          amountTextField(),
          heightSpace,
          height5Space,
          remarkTextField(),
          heightSpace,
        ],
      ),
    );
  }

  remarkTextField() {
    return const TextField(
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Remark (optional)',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }

  amountTextField() {
    return const TextField(
      keyboardType: TextInputType.number,
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Amount',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }
}
