import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/home/components/Search_box.dart';
import 'package:flutter_complete_guide/home/components/category_list.dart';
import 'package:flutter_complete_guide/models/customer.dart';
import 'package:flutter_complete_guide/models/store.dart';
import 'package:flutter_complete_guide/service/StoreList.dart';
import 'package:flutter_complete_guide/service/api_service.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Store> stores;
  bool isLoading = false;
  Future<Customer> futureCustomer;
  @override
  void initState() {
    super.initState();
  }

  Future getStore() async {
    Future<List<Store>> futureStore = ApiService().getAllStore();
    futureStore.then((StoreList) {
      setState(() {
        this.stores = StoreList;
      });
    });
    print("Future Store:" + stores.toString());
    return futureStore;
  }

  // ignore: missing_return
  /*Future<Store> getStore() async {
    var url = "http://52.73.161.142/api/Store/get-all-store";
    var data = await http.get(Uri.parse(url));
    var jsonData = json.decode(data.body);

    for (var s in jsonData) {
      Store store = Store();
      stores.add(store);
    }
  }*/

  /*Future<Customer> getStore() async {
    String phone = "0987470312";
    var url =
        "https://nmrp3a0bjc.execute-api.us-east-1.amazonaws.com/Prod/api/Customer/get-by-phonenumber/";
    String URL = url + phone.toString();
    var data = await http.get(Uri.parse(URL));
    var jsonData = json.decode(data.body);
    if (jsonData != null) {
      print("có data");
    }

    var check = Customer.fromJson(jsonData);
    //Customer storecheck = jsonData['id']['name']['phoneNumber']['gmail'];
    print("check: " + check.toString());
    return check;
  }*/

  @override
  Widget build(BuildContext context) {
    if (stores == null) {
      stores = List<Store>();
    }
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SearchBox(onchange: (value) {}),
          CategoryList(),
          SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: <Widget>[
                //background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                ),
                Container(
                  child: FutureBuilder(
                    future: getStore(),
                    builder: (context, snapshot) {
                      return stores.length > 0
                          ? new StoreList(store: stores)
                          : new Center(
                              child: new Text(
                                  'No data found, tap plus button to add!',
                                  style: Theme.of(context).textTheme.button));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
