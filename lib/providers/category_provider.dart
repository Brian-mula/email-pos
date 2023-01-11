import 'package:emailpos/logic/category_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = Provider<CategoryLogic>((ref) {
  return CategoryLogic();
});
