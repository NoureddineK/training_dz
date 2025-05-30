import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🧠 Phrase d'accroche
                Text(
                  "Notre IA anticipe.\nVous capitalisez.",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, height: 1.4),
                ),
                SizedBox(height: 30),

                // 📊 Carte Contexte économique
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF0b1c2c),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Titre
                      Row(
                        children: [
                          Icon(Icons.bar_chart, color: Color(0xFF00C2D1)),
                          SizedBox(width: 8),
                          Text(
                            "Contexte :",
                            style: TextStyle(color: Color(0xFF87C8E5), fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Type de croissance
                      Text(
                        "Croissance modérée",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      // À favoriser
                      Row(
                        children: [
                          Icon(Icons.check, color: Color(0xFF00C2D1), size: 20),
                          SizedBox(width: 8),
                          Text(
                            "À favoriser : ",
                            style: TextStyle(color: Color(0xFF87C8E5), fontWeight: FontWeight.w500),
                          ),
                          Text("Tech, Santé", style: TextStyle(color: Color(0xFF00C2D1))),
                        ],
                      ),
                      SizedBox(height: 8),
                      // À éviter
                      Row(
                        children: [
                          Icon(Icons.warning_amber, color: Color(0xFF00C2D1), size: 20),
                          SizedBox(width: 8),
                          Text("À éviter : ", style: TextStyle(color: Color(0xFF87C8E5), fontWeight: FontWeight.w500)),
                          Text("Crypto", style: TextStyle(color: Color(0xFF00C2D1))),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Score de confiance
                      Row(
                        children: [
                          Icon(Icons.bubble_chart, color: Color(0xFF00C2D1), size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Score de confiance : ",
                            style: TextStyle(color: Color(0xFF87C8E5), fontWeight: FontWeight.w500),
                          ),
                          Text("87 %", style: TextStyle(color: Color(0xFF00C2D1))),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Bouton Voir les détails
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
                          },
                          child: Text(
                            "Voir les détails",
                            style: TextStyle(color: Color(0xFF00C2D1), fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                // 🏦 Budget
                Text(
                  "Quel est votre budget à investir ?",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(color: Color(0xFF0b1c2c), borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      hintText: "Entrez un montant",
                      hintStyle: TextStyle(color: Colors.white38),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Appelle la génération du portefeuille
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00C2D1),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: Text(
                      "Générer mon portefeuille",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Text(
                  "Choisissez votre style d’investissement :",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 12),

                Container(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      investmentCard("Sûr", "Rendement faible mais stable", "6–9 %", Color(0xFF2E8B57)),
                      investmentCard("Équilibré", "Bon ratio risque/rendement", "10–15 %", Color(0xFF3CAEA3)),
                      investmentCard("Risqué", "Volatilité haute mais gros potentiel", "20–35 %", Color(0xFFE57373)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget investmentCard(String title, String subtitle, String rendement, Color color) {
  return Container(
    width: 200,
    margin: EdgeInsets.only(right: 16),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 10),
        Text(subtitle, style: TextStyle(color: Colors.white70, fontSize: 14)),
        Spacer(),
        Text("Rendement estimé : $rendement", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      ],
    ),
  );
}

// Dummy details page for navigation
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1C2C),
      appBar: AppBar(backgroundColor: Color(0xFF102A43), title: Text("Détails du contexte")),
      body: Center(child: Text("Détails à venir...", style: TextStyle(color: Colors.white))),
    );
  }
}
