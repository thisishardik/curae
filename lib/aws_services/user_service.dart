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
  UserService(this._userPool);
  CognitoUserPool _userPool;
  CognitoUser _cognitoUser;
  CognitoUserSession _session;
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

  /// Login user
  Future<User> login(String username, String password) async {
    _cognitoUser = new CognitoUser(username, userPool);

    final authDetails = new AuthenticationDetails(
      username: '$username',
      password: '$password',
    );

    bool isConfirmed;
    try {
      _session = await _cognitoUser.authenticateUser(authDetails);
      isConfirmed = true;
    } on CognitoUserNewPasswordRequiredException catch (e) {
      print(e);
    } on CognitoUserMfaRequiredException catch (e) {
      print(e);
      // handle SMS_MFA challenge
    } on CognitoUserSelectMfaTypeException catch (e) {
      print(e);
      // handle SELECT_MFA_TYPE challenge
    } on CognitoUserMfaSetupException catch (e) {
      print(e);
      // handle MFA_SETUP challenge
    } on CognitoUserTotpRequiredException catch (e) {
      print(e);
      // handle SOFTWARE_TOKEN_MFA challenge
    } on CognitoUserCustomChallengeException catch (e) {
      print(e);
      // handle CUSTOM_CHALLENGE challenge
    } on CognitoUserConfirmationNecessaryException catch (e) {
      print(e);
      // handle User Confirmation Necessary
    } on CognitoClientException catch (e) {
      print(e);
      isConfirmed = false;
      // handle Wrong Username and Password and Cognito Client
    } catch (e) {
      print(e);
    }
    print(_session.getAccessToken().getJwtToken());

    if (!_session.isValid()) {
      return null;
    }

    final attributes = await _cognitoUser.getUserAttributes();
    final user = new User.fromUserAttributes(attributes);
    user.confirmed = isConfirmed;
    user.hasAccess = true;

    return user;
  }

  /// Confirm user's account with confirmation code sent to email
  Future<bool> confirmAccount(String email, String confirmationCode) async {
    _cognitoUser =
        new CognitoUser(email, _userPool, storage: _userPool.storage);

    return await _cognitoUser.confirmRegistration(confirmationCode);
  }

  /// Resend confirmation code to user's email
  Future<void> resendConfirmationCode(String email) async {
    _cognitoUser =
        new CognitoUser(email, _userPool, storage: _userPool.storage);
    await _cognitoUser.resendConfirmationCode();
  }

  /// Check if user's current session is valid
  Future<bool> checkAuthenticated() async {
    if (_cognitoUser == null || _session == null) {
      return false;
    }
    return _session.isValid();
  }

  /// Sign up new user
  Future<User> signUp(String username, String email, String password,
      String number, String gender, String aadharNumber, String address) async {
    CognitoUserPoolData data;
    final userAttributes = [
      AttributeArg(name: 'name', value: '$username'),
      AttributeArg(name: 'email', value: '$email'),
      AttributeArg(name: 'phone_number', value: '+91$number'),
      AttributeArg(name: 'address', value: '$address'),
      AttributeArg(name: 'gender', value: '$gender')
    ];
    data = await userPool.signUp(
      '$username',
      '$password',
      userAttributes: userAttributes,
    );

    final user = new User();
    user.email = email;
    user.name = username;
    user.confirmed = data.userConfirmed;
    return user;
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
