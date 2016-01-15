import 'dart:math';

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart' show bootstrap;

main() => bootstrap(
    App, [provide(Random, useValue: new Random()), PirateNameService]);