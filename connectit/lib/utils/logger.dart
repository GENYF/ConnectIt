import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    lineLength: 160,
    colors: false,
    printEmojis: true,
    noBoxingByDefault: false,
  ),
);
