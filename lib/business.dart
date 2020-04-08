class Business {
  final double rating;
  final String price;
  final String phone;
  final String id;
  final String name;

  final String alias;
  final bool isClosed;
  final int reviewCount;

  final String url;
  final String imageUrl;

  final String city;
  final String state;
  final String country;
  final String zip;
  final String displayAddress;
  final String categories;

  Business(
      {this.rating,
      this.price,
      this.phone,
      this.id,
      this.name,
      this.alias,
      this.isClosed,
      this.reviewCount,
      this.url,
      this.imageUrl,
      this.displayAddress,
      this.city,
      this.state,
      this.country,
      this.zip,
      this.categories});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      rating: json['rating'],
      price: json['price'],
      phone: json['phone'],
      id: json['id'],
      name: json['name'],
      alias: json['alias'],
      isClosed: json['is_closed'],
      reviewCount: json['review_count'],
      url: json['url'],
      imageUrl: json['image_url'],
      displayAddress: json['location']['display_address'][0] +
          ', ' +
          json['location']['display_address'][1],
      city: json['location']['city'],
      state: json['location']['state'],
      country: json['location']['country'],
      zip: json['location']['zip_code'],
      categories: json['categories'][0]['title'],
    );
  }
}
