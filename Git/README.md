# README

Surcharge de configuration pour Git

## Installation

* S'assurer que le fichier `~/.gitconfig` existe
  * S'il n'existe pas, il suffit de configurer le nom et l'adresse mail :
    * `git config --global user.name "Mon nom"`
    * `git config --global user.email "mon.email@domaine.ext"`
* Dans le fichier `~/.gitconfig`, ajouter le bloc suivant pour inclure le fichier qui est dans ce repo

```
[core]
    include = /path/to/repo/Save/Git/.gitconfig
``` 

