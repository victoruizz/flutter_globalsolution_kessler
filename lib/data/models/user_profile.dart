enum Gender {
  masculino('Masculino'),
  feminino('Feminino'),
  outro('Outro');

  const Gender(this.label);
  final String label;
}

enum Country {
  brasil('Brasil'),
  eua('Estados Unidos'),
  china('China'),
  russia('Rússia'),
  outros('Outros');

  const Country(this.label);
  final String label;
}

class UserProfile {
  final String name;
  final Gender gender;
  final int age;
  final Country country;

  const UserProfile({
    required this.name,
    required this.gender,
    required this.age,
    required this.country,
  });
}
