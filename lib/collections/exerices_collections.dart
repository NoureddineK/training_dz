void exercice1() {
  List<double> nombres = [10.28, 20.5, 15, 5, 30];

  double somme = nombres.reduce((a, b) => a + b);
  double moyenne = somme / nombres.length;
  double max = nombres.reduce((a, b) => a > b ? a : b);

  print('Somme: $somme');
  print('Moyenne: $moyenne');
  print('Max: $max');
}

void exercice2() {
  Map<String, dynamic> utilisateur = {'nom': 'Alice', 'age': 28, 'email': 'alice@gmail.com'};

  print('Nom : ${utilisateur['nom']}, Âge : ${utilisateur['age']}, Email : ${utilisateur['email']}');
}

typedef Produit = Map<String, dynamic>;

void exercice3() {
  List<Map<String, dynamic>> produits = [
    {'nom': 'Stylo', 'prix': 2.5},
    {'nom': 'Cahier', 'prix': 4.0},
    {'nom': 'Clé USB', 'prix': 15.99},
  ];

  for (var produit in produits) {
    print('${produit['nom']} coûte ${produit['prix']}€');
  }
  print('-------------------2eme solution------------------------');
  Map<String, dynamic> produits2 = {'Stylo': 2.5, 'Cahier': 4.0, 'Clé USB': 15.99};
  produits2.forEach((key, value) => print("$key coûte $value €"));

  print('-------------------3eme solution------------------------');

  List<Produit> produits3 = [
    {'nom': 'Stylo', 'prix': 2.5},
    {'nom': 'Cahier', 'prix': 4.0},
    {'nom': 'Clé USB', 'prix': 15.99},
  ];

  for (Produit p in produits3) {
    print('${p['nom']} coûte ${p['prix']}€');
  }
}

void exercice4() {
  List<String> prenoms = ['Alice', 'Antoine', 'Bruno', 'Béatrice', 'Claire'];

  Map<String, List<String>> regroupement = {};

  for (var prenom in prenoms) {
    String lettre = prenom[0].toUpperCase();
    if (!regroupement.containsKey(lettre)) {
      regroupement[lettre] = [];
    }
    regroupement[lettre]!.add(prenom);
  }

  print(regroupement);
}

void exercice5() {
  List<String> items = ['pomme', 'banane', 'pomme', 'kiwi', 'banane'];

  List<String> sansDoublons = [];
  for (var item in items) {
    if (!sansDoublons.contains(item)) {
      sansDoublons.add(item);
    }
  }

  print(sansDoublons); // ['pomme', 'banane', 'kiwi']
}
