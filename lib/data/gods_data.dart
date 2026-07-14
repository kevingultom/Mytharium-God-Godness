import '../models/god_model.dart';
import 'greek_gods.dart';
import 'egyptian_gods.dart';
import 'nordic_gods.dart';
import 'hindu_gods.dart';
import 'chinese_gods.dart';
import 'japanese_gods.dart';

final List<God> godsData = [
  ...greekGods,
  ...egyptianGods,
  ...nordicGods,
  ...hinduGods,
  ...chineseGods,
  ...japaneseGods,
];
