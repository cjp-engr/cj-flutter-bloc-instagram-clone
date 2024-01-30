import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController {
  final WidgetRef ref;
  final GlobalKey<FormState> formKey;

  LoginController({
    required this.ref,
    required this.formKey,
  });
}
