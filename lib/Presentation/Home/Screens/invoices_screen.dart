import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/Home/Screens/invoice_details_screen.dart';
import 'package:test/Presentation/Home/Components/widget_invoice_card.dart';
import 'package:test/Presentation/sellCar/Screens/sell_car_screen.dart';
import 'package:test/Presentation/Components/widget_text_from_filds.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
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
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize(context).width * 0.05,
            vertical: AppSize(context).height * 0.02),
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize(context).width * 0.05,
              vertical: AppSize(context).height * 0.01),
          child: const Divider(
            thickness: 0.5,
          ),
        ),
        itemBuilder: (context, index) {
          return WidgetInvoiceCard(
            id: '1237',
            date: '2023-06-27',
            name: 'test',
            price: '100000 AED',
            ref: 'Tender 4',
            onTap: () => Navigator.push(
                context, downToTop(const InvoiceDitalsScreen(id: '1237'))),
          );
        },
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, AppSize(context).height * 0.15),
      child: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Invoices',
          style: TextStyle(
            fontSize: AppSize(context).mediumText3,
            color: AppColors.whiteColor1,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: AppColors.whiteColor1,
              size: 25,
            ),
            onPressed: () =>
                Navigator.push(context, downToTop(const SellCarScreen())),
          ),
        ],
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: AppSize(context).height * 0.08,
                right: AppSize(context).width * 0.05,
                left: AppSize(context).width * 0.05),
            child: WidgetTextField(
              'Search',
              radius: 10,
              fillColor: AppColors.greyColor1.withOpacity(0.2),
              haveBorder: false,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.greyColor3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
