import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/AddCar/Components/widget_part_card.dart';
import 'package:test/Presentation/AddCar/Screens/add_manual_screen.dart';
import 'package:test/Presentation/menu/Screens/my_store_screen.dart';
import 'package:test/Presentation/MyCars/Screens/add_expense_screen.dart';
import 'package:test/Presentation/MyCars/Components/widget_car_images.dart';
import 'package:test/Presentation/Components/widget_button.dart';
import 'package:test/Presentation/Components/widget_cach_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarDetailsScreen extends StatefulWidget {
  final Map carDetails;
  const CarDetailsScreen({super.key, required this.carDetails});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  TextEditingController vin = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController fuel = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController genration = TextEditingController();
  TextEditingController transmission = TextEditingController();
  TextEditingController mileage = TextEditingController();
  TextEditingController eingine = TextEditingController();
  TextEditingController cylinders = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController vehicle = TextEditingController();
  TextEditingController carPaint = TextEditingController();
  TextEditingController bodyCondition = TextEditingController();
  TextEditingController regional = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController sell = TextEditingController();
  TextEditingController payment = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController show = TextEditingController();
  TextEditingController active = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController additional = TextEditingController();

  @override
  void initState() {
    handelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  SingleChildScrollView _buildBody() {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Images
          WidgetCarImages(allImage: widget.carDetails['images']),
          // * Details
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize(context).width * 0.05),
            child: Column(
              children: [
                // * Vin number & Created date
                WidgetRowData(
                  title1: lang.vinNumber,
                  title2: lang.createdDate,
                  controller1: vin,
                  controller2: vin,
                ),
                // * Title
                CustomInputTextForm(
                  title: lang.title,
                  controller: title,
                  readOnly: true,
                ),
                // * Brand & Model
                WidgetRowData(
                  title1: lang.brands,
                  title2: lang.model,
                  controller1: brand,
                  controller2: model,
                ),
                // * Year & Fuel type
                WidgetRowData(
                  title1: lang.year,
                  title2: lang.fuelType,
                  controller1: year,
                  controller2: fuel,
                ),
                // * Body & Generation
                WidgetRowData(
                  title1: lang.body,
                  title2: lang.generation,
                  controller1: body,
                  controller2: genration,
                ),
                // * Transmission type & Mileage
                WidgetRowData(
                    title1: lang.transmissionType,
                    title2: lang.mileage,
                    controller1: transmission,
                    controller2: mileage),
                // * Engine size & Cylinders
                WidgetRowData(
                  title1: lang.engineSize,
                  title2: lang.clinders,
                  controller1: eingine,
                  controller2: cylinders,
                ),
                // * Color & Vehicle status
                WidgetRowData(
                  title1: lang.color,
                  title2: lang.vehicleStatus,
                  controller1: color,
                  controller2: vehicle,
                ),
                // * Car paint condition & Body condition
                WidgetRowData(
                  title1: lang.carPaintConditin,
                  title2: lang.bodyCondition,
                  controller1: carPaint,
                  controller2: bodyCondition,
                ),
                // * Regional specification
                CustomInputTextForm(
                  title: lang.regionalSpecification,
                  controller: regional,
                  readOnly: true,
                ),
                // * Cost price & Sell price
                WidgetRowData(
                  title1: lang.costPrice,
                  title2: lang.sellCar,
                  controller1: cost,
                  controller2: sell,
                ),
                // * Payment method & Number of months
                WidgetRowData(
                  title1: lang.paymentMethods,
                  title2: 'Number of months',
                  controller1: payment,
                  controller2: number,
                ),
                // * Show price
                WidgetRowData(
                  title1: lang.showPrice,
                  title2: lang.active,
                  controller1: show,
                  controller2: active,
                ),
                // * Details
                CustomInputTextForm(
                  title: 'Details',
                  controller: details,
                  readOnly: true,
                  maxLine: 3,
                ),
                // * Additional Presentation
                CustomInputTextForm(
                  title: lang.addtionalPresentation,
                  controller: additional,
                  readOnly: true,
                ),
                // * Expenses
                WidgetRowtitle(
                  title1: lang.expenses,
                  title2: 'Add',
                  onTap: () => Navigator.push(
                      context, downToTop(const AddExpenseScreen())),
                ),
                SizedBox(height: AppSize(context).height * 0.017),
                Divider(
                  height: 1,
                  color: AppColors.lightGreyColor.withOpacity(1),
                ),
                SizedBox(height: AppSize(context).height * 0.017),
                // * List Expenses
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.carDetails['expenses'].length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: AppSize(context).height * 0.007),
                  itemBuilder: (context, index) {
                    Map expenses = widget.carDetails['expenses'][index];
                    return Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child:
                              WidgetCachNetworkImage(image: expenses['image']),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenses['name'],
                              style: TextStyle(
                                fontSize: AppSize(context).smallText2,
                                color: AppColors.blackColor1,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              expenses['price'],
                              style: TextStyle(
                                fontSize: AppSize(context).smallText3,
                                color: AppColors.greyColor1,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
                SizedBox(height: AppSize(context).height * 0.02),
                // * Specification
                WidgetRowtitle(
                  title1: lang.specification,
                  title2: 'Add',
                ),
                SizedBox(height: AppSize(context).height * 0.017),
                Divider(
                  height: 1,
                  color: AppColors.lightGreyColor.withOpacity(1),
                ),
                SizedBox(height: AppSize(context).height * 0.017),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.carDetails['specification']
                      .map<Widget>(
                        (e) => WedgitPartCard(
                          icon: Icon(
                            e['icon'],
                            size: 30,
                            color: AppColors.blackColor1,
                          ),
                          title: e['title'],
                          value: false,
                          isAddCar: true,
                          titleAddCard: e['status'],
                          onChange: (value) {
                            setState(() {
                              e['value'] = value;
                            });
                          },
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  WidgetButton _buildBottomNavigationBar() {
    return WidgetButton(
      title: 'Sell The Car',
      color: AppColors.greenColor,
      radius: 0,
      onTap: () {},
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      title: Text(
        widget.carDetails['title'],
        style: TextStyle(
          fontSize: AppSize(context).mediumText3,
          color: AppColors.whiteColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: const SizedBox(),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context, rightToLeft(const AddManualScreen())),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      lang.edit,
                      style: TextStyle(
                        fontSize: AppSize(context).mediumText3,
                        color: AppColors.whiteColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      lang.close,
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
          ],
        )
      ],
    );
  }

  void handelData() {
    if (mounted) {
      setState(() {
        vin.text = widget.carDetails['vin_number'];
        title.text = widget.carDetails['title'];
        brand.text = widget.carDetails['brand'];
        model.text = widget.carDetails['model'];
        year.text = widget.carDetails['year'];
        fuel.text = widget.carDetails['fuel_type'];
        body.text = widget.carDetails['body'];
        genration.text = widget.carDetails['generation'];
        transmission.text = widget.carDetails['transmission_type'];
        mileage.text = widget.carDetails['Mileage'];
        eingine.text = widget.carDetails['engine_size'];
        cylinders.text = widget.carDetails['cylinders'];
        color.text = widget.carDetails['color'];
        vehicle.text = widget.carDetails['vehicle_status'];
        carPaint.text = widget.carDetails['car_paint_condition'];
        bodyCondition.text = widget.carDetails['body_condition'];
        regional.text = widget.carDetails['regional_specification'];
        cost.text = widget.carDetails['cost_price'];
        sell.text = widget.carDetails['sell_price'];
        payment.text = widget.carDetails['payment_method'];
        number.text = widget.carDetails['number_of_months'];
        show.text = widget.carDetails['show_price'];
        active.text = widget.carDetails['active'];
        details.text = widget.carDetails['details'];
        additional.text = widget.carDetails['additional_Presentation'];
      });
    }
  }
}

class WidgetRowtitle extends StatelessWidget {
  final String title1;
  final String title2;
  final Function()? onTap;

  const WidgetRowtitle({
    super.key,
    required this.title1,
    required this.title2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              title1,
              style: TextStyle(
                fontSize: AppSize(context).smallText4,
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w500,
              ),
            )),
            onTap == null ? const SizedBox() : const SizedBox(width: 10),
            onTap == null
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: onTap,
                      child: Text(
                        title2,
                        style: TextStyle(
                          fontSize: AppSize(context).smallText4,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}

class WidgetRowData extends StatelessWidget {
  final String title1;
  final String title2;
  final TextEditingController controller1;
  final TextEditingController controller2;

  const WidgetRowData({
    super.key,
    required this.title1,
    required this.title2,
    required this.controller1,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomInputTextForm(
            title: title1,
            controller: controller1,
            readOnly: true,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomInputTextForm(
            title: title2,
            controller: controller2,
            readOnly: true,
          ),
        ),
      ],
    );
  }
}
