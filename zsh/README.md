# README

Partage de ma configuration Zsh

## Alias

Le fichier `aliases` contient mes alias ZSH.

Pour l'utiliser, il suffit d'ajouter la ligne suivante dans le fichier `~/.zshrc` :

```bash
. /path/to/repo/Save/zsh/aliases
```

## Themes

Le dossier `themes` contient des thèmes Oh-My-Zsh personnalisé

Pour utiliser un thème, il faut créer un lien symbolique de ce thème dans le dossier `~/.oh-my-zsh/themes/` :

```bash
ln -s /path/to/repo/Save/zsh/themes/mikaelrandy.zsh-theme ~/.oh-my-zsh/themes
```
Puis modifier le fichier `~/.zshrc` et modifier la ligne suivant :

```bash
ZSH_THEME="mikaelrandy"
```
