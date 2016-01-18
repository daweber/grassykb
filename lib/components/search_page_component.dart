import 'package:angular2/angular2.dart' show Component, OnInit, View;
import 'package:grassykb/services/search_service.dart';

@Component(selector: 'search-page', templateUrl: 'search_page_component.html')
class SearchPage implements OnInit {
  String badgeName = "";
  String buttonText = "Aye! Gimme a name!";
  bool enableButton = false;
  bool enableInput = false;

  final SearchService _searchService;

  SearchPage(this._searchService);

  ngOnInit() async {
    try {
      await _searchService.readySources();
      // on success
      enableButton = true;
      enableInput = true;
    } catch (arrr) {
      badgeName = 'Arrr! No names.';
      print('Error initializing pirate names: $arrr');
    }
  }

  void generatePage() {
    badgeName = _searchService.getResults();
  }

  void updatePage(String inputName) {
    badgeName = _searchService.getResults(firstName: inputName);
    if (inputName
        .trim()
        .isEmpty) {
      buttonText = 'Aye! Gimme a name!';
      enableButton = true;
    } else {
      buttonText = 'Arrr! Write yer name!';
      enableButton = false;
    }
  }
}