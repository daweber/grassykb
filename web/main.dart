import 'dart:math';

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:grassykb/app.dart';
import 'package:grassykb/services/pirate_name_service.dart';

main() => bootstrap(
    App, [provide(Random, useValue: new Random()), PirateNameService]);