---
parent:
---
# Inhalt

- [Inhalt](#inhalt)
- [Häufig gestellte Fragen zu Backendsystem und KIM](#häufig-gestellte-fragen-zu-backendsystem-und-kim)
  - [Soll die Adresse der versicherten Person (VP) oder des Versicherungsnehmers (VN) übergeben werden?](#soll-die-adresse-der-versicherten-person-vp-oder-des-versicherungsnehmers-vn-übergeben-werden)
  - [Was ist beim Versand der KIM-Nachrichten zu beachten?](#was-ist-beim-versand-der-kim-nachrichten-zu-beachten)
  - [Führen Anpassungen von Daten im Primärsystem auch zu einer Datenanpassung beim Versicherungsunternehmen?](#führen-anpassungen-von-daten-im-primärsystem-auch-zu-einer-datenanpassung-beim-versicherungsunternehmen)
  - [Welcher Text soll in der KIM-Nachricht stehen?](#welcher-text-soll-in-der-kim-nachricht-stehen)

Private Krankenversicherungen – bzw. Dienstleister in ihrem Auftrag – beziehen die für den Online Check-in notwendigen Daten des Versicherten aus ihrem Backenendsystem und erstellen daraus eine KIM-Nachricht mit einem standardisierten Datensatz. Für diesen wird das `VSD-Schema` für gesetzlich Versicherte genutzt.

Da bei Privatversicherten aber nicht alle Informationen für die Befüllung der Pflichtfelder vorliegen und relevant sind, kommen bei einigen Feldern Ersatzwerte zum Einsatz, die auf der Unterseite der FHIR-Profile {{pagelink:Einfuehrung/Interoperabilitaetsvorgaben/FHIR-Profile/pkvvsd.page.md}} angegeben sind.

# Häufig gestellte Fragen zu Backendsystem und KIM

## Soll die Adresse der versicherten Person (VP) oder des Versicherungsnehmers (VN) übergeben werden?

Optimalerweise wird die Adresse der VP übergeben. Ist nur die Adresse des VN hinterlegt, kann diese beim Online Check-In übergeben werden. Eventuelle Abweichungen werden als akzeptabel erachtet, zumal die Problematik bereits bei Karten für Privatversicherte besteht. Ggf. kann das Praxispersonal die Adresse im PS anpassen. Zudem bietet auch die E-Rezept-App die Möglichkeit an, die Lieferadresse zu editieren, damit Arzneimittel an die erwünschte Adresse versendet werden.

## Was ist beim Versand der KIM-Nachrichten zu beachten?

- Ausgehende Nachrichten sollten validiert werden, um Fehler zu vermeiden. Außerdem muss der Versand so gestaltet sein, dass es nicht zu vermeidbaren zeitlichen Verzögerungen kommt, die den Gesamtprozess verlängern.
- Beim Versand der Bescheinigung mit der KIM-Nachricht ist im EEBMessageHeader hinterlegt (s. Element eventCoding), ob die Anfrage von einem Leistungserbringer per KIM oder vom Versicherten via App angefordert wurde. Da die Anfrage beim Online Check-in für Privatversicherte immer per App kommt, wird  das optionale Element response weggelassen, mit dem ansonsten die Referenz auf die vorangegangene EEB-Anfrage via KIM gegeben wäre.

## Führen Anpassungen von Daten im Primärsystem auch zu einer Datenanpassung beim Versicherungsunternehmen?

Nein, für den Prozess ist kein "Rückweg" vorgesehen. Versicherte müssen ihr Versicherungsunternehmen selbst auf Änderungen aufmerksam machen. Eine Anzeige der zu übermittelnden Daten kann jedoch dazu beitragen, dass Versicherte auf veraltete Daten aufmerksam werden.

## Welcher Text soll in der KIM-Nachricht stehen?

Für eine bessere Unterscheidbarkeit der Nachrichten zum eEB-Verfahren sowie zum Online Check-in empfiehlt es sich, den Text in der KIM-Nachricht auf den Online Check-in zu beziehen. Textvorschlag:

> Guten Tag,
>
> bei dieser Nachricht handelt es sich um eine Datenübermittlung für den Online Check-In einer privatversicherten Person.
