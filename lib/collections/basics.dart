void listExamples() {
  final fixedLengthList = List<int>.filled(5, 0);
  fixedLengthList.add(10);
  var list = [1, 2, 3]; // Type: List<int>
  list[0] = 4; //OK [4, 2, 3]

  var constantList = const [1, 2, 3];
  constantList[1] = 1; // Error

  List<String> fruits = ['Pomme', 'Banane', 'Mangue'];

  // Ajouter un élément
  fruits.add('Orange');

  // Ajouter plusieurs éléments
  fruits.addAll(['Ananas', 'Fraise']);

  // Supprimer un élément
  fruits.remove('Banane');
  fruits.forEach((e) => print(e));

  // Accéder à un élément
  print(fruits[0]); // 'Pomme'

  // Parcourir la liste
  for (var fruit in fruits) {
    print(fruit);
  }

  // Trier la liste
  fruits.sort();
  print(fruits);

  // Rechercher un élément
  bool contientMangue = fruits.contains('Mangue');
  print('Contient Mangue ? $contientMangue');
}
