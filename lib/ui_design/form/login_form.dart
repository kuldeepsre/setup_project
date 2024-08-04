import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../../components/custom_button.dart';
import '../../components/loading_indicator.dart';
import '../../dialog/custom_dialog.dart';
import '../../utils/color_utils.dart';
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late bool _validate;
  late bool isLogin;
  bool hidePassword = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _validate = false;
    isLogin = false;

  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginLoading){

        }


        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successful')),
          );
      //    showCustomSnackbar(context,"state.msg");
        }
        else if (state is LoginFailure) {
        showCustomSnackbar(context,state.error);

        }
        else if (state is NoInternetConnection) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No internet connection')),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(child:LoadingIndicator());
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 08),
                        child: TextFormField(
                          decoration:
                          InputDecoration(
                            enabledBorder:
                            UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorUtils
                                      .app_primary_color,
                                  width: 02),
                            ),
                            focusedBorder:
                            UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorUtils
                                      .app_primary_color,
                                  width: 4.0),
                            ),
                            border:
                            UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:ColorUtils
                                      .app_primary_color),
                            ),
                            hintText: "abc.xyz",
                            labelText: "Domain Id",
                            labelStyle: TextStyle(
                              color: ColorUtils
                                  .app_primary_color,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.grey
                                    .shade400),
                          ),
                          autocorrect: _validate,
                          controller:
                          _usernameController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty) {
                              return "Enter Domain Id!";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 08),
                        child: TextFormField(
                            obscureText:
                            hidePassword,
                            decoration:
                            InputDecoration(
                              // hintText: "Password",
                              labelText:
                              "Password",
                              labelStyle:
                              TextStyle(
                                color: ColorUtils
                                    .app_primary_color,
                              ),
                              enabledBorder:
                              UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorUtils
                                        .app_primary_color,
                                    width: 02),
                              ),
                              focusedBorder:
                              UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorUtils
                                        .app_primary_color,
                                    width: 4.0),
                              ),
                              border:
                              UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorUtils
                                        .app_primary_color),
                              ),
                              suffixIcon:
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword =
                                    !hidePassword;
                                  });
                                },
                                color: ColorUtils
                                    .app_primary_color
                                    .withOpacity(
                                    0.4),
                                icon: Icon(hidePassword
                                    ? Icons
                                    .visibility_off
                                    : Icons
                                    .visibility),
                              ),
                            ),
                            autocorrect:
                            _validate,
                            controller:
                            _passwordController,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return "Enter Password!";
                              } else {
                                return null;
                              }
                            }),
                      ),

                      const SizedBox(height: 20),
                CustomButton(

                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      final username = _usernameController.text;
                      final password = _passwordController.text;
                      context.read<LoginBloc>().add(LoginButtonPressed(
                        username: username,
                        password: password,
                      ));
                    }
                  },
                  title: 'Login',
                ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
