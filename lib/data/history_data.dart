import '../models/history_model.dart';
import 'history_greek_1.dart';
import 'history_greek_2.dart';
import 'history_egyptian.dart';
import 'history_egyptian_2.dart';
import 'history_nordic.dart';
import 'history_hindu_1.dart';
import 'history_hindu_2.dart';
import 'history_chinese_1.dart';
import 'history_chinese_2.dart';
import 'history_japanese_1.dart';
import 'history_japanese_2.dart';

/// All iconic mythological events, grouped by pantheon and combined into a
/// single flat list for the History feature.
final List<MythStory> historyData = [
  ...greekHistory1,
  ...greekHistory2,
  ...egyptianHistory,
  ...egyptianHistory2,
  ...nordicHistory,
  ...hinduHistory1,
  ...hinduHistory2,
  ...chineseHistory1,
  ...chineseHistory2,
  ...japaneseHistory1,
  ...japaneseHistory2,
];
