import 'dart:math' show Random;

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:grassykb/app.dart';
import 'package:grassykb/services/search_service.dart';

// This app began as a fork of https://github.com/ng2-dart-samples/pirate-badge
// TODO: Strip down to shell, build up as search engine TODONE: refactor components

main() => bootstrap(
    App, [provide(Random, useValue: new Random()), SearchService]);