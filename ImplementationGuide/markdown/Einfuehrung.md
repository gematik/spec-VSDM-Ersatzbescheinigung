# Inhalt

- [Inhalt](#inhalt)
  - [UseCase und Funktionsweise (GKV-Versicherte)](#usecase-und-funktionsweise-gkv-versicherte)
  - [UseCase und Funktionsweise (PKV-Versicherte)](#usecase-und-funktionsweise-pkv-versicherte)

## UseCase und Funktionsweise (GKV-Versicherte)

<plantuml>
@startuml gkv_ersatzverfahren
hide footbox
title Ersatzverfahren Bereitstellung VSD
actor Vers as "Versicherte" #ee8360
actor LE as "Praxis" #ee8360
participant PVS as "Primärsystem" #ee8360
participant KIMCM1 as "KIM-Clientmodul" #8da5c4
participant KIMFD as "KIM-Fachdienste" #8da5c4
participant KIMCM2 as "KIM-Clientmodul" #8da5c4
participant Kasse as "Krankenkasse (GKV)" #009a7c

Vers -> LE: "Ich habe meine\nGesundheitskarte\nnicht zur Hand"
LE -> PVS: VSDM Ersatzbescheinigung einholen
activate PVS #ee8360
PVS -> PVS: (1)
PVS -> KIMCM1: (2)
activate KIMCM1 #8da5c4
KIMCM1 -> KIMFD: (3)
deactivate KIMCM1
activate KIMFD #8da5c4
KIMFD -> KIMCM2: (4)
deactivate KIMFD
activate KIMCM2 #8da5c4
KIMCM2 -> Kasse: (5)
deactivate KIMCM2
activate Kasse #00907c
Kasse -> Kasse: (6)
Kasse -> KIMCM2: (7)
deactivate Kasse
activate KIMCM2 #8da5c4
KIMCM2 -> KIMFD: (8)
deactivate KIMCM2
activate KIMFD #8da5c4
KIMFD -> KIMCM1: (9)
deactivate KIMFD
activate KIMCM1 #8da5c4
KIMCM1 -> PVS: (10)
deactivate KIMCM1
PVS -> PVS: (11)
PVS --> LE: :Ersatzbescheinigung
deactivate PVS
LE -> Vers: "Kein Problem,\nihre Kasse hat\nuns soeben eine\nErsatzbescheinigung\ngeschickt"

@enduml
</plantuml>

## UseCase und Funktionsweise (PKV-Versicherte)

![Ablauf für PKV-Versicherte](../images/out/pkv_ersatzverfahren.png)
