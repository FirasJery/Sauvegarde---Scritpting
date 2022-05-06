#!/bin/bash

show_usage(){
  echo "sauvegarde.sh: [-h][-g][-m][-v][-n][-r][-a][-s] chemin..."
}

help(){
  cat help.txt
}

sizeModified24(){
  find /home/penguin/ -mtime -1 -exec du -ch {} + | grep total
  nb=$(find /home/penguin/ -mtime -1 | wc -l)
  echo "$nb fichiers modifiées dans les dernières 24 heures."
}

zipLast24(){
  #find /home/penguin/Desktop/Project/Scripting/ -mtime -1 -execdir zip 'Archive'.zip {} +
  #zip -d Archive.zip .zip
  #zip -d Archive.zip .zip.zip
  #zip -d Archive.zip .zip.zip.zip
  t=$(date +"%d-%m-%y %T")
  find /home/penguin/Desktop/Project/Scripting/ -mtime -1 -execdir tar -czvf "Archive".tar.gz {} +
  echo $t > time.txt
  mv Archive.tar.gz "$t.tar.gz"
  #tar -vf Archive.tar --delete ./.zip
}

Menu(){
  select item in "Afficher les fichiers modifiés dans les dernières 24 heures" "Archiver les fichiers modifiés" "Renommer l'archive" "Help" "Usage" "Version" "Quit"
  do
    echo "Vouz avez choisi l'item $REPLY: $item"
    case $REPLY in
      1)
        sizeModified24
        ;;
      2)
        zipLast24
        ;;
      3)
        renameTar
        ;;
      4)
        help
        ;;
      5)
        show_usage
        ;;
      6)
        version
        ;;
      7)
        exit 0
        ;;
      *)
        echo "Default"
        ;;
    esac
  done
}

renameTar(){
  t=$(date +"%d-%m-%y %T")
  old=$(cat /home/penguin/Desktop/Project/Scripting/time.txt)
  mv "$old.tar.gz" "$t.tar.gz"
}

version(){
  echo "Projet Shell - Khalil Khemiri - Firas ElJary"
  echo "version 0.1"
  echo "https://github.com/FirasJery/Sauvegarde---Scritpting.git"
}

echo "Memes"
