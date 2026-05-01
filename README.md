# AfrikDoc - Système de Gestion Médicale (S5J4)

## 📝 Présentation
AfrikDoc est le back-end d'une application de prise de rendez-vous médicaux inspirée de Doctolib. Ce projet met en pratique des relations **1-N** (Villes/Docteurs) et **N-N** (Docteurs/Spécialités via une table de jointure).

## 🚀 Installation et Utilisation
Si vous téléchargez ou clonez ce dépôt, voici la marche à suivre pour le faire fonctionner sur votre machine :

**Installer les dépendances :**
   ```bash
   bundle install
   ```

1- **Préparer la base de données** : ActiveRecord va transformer les fichiers de migration en tables SQLite.

2- **Peupler la base (Seed)** : Le fichier ```db/seeds.rb``` utilise la gem Faker pour créer des données réalistes (docteurs, patients, villes, spécialités).

3- **Tester en console** : Pour vérifier les liens entre les modèles, lancez :

4- Exemple : ```Doctor.first.patients``` ou ```Specialty.last.doctors.```

### 🛠 Architecture
**Modèles** : Doctor, Patient, Appointment, City, Specialty, JoinTableDoctorSpecialty.

**Associations** : ```has_many :through``` pour les spécialités et les rendez-vous.
