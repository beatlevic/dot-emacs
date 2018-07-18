# Emacs configuration

My .emacs.d configuration for MacOS

# Install on MacOS

```bash
brew tap railwaycat/emacsmacport
brew install emacs-mac
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications
brew install ack
git clone git@github.com:beatlevic/dot-emacs.git ~/.emacs.d
```

# Change font thickness in emacs

[link](https://emacs.stackexchange.com/questions/14890/antialising-of-light-text-on-dark-too-heavy-os-x-10-10)

```bash
defaults write org.gnu.Emacs AppleFontSmoothing -int 5
```
