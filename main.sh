#!/bin/bash
source fonctions.sh

while getopts "narmh" option
do
  echo "Getopts a trouvé $option"
  case $option in
    n)
      sizeModified24
      ;;
    a)
      zipLast24
      ;;
    r)
      renameTar
      ;;
    m)
      Menu
      ;;
    v)
      version
      ;;
    h)
      help
      ;;
    *)
      show_usage
      ;;
  esac
done
exit 0
