import 'package:angular2/angular2.dart' show Component, View;
import 'package:grassykb/components/search_page_component.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [SearchPage])
class App {}