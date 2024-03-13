// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';

class NewDeposits extends StatefulWidget {
  const NewDeposits({super.key});

  @override
  _NewDepositsState createState() => _NewDepositsState();
}

class _NewDepositsState extends State<NewDeposits> {
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
          'New Deposit',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upload cheque images',
                  style: black14MediumTextStyle,
                ),
                heightSpace,
                frontAndBackSideCheck(side: 'Front side'),
                height20Space,
                frontAndBackSideCheck(side: 'Back side'),
                height20Space,
                aboutTransfer(),
                height20Space,
                transferDetails(),
                height20Space,
                depositNowButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bottomSheet() {
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

  depositNowButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Deposit now',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  aboutTransfer() {
    return Stack(
      children: [
        Container(
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
          right: 10.0,
          top: 10.0,
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

  transferDetails() {
    return Container(
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

  frontAndBackSideCheck({side}) {
    return Stack(
      children: [
        InkWell(
          onTap: () => bottomSheet(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: fixPadding + 16.0,
              bottom: fixPadding + 16.0,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(fixPadding),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add_a_photo,
                      color: blackColor,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: InkWell(
            onTap: () => bottomSheet(),
            child: Text(
              side,
              style: white12MediumTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
