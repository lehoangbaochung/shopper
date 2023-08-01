import 'dart:math';

import 'package:flutter/material.dart';

import 'bloc/app_page.dart' as bloc;
import 'getx/app_page.dart' as getx;

void main() {
  runApp(Random.secure().nextBool() ? const getx.AppPage() : const bloc.AppPage());
}
