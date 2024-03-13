// ignore_for_file: library_private_types_in_public_api

import 'package:PocketChn/pages/screens.dart';
import 'package:fl_chart/fl_chart.dart';

class FlChart extends StatefulWidget {
  const FlChart({super.key});

  @override
  _FlChartState createState() => _FlChartState();
}

class _FlChartState extends State<FlChart> {
  final Color leftBarColor = Colors.blue;
  final Color rightBarColor = redColor;
  final double width = 6;

  List<BarChartGroupData>? rawBarGroups;
  List<BarChartGroupData>? showingBarGroups;

  int? touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 6, 1.5);
    final barGroup2 = makeGroupData(1, 10, 4);
    final barGroup3 = makeGroupData(2, 10, 5);
    final barGroup4 = makeGroupData(3, 7, 2);
    final barGroup5 = makeGroupData(4, 10, 6);
    final barGroup6 = makeGroupData(5, 5, 10);
    final barGroup7 = makeGroupData(6, 6, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 353.0,
      width: double.infinity,
      margin: const EdgeInsets.all(fixPadding * 2.0),
      padding: const EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fixPadding),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 2.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Income',
                    style: grey14MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    '\$3,000.00',
                    style: black16BoldTextStyle,
                  ),
                ],
              ),
              width20Space,
              width20Space,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Spend',
                    style: grey14MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    '\$1,424.67',
                    style: black16BoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          height20Space,
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: BarChart(
              BarChartData(
                maxY: 12.0,
                gridData: FlGridData(
                  show: false,
                ),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (a, b, c, d) => null,
                  ),
                  touchCallback: (FlTouchEvent event, response) {
                    if (response == null || response.spot == null) {
                      setState(() {
                        touchedGroupIndex = -1;
                        showingBarGroups = List.of(rawBarGroups!);
                      });
                      return;
                    }

                    showingBarGroups = List.of(rawBarGroups!);
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                  )),
                  topTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                  )),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.0,
                      // getTextStyles: (value) => grey14MediumTextStyle,
                      // margin: 15,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      // getTextStyles: (value) => grey14MediumTextStyle,
                      // margin: 25,
                      reservedSize: 40,
                      getTitlesWidget: (value, TitleMeta meta) {
                        String text;
                        if (value == 0) {
                          text = '50';
                        } else if (value == 5) {
                          text = '100';
                        } else if (value == 10) {
                          text = '150';
                        } else {
                          text = '';
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          // space: 25.0,
                          child: Text(text, style: grey14MediumTextStyle),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: showingBarGroups,
              ),
            ),
          ),
          height20Space,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 15.0,
                width: 15.0,
                color: Colors.blue,
              ),
              widthSpace,
              const Text(
                'Income',
                style: black16MediumTextStyle,
              ),
              widthSpace,
              Container(
                height: 15.0,
                width: 15.0,
                color: redColor,
              ),
              widthSpace,
              const Text(
                'Spend',
                style: black16MediumTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: rightBarColor,
          width: width,
        ),
      ],
    );
  }
}
