# Réponses aux Questions de Réflexion - TP N°2

### Exercice 2.1
chmod 644 attribue les permissions rw-r--r--. Le propriétaire a les droits de lecture et d'écriture, mais le fichier n'est pas exécutable par son propriétaire car le bit d'exécution (x) est absent.

### Exercice 2.2
Les guillemets protègent le script si la variable $UTILISATION est vide ou non définie, évitant ainsi une erreur de syntaxe Bash.

### Exercice 2.3
Sans set -Eeuo pipefail, Bash ignore l'échec de la commande tar et continue l'exécution des lignes suivantes malgré l'erreur.

### Exercice 2.4
cron s'exécute dans un environnement shell minimal avec un dossier de travail par défaut différent. Il ne peut donc pas résoudre les chemins relatifs.

### Exercice 2.5
Pour un vrai pipeline CI, on ajouterait une analyse statique (linter), des tests unitaires et un build Docker. Les défaillances (échec du clone, erreurs de syntaxe, échecs de test) doivent être gérées via des codes de retour non nuls (exit 1) pour interrompre le pipeline.
