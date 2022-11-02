# Inhalt

- [Inhalt](#inhalt)
  - [Verwendung von KIM](#verwendung-von-kim)
  - [KIM Dienstkennungen](#kim-dienstkennungen)
  - [KIM Datenübertragung](#kim-datenübertragung)
  - [KIM Textueller Inhalt](#kim-textueller-inhalt)
  - [KIM Betreff](#kim-betreff)
  - [KIM Nachrichten-Header](#kim-nachrichten-header)
  - [KIM Nachrichten-Anhänge](#kim-nachrichten-anhänge)
  - [KIM Beispielnachricht](#kim-beispielnachricht)

## Verwendung von KIM

Die Übertragung der Daten bzw. der Anfrage erfolgt via KIM. Dabei sind drei Nachrichtentypen zu unterscheiden:

- Anfrage des Leistungserbringers bei der Kasse nach Daten eines Versicherten (eEB Anfrage)
- Übermittlung der Daten eines Versicherten von der Kasse zum Leistungserbringer (eEB Bescheinigung)
- Rückgabe einer Fehlermeldung (eEB Fehler)

## KIM Dienstkennungen

Dienstkennungen in KIM-Nachrichten kennzeichnen den transportierten Inhalt für das Empfangssystem. Diese erlauben damit eine Dunkelverarbeitung bei Nachrichtenempfang und ggfs. die vollautomatisierte Erstellung und den Versand einer Antwortnachricht.

|Anwendung                          |elektronische Ersatzbescheinigung (eEB)|
|:--------                          |:--------------------------------------|
|Verantwortlich                     |gematik                                |
|Anwendungsbeschreibung             |Ersatzverfahren zur Übertragung der Versichertenstammdaten (VSD) von einer Krankenkasse zu einem Leistungserbringer|
|Dienstkennung & Kurzbeschreibung|**eEB;Anfrage;V1.0** <br /> Nachrichten-Typ: Anfragedaten zum Erhalt von Versichertendaten <br /> Verwendung: Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken <br /><br />  **eEB;Bescheinigung;V1.0** <br /> Nachrichten-Typ: Versichertendaten in verschiedenen Ausprägungen <br /> Verwendung: Krankenkassen <br /> <br /> **eEB;Fehler;V1.0** <br /> Nachrichten-Typ: Fehlermeldung bzgl. der Ermittlung der Daten des Versicherten <br />  Verwendung: Krankenkassen |

## KIM Datenübertragung

Die FHIR-Datensätze in Anfrage- und Antwortnachrichten werden ausschließlich als Anhang in der KIM Nachricht übertragen.
**siehe unten**

## KIM Textueller Inhalt

Der textuelle Inhalt der KIM Nachricht kann vom Empfänger ignoriert werden bzw. dem Sender werden keine Vorgaben gemacht, ob
oder wie diese zu befüllen sind.

Es wird empfohlen, dass die von den Krankenkassen erzeugten Nachrichten einen menschenlesbaren Text enthalten, falls die Systeme des empfangenden Leistungserbringers die Dienstkennung nicht verarbeiten können.

So könnte z.B. in einer Bescheinigung mit Daten stehen "Die versicherte Person \<Vorname Nachname> ist uns bekannt. Im Anhang
befinden sich die aktuellen Daten des Versicherten aus unserem System". Bei einer Fehlernachricht könnte z.B. der Text enthalten sein
"Zu den Daten aus ihrer Anfrage XXX vom DD.MM.YYYY konnten wir in unserem System keine Daten ermitteln".

## KIM Betreff

Der Betreff der KIM-Nachricht ist je Dienstkennung folgendermaßen aufzubauen:

|Dienstkennung          |Betreff|
|-------------          |-------|
|eEB;Anfrage;V1.0       |<E,T>EEB0_ANF_\<UUID> |
|eEB;Bescheinigung;V1.0 |<E,T>EEB0_BES_\<UUID> <br /> Hinweis: In der Response-FHIR Nachricht wird der Bundle-Identifier des Requests referenziert (Korrelation) |
|eEB;Fehler;V1.0        |<E,T>EEB0_FEH_\<UUID> <br /> Hinweis: In der Response-FHIR Nachricht wird der Bundle-Identifier des Requests  referenziert (Korrelation)|

## KIM Nachrichten-Header

Folgende E-Mail-Header sind jeder KIM-Nachricht hinzuzufügen:

|Header                 |Wert                                   |
|---------------------- |-------------------------------------- |
|X-KIM-Sendersystem     |\<PVS/KK Bezeichnung>;\<Release-Version> |
|X-KIM-Ursprungssystem  |\<PVS Bezeichnung>;\<Release-Version>    |
|X-KIM-Dienstkennung    |\<Dienstkennung>                        |
|X-KIM-Fehlercode       |\<Code>                                 |

## KIM Nachrichten-Anhänge

Je nach Dienstkennung (Nachrichtentyp) sind folgende Anhänge mit zu übermitteln:

| Dienstkennung          | Anhang                    |
|------------------------|---------------------------|
| eEB;Anfrage;V1.0       | <E,T>EEB0_ANF_\<UUID>.xml |
| eEB;Bescheinigung;V1.0 | <E,T>EEB0_BES_\<UUID>.xml |
| eEB;Fehler;V1.0        | <E,T>EEB0_FEH_\<UUID>.xml |

Die jeweilige XML-Datei enthält die zum Nachrichtentyp passende FHIR-Ressource.
Die XML-Datei wird im Anhang in einem base64-codierten MIME-Segment übertragen.
Das Segment muss die folgenden Metainformationen enthalten:

- Content-Type: application/xml
- Content-Transfer-Encoding: base64
- Content-Disposition: attachment
- Content-Description: KIM\<FHIR-ProfilName>.xml

## KIM Beispielnachricht

wird nachgeliefert
