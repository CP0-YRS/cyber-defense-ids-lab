#!/bin/bash
# scan-nmap.sh - Commandes de reconnaissance et de cartographie réseau utilisées pendant le projet

echo "[+] Phase 1 : Découverte des hôtes actifs sur le réseau DMZ..."
nmap -sn 10.0.0.0/24

echo "[+] Phase 2 : Scan de vulnérabilités et détection de services sur la cible Metasploitable..."
# -sV : Détection des versions de services
# -sC : Utilisation des scripts par défaut (NSE)
# -O  : Détection du système d'exploitation
nmap -sV -sC -O -p 80,21,22,445 10.0.0.100 -oN scan-cible-metasploitable.txt

echo "[+] Scan terminé. Résultats exportés dans 'scan-cible-metasploitable.txt'"
