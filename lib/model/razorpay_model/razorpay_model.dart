// import 'package:json_annotation/json_annotation.dart';

// part 'razorpay_model.g.dart';

// @JsonSerializable()
// class RazorpayModel {
//   String? id;
//   String? entity;
//   int? amount;
//   @JsonKey(name: 'amount_paid')
//   int? amountPaid;
//   @JsonKey(name: 'amount_due')
//   int? amountDue;
//   String? currency;
//   String? receipt;
//   String? status;
//   int? attempts;
//   List<dynamic>? notes;
//   @JsonKey(name: 'created_at')
//   int? createdAt;

//   RazorpayModel({
//     this.id,
//     this.entity,
//     this.amount,
//     this.amountPaid,
//     this.amountDue,
//     this.currency,
//     this.receipt,
//     this.status,
//     this.attempts,
//     this.notes,
//     this.createdAt,
//   });

//   factory RazorpayModel.fromJson(Map<String, dynamic> json) {
//     return _$RazorpayModelFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$RazorpayModelToJson(this);
// }
