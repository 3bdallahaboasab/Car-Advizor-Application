import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test/Business/dashboard/dashboard_apis.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Icon/app_icons.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Data/model/dashboard_model.dart';
import 'package:test/Presentation/Home/Screens/invoices_screen.dart';
import 'package:test/Presentation/menu/Screens/my_store_screen.dart';
import 'package:test/Presentation/Components/widget_cach_network_image.dart';
import 'package:test/Presentation/Components/widget_custom_rich_text.dart';
import 'package:test/Presentation/Home/Components/chart_semple_data.dart';
import 'package:test/Presentation/Home/Components/widget_box_progress.dart';
import 'package:test/Presentation/Home/Components/widget_home_subcard.dart';
import 'package:test/Presentation/Home/Components/widget_home_card.dart';
import 'package:test/Presentation/myCars/Screens/my_cars_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? loading;
  TooltipBehavior? _tooltipBehavior;
  DashboardModel? dashboardModel;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    getDashboardData();
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
    AppLocalizations lang = AppLocalizations.of(context)!;
    return RefreshIndicator(
      onRefresh: () async {
        await getDashboardData();
      },
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
                    title: lang.revenue,
                    desc:
                        '${NumberFormat('#,##0.00', 'en_US').format(double.tryParse('${dashboardModel?.carRevenue ?? 0.0}') ?? 0.0)} ${dashboardModel?.currency}',
                    value: 00.33,
                    colorProgress: AppColors.orangeColor,
                    backGroundProgress: AppColors.orangeColorLight,
                  ),
                  WidgetBoxProgress(
                    title: lang.value,
                    desc:
                        '${NumberFormat('#,##0.00', 'en_US').format(double.tryParse('${dashboardModel?.carValue ?? 0.0}') ?? 0.0)} ${dashboardModel?.currency}',
                    value: 99.67,
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
                  title: lang.ownedCars,
                  colorFirstIcon: AppColors.orangeColorLight,
                  firstIcon: AppIcons.orangeCar,
                  counts: dashboardModel?.activeCars.toString() ?? '0',
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
                  title: lang.soldCars,
                  colorFirstIcon: AppColors.greenColorLight,
                  firstIcon: AppIcons.greenDollar,
                  counts: dashboardModel?.carsSold.toString() ?? '0',
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
                        lang.expenses,
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
                          '${NumberFormat('#,##0.00', 'en_US').format(double.tryParse('${dashboardModel?.expense ?? 0.0}') ?? 0.0)} ${dashboardModel?.currency}',
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
                  title: lang.invoice,
                  colorFirstIcon: AppColors.redColorLight,
                  firstIcon: Icon(
                    Icons.description,
                    color: AppColors.redColor,
                    size: 20,
                  ),
                  counts: dashboardModel?.totalInvoice.toString() ?? '0',
                  sacundIcon: AppIcons.lineRrd,
                  isSacundCard: true,
                  onTap: () => Navigator.push(
                      context, rightToLeft(const InvoicesScreen())),
                ),
                SizedBox(width: AppSize(context).width * 0.03),
                WidgetHomeSubCard(
                  title: lang.innouncement,
                  colorFirstIcon: AppColors.indigoColorLight,
                  firstIcon: Icon(
                    Icons.description,
                    color: AppColors.indigoColor,
                    size: 20,
                  ),
                  counts: dashboardModel?.announcement.toString() ?? '0',
                  sacundIcon: AppIcons.lineIndigo,
                ),
              ],
            ),
            SizedBox(height: AppSize(context).height * 0.01),
            // * Total Reviews And Views
            Row(
              children: [
                WidgetHomeSubCard(
                  title: lang.totalReviews,
                  colorFirstIcon: AppColors.yellowColorLight,
                  firstIcon: Icon(
                    Icons.star,
                    color: AppColors.yellowColor,
                    size: 20,
                  ),
                  counts: dashboardModel?.reviews.toString() ?? '0',
                  sacundIcon: AppIcons.lineYellow,
                ),
                SizedBox(width: AppSize(context).width * 0.03),
                WidgetHomeSubCard(
                  title: lang.totalViews,
                  colorFirstIcon: AppColors.blueColorLight,
                  firstIcon: Icon(
                    Icons.visibility,
                    color: AppColors.blueColor,
                    size: 20,
                  ),
                  counts: dashboardModel?.views.toString() ?? '0',
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
                      lang.weeklyRevenue,
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
    AppLocalizations lang = AppLocalizations.of(context)!;

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
          CustomRichText(
            text1: '${lang.hello} ',
            text2: 'Basel Alsous',
          ),
          const SizedBox(height: 5),
          Text(
            lang.welcomeToAutoParts,
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
    AppLocalizations lang = AppLocalizations.of(context)!;

    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(
              day: lang.tuesday,
              value: double.tryParse(
                  '${dashboardModel?.totalRevenueList?[5] ?? 0.0}')),
          ChartSampleData(
              day: lang.monday,
              value: double.tryParse(
                  '${dashboardModel?.totalRevenueList?[6] ?? 0.0}')),
          ChartSampleData(
              day: lang.sunday,
              value: double.tryParse(
                  '${dashboardModel?.totalRevenueList?[0] ?? 0.0}')),
          ChartSampleData(
              day: lang.saturday,
              value: double.tryParse(
                  '${dashboardModel?.totalRevenueList?[1] ?? 0.0}')),
          ChartSampleData(
              day: lang.friday,
              value: double.tryParse(
                  '${dashboardModel?.totalRevenueList?[2] ?? 0.0}')),
          ChartSampleData(
              day: lang.thursday,
              value: double.tryParse(
                  '${dashboardModel?.totalRevenueList?[3] ?? 0.0}')),
          ChartSampleData(
              day: lang.wednesday,
              value: double.tryParse(
                  '${dashboardModel?.totalRevenueList?[4] ?? 0.0}')),
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

  Future getDashboardData() async {
    try {
      await DashboardApis.getAllDataForDashboard().then((value) {
        if (value != null) {
          if (mounted) {
            setState(() {
              dashboardModel = value;
            });
          }
        } else {
          log('Error in Home Managements getDashboardData()');
        }
      });
    } catch (e) {
      log('Error in Home Managements getDashboardData()');
    }
  }
}
