import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessDialog {
  static void show(BuildContext context, {String message = 'Operation was successful!'}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 50,
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
class ErrorDialog {
  static void show(BuildContext context, {String message = 'An error occurred!'}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
class ExitDialog {
  static Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                  Navigator.of(context).pop(); // Dismisses the dialog
                // Exits the app
                if (Theme.of(context).platform == TargetPlatform.android) {
                  SystemNavigator.pop();    // For Android
                } else {

                }
              },
            ),
          ],
        );
      },
    );
  }
}
class LogoutDialog {
  static Future<void> show(BuildContext context, VoidCallback onLogout) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
                onLogout(); // Calls the callback function to perform the logout action
              },
            ),
          ],
        );
      },
    );
  }
}
class SaveDataDialog {
  static Future<void> show(BuildContext context, VoidCallback onSave) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Changes'),
          content: Text('Do you want to save the changes you made?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
                onSave(); // Calls the callback function to perform the save action
              },
            ),
          ],
        );
      },
    );
  }
}