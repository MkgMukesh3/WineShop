class SignupRespModel {
  bool? status;
  int? ecomAfCustomerId;
  String? message;

  SignupRespModel({this.status, this.ecomAfCustomerId, this.message});

  SignupRespModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    ecomAfCustomerId = json['ecom_af_customer_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ecom_af_customer_id'] = this.ecomAfCustomerId;
    data['message'] = this.message;
    return data;
  }
}
