 

class MyCars {
  final int? id;
  final String? title;
  final int? price;
  final int? costPrice;
  final String? image;
  final int? stock;
  final bool? sold;
  final dynamic vin;

  MyCars({
    this.id,
    this.title,
    this.price,
    this.costPrice,
    this.image,
    this.stock,
    this.sold,
    this.vin,
  });

  MyCars.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        price = json['price'] as int?,
        costPrice = json['costPrice'] as int?,
        image = json['image'] as String?,
        stock = json['stock'] as int?,
        sold = json['sold'] as bool?,
        vin = json['vin'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'costPrice': costPrice,
        'image': image,
        'stock': stock,
        'sold': sold,
        'vin': vin
      };
}
