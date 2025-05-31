# 📱 Training_dz

Ce projet Flutter est une application mobile développée avec [Flutter](https://flutter.dev/) qui fonctionne sur Android, iOS, et le web. Ce README explique comment cloner le projet, l’installer et le lancer en local.

---

## 🚀 Prérequis

Avant de commencer, assurez-vous d'avoir les outils suivants installés :

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Android Studio](https://developer.android.com/studio) ou [Visual Studio Code](https://code.visualstudio.com/) avec le plugin Flutter
- [Git](https://git-scm.com/)
- Un **émulateur Android/iOS** ou un **téléphone physique** en mode développeur

---

## 🧾 Installation

1. **Cloner le dépôt**
   ```bash
   git clone https://github.com/NoureddineK/training_dz
   cd training_dz 
2. **Installer les dépendances**
    ```bash 
    flutter pub get
3. **▶️ Lancement de l'application**
📱 Sur un téléphone ou un émulateur :
Connectez un appareil ou démarrez un émulateur :
    ```bash 
    flutter devices
- Lancez sur navigateur :
  ```bash 
    flutter run -d chrome
- Lancez sur windows :
  ```bash 
    flutter run -d windows
- Lancez sur smartphone physique :
    ```bash 
    flutter run -d ID_TELEPHONE
4. **🛠️ Structure du projet**
```text 
/lib
 ├── main.dart         # Point d'entrée de l'application
 ├── screens/          # Écrans principaux
 ├── widgets/          # Composants réutilisables
 ├── models/           # Models de données
 └── services/         # Appels API, logique métier, etc.



fix user + signup page + login page if not the user error.
add stadium + logout.

Refactoriser l’app précédente :asset
•	Créer un dossier models, providers, screens, widgets
•	Séparer les responsabilités : UI, logique métier, données

dart run build_runner build --delete-conflicting-outputs