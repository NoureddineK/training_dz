void setExamples() {
  Set<String> langages = {'Dart', 'Python', 'JavaScript'};

  // Ajouter un élément
  langages.add('Go');

  // Tenter d'ajouter un doublon
  langages.add('Dart'); // Ignoré

  // Supprimer un élément
  langages.remove('Python');

  // Vérifier la présence
  bool contientDart = langages.contains('Dart');

  // Parcourir le Set
  for (var langage in langages) {
    print(langage);
  }

  // Union & intersection
  var autres = {'C++', 'Dart'};
  var union = langages.union(autres);
  var intersection = langages.intersection(autres);

  print('Union: $union');
  print('Intersection: $intersection');
}
