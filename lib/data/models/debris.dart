import 'risk_level.dart';

class Debris {
  final String id;
  final String name;
  final String countryOfOrigin;
  final int launchYear;
  final double altitudeKm;
  final double massKg;
  final double orbitalInclinationDegrees;
  final String type;
  final RiskLevel riskLevel;
  final String originMission;
  final String story;

  const Debris({
    required this.id,
    required this.name,
    required this.countryOfOrigin,
    required this.launchYear,
    required this.altitudeKm,
    required this.massKg,
    required this.orbitalInclinationDegrees,
    required this.type,
    required this.riskLevel,
    required this.originMission,
    required this.story,
  });
}
