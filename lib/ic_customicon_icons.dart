// Place fonts/ic_customicon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: ic_customicon
//      fonts:
//       - asset: fonts/ic_customicon.ttf
import 'package:flutter/widgets.dart';

class Customicon {
  Customicon._();

  static const String _fontFamily = 'customicon';

  static const IconData Home = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData Activity = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData medical_jar = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData thermometer = IconData(0xe903, fontFamily: _fontFamily);
}
