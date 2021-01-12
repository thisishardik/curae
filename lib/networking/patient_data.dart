import 'package:biocom2/networking/network_helper.dart';
import 'package:biocom2/networking/network_helper_doctor.dart';
import 'package:flutter/material.dart';

class PatientData {
  getPatientData() async {
    NetworkHelperDoctor networkHelperDoctor = NetworkHelperDoctor(
        url:
            'https://mcjh1cco7c.execute-api.us-east-1.amazonaws.com/v2/username/anish2000');
    var doctorData = await networkHelperDoctor.getData();
    return doctorData;
  }
}
