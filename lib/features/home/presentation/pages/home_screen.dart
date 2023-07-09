import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Functions/navigation.dart';
import 'package:test/core/Icon/app_icons.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/home/presentation/pages/invoices_screen.dart';
import 'package:test/features/menu/presentation/pages/my_store_screen.dart';
import 'package:test/features/widget/widget_cach_network_image.dart';
import 'package:test/features/widget/widget_custom_rich_text.dart';
import 'package:test/features/home/presentation/widgets/chart_semple_data.dart';
import 'package:test/features/home/presentation/widgets/widget_box_progress.dart';
import 'package:test/features/home/presentation/widgets/widget_home_subcard.dart';
import 'package:test/features/home/presentation/widgets/widget_home_card.dart';
import 'package:test/features/myCars/presentation/pages/my_cars_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? loading;

  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  RefreshIndicator _buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        padding: AppSize(context).appPadding,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Box Progress
            WidgetHomeCard(
              isFirstCard: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetBoxProgress(
                    title: 'Recenue',
                    desc: '140.500.00 AED',
                    value: 00.06,
                    colorProgress: AppColors.orangeColor,
                    backGroundProgress: AppColors.orangeColorLight,
                  ),
                  WidgetBoxProgress(
                    title: 'Value',
                    desc: '225.548.745.00 AED',
                    value: 99.94,
                    colorProgress: AppColors.indigoColor,
                    backGroundProgress: AppColors.indigoColorLight,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize(context).height * 0.01),
            // * Owned And Solid Car
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHomeSubCard(
                  title: 'Owned Cars',
                  colorFirstIcon: AppColors.orangeColorLight,
                  firstIcon: AppIcons.orangeCar,
                  counts: '61',
                  sacundIcon: AppIcons.lineOrange,
                  isSacundCard: true,
                  onTap: () => Navigator.push(
                      context,
                      rightToLeft(const MyCarsScreen(
                        isSectionHome: true,
                        isSolidCar: false,
                      ))),
                ),
                SizedBox(width: AppSize(context).width * 0.03),
                WidgetHomeSubCard(
                  title: 'Sold Cars',
                  colorFirstIcon: AppColors.greenColorLight,
                  firstIcon: AppIcons.greenDollar,
                  counts: '17',
                  sacundIcon: AppIcons.lineGreen,
                  isSacundCard: true,
                  onTap: () => Navigator.push(
                      context,
                      rightToLeft(const MyCarsScreen(
                        isSectionHome: true,
                        isSolidCar: true,
                      ))),
                ),
              ],
            ),
            SizedBox(height: AppSize(context).height * 0.01),
            // * Expenses
            WidgetHomeCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.parpolColorLight,
                            borderRadius: BorderRadius.circular(100000),
                          ),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: AppIcons.parpolDollar,
                          )),
                      const SizedBox(width: 8),
                      Text(
                        'Expenses',
                        style: TextStyle(
                          fontSize: AppSize(context).smallText3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 11),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '710.00 AED',
                          style: TextStyle(
                            fontSize: AppSize(context).smallText1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                        SizedBox(
                          width: AppSize(context).width * 0.15,
                          height: AppSize(context).height * 0.02,
                          child: AppIcons.lineParpol,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize(context).height * 0.01),
            // * Invoice And Innouncement
            Row(
              children: [
                WidgetHomeSubCard(
                  title: 'Invoice',
                  colorFirstIcon: AppColors.redColorLight,
                  firstIcon: Icon(
                    Icons.description,
                    color: AppColors.redColor,
                    size: 20,
                  ),
                  counts: '4',
                  sacundIcon: AppIcons.lineRrd,
                  isSacundCard: true,
                  onTap: () => Navigator.push(
                      context, rightToLeft(const InvoicesScreen())),
                ),
                SizedBox(width: AppSize(context).width * 0.03),
                WidgetHomeSubCard(
                  title: 'Innouncement',
                  colorFirstIcon: AppColors.indigoColorLight,
                  firstIcon: Icon(
                    Icons.description,
                    color: AppColors.indigoColor,
                    size: 20,
                  ),
                  counts: '0',
                  sacundIcon: AppIcons.lineIndigo,
                ),
              ],
            ),
            SizedBox(height: AppSize(context).height * 0.01),
            // * Total Reviews And Views
            Row(
              children: [
                WidgetHomeSubCard(
                  title: 'Total Reviews',
                  colorFirstIcon: AppColors.yellowColorLight,
                  firstIcon: Icon(
                    Icons.star,
                    color: AppColors.yellowColor,
                    size: 20,
                  ),
                  counts: '0',
                  sacundIcon: AppIcons.lineYellow,
                ),
                SizedBox(width: AppSize(context).width * 0.03),
                WidgetHomeSubCard(
                  title: 'Total Views',
                  colorFirstIcon: AppColors.blueColorLight,
                  firstIcon: Icon(
                    Icons.visibility,
                    color: AppColors.blueColor,
                    size: 20,
                  ),
                  counts: '7',
                  sacundIcon: AppIcons.lineBlue,
                ),
              ],
            ),
            SizedBox(height: AppSize(context).height * 0.02),
            // * Chart
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.grey.shade100,
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Title
                    Text(
                      'Weekly revenue',
                      style: TextStyle(
                        fontSize: AppSize(context).smallText1,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: AppSize(context).height * 0.06),
                    // * Chart
                    SfCartesianChart(
                      palette: [AppColors.orangeColor.withOpacity(0.8)],
                      plotAreaBorderWidth: 0,
                      primaryXAxis: CategoryAxis(
                          majorGridLines: const MajorGridLines(width: 0),
                          labelRotation: -30,
                          labelAlignment: LabelAlignment.start,
                          labelStyle: TextStyle(
                            fontSize: AppSize(context).smallText4,
                          )),
                      primaryYAxis: NumericAxis(
                          axisLine: const AxisLine(width: 0),
                          labelStyle: TextStyle(
                              fontSize: AppSize(context).smallText4,
                              color: AppColors.darkGreyColor,
                              letterSpacing: 0.5),
                          labelFormat: 'AED {value}',
                          majorTickLines: const MajorTickLines(size: 0)),
                      series: _getDefaultColumnSeries(),
                      tooltipBehavior: _tooltipBehavior,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: AppSize(context).height * 0.1,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomRichText(
            text1: 'Hello ',
            text2: 'Basel Alsous',
          ),
          const SizedBox(height: 5),
          Text(
            'Welcome To Auto Parts',
            style: TextStyle(
              fontSize: AppSize(context).smallText2,
              color: AppColors.whiteColor1,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () =>
                  Navigator.push(context, rightToLeft(const MyStoreScreen())),
              borderRadius: BorderRadius.circular(100000),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 32,
                  height: 32,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100000),
                  ),
                  child: const WidgetCachNetworkImage(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzpAIprXCYrYC9zsTc6oJJdUPZXUrKCWgJ7g&usqp=CAU'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(day: 'Tuesday', value: 0.0),
          ChartSampleData(day: 'Monday', value: 0.0),
          ChartSampleData(day: 'Sunday', value: 0.0),
          ChartSampleData(day: 'Saturday', value: 0.0),
          ChartSampleData(day: 'Friday', value: 0.0),
          ChartSampleData(day: 'Thursday', value: 0.0),
          ChartSampleData(day: 'Wednesday', value: 90000.00),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.day,
        yValueMapper: (ChartSampleData sales, _) => sales.value,
        dataLabelSettings: const DataLabelSettings(
          isVisible: false,
          textStyle: TextStyle(fontSize: 10),
        ),
      )
    ];
  }
}
