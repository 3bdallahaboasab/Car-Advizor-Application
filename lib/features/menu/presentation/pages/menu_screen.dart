import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Functions/navigation.dart';
import 'package:test/core/Helper/cache_helper.dart';
import 'package:test/core/Strings/cache_string.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/home/presentation/pages/invoices_screen.dart';
import 'package:test/features/menu/presentation/pages/about_us_screen.dart';
import 'package:test/features/menu/presentation/pages/contact_us_screen.dart';
import 'package:test/features/menu/presentation/pages/my_store_screen.dart';
import 'package:test/features/menu/presentation/pages/privacy_police_screen.dart';
import 'package:test/features/menu/presentation/pages/terms_and_conditions.dart';
import 'package:test/features/menu/presentation/widgets/widget_language_list_tile.dart';
import 'package:test/features/widget/widget_button.dart';
import 'package:test/features/widget/widget_cach_network_image.dart';
import 'package:test/features/menu/presentation/widgets/widget_profile_divider.dart';
import 'package:test/features/menu/presentation/widgets/widget_profile_list_tile.dart';
import 'package:test/language_bloc/language_bloc.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isArabicActive = false;
  bool isEnglishActive = true;
  String? selectLang;

  @override
  void initState() {
    if (CacheHelper.getData(key: LANG_CACHE) == 'en') {
      if (mounted) {
        setState(() {
          isArabicActive = false;
          isEnglishActive = true;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          isArabicActive = true;
          isEnglishActive = false;
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectLang =
        CacheHelper.getData(key: LANG_CACHE) == 'en' ? 'English' : 'Arabic';
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // * Background
            Container(
              height: AppSize(context).height * 0.08,
              width: double.infinity,
              color: AppColors.primaryColor,
            ),
            // * Contents
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // * Image
                Card(
                  elevation: 5,
                  shadowColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000000),
                  ),
                  child: Container(
                    width: AppSize(context).width * 0.25,
                    height: AppSize(context).width * 0.25,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000000),
                        border: Border.all(
                          color: AppColors.whiteColor1,
                        )),
                    child: const WidgetCachNetworkImage(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF92illYJYChj1MCbrEnNVI4w_73q-KZOm9g&usqp=CAU'),
                  ),
                ),
                SizedBox(height: AppSize(context).height * 0.005),
                // * Title
                Text(
                  'free',
                  style: TextStyle(
                    fontSize: AppSize(context).mediumText4,
                    color: AppColors.blackColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: AppSize(context).height * 0.005),
                // * Email
                Text(
                  'test@gmail.com',
                  style: TextStyle(
                    fontSize: AppSize(context).smallText2,
                    color: AppColors.darkGreyColor,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: AppSize(context).height * 0.05),
                // * Language
                WidgetProfileListTile(
                  leading: const Icon(
                    Icons.language,
                    color: AppColors.darkGreyColor,
                    size: 23,
                  ),
                  title: 'Language',
                  language: 'English',
                  isLanguage: true,
                  onTap: () => changeLanguage(),
                ),
                const WidgetProfileDivider(),
                // * My Store
                WidgetProfileListTile(
                  leading: const Icon(
                    Icons.store,
                    color: AppColors.darkGreyColor,
                    size: 23,
                  ),
                  title: 'My Store',
                  onTap: () => Navigator.push(
                      context, rightToLeft(const MyStoreScreen())),
                ),
                const WidgetProfileDivider(),
                // * Invoices
                WidgetProfileListTile(
                  leading: const Icon(
                    Icons.description,
                    color: AppColors.darkGreyColor,
                    size: 23,
                  ),
                  title: 'Invoices',
                  onTap: () => Navigator.push(
                      context, rightToLeft(const InvoicesScreen())),
                ),
                const WidgetProfileDivider(),
                // * About Us
                WidgetProfileListTile(
                  leading: const Icon(
                    Icons.info,
                    color: AppColors.darkGreyColor,
                    size: 23,
                  ),
                  title: 'About Us',
                  onTap: () => Navigator.push(
                      context, rightToLeft(const AboutUsScreen())),
                ),
                const WidgetProfileDivider(),
                // * Contact Us
                WidgetProfileListTile(
                  leading: const Icon(
                    Icons.email,
                    color: AppColors.darkGreyColor,
                    size: 23,
                  ),
                  title: 'Contact Us',
                  onTap: () => Navigator.push(
                      context, rightToLeft(const ContactUsScreen())),
                ),
                const WidgetProfileDivider(),
                // * Privacy Policy
                WidgetProfileListTile(
                  leading: const Icon(
                    Icons.lock,
                    color: AppColors.darkGreyColor,
                    size: 23,
                  ),
                  title: 'Privacy Policy',
                  onTap: () => Navigator.push(
                      context, rightToLeft(const PrivacePolicyScreen())),
                ),
                const WidgetProfileDivider(),
                // * Terms & conditions
                WidgetProfileListTile(
                  leading: const Icon(
                    Icons.shield,
                    color: AppColors.darkGreyColor,
                    size: 23,
                  ),
                  title: 'Terms & conditions',
                  onTap: () => Navigator.push(
                      context, rightToLeft(const TermsAndConditionsScreen())),
                ),
                SizedBox(height: AppSize(context).height * 0.04),
                // * Log out
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize(context).width * 0.04),
                  child: WidgetButton(
                    height: AppSize(context).height * 0.06,
                    title: '',
                    color: AppColors.redColor.withOpacity(0.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.logout,
                          color: AppColors.whiteColor1,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: AppSize(context).smallText2,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor1,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void changeLanguage() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, set) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          insetPadding: const EdgeInsets.only(bottom: 20),
          contentPadding:
              EdgeInsets.symmetric(vertical: AppSize(context).height * 0.01),
          content: Builder(
            builder: (context) => SizedBox(
              width: AppSize(context).width * 0.2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize(context).width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Language',
                          style: TextStyle(
                            fontSize: AppSize(context).mediumText4,
                            color: AppColors.blackColor1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    Column(
                      children: [
                        WidgetLanguageListTile(
                          title: 'English',
                          isActive: isEnglishActive,
                          onTap: () {
                            set(() {
                              isEnglishActive = true;
                              isArabicActive = false;
                              selectLang = 'English';
                            });
                          },
                        ),
                        WidgetLanguageListTile(
                          title: 'العربية',
                          isActive: isArabicActive,
                          onTap: () {
                            set(() {
                              isEnglishActive = false;
                              isArabicActive = true;
                              selectLang = 'العربية';
                            });
                          },
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              pop(context);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: AppColors.lightGreyColor,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Back',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: AppSize(context).smallText2,
                                        color: AppColors.indigoColor,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              set(() {
                                if (isEnglishActive == true) {
                                  BlocProvider.of<LanguageBloc>(context).add(
                                      const ConverLanguageEvent(
                                          locale: Locale('en', '')));
                                  pop(context);
                                } else if (isArabicActive == true) {
                                  BlocProvider.of<LanguageBloc>(context).add(
                                      const ConverLanguageEvent(
                                          locale: Locale('ar', '')));
                                  pop(context);
                                }
                              });
                            },
                            child: Center(
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                      fontSize: AppSize(context).smallText2,
                                      color: AppColors.indigoColor,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
