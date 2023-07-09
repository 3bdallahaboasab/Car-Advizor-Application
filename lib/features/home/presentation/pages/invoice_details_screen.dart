import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Functions/navigation.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/home/presentation/pages/invoice_pdf_screen.dart';
import 'package:test/features/home/presentation/widgets/widget_info_details_invoice_page.dart';
import 'package:test/features/widget/widget_button.dart';
import 'package:test/features/widget/widget_cach_network_image.dart';
import 'package:test/layout_screen.dart';

class InvoiceDitalsScreen extends StatefulWidget {
  final String id;
  final bool? isSellCar;
  const InvoiceDitalsScreen(
      {super.key, required this.id, this.isSellCar = false});

  @override
  State<InvoiceDitalsScreen> createState() => _InvoiceDitalsScreenState();
}

class _InvoiceDitalsScreenState extends State<InvoiceDitalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  WidgetButton _buildBottomNavigationBar() {
    return WidgetButton(
      title: 'View invoice as PDF',
      radius: 0,
      onTap: () => Navigator.push(
          context,
          downToTop(const PDFScreen(
              pdfUrl:
                  'https://www.who.int/docs/default-source/coronaviruse/situation-reports/20200306-sitrep-46-covid-19.pdf'))),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize(context).width * 0.05,
          vertical: AppSize(context).height * 0.02),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Ref Number
          const WidgetInfoPage(
            title: 'Ref. number',
            subTitle: 'Tender 4',
          ),
          // * Customer Name
          const WidgetInfoPage(
            title: 'Customer name',
            subTitle: 'Test',
          ),
          // * Customer Phone
          const WidgetInfoPage(
            title: 'Customer phone',
            subTitle: '+962 780000000',
          ),
          // * Customer phone
          const WidgetInfoPage(
            title: 'Customer Email',
            subTitle: 'test@gmail.com',
          ),
          SizedBox(height: AppSize(context).height * 0.03),
          // * Items List
          Text(
            'Items List',
            style: TextStyle(
              fontSize: AppSize(context).mediumText3,
              color: AppColors.blackColor1,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: AppSize(context).height * 0.02),
          Card(
            elevation: 3,
            shadowColor: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: AppSize(context).height * 0.13,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Image
                  const Expanded(
                    flex: 3,
                    child: WidgetCachNetworkImage(
                      image:
                          'https://hips.hearstapps.com/hmg-prod/images/2023-jeep-compass-101-1669747450.jpg?crop=0.705xw:0.529xh;0.103xw,0.317xh&resize=1200:*',
                    ),
                  ),
                  SizedBox(width: AppSize(context).width * 0.03),
                  // * Name & Pice & Total
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Toyota Land Cruser Prodo 2020',
                          style: TextStyle(
                            fontSize: AppSize(context).smallText3,
                            color: AppColors.blackColor1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: AppSize(context).height * 0.01),
                        Text(
                          'Price 3,000.00 AED x 1',
                          style: TextStyle(
                            fontSize: AppSize(context).smallText4,
                            color: AppColors.greyColor3,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: AppSize(context).height * 0.02),
                        Text(
                          'Total 3,000.00 AED',
                          style: TextStyle(
                            fontSize: AppSize(context).smallText4,
                            color: AppColors.greyColor3,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppSize(context).height * 0.03),
          // * Subtotal
          SizedBox(
            width: AppSize(context).width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'SubTotal',
                  style: TextStyle(
                    fontSize: AppSize(context).mediumText4,
                    color: AppColors.blackColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '3,000.00 AED',
                  style: TextStyle(
                    fontSize: AppSize(context).mediumText3,
                    color: AppColors.greyColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'Invoices # ${widget.id}',
        style: TextStyle(
          fontSize: AppSize(context).mediumText3,
          color: AppColors.whiteColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (widget.isSellCar == false) {
                pop(context);
              } else {
                Navigator.pushAndRemoveUntil(
                    context,
                    downToTop(const LayoutScreen(
                      currentIndex: 0,
                    )),
                    (route) => false);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Close',
                style: TextStyle(
                  fontSize: AppSize(context).mediumText3,
                  color: AppColors.whiteColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert_outlined,
            color: AppColors.whiteColor1,
            size: 25,
          ),
          onPressed: () => showMore(),
        ),
      ],
    );
  }

  void showMore() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.only(bottom: 20),
            elevation: 0.0,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: AppSize(context).width * 0.9,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      // * Actions
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Actions',
                          style: TextStyle(
                            fontSize: AppSize(context).smallText3,
                            color: AppColors.greyColor3,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          pop(context);
                          Navigator.push(
                              context,
                              downToTop(const PDFScreen(
                                  pdfUrl:
                                      'https://www.who.int/docs/default-source/coronaviruse/situation-reports/20200306-sitrep-46-covid-19.pdf')));
                        },
                        highlightColor: AppColors.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_copy_outlined,
                              size: 20,
                              color: AppColors.blueColor,
                            ),
                            SizedBox(width: AppSize(context).width * 0.02),
                            Text(
                              'View invoice as PDF',
                              style: TextStyle(
                                fontSize: AppSize(context).smallText3,
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  onTap: () => pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: AppSize(context).smallText3,
                          color: AppColors.indigoColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}
