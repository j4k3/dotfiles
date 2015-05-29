#!/usr/bin/env bash

sudo -v

# "Resume" ausschalten: beim erneuten Start von Programmen nicht den vorherigen Zustand wiederherstellen (bsp. Fenster und Tabs der Safari-Session, geöffnete Dokumente, ...)
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Systemweit die Autokorrektur deaktivieren
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Sofort nachdem der Bildschirmschoner aktiv wird nach dem Passwort fragen
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Bildschirmfotos standardmäßig auf dem Desktop ablegen 
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Finder: Beenden-Menüeintrag zeigen und Statusleiste einblenden
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Textauswahl in Quicklook
defaults write com.apple.finder QLEnableTextSelection -bool true

# Spotlight im Finder: Nur im aktuellen Ordner als Standard
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Diskimages nicht vor dem mounten prüfen
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Listenansicht im Finder als Standard
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Papierkorb sicher entleeren
defaults write com.apple.finder EmptyTrashSecurely -bool true

# In Mail alle Animationen abschalten und Mail-Adressen im Klarformat anzeigen
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# In TextEdit neue Dateien standardmäßig als Text, nicht Richtext anlegen
defaults write com.apple.TextEdit RichText -int 0

# Erweiterte Optionen im Festplattendienstprogramm anzeigen
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Scrollbalken immer anzeigen
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Erweiterte Speichern- und Drucken-Dialoge zeigen
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Neue Dokumente standardmäßig immer lokal speichern, nicht in der iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Alle Druckerprogramme beenden, wenn der Druckauftrag erfolgreich abgeschlossen ist
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null

# Automatische Korrektur nach typografischen Anführungszeichen und Gedankenstrichen deaktivieren
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Volle Tastatursteuerung freigeben (mit Tab zur nächsten Schaltfläche, mit Enter auslösen)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Schnellere Tastenwiederholrate
defaults write NSGlobalDomain KeyRepeat -int 0

# Icons im Dock auf 32 pixel setzen - Exponenzen von 2 rendern besonders scharf
defaults write com.apple.dock tilesize -int 32

# Indikatoren für laufende Programme im Dock zeigen
defaults write com.apple.dock show-process-indicators -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true



# Safari: leere Startseite, Devug- und Dev-Menue
defaults write com.apple.Safari HomePage -string "about:blank"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Suchqueries nicht an Apple senden
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Mit Tab zwischen Schaltflächen wecheln
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Ganze URL in der Adressleiste anzeigen
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# 'Sichere' Downloads nicht automatisch öffnen
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false



# Neu verbundene Volumes nicht automatisch indizieren
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
# Nur Programme, Ordner und Systemeinstellungen suchen
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 0;"name" = "PDF";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
# Neue Einstellungen in den Indexer laden
killall mds > /dev/null 2>&1
# Indexing auf dem Hauptvolume aktivieren
sudo mdutil -i on / > /dev/null
# Index neu aufbauen
sudo mdutil -E / > /dev/null
