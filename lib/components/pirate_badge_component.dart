import 'package:angular2/angular2.dart' show Component, OnInit, View;

@Component(selector: 'pirate-badge', templateUrl: 'pirate_badge_component.html')
class PirateBadge implements OnInit {
  String badgeName = "";
  String buttonText = "Aye! Gimme a name!";
  bool enableButton = false;
  bool enableInput = false;

  final PirateNameService _pirateService;

  PirateBadge(this._pirateService);

  ngOnInit() async {
    try {
      await _pirateService.readyThePirates();
      // on success
      enableButton = true;
      enableInput = true;
    } catch (arrr) {
      badgeName = 'Arrr! No names.';
      print('Error initializing pirate names: $arrr');
    }
  }

  void generateBadge() {
    badgeName = _pirateService.getPirateName();
  }

  void updateBadge(String inputName) {
    badgeName = _pirateService.getPirateName(firstName: inputName);
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