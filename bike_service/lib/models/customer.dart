class Customer {
  final String name, phoneNumber, email;

  Customer({this.name, this.phoneNumber, this.email});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
    );
  }
}
