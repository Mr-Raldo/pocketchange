// ignore_for_file: library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';
import 'package:PocketChn/widget/column_builder.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  double? height;
  double limit = 5888.0;
  final transactionsList = [
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'City people\'s hospital',
      'amount': '558.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'Apple Electronics co. LTD',
      'amount': '669.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'Google Play',
      'amount': '59.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'Croma Digital',
      'amount': '1254.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'Google Ads',
      'amount': '1689.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'Apple Hospital',
      'amount': '5972.00',
    },
  ];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: const Text(
          'Cards',
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
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              fixPadding * 2.0,
              fixPadding * 2.0,
              0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Card',
                  style: black16BoldTextStyle,
                ),
                heightSpace,
                height5Space,
                card(),
                height20Space,
                setLimitAndLocakCard(),
                height20Space,
                const Text(
                  'Transactions',
                  style: black16BoldTextStyle,
                ),
                transactions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  transactions() {
    return ColumnBuilder(
      itemCount: transactionsList.length,
      itemBuilder: (context, index) {
        final transaction = transactionsList[index];
        return Padding(
          padding: EdgeInsets.only(
            top: (index == 0) ? fixPadding : fixPadding * 2.0,
            bottom:
                (index == transactionsList.length - 1) ? fixPadding * 2.0 : 0.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.20),
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor),
                    ),
                    child: Icon(
                      (transaction['iscredit'] == true)
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color: primaryColor,
                    ),
                  ),
                  widthSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${transaction['type']}',
                        style: black16MediumTextStyle,
                      ),
                      height5Space,
                      Text(
                        '${transaction['owner']}',
                        style: grey14MediumTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'USD',
                    style: black14MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    (transaction['iscredit'] == true)
                        ? '+${transaction['amount']}'
                        : '-${transaction['amount']}',
                    style: black16BoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  setLimitAndLocakCard() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => setLimit(),
            child: setLimitOrLockCard(
              icon: Icons.attach_money,
              text: 'Set limit',
            ),
          ),
        ),
        widthSpace,
        Expanded(
          child: InkWell(
            child: setLimitOrLockCard(
              icon: Icons.lock,
              text: 'Lock card',
            ),
          ),
        ),
      ],
    );
  }

  setLimit() {
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(fixPadding * 2.0),
                        child: Text(
                          'Monthly spending limit',
                          style: black16BoldTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${limit.toInt()}',
                                  style: black18BoldTextStyle,
                                ),
                                width5Space,
                                Container(
                                  width: 1.0,
                                  height: 12.0,
                                  color: greyColor,
                                ),
                              ],
                            ),
                            const Text(
                              'USD',
                              style: black14MediumTextStyle,
                            ),
                          ],
                        ),
                      ),
                      heightSpace,
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 2.0),
                        color: greyColor,
                        height: 1.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding - 2.0,
                          vertical: fixPadding - 5.0,
                        ),
                        child: SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: primaryColor,
                            inactiveTrackColor: greyColor,
                            trackHeight: 3.0,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6.0),
                            thumbColor: primaryColor,
                            trackShape: const RectangularSliderTrackShape(),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 15.0),
                            overlayColor: primaryColor.withOpacity(0.2),
                          ),
                          child: Slider(
                            value: limit,
                            onChanged: (newRating) {
                              setState(() {
                                limit = newRating;
                              });
                            },
                            min: 0,
                            max: 100000,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 2.0,
                          vertical: fixPadding,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'This month limit',
                              style: black14MediumTextStyle,
                            ),
                            Text(
                              'USD \$${limit.toInt()}',
                              style: black14MediumTextStyle,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: const EdgeInsets.all(fixPadding * 2.0),
                          padding:
                              const EdgeInsets.symmetric(vertical: fixPadding),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            'Confirm',
                            style: white16BoldTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  setLimitOrLockCard({icon, text}) {
    return Container(
      padding: const EdgeInsets.only(
        top: fixPadding * 2.0,
        bottom: fixPadding * 2.0,
        left: fixPadding * 2.0,
      ),
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
      child: Row(
        children: [
          Icon(
            icon,
            size: 24.0,
            color: blackColor,
          ),
          widthSpace,
          Text(
            text,
            style: black16MediumTextStyle,
          ),
        ],
      ),
    );
  }

  card() {
    return Container(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(fixPadding - 5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/visa.png',
              width: 64.0,
            ),
          ),
          height20Space,
          heightSpace,
          height5Space,
          const Text(
            '6290 8821 7695 7551',
            style: white16MediumTextStyle,
          ),
          height20Space,
          heightSpace,
          height5Space,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card holder',
                    style: white12MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    'Ellison Perry',
                    style: white14MediumTextStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry date',
                    style: white12MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    '12 / 2023',
                    style: white14MediumTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
