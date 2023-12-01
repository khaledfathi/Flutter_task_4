import 'package:flutter/material.dart';
import 'package:task_l4/services/validation_services.dart';
import 'package:task_l4/views/components/alert_message.dart';
import 'package:task_l4/views/login_with_number_view.dart';
import 'package:task_l4/views/login_view.dart';
import 'package:task_l4/views/otp_view.dart';
import 'package:task_l4/views/password_changed_view.dart';
import 'package:task_l4/views/recover_account_view.dart';
import 'package:task_l4/views/signup_view.dart';
import 'package:task_l4/models/user_model.dart';
import 'package:task_l4/views/user_profile_view.dart';

class AuthController {
  Widget signUpView() {
    return const SignUpView();
  }

  Widget loginView() {
    return const LoginView();
  }

  Widget loginWithNumberView() {
    return const LoginWithNumberView();
  }

  Widget recoverAccountView() {
    return const RecoverAccountView();
  }

  Widget passwordChangedView() {
    return const PasswordChangedView();
  }

  Future signUp(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required BuildContext context}) async {
    List<String> errors = [];
    //sanatizing
    name = name.trim();
    email = email.trim();
    phone = phone.trim();
    //validation
    if (!Validation(name).length(minLength: 3).required().validate()) {
      errors.add('- Name is invalid');
    }
    if (!Validation(password)
        .length(minLength: 8, maxLength: 20)
        .required()
        .validate()) {
      errors.add('- password length should be 8 to 10 characters');
    }
    await Validation(email)
        .email()
        .required()
        .unique('users', 'email')
        .then((validation) {
      if (!validation.validate()) {
        errors.add('- invalid Email or already exist');
      }
    });
    await Validation(phone)
        .numeric()
        .required()
        .unique('users', 'phone')
        .then((validation) {
      if (!validation.validate()) {
        errors.add('- Invalid phone number or already exist');
      }
    });

    if (errors.isEmpty) {
      //store in database
      UserModel().insert({
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      });
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertMessage(
            icon: const Icon(
              Icons.info_outline,
              color: Colors.deepPurpleAccent,
            ),
            title: 'Done',
            message: 'Registerd Succssefuly',
            actionButtonTitle: 'Go to Home',
            onTapActionButton: () => Navigator.of(context)
                .pushNamedAndRemoveUntil('home', (route) => false)),
      );
    } else {
      await showDialog(
        context: context,
        builder: (context) => AlertMessage(
            icon: const Icon(
              Icons.dangerous,
              color: Colors.red,
            ),
            title: 'Validation Error',
            message: errors.join('\n'),
            actionButtonTitle: 'OK',
            onTapActionButton: () => Navigator.of(context).pop()),
      );
    }
  }

  Future login(
      {required String email,
      required String password,
      required context}) async {
    //sanatizing
    email = email.trim();
    bool attemp = false;
    UserModel? record;
    //attemp to login
    await UserModel()
        .selectWhere('email = "$email" AND password = "$password" ')
        .then((queryResult) {
      attemp = queryResult.isNotEmpty;
      if (attemp) {
        record = queryResult[0];
      }
    });

    if (attemp) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => UserProfileView(userRecord: record!)),
          (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertMessage(
                icon: const Icon(
                  Icons.dangerous,
                  color: Colors.red,
                ),
                title: 'Invalid Credintial ',
                message: 'Invalid user name or password',
                actionButtonTitle: 'Ok',
                onTapActionButton: () => Navigator.of(context).pop());
          });
    }
  }

  Future loginWithNumber({required String phone, required context}) async {
    //sanatizing
    phone = phone.trim();

    //validation
    bool isValid = Validation(phone).numeric().required().validate();

    //attemp to login
    bool attemp = false;
    UserModel? record;
    if (isValid) {
      await UserModel().selectWhere('phone = "$phone"').then((queryResult) {
        attemp = queryResult.isNotEmpty;
        if (attemp) {
          record = queryResult[0];
        }
      });
      if (attemp) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => UserProfileView(userRecord: record!)),
            (route) => false);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertMessage(
                  icon: const Icon(
                    Icons.dangerous,
                    color: Colors.red,
                  ),
                  title: 'Login Error',
                  message: 'Mobile number dosn\'t exist',
                  actionButtonTitle: 'Ok',
                  onTapActionButton: () => Navigator.of(context).pop());
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertMessage(
                icon: const Icon(
                  Icons.dangerous,
                  color: Colors.red,
                ),
                title: 'Invalid Entry',
                message: 'Mobile number must be numeric ',
                actionButtonTitle: 'Ok',
                onTapActionButton: () => Navigator.of(context).pop());
          });
    }
  }

  Future passwordRecovery(
      {required String email, required String phone, required context}) async {
    //sanatizing
    email = email.trim();
    phone = phone.trim();

    //query
    int? recordId;
    bool attemp = false;
    await UserModel()
        .selectWhere('email = "$email" AND phone = "$phone"')
        .then((queryResult) {
      if (queryResult.isNotEmpty) {
        attemp = true;
        recordId = int.parse(queryResult[0].id!);
      }
    });

    //attemp
    if (attemp) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OTPView(recordId: recordId!)));
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => NewPasswordView(recordId:recordId!)));
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertMessage(
                icon: const Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
                title: 'Not Found',
                message: 'Email or phone dosen\'t exist',
                actionButtonTitle: 'ok',
                onTapActionButton: () {
                  Navigator.of(context).pop();
                });
          });
    }
  }

  Future updatePassword(
      {required int recordId,
      required String password,
      required String confirmPassword,
      required context}) async {
    //validation
    bool isValid = Validation(password).required().length(minLength: 8 , maxLength: 20).validate() &&
        Validation(confirmPassword).required().length(minLength: 8 , maxLength: 20).validate();
    if (isValid) {
      if (password == confirmPassword) {
        await UserModel().update({'password':password} , recordId); 
        Navigator.of(context).pushNamedAndRemoveUntil('auth.passwordChanged',(route)=>false);
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertMessage(
                icon: const Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
                title: 'Not Matched',
                message: 'passwords dosen\'t match',
                actionButtonTitle: 'ok',
                onTapActionButton: () => Navigator.of(context).pop(),
              );
            });
      }
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertMessage(
              icon: const Icon(
                Icons.warning,
                color: Colors.yellow,
              ),
              title: 'Not valid',
              message: 'Validation Error',
              actionButtonTitle: 'ok',
              onTapActionButton: () => Navigator.of(context).pop(),
            );
          });
    }
  }
}
