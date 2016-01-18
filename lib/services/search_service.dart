import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:angular2/angular2.dart' show Injectable;

@Injectable()
class SearchService {
  // injected by DI
  final Random _indexGen;

  // those two will be filled after fetching the names from the server
  // using readyThePirates
  final List<String> _names = [];
  final List<String> _appellations = [];

  bool _piratesLoaded = false;

  SearchService(this._indexGen);

  Future readySources() async {
    final path = 'https://www.dartlang.org/codelabs/darrrt/files/'
        'piratenames.json';
    final jsonString = await HttpRequest.getString(path);
    final pirateNames = JSON.decode(jsonString);
    _names.addAll(pirateNames['names']);
    _appellations.addAll(pirateNames['appellations']);

    _piratesLoaded = true;
  }

  String getResults({String firstName, String appellation}) {
    if (!_piratesLoaded)
      throw new Exception('Wait for Future from readThePirates method to finish'
          'before asking for pirate names.');

    firstName ??= _names[_indexGen.nextInt(_names.length)];
    appellation ??= _appellations[_indexGen.nextInt(_appellations.length)];

    return firstName.isEmpty ? '' : '$firstName the $appellation';
  }
}