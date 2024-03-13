// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';

class WithAccountNumber extends StatefulWidget {
  const WithAccountNumber({super.key});

  @override
  _WithAccountNumberState createState() => _WithAccountNumberState();
}

class _WithAccountNumberState extends State<WithAccountNumber> {
  final List<String> _bankList = [
    'Select bank',
    'AXIS BANK',
    'CITI BANK',
    'FEDERAL BANK LTD.',
    'HDFC BANK LTD',
    'KOTAK MAHINDRA BANK',
    'OTHER BANKS',
  ];
  final List<String> _accountTypeList = [
    'Select account type',
    'Savings',
    'Current',
    'Overdraft',
    'Cash Credit',
    'Loan',
    'NRE',
  ];
  var defaultAccountType = 'Saving';
  var defaultAccountNumber = '032523651475';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 1.0,
        title: const Text(
          'One Time Trasfer',
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
          aboutTransfer(),
          bankDetails(),
          accountDetails(),
          transferDetails(),
          countinueButton(),
        ],
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

  bankDetails() {
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
            'Bank Details',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          selectBankDropDown(),
          heightSpace,
          height5Space,
          ifscTextField(),
          heightSpace,
        ],
      ),
    );
  }

  selectBankDropDown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor),
        ),
        hintText: 'Select bank',
        hintStyle: black14MediumTextStyle,
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: blackColor,
        size: 20.0,
      ),
      items: _bankList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: black14MediumTextStyle,
          ),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  ifscTextField() {
    return const TextField(
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Enter IFSC',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }

  accountDetails() {
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
            'Account Details',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          accountNumberTextField(),
          heightSpace,
          height5Space,
          confirmAccountNumberTextField(),
          heightSpace,
          height5Space,
          selectAccountTypeDropDown(),
          heightSpace,
          height5Space,
          beneficiaryNameTextField(),
          heightSpace,
        ],
      ),
    );
  }

  beneficiaryNameTextField() {
    return const TextField(
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Enter beneficiary name',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }

  selectAccountTypeDropDown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor, width: 1.0),
        ),
        hintText: 'Select account type',
        hintStyle: black14MediumTextStyle,
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: blackColor,
        size: 20.0,
      ),
      items: _accountTypeList.map(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: black14MediumTextStyle,
            ),
          );
        },
      ).toList(),
      onChanged: (_) {},
    );
  }

  confirmAccountNumberTextField() {
    return const TextField(
      cursorColor: primaryColor,
      keyboardType: TextInputType.number,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Confirm account number',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }

  accountNumberTextField() {
    return const TextField(
      keyboardType: TextInputType.number,
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Enter account number',
        hintStyle: grey14MediumTextStyle,
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
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.0,
        ),
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
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.0,
        ),
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

  countinueButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.topToBottom,
          child: const OneTimeTransferSuccessfull(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(fixPadding * 2.0),
        padding: const EdgeInsets.symmetric(vertical: fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(fixPadding),
        ),
        child: const Text(
          'Countinue',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
