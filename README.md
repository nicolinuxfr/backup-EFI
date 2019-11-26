# Script de sauvegarde de la partition EFI

Sur mon hackintosh, je clone le SSD principal toutes les nuits avec Carbon Copy Cloner. Toutefois, cette sauvegarde ignore la partition EFI, où se trouvent des éléments très importants.

Le script `EFI.sh` sauvegarde la partition EFI sous la forme d'un DMG stocké dans un dossier. Il supprime aussi les sauvegardes les plus anciennes (plus de 10&nbsp;jours). 

Pour l'activer automatiquement, le fichier `com.nicolinux.backupEFI.plist` est activé comme un LaunchDaemon qui lance le script tous les jours à minuit.

## Préparation


- Modifiez le fichier `EFI.sh` pour changer le chemin de destination pour les sauvegardes ([ligne&nbsp;2](https://github.com/nicolinuxfr/backup-EFI/blob/master/EFI.sh#L2)). Choisissez ce que vous voulez, mais de préférence un dossier sauvegardé régulièrement.
- Ouvrez le fichier `com.nicolinux.backupEFI.plist` pour modifier le chemin d'accès au script ([ligne&nbsp;12](https://github.com/nicolinuxfr/backup-EFI/blob/master/com.nicolinux.backupEFI.plist#L12)). Vous pouvez placer le fichier `EFI.sh` n'importe où, mais gardez-le à un endroit où il ne sera supprimé par erreur. 


## Installation

**Note** : le script nécessite un accès root pour fonctionner, c'est pourquoi on le place dans la bibliothèque système.

- Déplacement du plist :

```	
	sudo mv com.nicolinux.backupEFI.plist /Library/LaunchDaemons/
```	

- Correction des autorisations : 

```	
	sudo chown root /Library/LaunchDaemons/com.nicolinux.backupEFI.plist
	sudo chgrp wheel /Library/LaunchDaemons/com.nicolinux.backupEFI.plist
```	

- Activation : 
	
```	
	sudo launchctl load -w /Library/LaunchDaemons/com.nicolinux.backupEFI.plist
```	

## Sources : 

- Idée originale : macomaniac http://www.macg.co/comment/1647454#comment-1647454
- Fichier plist : http://superuser.com/questions/126907/how-can-i-get-a-script-to-run-every-day-on-mac-os-x
- Autorisations plist : http://stackoverflow.com/a/28157098
