# Script de sauvegarde de la partition EFI

Sur mon hackintosh, je clone le SSD principal toutes les nuits avec Carbon Copy Cloner. Toutefois, cette sauvegarde ignore la partition EFI, où se trouvent des éléments très importants.

Le script `EFI.sh` sauvegarde la partition EFI sous la forme d'un DMG stocké dans un dossier. Il supprime aussi les sauvegardes les plus anciennes (plus de 10&nbsp;jours). 

Pour l'activer automatiquement, le fichier `com.nicolinux.backupEFI.plist` est activé comme un LaunchDaemon qui lance le script tous les jours à minuit.

## Installation

⚠️ Ouvrez le fichier `com.nicolinux.backupEFI.plist` pour modifier le chemin d'accès au script (ligne 12). ⚠️

- Déplacez le fichier dans `com.nicolinux.backupEFI.plist` :
	sudo mv com.nicolinux.backupEFI.plist /System/Library/LaunchDaemons/
- Correction des autorisations : 
	sudo chown root /System/Library/LaunchDaemons/com.nicolinux.backupEFI.plist
	sudo chgrp wheel /System/Library/LaunchDaemons/com.nicolinux.backupEFI.plist
- Activation ;
	sudo launchctl load -w /System/Library/LaunchDaemons/com.nicolinux.backupEFI.plist


## Sources : 

- Idée originale : macomaniac http://www.macg.co/comment/1647454#comment-1647454
- Fichier plist : http://superuser.com/questions/126907/how-can-i-get-a-script-to-run-every-day-on-mac-os-x
- Autorisations plist : http://stackoverflow.com/a/28157098
