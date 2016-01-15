import 'package:angular2/angular2.dart' show Component, View;

@Component(
    selector: 'app',
    template: '''
    <h1>Pirate badge</h1>
    <pirate-badge></pirate-badge>
    ''',
    directives: const [PirateBadge])
class App {}