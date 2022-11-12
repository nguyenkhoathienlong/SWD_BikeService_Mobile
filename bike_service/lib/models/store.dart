/*class Store {
  String name, phoneNumber, address, wardName, districtName;

  Store(String name, phoneNumber, address, wardName, districtName) {
    this.name = name;
    this.phoneNumber = phoneNumber;
    this.address = address;
    this.wardName = wardName;
    this.districtName = districtName;
  }

  Store.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phoneNumber = json['phoneNumber'],
        address = json['address'],
        wardName = json['wardName'],
        districtName = json['districtName'];

  Map toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'wardName': wardName,
      'districtName': districtName
    };
  }
}*/

class Store {
  final int id;
  final String name, phoneNumber, address, wardName, districtName;

  Store(
      {this.id,
      this.name,
      this.phoneNumber,
      this.address,
      this.wardName,
      this.districtName});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
        id: json['id'] as int,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        address: json['address'] as String,
        wardName: json['wardName'] as String,
        districtName: json['districtName'] as String);
  }
}





// list of products
// for our demo
/*List<Product> products = [
  Product(
    id: 1,
    name: "Tiệm sửa xe Tuấn",
    image: "assets/images/mechanic.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 2,
    name: "Tiệm sửa xe Toàn",
    image: "assets/images/mechanic.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 3,
    name: "Tiệm sửa xe Long",
    image: "assets/images/mechanic.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 4,
    name: "Tiệm sửa xe Phúc",
    image: "assets/images/mechanic.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 5,
    name: "Tiệm sửa xe Long",
    image: "assets/images/mechanic.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];*/
