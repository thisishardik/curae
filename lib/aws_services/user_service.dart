import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:biocom2/aws_services/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _awsUserPoolId = 'us-east-1_RrWQ0yWhg';
const _awsClientId = '7omgkncbjkr1rdc7lotit0dlfb';

final userPool = new CognitoUserPool(
  'us-east-1_RrWQ0yWhg',
  '7omgkncbjkr1rdc7lotit0dlfb',
);

class UserService {
  CognitoUserPool _userPool;
  CognitoUser _cognitoUser;
  CognitoUserSession _session;
  UserService(this._userPool);
  CognitoCredentials credentials;

  /// Initiate user session from local storage if present
  Future<bool> init() async {
    final prefs = await SharedPreferences.getInstance();

    _cognitoUser = await _userPool.getCurrentUser();
    if (_cognitoUser == null) {
      return false;
    }
    _session = await _cognitoUser.getSession();
    return _session.isValid();
  }

  /// Get existing user from session with his/her attributes
  Future<User> getCurrentUser() async {
    print('*************');
    if (_cognitoUser == null || _session == null) {
      print('_cognitoUser == null || _session == null');
      return null;
    }
    if (!_session.isValid()) {
      print('!_session.isValid()');
      return null;
    }
    final attributes = await _cognitoUser.getUserAttributes();
    if (attributes == null) {
      print('attributes == null');
      return null;
    }
    final user = User.fromUserAttributes(attributes);
    user.hasAccess = true;
    return user;
  }

//  /// Retrieve user credentials -- for use with other AWS services
//  Future<CognitoCredentials> getCredentials() async {
//    if (_cognitoUser == null || _session == null) {
//      return null;
//    }
//    credentials = CognitoCredentials(_identityPoolId, _userPool);
//    await credentials.getAwsCredentials(_session.getIdToken().getJwtToken());
//    return credentials;
//  }

  /// Check if user's current session is valid
  Future<bool> checkAuthenticated() async {
    if (_cognitoUser == null || _session == null) {
      return false;
    }
    return _session.isValid();
  }

  Future<void> signOut() async {
    if (credentials != null) {
      await credentials.resetAwsCredentials();
    }
    if (_cognitoUser != null) {
      return _cognitoUser.signOut();
    }
  }
}
