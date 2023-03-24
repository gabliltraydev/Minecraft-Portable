# Comment faire votre propre version de minecraft custom ?

Vous voulez mettre une version déjà crée ou encore une avec des mods préinstallés ? Alors ce tuto est la pour vous.

## 1. Si vous voulez du vanilla en dessous de la 1.17 
  - Téléchargez [ces fichiers](https://github.com/gabliltraydev/Minecraft-Portable/tree/main/Version%20de%20Base)
  - Supprimez le fichier "readme.md"
  - Faites "Win+R" et tapez "%appdata%/.minecraft"
  - Supprimez tous ce qui est présent dans ce dossier **(attention, cela effaçera toutes vos sauvegardes ainsi que vos options de jeu si vous utilisez le launcher minecraft ou un client tierce comme BadLion, LunarClient... Si vous ne voulez pas tout perdre, sauvegardez tout dans un autre dossier avant de tout supprimer du dossier .minecraft)**
  - Allez sur le launcher et créez une nouvelle configuration avec la version de minecraft qui vous intéresse
  - Lancez cette version
  - Retournez dans "%appdata%/.minecraft"
  - Copiez le dossier assets, libraries et le dossier versions
  - Retournez dans le dossier contenant le .bat de lancement et collez les 3 dossiers copiés au dessus
  - Faites clic-droit ; modifier sur le fichier "jeu.bat"
 - Vous allez devoir modifier plusieurs lignes :
- Déjà, vous allez devoir [trouver les natives pour votre version de minecraft](https://soon) et les mettres dans le dossier 'versions/[numéro_de_version]/natives'
 Le chemin précédent ('versions/[numéro_de_version]/natives'), vous allez devoir le mettre sur la ligne "SET LIBRARIES=" (exemple : SET LIBRARIES=versions/1.12.2/natives)
- **Ne pas toucher la ligne** "SET MAIN_CLASS=net.minecraft.client.main.Main", si vous restez en vanilla vous n'aurez pas à la changer
- Attention, grosse partie. La ligne "SET CLASSPATH=libs" ressence toutes les librairies de minecraft. Donc il va falloir prendre, une par une, toutes les librairies et les mettres à la suite séparées d'un point virgule, sans en oublier bien évidemment.
Pour voir à quoi ça ressemble une fois toutes les libraries mises à la suite, direction [ce site](https://github.com/gabliltraydev/Minecraft-Portable/blob/main/Vanilla%201.8.9/jeu.bat). les libraries une fois mises les unes après les autres ressembleron à ça : "libraries\truc\machin\chose\e.jar;libraires\bidule\chpquoi\unchemin\j.jar;" et ce jusqu'a la fin de toutes les libraries... Bon courage à vous, c'est la partie la plus dure.
- Ensuite, téléportons nous à la fin du document sur la ligne 'start ""...' 
- Au '--version version' remplacez le 2ème version par la version de vôtre jeu (par exemple : "--version 1.12.2")
- Au '--assetIndex version', rempalcez le version par la version de votre jeu **⚠ sans l'extention de version ⚠** (par exemple : "--assetIndex 1.12")
- Et voilà, votre version personnalisée vanilla en dessous de la 1.17 est prêt, vous n'aver plus quàa retourner sur le tuto du launcher afin de l'intégrer à votre launcher !

 
