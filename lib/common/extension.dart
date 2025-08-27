import 'package:flutter/material.dart';
import 'base_bloc.dart';
import 'contant.dart';

extension ContextExtension on BuildContext {
  void showPopup(VoidCallback onSubmit, String title, Widget content) {
    showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                onSubmit();
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

extension BaseBlocExtension on BaseBloc {
  void showSnackbar(
    String translationKey,
  ) {
    ScaffoldMessenger.of(navigator.currentContext!).showSnackBar(
      SnackBar(
        content: Text(translationKey,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            )),
      ),
    );
  }

  Future<T?> push<T extends Object?>(
    String route,
  ) {
    return Navigator.of(navigator.currentContext!).pushNamed(
      route,
    );
  }

  Future<T?> replace<T extends Object?>(String route) {
    return Navigator.of(navigator.currentContext!).pushReplacementNamed(
      route,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(String route) {
    return Navigator.of(navigator.currentContext!).pushNamedAndRemoveUntil(
      route,
      (route) => false,
    );
  }

  Future<bool> pop<T extends Object?>(T? result) {
    return Navigator.of(navigator.currentContext!).maybePop(result);
  }
}
