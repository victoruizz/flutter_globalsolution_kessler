import 'package:flutter/foundation.dart';

import '../data/models/debris.dart';
import '../data/models/risk_level.dart';
import '../data/models/user_profile.dart';
import '../data/repositories/debris_repository.dart';

class AppState extends ChangeNotifier {
  RiskLevel? _selectedRisk;
  final Set<String> _monitoredIds = <String>{};
  UserProfile? _user;

  RiskLevel? get selectedRisk => _selectedRisk;

  Set<String> get monitoredIds => Set.unmodifiable(_monitoredIds);

  int get monitoredCount => _monitoredIds.length;

  UserProfile? get user => _user;

  void setUser(UserProfile profile) {
    _user = profile;
    notifyListeners();
  }

  List<Debris> get filteredDebris {
    final risk = _selectedRisk;
    if (risk == null) {
      return DebrisRepository.all;
    }
    return DebrisRepository.all
        .where((debris) => debris.riskLevel == risk)
        .toList(growable: false);
  }

  bool isMonitored(String id) => _monitoredIds.contains(id);

  void selectRisk(RiskLevel? risk) {
    if (_selectedRisk == risk) return;
    _selectedRisk = risk;
    notifyListeners();
  }

  void toggleMonitored(String id) {
    if (!_monitoredIds.add(id)) {
      _monitoredIds.remove(id);
    }
    notifyListeners();
  }
}
