import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Enums/enum.dart';
import 'package:template/core/Utilities/Helpers/selection.dart';

final interestsVM = ChangeNotifierProvider((ref) => InterestsViewModel());

class InterestsViewModel with ChangeNotifier {
  ValueNotifier<List<SelectableItems<Interests>>> selectedInterests =
      ValueNotifier([]);

  void incrementInterestList(SelectableItems<Interests> interest) {
    if (selectedInterests.value.length == 6) {
      selectedInterests.value.removeLast();
    }
    selectedInterests.value.add(interest);
    selectedInterests.notifyListeners();
  }

  void decrementList() {
    if (selectedInterests.value.isEmpty) {
      return;
    }
    selectedInterests.value.removeLast();

    selectedInterests.notifyListeners();
  }
}
