import 'package:coba_riverpod/change_name_model.dart';
import 'package:coba_riverpod/riverpod_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Counter = ChangeNotifierProvider<CounterModel>((ref) {
  return CounterModel(value: 0);
});

final ChangeName = ChangeNotifierProvider<ChangeNameModel>((ref) {
  return ChangeNameModel(name: "its default name");
});
