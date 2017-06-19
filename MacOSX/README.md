# MacOS X installation

Détail de l'installation de base à faire sur une nouvelle machine MacOS X

## Default softwares

### Homebrew

Documentation officielle : https://brew.sh/index_fr.html

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Keep Your Mac Stuff Updated

NB : Librement inspiré de http://blog.welcomattic.com/kymsu/

```bash
brew install mas
ln -s /path/to/repo/Save/MacOSX/kymsu.sh /usr/local/bin/kymsu
```

Puis dans une nouvelle fenêtre, lancer la commande `kymsu`
