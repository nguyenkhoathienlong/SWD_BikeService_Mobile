import 'package:flutter_complete_guide/models/customer.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ListCustomer {
  List<Customer> data;
  ListCustomer({this.data});
  factory ListCustomer.fromJson(Map<String, dynamic> json) =>
      _$ListCustomerFromJson(json);
  Map<String, dynamic> toJson() => _$ListCustomerToJson(this);
}

ListCustomer _$ListCustomerFromJson(Map<String, dynamic> json) {
  return ListCustomer(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Customer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListCustomerToJson(ListCustomer instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
