import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/utils/color_utils.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:color_palette_generator/color_palette_generator.dart';

class _LineChart extends StatelessWidget {
  final int type;

  const _LineChart(this.type);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData2,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData(),
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
              case 5:
                return '6m';
            }
            return '';
          },
        ),
      );

  List<LineChartBarData> lineBarsData() {
    var basicPalette = ColorPalette.from(['#f87a33','#cc0031','#04a330']) ;
    var colorGenerator = ColorGeneratorFromBasicPalette(basicPalette) ;
    var expandedPalette = colorGenerator.generatePaletteAsString(3) ;
    expandedPalette = expandedPalette.map((e) => e.replaceAll('#', '')).toList();
    List<LineChartBarData> lineChartBarDataList = [
      lineChartBarData(
        [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
        expandedPalette[0]
      ),
      lineChartBarData(
        [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
        expandedPalette[1]
      ),
      lineChartBarData(
        [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
        expandedPalette[2]
      ),
    ];
    return lineChartBarDataList;
  }

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        getTextStyles: (context, value) => TextStyle(
          color: isDark(context) ? GlobalTheme.kAccentColor : GlobalTheme.kPrimaryColor,
          fontSize: 10,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        rotateAngle: -90,
        getTextStyles: (context, value) => TextStyle(
          color: isDark(context) ? GlobalTheme.kAccentColor : GlobalTheme.kPrimaryColor,
          fontSize: 10,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return 'Jan';
            case 2:
              return 'Feb';
            case 3:
              return 'Mar';
            case 4:
              return 'Apr';
            case 5:
              return 'May';
            case 6:
              return 'Jun';
            case 7:
              return 'Jul';
            case 8:
              return 'Aug';
            case 9:
              return 'Sep';
            case 10:
              return 'Oct';
            case 11:
              return 'Nov';
            case 12:
              return 'Dec';
          }
          return '';
        },
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: GlobalTheme.kOrangeColor, width: 2),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData lineChartBarData(List<FlSpot>? spots, String color) {
    if (type == 0)
      return lineChartBarDataNodes(spots, color);
    else if (type == 1)
      return lineChartBarDataShadow(spots, color);
    else 
      return lineChartBarDataPath(spots, color);
  }
  LineChartBarData lineChartBarDataNodes(List<FlSpot>? spots, String color) => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        colors: [ColorUtils(color).toColor(), ColorUtils(color).lighten()],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: spots,
      );

  LineChartBarData lineChartBarDataShadow(List<FlSpot>? spots, String color) => LineChartBarData(
        isCurved: true,
        colors: [ColorUtils(color).toColor(), ColorUtils(color).lighten()],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            ColorUtils(color).toColor().withOpacity(.2),
          ],
        ),
        spots: spots,
      );

  LineChartBarData lineChartBarDataPath(List<FlSpot>? spots, String color) => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        colors: [ColorUtils(color).toColor(), ColorUtils(color).lighten()],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: spots,
      );
}

class LineChartWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartWidgetState();
}

class LineChartWidgetState extends State<LineChartWidget> {
  late bool isShowingMainData;
  late int _type;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    _type = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        (_type == 2) ? _type = 0 : _type++;
                      }),
                      child: Icon(
                        Icons.refresh_rounded,
                        color: GlobalTheme.kOrangeColor,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 0.0),
                  child: _LineChart(_type),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}