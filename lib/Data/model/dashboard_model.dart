class DashboardModel {
  final int? activeCars;
  final int? carsSold;
  final int? carValue;
  final int? carRevenue;
  final int? totalRevenue;
  final int? totalInvoice;
  final int? totalRevenueMonth;
  final List<int>? totalRevenueList;
  final int? reviews;
  final int? views;
  final int? expense;
  final int? announcement;
  final String? currency;

  DashboardModel({
    this.activeCars,
    this.carsSold,
    this.carValue,
    this.carRevenue,
    this.totalRevenue,
    this.totalInvoice,
    this.totalRevenueMonth,
    this.totalRevenueList,
    this.reviews,
    this.views,
    this.expense,
    this.announcement,
    this.currency,
  });

  DashboardModel.fromJson(Map<String, dynamic> json)
      : activeCars = json['activeCars'] as int?,
        carsSold = json['carsSold'] as int?,
        carValue = json['carValue'] as int?,
        carRevenue = json['carRevenue'] as int?,
        totalRevenue = json['totalRevenue'] as int?,
        totalInvoice = json['totalInvoice'] as int?,
        totalRevenueMonth = json['totalRevenueMonth'] as int?,
        totalRevenueList = (json['totalRevenueList'] as List?)
            ?.map((dynamic e) => e as int)
            .toList(),
        reviews = json['reviews'] as int?,
        views = json['views'] as int?,
        expense = json['expense'] as int?,
        announcement = json['announcement'] as int?,
        currency = json['currency'] as String?;

  Map<String, dynamic> toJson() => {
        'activeCars': activeCars,
        'carsSold': carsSold,
        'carValue': carValue,
        'carRevenue': carRevenue,
        'totalRevenue': totalRevenue,
        'totalInvoice': totalInvoice,
        'totalRevenueMonth': totalRevenueMonth,
        'totalRevenueList': totalRevenueList,
        'reviews': reviews,
        'views': views,
        'expense': expense,
        'announcement': announcement,
        'currency': currency
      };
}
