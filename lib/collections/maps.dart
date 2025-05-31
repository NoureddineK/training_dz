void mapExamples() {
  Map<String, String> paysCapitales = {'Algérie': 'Alger', 'France': 'Paris', 'Espagne': 'Madrid', 'Italie': 'Rome'};

  // Ajouter une nouvelle paire
  paysCapitales['Allemagne'] = 'Berlin';

  // Accéder à une valeur
  print(paysCapitales['Algérie']); // Alger

  // Supprimer une clé
  paysCapitales.remove('Espagne');

  // Parcourir la Map
  paysCapitales.forEach((pays, capitale) {
    print('$pays -> $capitale');
  });

  // Vérifier la présence d'une clé
  print(paysCapitales.containsKey('Italie')); // true

  // Récupérer les clés ou valeurs
  print(paysCapitales.keys.toList());
  print(paysCapitales.values);
}

void filterAndTransform() {
  List<int> nombres = [1, 2, 3, 4, 5, 6];

  // Filtrer (pair uniquement)
  var pairs = nombres.where((n) => n % 2 == 0).toList();

  // Transformer (carrés)
  var carres = nombres.map((n) => n * n).toList();

  print('Pairs: $pairs');
  print('Carrés: $carres');
}
