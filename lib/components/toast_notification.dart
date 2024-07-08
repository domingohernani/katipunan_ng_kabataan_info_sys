import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastNotification {
  ToastNotification({required this.title, required this.body});

  String title;
  String body;

  void success() {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      title: Text(title),
      description: Text(body),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      pauseOnHover: false,
    );
  }

  void info() {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flat,
      title: Text(title),
      description: Text(body),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      pauseOnHover: false,
    );
  }

  void warning() {
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.flat,
      title: Text(title),
      description: Text(body),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      pauseOnHover: false,
    );
  }

  void error() {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      title: Text(title),
      description: Text(body),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      pauseOnHover: false,
    );
  }
}
