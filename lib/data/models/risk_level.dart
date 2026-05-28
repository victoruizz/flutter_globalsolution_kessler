enum RiskLevel {
  baixo('Baixo'),
  medio('Médio'),
  alto('Alto'),
  critico('Crítico');

  const RiskLevel(this.label);
  final String label;
}
