# 💼 NLP2SQL avec Mistral Large 2

Ce projet démontre l’intégration d’un **agent IA Mistral (Mistral Large 2)** avec une base de données MySQL d’entreprise, permettant d’interroger les données en **langage naturel** et d’obtenir automatiquement des requêtes SQL exécutées en temps réel.

---

## 🎯 Objectif
L’objectif est de créer un démonstrateur clair et convaincant, adapté au monde **corporate**, qui illustre la puissance de l’IA appliquée à la **Business Intelligence** et aux bases relationnelles.  
Les utilisateurs peuvent poser des questions simples (par ex. *« Quels employés travaillent sur le projet Migration Système ERP ? »*) et obtenir des résultats sous forme de tableau structuré.

---

## 🏗️ Structure de la base de données
La base `entreprise` comporte 4 tables principales :

- **employe** : informations sur les employés (id, nom, prénom, service, poste)  
- **projet** : informations sur les projets (id, nom, budget, dates, statut)  
- **employe_projet** : table de liaison n–n entre employés et projets (rôle, taux d’allocation)  
- **tache** : tâches liées aux projets (description, statut, date d’échéance, assignation)

Un **trigger** permet de mettre automatiquement à jour le statut d’un projet en *Terminé* lorsque toutes ses tâches sont complétées.  
Une **procédure stockée** fournit des statistiques de progression par projet.

---

## ⚙️ Méthodologie
- Génération du **prompt système** (instructions pour l’agent IA)  
- Utilisation de **Mistral Large 2** comme moteur NLP2SQL (API `conversations`)  
- Interface utilisateur réalisée avec **Gradio**, permettant d’entrer une question et de visualiser le résultat sous forme de tableau.  
- Base de données MySQL locale, peuplée de données réalistes et corporate-friendly.  

---

## 📂 Arborescence du dépôt
```
NLP2SQL_project/
├── README.md                # Documentation principale (Français)
├── README_En.md             # Documentation traduite en anglais
├── code/                    # Scripts Python et prompts
│   ├── NLP2SQL.py           # Script principal (Gradio + API Mistral + MySQL)
│   ├── system_prompt.txt    # Prompt système pour l’agent IA
│   └── requete_NLP.txt      # Exemples de requêtes en langage naturel
├── database/                # Base de données MySQL
│   └── entreprise.sql       # Script SQL pour recréer la base
├── screenshots/             # Démonstrations visuelles
│   ├── NLP_in_action_1.gif  # Démo animée 1
│   ├── NLP_in_action_2.gif  # Démo animée 2
│   └── NLP_screenshot.png   # Capture fixe
```

---

## 📸 Aperçu
![Capture NLP2SQL](screenshots/NLP_screenshot.png)

---

## 🌍 Version anglaise
La version anglaise de ce README est disponible dans [README_En.md](README_En.md).
