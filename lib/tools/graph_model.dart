import 'package:biocom2/tools/graph_api.dart';
import 'package:flutter/material.dart';

class GraphModel {
  Future getGraph() async {
    NetworkHelper networkHelper = NetworkHelper();

    var bookData = await networkHelper.getData();

    return bookData;
  }
}
