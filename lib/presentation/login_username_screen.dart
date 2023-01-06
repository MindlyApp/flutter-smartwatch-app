import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mind_pro/presentation/background/background_builder.dart';
import 'package:wear/wear.dart';

class LoginUsernameScreen extends StatefulWidget {
  const LoginUsernameScreen({Key? key}) : super(key: key);

  @override
  State<LoginUsernameScreen> createState() => _LoginUsernameScreenState();
}

class _LoginUsernameScreenState extends State<LoginUsernameScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  //
  // See also: https://docs.flutter.dev/cookbook/forms/validation
  final _formKey = GlobalKey<FormState>();

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 8) {
      return "Password should be at least 8 characters";
    } else if (value.length > 32) {
      return "Password should not be greater than 32 characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
          child: WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
          return Container(
            decoration: MSBackgrounds.createBoxDecoration(),
            child: SingleChildScrollView(
                child: Form(
              autovalidateMode:
                  AutovalidateMode.always, //check for validation while typing
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 8,
                  ),
                  SizedBox(
                      width: screenWidth - 50,
                      child: Column(
                        children: [
                          /// see also: https://medium.com/swlh/forms-and-validation-in-flutter-login-ui-f2e7db4e00c9
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                    hintText:
                                        'Enter valid email id as abc@gmail.com',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
                                    filled: true,
                                    fillColor: Color(0x22FFFFFF)),
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "* Required"),
                                  EmailValidator(
                                      errorText: "Enter valid email id"),
                                ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 10, bottom: 0),
                            child: TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter secure password',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                filled: true,
                                fillColor: Color(0x22FFFFFF),
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Required"),
                                MinLengthValidator(8,
                                    errorText:
                                        "Password should be at least 8 characters"),
                                MaxLengthValidator(32,
                                    errorText:
                                        "Password should not be greater than 32 characters")
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                        ],
                      )),

                  /// see aslo: https://www.flutterbeads.com/button-with-icon-and-text-flutter/
                  ElevatedButton.icon(
                    // <-- ElevatedButton
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /// TODO: login

                        Navigator.pushNamedAndRemoveUntil(context, '/main-menu',
                            ModalRoute.withName('/main-menu'));

                        print("Login successful");
                      } else {
                        print("Not Validated");
                      }
                    },

                    style: MSBackgrounds.createButtonStyle(context),
                    icon: const Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 24.0,
                    ),
                    label: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
          );
        },
        child: AmbientMode(
          builder: (BuildContext context, WearMode mode, Widget? child) {
            return const Placeholder();
          },
        ),
      )),
    );
  }
}
