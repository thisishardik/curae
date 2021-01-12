import 'package:biocom2/networking/network_helper.dart';
import 'package:flutter/material.dart';

class DoctorData {
  getDoctorData() async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://iatyp2ev74.execute-api.us-east-1.amazonaws.com/v3/username');
    var doctorData = await networkHelper.getData();
    return doctorData;
  }
}
