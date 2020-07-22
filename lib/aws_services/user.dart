import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';

const _awsUserPoolId = 'us-east-1_RrWQ0yWhg';
const _awsClientId = '7omgkncbjkr1rdc7lotit0dlfb';
final userPool = new CognitoUserPool(
  'us-east-1_RrWQ0yWhg',
  '7omgkncbjkr1rdc7lotit0dlfb',
);

class User {
  String email;
  String name;
  String password;
  bool confirmed = false;
  bool hasAccess = false;

  User({this.email, this.name});

  factory User.fromUserAttributes(List<CognitoUserAttribute> attributes) {
    final user = User();
    attributes.forEach((attribute) {
      if (attribute.getName() == 'email') {
        user.email = attribute.getValue();
      } else if (attribute.getName() == 'name') {
        user.name = attribute.getValue();
      }
    });
    return user;
  }
}
