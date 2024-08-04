import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'color_utils.dart';
import 'navigation_service.dart';


class CustomDialogs {
  static final CustomDialogs _instance = CustomDialogs._internal();

  factory CustomDialogs() => _instance;

  CustomDialogs._internal();

  showErrorDialog(
      {required String msg, required String title, Function()? onClick}) {
    return showDialog(
        context: NavigationService().navigationKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:  const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding:  const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: 300.0,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:  const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700),
                  ),
                   const SizedBox(height: 10),
                   const Divider(thickness: 0.5,),
                   const SizedBox(height: 30),
                  Expanded(
                    child: Text(
                      msg,
                      textAlign: TextAlign.center,
                      style:  const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  InkWell(
                    onTap: onClick ??
                            () {
                          NavigationService().goBack();
                        },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorUtils.app_primary_color,
                        borderRadius:  const BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child:  const Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static showDialogMessage(BuildContext context, String message, String title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:  const RoundedRectangleBorder(
                borderRadius:  BorderRadius.all( Radius.circular(32.0))),
            contentPadding:  const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style:  const TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                   const SizedBox(
                    height: 5.0,
                  ),
                   const Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: message,
                        border: InputBorder.none,
                      ),
                      readOnly: true,
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:  const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: ColorUtils.app_primary_color,
                        borderRadius:  const BorderRadius.only(
                            bottomLeft:  Radius.circular(32.0),
                            bottomRight:  Radius.circular(32.0)),
                      ),
                      child:  const Text(
                        "OK",
                        style:  TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static showDialogMessageSiteProgressPhoto(
      BuildContext context, String message, String title) {


    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:  const RoundedRectangleBorder(
                borderRadius:  BorderRadius.all( Radius.circular(32.0))),
            contentPadding:  const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style:  const TextStyle(fontSize: 22.0),
                      ),
                    ],
                  ),
                   const SizedBox(
                    height: 5.0,
                  ),
                   const Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: message,
                        border: InputBorder.none,
                      ),
                      readOnly: true,
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);

                    },
                    child: Container(
                      padding:  const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: ColorUtils.app_primary_color,
                        borderRadius:  const BorderRadius.only(
                            bottomLeft:  Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child:  const Text(
                        "OK",
                        style:  TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


  static showDialogForError(
      BuildContext context, String message, String title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:  const RoundedRectangleBorder(
                borderRadius:  BorderRadius.all(Radius.circular(32.0))),
            contentPadding:  const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style:  const TextStyle(fontSize: 22.0),
                      ),
                    ],
                  ),
                   const SizedBox(
                    height: 5.0,
                  ),
                   const Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: message,
                        border: InputBorder.none,
                      ),
                      readOnly: true,
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      //Navigator.pop(context);
                    },
                    child: Container(
                      padding:  const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: ColorUtils.app_primary_color,
                        borderRadius:  const BorderRadius.only(
                            bottomLeft:  Radius.circular(32.0),
                            bottomRight:  Radius.circular(32.0)),
                      ),
                      child:  const Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static showLogoutConfirmation(BuildContext context) {
    final storage = new FlutterSecureStorage();
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            shape:  const RoundedRectangleBorder(
                borderRadius:  BorderRadius.all( Radius.circular(16.0))),
            //contentPadding: EdgeInsets.only(top: 08.0),
            content: SizedBox(
              width: 300.0,
              height: 152,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   const Text(
                    "Logout",
                    style:  TextStyle(fontSize: 22.0),
                  ),
                   const Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                   const Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Are you sure that you want to logout?",
                        border: InputBorder.none,
                      ),
                      readOnly: true,
                      maxLines: 2,
                    ),
                  ),
                   const SizedBox(
                    height: 08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       const Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          //Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ColorUtils.app_primary_color),
                        child:  const Text(
                          "Cancel",
                        ),
                      ),
                       const SizedBox(
                        width: 08,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                  /*        DialogBuilder(context)
                              .showLoadingIndicator("Logging out");
                          var service = LoginFetchService();
                          var res = await service.userLogout(ants.userId);

                          if (res.success) {
                            storage.deleteAll();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  LoginScreen()),
                            );
                            Phoenix.rebirth(context);
                          }
                          else {
                            CustomDialogs.showDialogForError(
                                context, res.userMsg, "Logout Status");
                          }*/
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ColorUtils.app_primary_color),
                        child:  const Text(
                          "Logout",
                        ),
                      ),
                       const SizedBox(
                        width: 08,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  static showDialogRedirctLogin(
      BuildContext context, String message, String title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:  const RoundedRectangleBorder(
                borderRadius:  BorderRadius.all( Radius.circular(32.0))),
            contentPadding:  const EdgeInsets.only(top: 10.0),
            content: SizedBox(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style:  const TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                   const SizedBox(
                    height: 5.0,
                  ),
                   const Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: message,
                        border: InputBorder.none,
                      ),
                      readOnly: true,
                      maxLines: 4,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: ColorUtils.app_primary_color,
                    indent: 08,
                  ),
                  Row(
                    children: [
                       const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ColorUtils.app_primary_color),
                        child:  const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                       const SizedBox(
                        width: 08,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Phoenix.rebirth(context);
                        //  NavigationService().pushNamedAndRemoveUntil(loginScreenRoute);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ColorUtils.app_primary_color),
                        child:  const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                       const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  static onBackPressed(BuildContext context) {
    return
      showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              shape:  const RoundedRectangleBorder(
                  borderRadius:  BorderRadius.all( Radius.circular(16.0))),
              //contentPadding: EdgeInsets.only(top: 08.0),
              content: SizedBox(
                width: 300.0,
                height: 168,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      "fsfd",
                      style:  TextStyle(fontSize: 22.0),
                    ),
                //    ants.verticalDivider,
                     const Padding(
                      padding:  EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText:
                          "Are you sure that you want to exit from the app ?",
                          border: InputBorder.none,
                        ),
                        readOnly: true,
                        maxLines: 3,
                      ),
                    ),
                     const SizedBox(
                      height: 08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            //Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: ColorUtils.app_primary_color),
                          child:  const Text(
                            "NO",
                          ),
                        ),
                         const SizedBox(
                          width: 08,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: ColorUtils.app_primary_color),
                          child:  const Text(
                            "YES",
                          ),
                        ),
                         const SizedBox(
                          width: 08,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
  }
}