# Laboratoire de Cyberdéfense : Déploiement d'un IDS Suricata et Simulation d'Attaques Web

Ce projet documente la mise en place d'un environnement de test virtualisé dédié à la sécurité offensive et défensive. L'objectif est de simuler une attaque par injection SQL contre une application web vulnérable située dans une zone démilitarisée (DMZ), puis de configurer, optimiser et personnaliser un système de détection d'intrusion (IDS) Suricata afin d'identifier et d'analyser les flux malveillants.

---

## Architecture Réseau et Topologie

L'infrastructure est entièrement virtualisée sous Oracle VirtualBox et segmentée par un pare-feu/routeur pfSense (Version 2.8.1).

| Composant | Interface pfSense | Adresse IP | Rôle et Positionnement |
| :--- | :--- | :--- | :--- |
| **Hôte Attaquant** | `em1` (LAN) | `192.168.10.50` | Machine physique (Hôte Windows) / Auditeur |
| **Passerelle pfSense** | - | `192.168.10.1` \| `10.0.0.1` | Routeur / Pare-feu d'interconnexion |
| **Cible (Metasploitable)** | `em2` (OPT1) | `10.0.0.100` | Serveur Web en DMZ hébergeant l'application DVWA |

### Configuration et Optimisation des Interfaces
Pour garantir une inspection approfondie et fiable des paquets par le moteur d'analyse, les configurations suivantes ont été appliquées :

* **Routage Statique (Hôte Windows) :** Injection d'une route élastique via l'invite de commandes de l'hôte afin d'atteindre le sous-réseau de la DMZ à travers la passerelle pfSense :
  ```cmd
  route add 10.0.0.0 mask 255.255.255.0 192.168.10.1
