import 'package:angular2/angular2.dart' show Component, View;
import 'package:grassykb/components/pirate_badge_component.dart';

@Component(
    selector: 'app',
    template: '''
    <h1>Pirate badge</h1>
    <pirate-badge></pirate-badge>
    ''',
    directives: const [PirateBadge])
class App {}