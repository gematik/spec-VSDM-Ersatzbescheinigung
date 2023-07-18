---
parent:
---
# Inhalt

- [Inhalt](#inhalt)
- [Verwendung von KIM](#verwendung-von-kim)
- [KIM Dienstkennungen](#kim-dienstkennungen)
- [Übermittlungsbestätigung und Lesebestätigung](#übermittlungsbestätigung-und-lesebestätigung)
- [KIM Anfrage einer Ersatzbescheinigung](#kim-anfrage-einer-ersatzbescheinigung)
  - [KIM Anfrage Beispielnachricht](#kim-anfrage-beispielnachricht)
- [KIM Bescheinigung](#kim-bescheinigung)
  - [KIM Bescheinigung Beispielnachricht](#kim-bescheinigung-beispielnachricht)
- [KIM Fehlernachricht](#kim-fehlernachricht)
  - [KIM Fehler Beispielnachricht](#kim-fehler-beispielnachricht)

# Verwendung von KIM

Die Übertragung der Daten bzw. der Anfrage erfolgt via KIM. Dabei sind drei Nachrichtentypen zu unterscheiden:

- Anfrage des Leistungserbringers bei der Kasse nach Daten eines Versicherten (eEB Anfrage)
- Übermittlung der Daten eines Versicherten von der Kasse zum Leistungserbringer (eEB Bescheinigung) oder
- Rückgabe einer Fehlermeldung (eEB Fehler)

# KIM Dienstkennungen

Dienstkennungen in KIM-Nachrichten kennzeichnen den transportierten Inhalt für das Empfangssystem. Diese erlauben damit eine Dunkelverarbeitung bei Nachrichtenempfang und ggfs. die vollautomatisierte Erstellung und den Versand einer Antwortnachricht.

|Anwendung                          |elektronische Ersatzbescheinigung (eEB)|
|:--------                          |:--------------------------------------|
|Verantwortlich                     |gematik                                |
|Anwendungsbeschreibung             |Verfahren zur Übertragung von Versichertenstammdaten (VSD) aus einem PKV Versicherungsunternehmen und Erstzbescheinigung nach §19 Abs. 2 BMV von einer Gesetzlichen Krankenkasse zu einem Leistungserbringer|
|Dienstkennung & Kurzbeschreibung|**eEB;Anfrage;V1.0** <br /> Nachrichten-Typ: Anfragedaten zum Erhalt von Versichertendaten <br /> Verwendung: Vertragsärzte, Vertragszahnärzte, Krankenhäuser <br /><br />  **eEB;Bescheinigung;V1.0** <br /> Nachrichten-Typ: Versichertendaten in verschiedenen Ausprägungen <br /> Verwendung: Krankenkassen, Versicherungsunternehmen <br /> <br /> **eEB;Fehler;V1.0** <br /> Nachrichten-Typ: Fehlermeldung bzgl. der Ermittlung der Daten des Versicherten <br />  Verwendung: Krankenkassen, Versicherungsunternehmen |

# Übermittlungsbestätigung und Lesebestätigung

Eine Übermittlungsbestätigung (DSN) vom KIM-Mailserver des Nachrichtenempfängers signalisierte dem Sendesystem, dass eine Nachricht an den Empfänger ausgeliefert werden konnte. Die Anforderung einer solchen DSN unterstützt daher den automatisierten Prozess der elektronischen Ersatzbescheinigung.

Die Anforderung einer Lesebestätigung (MDN) durch das Sendesystem führt in Empfangssystemen je nach Konfiguration zu einem Pop-up, ob eine Lesebestätigung versendet werden soll. Dieses stört ggfs. den Workflow der automatisierten Bearbeitung empfangener KIM-Nachrichten. Daher ist das Anfordern einer Lesenbestätigung durch das Sendesystem zu unterbinden.

# KIM Anfrage einer Ersatzbescheinigung

Die FHIR-Datensätze in Anfrage- und Antwortnachrichten werden ausschließlich als Anhang in der KIM Nachricht übertragen.
**siehe unten**

|KIM-Header              |Inhalt                                 |verpflichtend|
|------------------------|---------------------------------------|-------------|
|X-KIM-Dienstkennung     |eEB;Anfrage;V1.0                       |ja|
|X-KIM-Sendersystem      |\<PVS-Bezeichnung>;\<Releaseversion>   |ja|
|X-KIM-Support           |\<Support-Email-Adresse PVS-Hersteller>|nein|
|Subject                 |\<T/E>EEB0_ANF_\<UUID>                 |ja <br />T/E: *T*estsystem (RU) / *E*chtsystem (PU)<br />UUID: bundle-identifier (AZ des LE)|
|Content-Type            | application/octet-stream;<br />name="<T/E>EEB0_ANF_\<UUID>.p7s" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ des LE)<br />
|Content-Transfer-Encoding |base64 |ja|
|Content-Disposition     |attachment;<br />filename="<T/E>EEB0_ANF_\<UUID>.p7s" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ des LE)|
|Content-Description     |eEB_ANF                                |ja|

Der Anhang enthält die signierte Anfrage (SMC-B OSIG-signiert) als `PKCS7`-Datei.

## KIM Anfrage Beispielnachricht

```xml
  Date: Mon, 17 Apr 2023 16:35:58 +0200 (CEST)
  From: ehex-22@arv.kim.telematik-test
  Reply-To: ehex-22@arv.kim.telematik-test
  To: tk@dgn.kim.telematik-test
  Message-ID: <1122966724.1.1681742158295@[192.168.200.196]>
  Subject: TEEB0_ANF_90c9ae58-5a9d-4861-b77d-665d10b2789d
  MIME-Version: 1.0
  Content-Type: multipart/mixed;
  boundary="----=_Part_0_2088448449.1681742158273"
  X-KIM-Dienstkennung: eEB;Anfrage;V1.0
  X-KIM-Sendersystem: easyTI;2.2.1-SNAPSHOT

  ------=_Part_0_2088448449.1681742158273
  Content-Type: text/plain; charset=utf-8
  Content-Transfer-Encoding: 7bit

  eEB Anfrage TEEB0_ANF_90c9ae58-5a9d-4861-b77d-665d10b2789d
  ------=_Part_0_2088448449.1681742158273
  Content-Type: application/octet-stream;
  name=TEEB0_ANF_90c9ae58-5a9d-4861-b77d-665d10b2789d.p7s
  Content-Transfer-Encoding: base64
  Content-Disposition: attachment;
  filename=TEEB0_ANF_90c9ae58-5a9d-4861-b77d-665d10b2789d.p7s
  Content-Description: eEB

  MIIVQwYJKoZIhvcNAQcCoIIVNDCCFTACAQExDzANBglghkgBZQMEAgEFADCCDBsGCSqGSIb3DQEH
  AaCCDAwEggwIPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48QnVuZGxlIHht
  bG5zPSJodHRwOi8vaGw3Lm9yZy9maGlyIj48aWQgdmFsdWU9IjUzNWNhOGViLTUxNTItNGFmZC1i
  NGE0LWQ0YTk4OTJhMWFhNCIvPjxtZXRhPjxwcm9maWxlIHZhbHVlPSJodHRwczovL2dlbWF0aWsu
  ZGUvZmhpci9lZWIvU3RydWN0dXJlRGVmaW5pdGlvbi9FRUJBbmZyYWdlQnVuZGxlIi8+PC9tZXRh
  PjxpZGVudGlmaWVyPjxzeXN0ZW0gdmFsdWU9InVybjppZXRmOnJmYzozOTg2Ii8+PHZhbHVlIHZh
  bHVlPSJ1cm46dXVpZDo5MGM5YWU1OC01YTlkLTQ4NjEtYjc3ZC02NjVkMTBiMjc4OWQiLz48L2lk
  ZW50aWZpZXI+PHR5cGUgdmFsdWU9Im1lc3NhZ2UiLz48dGltZXN0YW1wIHZhbHVlPSIyMDIzLTA0
  LTE3VDE2OjM1OjU1Ljk0MSswMjowMCIvPjxlbnRyeT48ZnVsbFVybCB2YWx1ZT0iaHR0cHM6Ly9l
  YXN5dGkuZWhleC5kZS9maGlyL01lc3NhZ2VIZWFkZXIvMGE4MjBlNGQtNzQ5ZS00ZTVmLTg0ZWUt
  ZDQ2YWU3NTdlYmQxIi8+PHJlc291cmNlPjxNZXNzYWdlSGVhZGVyPjxpZCB2YWx1ZT0iMGE4MjBl
  NGQtNzQ5ZS00ZTVmLTg0ZWUtZDQ2YWU3NTdlYmQxIi8+PG1ldGE+PHByb2ZpbGUgdmFsdWU9Imh0
  dHBzOi8vZ2VtYXRpay5kZS9maGlyL2VlYi9TdHJ1Y3R1cmVEZWZpbml0aW9uL0VFQkFuZnJhZ2VI
  ZWFkZXIiLz48L21ldGE+PGV4dGVuc2lvbiB1cmw9Imh0dHBzOi8vZ2VtYXRpay5kZS9maGlyL2Vl
  Yi9TdHJ1Y3R1cmVEZWZpbml0aW9uL0xlaXN0dW5nc2RhdHVtIj48dmFsdWVEYXRlIHZhbHVlPSIy
  MDIzLTA0LTE3Ii8+PC9leHRlbnNpb24+PGV4dGVuc2lvbiB1cmw9Imh0dHBzOi8vZ2VtYXRpay5k
  ZS9maGlyL2VlYi9TdHJ1Y3R1cmVEZWZpbml0aW9uL0VpbnZlcnN0YWVuZG5pcyI+PHZhbHVlQm9v
  bGVhbiB2YWx1ZT0idHJ1ZSIvPjwvZXh0ZW5zaW9uPjxleHRlbnNpb24gdXJsPSJodHRwczovL2dl
  bWF0aWsuZGUvZmhpci9lZWIvU3RydWN0dXJlRGVmaW5pdGlvbi9JbnN0aXR1dGlvbnNrZW5uemVp
  Y2hlbiI+PHZhbHVlSWRlbnRpZmllcj48c3lzdGVtIHZhbHVlPSJodHRwOi8vZmhpci5kZS9zaWQv
  YXJnZS1pay9pa25yIi8+PHZhbHVlIHZhbHVlPSIxMDE1NzU1MTkiLz48L3ZhbHVlSWRlbnRpZmll
  cj48L2V4dGVuc2lvbj48ZXZlbnRDb2Rpbmc+PHN5c3RlbSB2YWx1ZT0iaHR0cHM6Ly9nZW1hdGlr
  LmRlL2ZoaXIvZGlyZWN0b3J5L0NvZGVTeXN0ZW0vT3JnYW5pemF0aW9uUHJvZmVzc2lvbk9JRCIv
  Pjxjb2RlIHZhbHVlPSIxLjIuMjc2LjAuNzYuNC41MCIvPjxkaXNwbGF5IHZhbHVlPSJCZXRyaWVi
  c3N0w6R0dGUgQXJ6dCIvPjwvZXZlbnRDb2Rpbmc+PHNlbmRlcj48cmVmZXJlbmNlIHZhbHVlPSJP
  cmdhbml6YXRpb24vNDY0MWI4NmUtMjBjYy00ZTlkLWFiODctYmFiZWRhYzY4NjVhIi8+PC9zZW5k
  ZXI+PHNvdXJjZT48ZW5kcG9pbnQgdmFsdWU9Imh0dHBzOi8vZWhleC5kZS9LSU0iLz48L3NvdXJj
  ZT48L01lc3NhZ2VIZWFkZXI+PC9yZXNvdXJjZT48L2VudHJ5PjxlbnRyeT48ZnVsbFVybCB2YWx1
  ZT0iaHR0cHM6Ly9lYXN5dGkuZWhleC5kZS9maGlyL1BhdGllbnQvNjVjYmMzYjYtOGUyYi00ZmVi
  LThmMjQtYmU3NmMyMWFjNzViIi8+PHJlc291cmNlPjxQYXRpZW50PjxpZCB2YWx1ZT0iNjVjYmMz
  YjYtOGUyYi00ZmViLThmMjQtYmU3NmMyMWFjNzViIi8+PG1ldGE+PHByb2ZpbGUgdmFsdWU9Imh0
  dHBzOi8vZ2VtYXRpay5kZS9maGlyL2VlYi9TdHJ1Y3R1cmVEZWZpbml0aW9uL0VFQktub3duUGF0
  aWVudCIvPjwvbWV0YT48aWRlbnRpZmllcj48dHlwZT48Y29kaW5nPjxzeXN0ZW0gdmFsdWU9Imh0
  dHA6Ly9maGlyLmRlL0NvZGVTeXN0ZW0vaWRlbnRpZmllci10eXBlLWRlLWJhc2lzIi8+PGNvZGUg
  dmFsdWU9IkdLViIvPjwvY29kaW5nPjwvdHlwZT48c3lzdGVtIHZhbHVlPSJodHRwOi8vZmhpci5k
  ZS9zaWQvZ2t2L2t2aWQtMTAiLz48dmFsdWUgdmFsdWU9IlQwMjk2NTMyOTAiLz48L2lkZW50aWZp
  ZXI+PC9QYXRpZW50PjwvcmVzb3VyY2U+PC9lbnRyeT48ZW50cnk+PGZ1bGxVcmwgdmFsdWU9Imh0
  dHBzOi8vZWFzeXRpLmVoZXguZGUvZmhpci9Pcmdhbml6YXRpb24vNDY0MWI4NmUtMjBjYy00ZTlk
  LWFiODctYmFiZWRhYzY4NjVhIi8+PHJlc291cmNlPjxPcmdhbml6YXRpb24+PGlkIHZhbHVlPSI0
  NjQxYjg2ZS0yMGNjLTRlOWQtYWI4Ny1iYWJlZGFjNjg2NWEiLz48bWV0YT48cHJvZmlsZSB2YWx1
  ZT0iaHR0cHM6Ly9maGlyLmtidi5kZS9TdHJ1Y3R1cmVEZWZpbml0aW9uL0tCVl9QUl9GT1JfT3Jn
  YW5pemF0aW9ufDEuMS4wIi8+PC9tZXRhPjxpZGVudGlmaWVyPjx0eXBlPjxjb2Rpbmc+PHN5c3Rl
  bSB2YWx1ZT0iaHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS92Mi0wMjAzIi8+
  PGNvZGUgdmFsdWU9IkJTTlIiLz48L2NvZGluZz48L3R5cGU+PHN5c3RlbSB2YWx1ZT0iaHR0cHM6
  Ly9maGlyLmtidi5kZS9OYW1pbmdTeXN0ZW0vS0JWX05TX0Jhc2VfQlNOUiIvPjx2YWx1ZSB2YWx1
  ZT0iMDEyMzQ1Njc4Ii8+PC9pZGVudGlmaWVyPjxuYW1lIHZhbHVlPSJQcmF4aXMgQsO8bG93LUJv
  Z2VuIi8+PHRlbGVjb20+PHN5c3RlbSB2YWx1ZT0icGhvbmUiLz48dmFsdWUgdmFsdWU9IjAxMjM0
  NTY3ODkiLz48L3RlbGVjb20+PGFkZHJlc3M+PHR5cGUgdmFsdWU9ImJvdGgiLz48bGluZSB2YWx1
  ZT0iRW1pbC1GaWdnZS1TdHJhw59lIDIiPjxleHRlbnNpb24gdXJsPSJodHRwOi8vaGw3Lm9yZy9m
  aGlyL1N0cnVjdHVyZURlZmluaXRpb24vaXNvMjEwOTAtQURYUC1zdHJlZXROYW1lIj48dmFsdWVT
  dHJpbmcgdmFsdWU9IkVtaWwtRmlnZ2UtU3RyYcOfZSIvPjwvZXh0ZW5zaW9uPjxleHRlbnNpb24g
  dXJsPSJodHRwOi8vaGw3Lm9yZy9maGlyL1N0cnVjdHVyZURlZmluaXRpb24vaXNvMjEwOTAtQURY
  UC1ob3VzZU51bWJlciI+PHZhbHVlU3RyaW5nIHZhbHVlPSIyIi8+PC9leHRlbnNpb24+PC9saW5l
  PjxjaXR5IHZhbHVlPSJEb3J0bXVuZCIvPjxwb3N0YWxDb2RlIHZhbHVlPSI0NDIyNyIvPjxjb3Vu
  dHJ5IHZhbHVlPSJEIi8+PC9hZGRyZXNzPjwvT3JnYW5pemF0aW9uPjwvcmVzb3VyY2U+PC9lbnRy
  eT48L0J1bmRsZT6gggUPMIIFCzCCA/OgAwIBAgIHA0y9dMfkJjANBgkqhkiG9w0BAQsFADCBmjEL
  MAkGA1UEBhMCREUxHzAdBgNVBAoMFmdlbWF0aWsgR21iSCBOT1QtVkFMSUQxSDBGBgNVBAsMP0lu
  c3RpdHV0aW9uIGRlcyBHZXN1bmRoZWl0c3dlc2Vucy1DQSBkZXIgVGVsZW1hdGlraW5mcmFzdHJ1
  a3R1cjEgMB4GA1UEAwwXR0VNLlNNQ0ItQ0EyNCBURVNULU9OTFkwHhcNMjAwMTI3MDAwMDAwWhcN
  MjQxMjExMjM1OTU5WjCB0zELMAkGA1UEBhMCREUxEjAQBgNVBAcMCUJhZCBUw7ZsejEOMAwGA1UE
  EQwFODM2NDYxGTAXBgNVBAkMEERlbW1lbGpvY2hzdHIuIDcxJTAjBgNVBAoMHFByYXhpcyBCw7xs
  b3ctQm9nZW5OT1QtVkFMSUQxFTATBgNVBAQMDELDvGxvdy1Cb2dlbjESMBAGA1UEKgwJQXBocm9k
  aXRlMQwwCgYDVQQMDANEci4xJTAjBgNVBAMMHFByYXhpcyBCw7xsb3ctQm9nZW5URVNULU9OTFkw
  ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDE1Ep6QPXEKgxiZnlFv0JoOXN6uzbP7WWH
  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
  ------=_Part_0_2088448449.1681742158273--

```

# KIM Bescheinigung

|Header                  |Inhalt                                 |verpflichtend|
|------------------------|---------------------------------------|-------------|
|X-KIM-Dienstkennung     |eEB;Bescheinigung;V1.0                 |ja|
|X-KIM-Ursprungssystem   |\<PVS-Bezeichnung>;\<Releaseversion>   |nein|
|X-KIM-Sendersystem      |\<Kasse-Bezeichnung>;\<Releaseversion> |nein|
|X-KIM-Support           |\<Support-Email-Adresse Kasse> |nein|
|In-Reply-To             |Message-ID der Anfrage                 |ja - wenn die Anfrage über eine KIM-Nachricht gestellt wurde -<br />andernfalls nein|
|Subject                 |\<T/E>EEB0_BES_\<UUID>                 |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Type            |application/octet-stream;<br />name="<T/E>EEB0_BES_\<UUID>.p7s" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Transfer-Encoding |base64 |ja|
|Content-Disposition     |attachment;<br />filename="<T/E>EEB0_BES_\<UUID>.p7s" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Description     |eEB_BES |ja|

Der Anhang enthält die signierte Bescheinigung (SMC-B signiert) als `PKCS7`-Datei

## KIM Bescheinigung Beispielnachricht

```xml
  Date: Mon, 17 Apr 2023 16:36:52 +0200 (CEST)
  From: tk@dgn.kim.telematik-test
  To: ehex-22@arv.kim.telematik-test
  Message-ID: <2091056040.122.1681742212013@reai20v01.dst.tk-inline.net>
  In-Reply-To: <1122966724.1.1681742158295@[192.168.200.196]>
  Subject: TEEB0_BES_796ca3a6-83de-4682-9345-3e9c79d25f78
  MIME-Version: 1.0
  Content-Type: multipart/mixed;
  boundary="----=_Part_16_1977848886.1681742225100"
  X-System: DT02
  X-KIM-Ursprungssystem: easyTI;2.2.1-SNAPSHOT
  X-KIM-Sendersystem: Test-TK;1.0
  X-KIM-Support: v-eeb@tk.de
  X-KIM-Dienstkennung: eEB;Bescheinigung;V1.0
  X-TK-OBJECT-ID: 13901:00010000000000561735050000029000
  X-TK-ARCHIVE-ID: SENT/EEB0/1.0/ehex-22@arv.kim.telematik-test/2023/04/17/1/<2091056040.122.1681742212013@reai20v01.dst.tk-inline.net>

  ------=_Part_16_1977848886.1681742225100
  Content-Type: text/plain;charset=UTF-8
  Content-Transfer-Encoding: quoted-printable



  <DT02 - reai20v01.dst.tk-inline.net/10.183.101.43>


  ---------------------------------------------
  Die Nachricht wurde entschlüsselt.
  Die Signatur wurde erfolgreich geprüft.
  ------=_Part_16_1977848886.1681742225100
  Content-Type: application/octet-stream; charset=utf-8;
  name=TEEB0_BES_796ca3a6-83de-4682-9345-3e9c79d25f78.p7s
  Content-Transfer-Encoding: base64
  Content-Disposition: attachment;
  filename=TEEB0_BES_796ca3a6-83de-4682-9345-3e9c79d25f78.p7s
  Content-Description: eEB_BES

  MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwGggCSABIID
  6Dw/eG1sIHZlcnNpb249IjEuMCIgZW5jb2Rpbmc9IlVURi04Ij8+CjxCdW5kbGUgeG1sbnM9Imh0
  dHA6Ly9obDcub3JnL2ZoaXIiPgogICA8aWQgdmFsdWU9IjZhOGU3MDVlLWJkODctNGE2NS1iYTJh
  LWNiOWNmMDRhNmEyMyIgLz4KICAgPG1ldGE+CiAgICAgIDxwcm9maWxlIHZhbHVlPSJodHRwczov
  L2dlbWF0aWsuZGUvZmhpci9lZWIvU3RydWN0dXJlRGVmaW5pdGlvbi9FRUJCZXNjaGVpbmlndW5n
  QnVuZGxlIiAvPgogICA8L21ldGE+CiAgIDxpZGVudGlmaWVyPgogICAgICA8c3lzdGVtIHZhbHVl
  PSJ1cm46aWV0ZjpyZmM6Mzk4NiIgLz4KICAgICAgPHZhbHVlIHZhbHVlPSJ1cm46dXVpZDo3OTZj
  YTNhNi04M2RlLTQ2ODItOTM0NS0zZTljNzlkMjVmNzgiIC8+CiAgIDwvaWRlbnRpZmllcj4KICAg
  PHR5cGUgdmFsdWU9Im1lc3NhZ2UiIC8+CiAgIDx0aW1lc3RhbXAgdmFsdWU9IjIwMjMtMDQtMTdU
  MTY6MzY6NTEuNjEwKzAyOjAwIiAvPgogICA8ZW50cnk+CiAgICAgIDxmdWxsVXJsIHZhbHVlPSJo
  dHRwczovL2dlbWF0aWsuZGUvZmhpci9NZXNzYWdlSGVhZGVyLzUyMTExMjczLTk1NzEtNDVjYi1i
  YjljLWYyYzhkMDkxMWU4OCIgLz4KICAgICAgPHJlc291cmNlPgogICAgICAgICA8TWVzc2FnZUhl
  YWRlciB4bWxucz0iaHR0cDovL2hsNy5vcmcvZmhpciI+CiAgICAgICAgICAgIDxpZCB2YWx1ZT0i
  NTIxMTEyNzMtOTU3MS00NWNiLWJiOWMtZjJjOGQwOTExZTg4IiAvPgogICAgICAgICAgICA8bWV0
  YT4KICAgICAgICAgICAgICAgPHByb2ZpbGUgdmFsdWU9Imh0dHBzOi8vZ2VtYXRpay5kZS9maGly
  L2VlYi9TdHJ1Y3R1cmVEZWZpbml0aW9uL0VFQkJlc2NoZWluaWd1bmdIZWFkZXIiIC8+CiAgICAg
  ICAgICAgIDwvbWV0YT4KICAgICAgICAgICAgPGV2ZW50Q29kaW5nPgogICAgICAgICAgICAgICA8
  c3lzdGVtIHZhbHVlPSJodHRwczovL2dlbWF0aWsuZGUvZmhpci9kaXJlY3RvcnkvQ29kZVN5c3Rl
  bS9Pcmdhbml6YXRpb25Qcm9mZXNzaW9uT0lEIiAvPgoEggPoICAgICAgICAgICAgICAgPGNvZGUg
  dmFsdWU9IjEuMi4yNzYuMC43Ni40LjUwIiAvPgogICAgICAgICAgICAgICA8ZGlzcGxheSB2YWx1
  ZT0iQmV0cmllYnNzdMOkdHRlIEFyenQiIC8+CiAgICAgICAgICAgIDwvZXZlbnRDb2Rpbmc+CiAg
  ICAgICAgICAgIDxzb3VyY2U+CiAgICAgICAgICAgICAgIDxlbmRwb2ludCB2YWx1ZT0iaHR0cDov
  L3d3dy50ay5kZSIgLz4KICAgICAgICAgICAgPC9zb3VyY2U+CiAgICAgICAgICAgIDxyZXNwb25z
  ZT4KICAgICAgICAgICAgICAgPGlkZW50aWZpZXIgdmFsdWU9IjkwYzlhZTU4LTVhOWQtNDg2MS1i
  NzdkLTY2NWQxMGIyNzg5ZCIgLz4KICAgICAgICAgICAgICAgPGNvZGUgdmFsdWU9Im9rIiAvPgog
  ICAgICAgICAgICA8L3Jlc3BvbnNlPgogICAgICAgICA8L01lc3NhZ2VIZWFkZXI+CiAgICAgIDwv
  cmVzb3VyY2U+CiAgIDwvZW50cnk+CiAgIDxlbnRyeT4KICAgICAgPGZ1bGxVcmwgdmFsdWU9Imh0
  dHBzOi8vZ2VtYXRpay5kZS9maGlyL1BhdGllbnQvMGRmMzM0YTctMTQxOS00ZWNmLTgzMjAtYTIz
  NWY3NGM4MWI2IiAvPgogICAgICA8cmVzb3VyY2U+CiAgICAgICAgIDxQYXRpZW50IHhtbG5zPSJo
  dHRwOi8vaGw3Lm9yZy9maGlyIj4KICAgICAgICAgICAgPGlkIHZhbHVlPSIwZGYzMzRhNy0xNDE5
  LTRlY2YtODMyMC1hMjM1Zjc0YzgxYjYiIC8+CiAgICAgICAgICAgIDxtZXRhPgogICAgICAgICAg
  ICAgICA8cHJvZmlsZSB2YWx1ZT0iaHR0cHM6Ly9maGlyLmtidi5kZS9TdHJ1Y3R1cmVEZWZpbml0
  aW9uL0tCVl9QUl9GT1JfUGF0aWVudHwxLjEuMCIgLz4KICAgICAgICAgICAgPC9tZXRhPgogICAg
  ICAgICAgICA8aWRlbnRpZmllcj4KICAgICAgICAgICAgICAgPHR5cGU+CiAgICAgICAgICAgICAg
  ICAgIDxjb2Rpbmc+CiAgICAgICAgICAgICAgICAgICAgIDxzeXN0ZW0gdmFsdWU9Imh0dHA6Ly9m
  aGlyLmRlL0NvZGVTeXN0ZW0vaWRlbnRpZmllci10eXBlLWRlLWJhc2lzIiAvPgogICAgICAgICAg
  ICAgICAgICAgIASCA+ggPGNvZGUgdmFsdWU9IkdLViIgLz4KICAgICAgICAgICAgICAgICAgPC9j
  b2Rpbmc+CiAgICAgICAgICAgICAgIDwvdHlwZT4KICAgICAgICAgICAgICAgPHN5c3RlbSB2YWx1
  ZT0iaHR0cDovL2ZoaXIuZGUvc2lkL2drdi9rdmlkLTEwIiAvPgogICAgICAgICAgICAgICA8dmFs
  dWUgdmFsdWU9IlQwMjk2NTMyOTAiIC8+CiAgICAgICAgICAgIDwvaWRlbnRpZmllcj4KICAgICAg
  ICAgICAgPG5hbWU+CiAgICAgICAgICAgICAgIDx1c2UgdmFsdWU9Im9mZmljaWFsIiAvPgogICAg
  ICAgICAgICAgICA8ZmFtaWx5IHZhbHVlPSJUSy1lQVUtTcO8bGxlciI+CiAgICAgICAgICAgICAg
  ICAgIDxleHRlbnNpb24gdXJsPSJodHRwOi8vaGw3Lm9yZy9maGlyL1N0cnVjdHVyZURlZmluaXRp
  b24vaHVtYW5uYW1lLW93bi1uYW1lIj4KICAgICAgICAgICAgICAgICAgICAgPHZhbHVlU3RyaW5n
  IHZhbHVlPSJUSy1lQVUtTcO8bGxlciIgLz4KICAgICAgICAgICAgICAgICAgPC9leHRlbnNpb24+
  CiAgICAgICAgICAgICAgIDwvZmFtaWx5PgogICAgICAgICAgICAgICA8Z2l2ZW4gdmFsdWU9IlBl
  dGVyIiAvPgogICAgICAgICAgICA8L25hbWU+CiAgICAgICAgICAgIDxiaXJ0aERhdGUgdmFsdWU9
  IjE5OTItMDEtMDEiIC8+CiAgICAgICAgICAgIDxhZGRyZXNzPgogICAgICAgICAgICAgICA8dHlw
  ZSB2YWx1ZT0iYm90aCIgLz4KICAgICAgICAgICAgICAgPGxpbmUgdmFsdWU9IlNwZWRpdGlvbnN0
  ci4gMTkiPgogICAgICAgICAgICAgICAgICA8ZXh0ZW5zaW9uIHVybD0iaHR0cDovL2hsNy5vcmcv
  Zmhpci9TdHJ1Y3R1cmVEZWZpbml0aW9uL2lzbzIxMDkwLUFEWFAtc3RyZWV0TmFtZSI+CiAgICAg
  ICAgICAgICAgICAgICAgIDx2YWx1ZVN0cmluZyB2YWx1ZT0iU3BlZGl0aW9uc3RyLiIgLz4KICAg
  ICAgICAgICAgICAgICAgPC9leHRlbnNpb24+CiAgICAgICAgICAgICAgICAgIDxleHRlbnNpb24g
  dXJsPSJodHRwOi8vaGw3Lm9yZy9maGlyL1N0cnVjdHVyZURlZmluaXRpb24vBIID6GlzbzIxMDkw
  LUFEWFAtaG91c2VOdW1iZXIiPgogICAgICAgICAgICAgICAgICAgICA8dmFsdWVTdHJpbmcgdmFs
  dWU9IjE5IiAvPgogICAgICAgICAgICAgICAgICA8L2V4dGVuc2lvbj4KICAgICAgICAgICAgICAg
  PC9saW5lPgogICAgICAgICAgICAgICA8Y2l0eSB2YWx1ZT0iRMO8c3NlbGRvcmYiIC8+CiAgICAg
  ICAgICAgICAgIDxwb3N0YWxDb2RlIHZhbHVlPSI0MDIyMSIgLz4KICAgICAgICAgICAgPC9hZGRy
  ZXNzPgogICAgICAgICA8L1BhdGllbnQ+CiAgICAgIDwvcmVzb3VyY2U+CiAgIDwvZW50cnk+CiAg
  IDxlbnRyeT4KICAgICAgPGZ1bGxVcmwgdmFsdWU9Imh0dHBzOi8vZ2VtYXRpay5kZS9maGlyL0Nv
  dmVyYWdlL2FjZTczZGU2LTE2NTQtNGNkNi1hNWMwLTA4MDhhMDllYmRkMiIgLz4KICAgICAgPHJl
  c291cmNlPgogICAgICAgICA8Q292ZXJhZ2UgeG1sbnM9Imh0dHA6Ly9obDcub3JnL2ZoaXIiPgog
  ICAgICAgICAgICA8aWQgdmFsdWU9ImFjZTczZGU2LTE2NTQtNGNkNi1hNWMwLTA4MDhhMDllYmRk
  MiIgLz4KICAgICAgICAgICAgPG1ldGE+CiAgICAgICAgICAgICAgIDxwcm9maWxlIHZhbHVlPSJo
  dHRwczovL2dlbWF0aWsuZGUvZmhpci9lZWIvU3RydWN0dXJlRGVmaW5pdGlvbi9FRUJDb3ZlcmFn
  ZUVnayIgLz4KICAgICAgICAgICAgPC9tZXRhPgogICAgICAgICAgICA8ZXh0ZW5zaW9uIHVybD0i
  aHR0cDovL2ZoaXIuZGUvU3RydWN0dXJlRGVmaW5pdGlvbi9na3YvdmVyc2lvbi12c2RtIj4KICAg
  ICAgICAgICAgICAgPHZhbHVlU3RyaW5nIHZhbHVlPSI1LjIuMCIgLz4KICAgICAgICAgICAgPC9l
  eHRlbnNpb24+CiAgICAgICAgICAgIDxleHRlbnNpb24gdXJsPSJodHRwczovL2dlbWF0aWsuZGUv
  Zmhpci9lZWIvU3RydWN0dXJlRGVmaW5pdGlvbi9BbGxnZW1laW5lVmVyc2ljaGVydW5nc2RhdGVu
  Ij4KICAgICAgICAgICAgICAgPHZhbHVlQmFzZTY0QmluYXJ5IHZhbHVlPSJINHNJQUFBQUFBQUFB
  SzFTVzAvQ01CVCtLMHZmV1RkMEFVeFgEggPoZzJBTW1ZQVJSZVBMVXJmRHRtdzdNMjFCNWRmYkVU
  UWJJZWlETDIzTzVidTA1N0RMajdLd05pQlZWcUZQWE5zaEZtQlV4UmttUHBrczVwMSszeHQwWEk5
  WVNndU1SVkVoK09RVEZMbms3SEVVRG9zaWdSSXloR1ZORXFVZzE1aW9XR2pBNSttdE5ScFB3K1gx
  L1dJeW4vbkVzN3UxZ0pGRTVaTlU2N2NMU3QrVmJSaUV6bkk3QnJvU2RLUGlzajdveHZRVHpuNklO
  Y2hHVk11b0tGM3JMV2RYa0dTSXZPdDBIY2QxWEViM0NSWlV5aGpSVWtCU2cxdGhEb2lHaEJ1QTEv
  TThkOERvMFhvYlZRakFHS1Q1SXVEakEwU3p4bWFpQlA0QVVZcFpEdElLcEVERG1BdWxnTkZka1Ex
  ZlpWM2ZnZjdtOU56cDliejZnZi92TlBoMlJVL1lvb2Z4MFhHOHJKWFEyd3hYbFdvRk44R3lOVTRV
  VW5PM1FiSlBOVEhoM28zaEQzZjRwL2tkUCtzeld0K01udXFraDlLMFpZeTJGNHYrdnMzOEMyT3Nj
  b0F2QXdBQSIgLz4KICAgICAgICAgICAgPC9leHRlbnNpb24+CiAgICAgICAgICAgIDxleHRlbnNp
  b24gdXJsPSJodHRwczovL2dlbWF0aWsuZGUvZmhpci9lZWIvU3RydWN0dXJlRGVmaW5pdGlvbi9Q
  ZXJzb2VubGljaGVWZXJzaWNoZXJ0ZW5kYXRlbiI+CiAgICAgICAgICAgICAgIDx2YWx1ZUJhc2U2
  NEJpbmFyeSB2YWx1ZT0iSDRzSUFBQUFBQUFBQUkxU3kyN0NNQkQ4RmVRN2NaS1dpbFFiVndpcUZw
  V1h5cU85SVRkWlNGVEhRYmFoajIvbjBBMEZDbFVQdmRpZThYaDJ0R3U0ZVM5VWJZUEc1cVdPV2VE
  NXJJWTZLZE5jTDJQV0hRL3J6V1lqcWdjTlZyTk82bFNxVW1QTVB0Q3lHd0hUOW54RVQwdlVLazh5
  bkZVMnRCdUhwS1RsdWQrcnRUdjkrZXoyY2R3ZERtTFc4TUtxQXRYVU5tYVpjNnRyenQrc3Q4UkN1
  dnpWUzVFdkpOL1l0S2dXdmlFOUUzRGlhODZRbm5jN1l1S0gwVlhqSW94ODRML3ZZQmRQQzdqRGw3
  VnhsbEt0Q3hGRVVlZ0hmZ0Q4aklaWmFiUXNVSXlRQ3BIWkhzSkFKdG51Tkhtb1kydGE3MitWcWdS
  SG51eHRraWxNTWlmNmxlc1J3ZGdaYVMzcVZtcVFka3BVV3Fjd2Q1OHlVK0xTRDBPS2NjYkIwRGpS
  MgSCA+haSllwYVZaQUs4dzlLajVBcDdLVEZ2U0tVa2RSa056UXRFQi9oY04vUHZKUG9BWXJ6RE5I
  VTNaT3VNQlA5QndMOWRXcjR1Q1dodEV3RS9nVWZRVG5oLzZ5Yzlud3YveEU4UVhucnU5eDJ3Q0FB
  QT0iIC8+CiAgICAgICAgICAgIDwvZXh0ZW5zaW9uPgogICAgICAgICAgICA8ZXh0ZW5zaW9uIHVy
  bD0iaHR0cHM6Ly9nZW1hdGlrLmRlL2ZoaXIvZWViL1N0cnVjdHVyZURlZmluaXRpb24vR2VzY2h1
  ZXR6dGVWZXJzaWNoZXJ0ZW5kYXRlbiI+CiAgICAgICAgICAgICAgIDx2YWx1ZUJhc2U2NEJpbmFy
  eSB2YWx1ZT0iSDRzSUFBQUFBQUFBQUlWUFhXdkNRQkQ4SytIZXpXb2hvR1h2cEdncFFxM1FVQkZm
  NUVqV1hQQnlLYmxOMnViWDkwSUx0U2o0TXZzMXpNemkvTE95VVVlTkwyc254U1FlaTRoY1Z1ZWxL
  NlJZcFp2UmRKck1ScE5FUko2MXk3V3RIVW54UlY3TUZiNHREay9rTTlNUzkwemJRU1V6MURBRllv
  RGQramxhTE5lSDdlTnJ1dHE4U0pIRWQ0TkJzSFJlQ3NQOGZnL3c0ZU9DS3MzbEtjNEpqaG82bjFj
  RFFCZjRRdUcrN2JXeHJTdDhpTUN0VjVqKzFESENiNGR3aFVTV1RseDI0VGx1TkJXazhJR2FubTNJ
  cUdZSWZ3UHV0WEg2L1BaL0VXd3V0ZUQyOCtvYlViNDBoRjRCQUFBPSIgLz4KICAgICAgICAgICAg
  PC9leHRlbnNpb24+CiAgICAgICAgICAgIDxzdGF0dXMgdmFsdWU9ImFjdGl2ZSIgLz4KICAgICAg
  ICAgICAgPHR5cGU+CiAgICAgICAgICAgICAgIDxjb2Rpbmc+CiAgICAgICAgICAgICAgICAgIDxz
  eXN0ZW0gdmFsdWU9Imh0dHA6Ly9maGlyLmRlL0NvZGVTeXN0ZW0vdmVyc2ljaGVydW5nc2FydC1k
  ZS1iYXNpcyIgLz4KICAgICAgICAgICAgICAgICAgPGNvZGUgdmFsdWU9IkdLViIgLz4KICAgICAg
  ICAgICAgICAgICAgPGRpc3BsYXkgdmFsdWU9Imdlc2V0emxpY2hlIEtyYW5rZW52ZXJzaWNoZXJ1
  bmciIC8+CiAgICAgICAgICAgICAgIDwvY29kaW5nPgogICAgICAgICAgICA8L3R5cGU+CiAgICAg
  ICAgICAgIDxiZW5lZmljaWFyeT4KICAgICAgICAgICAgICAgBIICKjxyZWZlcmVuY2UgdmFsdWU9
  IlBhdGllbnQvMGRmMzM0YTctMTQxOS00ZWNmLTgzMjAtYTIzNWY3NGM4MWI2IiAvPgogICAgICAg
  ICAgICA8L2JlbmVmaWNpYXJ5PgogICAgICAgICAgICA8cGVyaW9kPgogICAgICAgICAgICAgICA8
  c3RhcnQgdmFsdWU9IjIwMjMtMDQtMTciIC8+CiAgICAgICAgICAgICAgIDxlbmQgdmFsdWU9IjIw
  MjMtMDYtMzAiIC8+CiAgICAgICAgICAgIDwvcGVyaW9kPgogICAgICAgICAgICA8cGF5b3I+CiAg
  ICAgICAgICAgICAgIDxpZGVudGlmaWVyPgogICAgICAgICAgICAgICAgICA8c3lzdGVtIHZhbHVl
  PSJodHRwOi8vZmhpci5kZS9zaWQvYXJnZS1pay9pa25yIiAvPgogICAgICAgICAgICAgICAgICA8
  dmFsdWUgdmFsdWU9IjEwMTU3NTUxOSIgLz4KICAgICAgICAgICAgICAgPC9pZGVudGlmaWVyPgog
  ICAgICAgICAgICAgICA8ZGlzcGxheSB2YWx1ZT0iVGVjaG5pa2VyIEtyYW5rZW5rYXNzZSIgLz4K
  ICAgICAgICAgICAgPC9wYXlvcj4KICAgICAgICAgPC9Db3ZlcmFnZT4KICAgICAgPC9yZXNvdXJj
  ZT4KICAgPC9lbnRyeT4KPC9CdW5kbGU+AAAAAAAAoIAwggTGMIIDrqADAgECAgcCQsGD+UEcMA0G
  CSqGSIb3DQEBCwUAMIGaMQswCQYDVQQGEwJERTEfMB0GA1UECgwWZ2VtYXRpayBHbWJIIE5PVC1W
  QUxJRDFIMEYGA1UECww/SW5zdGl0dXRpb24gZGVzIEdlc3VuZGhlaXRzd2VzZW5zLUNBIGRlciBU
  ZWxlbWF0aWtpbmZyYXN0cnVrdHVyMSAwHgYDVQQDDBdHRU0uU01DQi1DQTI0IFRFU1QtT05MWTAe
  Fw0yMDA5MjkyMjAwMDBaFw0yNTA5MjkyMTU5NTlaMGwxCzAJBgNVBAYTAkRFMRswGQYDVQQKDBIx
  MjM0NTY3OCBOT1QtVkFMSUQxIDAeBgNVBAUTFzIzLjgwMjc2ODgzMTEwMDAwMTI5MTUzMR4wHAYD
  VQQDDBVUSyBUS1ItVGVzdCBURVNULU9OTFkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
  AQCTMuRh9phNA/hw2Abv8uWIfN/kiwU/9qKTHXcfV2GJEWE3ddtt6mZfSB2+HjIQZ1UYShVyOiVO
  NfdTuHKiYXbuVnRI0MqCz/1nSFyOeCP8ntAGUwcWnh+5t1or+G1phjCVmaXqUELokNMan/rehUcS
  JLviOhAonqygwebD/s5rZCQ3zEXy4Sm8Q4A/IjzveTQbU4Unu4ew8f1XEJpCYO6uTjVJt4b2G0Zk
  ZusddPfYDmoxyEHWOQ5CKtYOQ/8ixfCXkN56LkpwB8AmcuVO0jj1OWbz4SVEKqRkMTyWOM2DsMt5
  TJ3j1yCFrjdUKQdhwCZirjPhzbDtiWCyeDImlWjrAgMBAAGjggE8MIIBODAfBgNVHSMEGDAWgBR6
  6eFv6hRZFgXuA+nT/SGr3unZnjB8BgUrJAgDAwRzMHGkLDAqMQswCQYDVQQGEwJERTEbMBkGA1UE
  CgwSR0tWIFNwaXR6ZW52ZXJiYW5kMEEwPzA9MDswHwwdQmV0cmllYnNzdMOkdHRlIEtvc3RlbnRy
  w6RnZXIwCQYHKoIUAEwEOxMNOC0yMGExMjAxLTAwMjAdBgNVHQ4EFgQUI+9C52GaBVikRTVJpjTl
  EAV5G7IwIAYDVR0gBBkwFzAKBggqghQATASBIzAJBgcqghQATAROMAwGA1UdEwEB/wQCMAAwDgYD
  VR0PAQH/BAQDAgZAMDgGCCsGAQUFBwEBBCwwKjAoBggrBgEFBQcwAYYcaHR0cDovL2VoY2EuZ2Vt
  YXRpay5kZS9vY3NwLzANBgkqhkiG9w0BAQsFAAOCAQEAVV1vOl5t/e/789LtSwyTTflR1lSOhf8R
  GBp9GZ0h8b5Jn8yfKXhKk9FH2Mh3LWFMLgwazzW1tJd/yxkTLfAhhtyTdP8fPkqW8qO6riLjCDT7
  wLwm3+xIk2dzDut0iD3oe7MMa9apecHVJ83g1NRmNKBiTGkniyO3aipNAfB/zfdIQtrez+B7GZLT
  QTzAIbR5gwuMo3zQbM9OHmeBOseO9pA1jQp7/Bm2SQLj1MXHv2hx7eks6ZYNDPLd5biZZ2BnRj5n
  GFfcs7hRMQr8MsTS0ahekAZQXas8EWxPXuXEhTgRTigJy4Jb4FVSdJHRxyaOCLCDPuvcfv+W97e4
  9Htb+QAAMYIDwzCCA78CAQEwgaYwgZoxCzAJBgNVBAYTAkRFMR8wHQYDVQQKDBZnZW1hdGlrIEdt
  YkggTk9ULVZBTElEMUgwRgYDVQQLDD9JbnN0aXR1dGlvbiBkZXMgR2VzdW5kaGVpdHN3ZXNlbnMt
  Q0EgZGVyIFRlbGVtYXRpa2luZnJhc3RydWt0dXIxIDAeBgNVBAMMF0dFTS5TTUNCLUNBMjQgVEVT
  VC1PTkxZAgcCQsGD+UEcMA0GCWCGSAFlAwQCAQUAoIIBuTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcN
  AQcBMBwGCSqGSIb3DQEJBTEPFw0yMzA0MTcxNDM2NTFaMC8GCSqGSIb3DQEJBDEiBCCNYLJ4bIaA
  i16RHXJfurVmamzSh9Q6AsjKp7KyeJWplzBhBgkqhkiG9w0BCTQxVDBSMA0GCWCGSAFlAwQCAQUA
  oUEGCSqGSIb3DQEBCjA0oA8wDQYJYIZIAWUDBAIBBQChHDAaBgkqhkiG9w0BAQgwDQYJYIZIAWUD
  BAIBBQCiAwIBIDCB6gYLKoZIhvcNAQkQAi8xgdowgdcwgdQwgdEEIGK6/TxUTU3uUv1PSQgT63ze
  Xned9ZwUs97CvFRE85SKMIGsMIGgpIGdMIGaMQswCQYDVQQGEwJERTEfMB0GA1UECgwWZ2VtYXRp
  ayBHbWJIIE5PVC1WQUxJRDFIMEYGA1UECww/SW5zdGl0dXRpb24gZGVzIEdlc3VuZGhlaXRzd2Vz
  ZW5zLUNBIGRlciBUZWxlbWF0aWtpbmZyYXN0cnVrdHVyMSAwHgYDVQQDDBdHRU0uU01DQi1DQTI0
  IFRFU1QtT05MWQIHAkLBg/lBHDBBBgkqhkiG9w0BAQowNKAPMA0GCWCGSAFlAwQCAQUAoRwwGgYJ
  KoZIhvcNAQEIMA0GCWCGSAFlAwQCAQUAogMCASAEggEAko8oET6IakyeWnQzEsNcE2mXnqGS7p6L
  qNs60Beb9dRWX1qzESUEanFy/T7k8JQNhTGKHtun0o5rhnBVDMBumA0HIJ/zBga3FMhLAOmwwM0k
  R6nP2iXrtuAKdxFJRXh1tNBdRPf8sgNR2eeJpD+pEFgtLc8n31N3x5mzp6OAoNCAMf6Cbq3h/s7M
  6ESAlw7BfP0BKfbAf/aktFxlmYq2YC0NjY0m4XmvsQHCzfC+PtVH5sr0hD5PbMWPZxp6uvGfpPev
  J0QKqz2SHwHGJXn3o6gJ+i5KbtFfX8OA6ed/bXsXwuu23bdobHVHuV8xxZjcEeQs2L13GGJAH4iD
  /39xPQAAAAAAAA==
  ------=_Part_16_1977848886.1681742225100
  Content-Type: application/pdf; name=Signaturpruefungsbericht.pdf
  Content-Transfer-Encoding: base64
  Content-Disposition: attachment; filename=Signaturpruefungsbericht.pdf

  JVBERi0xLjQKJfbk/N8KMSAwIG9iago8PAovVHlwZSAvQ2F0YWxvZwovVmVyc2lvbiAvMS40Ci9Q
  YWdlcyAyIDAgUgo+PgplbmRvYmoKMiAwIG9iago8PAovVHlwZSAvUGFnZXMKL0tpZHMgWzMgMCBS
  XQovQ291bnQgMQo+PgplbmRvYmoKMyAwIG9iago8PAovVHlwZSAvUGFnZQovTWVkaWFCb3ggWzAu
  MCAwLjAgNjEyLjAgNzkyLjBdCi9Db250ZW50cyA0IDAgUgovUmVzb3VyY2VzIDUgMCBSCi9QYXJl
  bnQgMiAwIFIKPj4KZW5kb2JqCjQgMCBvYmoKPDwKL0xlbmd0aCAxNjk2Ci9GaWx0ZXIgL0ZsYXRl
  RGVjb2RlCj4+CnN0cmVhbQ0KeJy9WVtz2joQfudX6LGdKY7uspmTMxMMpJ22SSfQM3M6fXGIEjgh
  JINNb7/+rGSB7YTUltppbhDMer/9tNr9VgxnvaOR/rKc64vTIZrnPYzMdz7vHU0IIhLNrnsUIyUo
  ml31/hJMJlLJsSSKK6GowopOUikllfAfXGMyVvxvNPuvN27cOZ26O0/THtwXvsEFQV/tzQmLRCIx
  QXAPROKIY442ujfsDWd1PBQlFg4HC+UsDCjOwbGg+DE4ipUyj5KbqxaglBOZSgXPRAkWXldwxYWh
  OB3vwO/h4ihBu98KtExoJLBIYguakggnhzAzRIgDDQ6dBYB+cRKh6fJmnRXbzZUusuUqf/nY8WOe
  pBIRFTEiikQSY4geaKA8PsxVvHOrEmtlnO48/tDL4mG7vi3QKtsW6OO60Oa1+WKtN4Of4yDJzvkO
  Dsc4Ygl8tcMhidgbV6gopqyPeZ8oSLgBkwPB2rkQcYRJyYEXG5I6O5c5NlfkCPKAS5szz6U4vGss
  FTt5kh/P0bNHGEZQHehjitQAi3aKOI6UBEtfijh3do6iiRwaimDLjBU3m2ciRxO7pRI5pphTlShD
  HvMgZ48tjJw6xBeEcYB9+b3QHfYQhVpDTIHxJIUqZ2c8vs7yRba6ud8si8XdNu++Zfbew8JugJi+
  PqFCtkeMZQSFDwvfiAl2dvXKERT1HkFY1A0gF9OTD9Npa9QiTmD7xFh5Ri0S5uxcu4MeIdNJqphi
  sAFSmY65qQP19JeQ/j7JX2EL4qMBESoDj9vZAA6Uwti3dwgo8aWdcdV1vStvYfE1nI70Bn25v2v2
  KJRDOi71ptDIbMWv8Aw9ZHleoB9bdKXX1fU1GmXw9wn0w01dCBzJGEOqdW3qQnBnYcAOI/QJvC6v
  l7dZkXft64LRiCrYJZ31D+Sls2h2dX/XRESYxv6JQRJnZwC8WS+yS1iVK53X4+9cICoUYQnTAJOe
  Hc/eotnbi/5MQ0LMxtNZ//zs3b+tXPBERQqWMvHlAhNnZ9zPvj90jrvyGBZ3w/HZtvihaznQHm+M
  I0g9XwXFY16a2dTTm6Ver7d3d7D8n18s9LfPL7uHvwMQFH0DB/5GOZ2TmF0nnJB5e+ySRTTmxFcb
  gfxxdrY9nBjJqMz4IeF3aCQjtAVpBWNsFJHRRaCamBkz4LXUvlfBYGKaCbSN7k2jQhzGVh24kZO4
  j5M+AwM8sD/tlHEZYSYJ86UMampp9xPKXFd9njBpuqxHj63QhtFVB23oEoYumiDKBiKBn3a6aAyb
  Mya+sotDMyjtdnRZeYHt+DG0ZLlBhdcIAiLL97HQcaXCG0ZYHXbQuMIxdMGEkroypzLiiWwhzKhL
  a2fH6i2oAL1a/UI3qoBUTLQCqTEBzUxwTOSuG52O30fT9+mwn54A3H0/eoXOPx6/WefFstgWy/u1
  xXuq8+36agHjef5V53qdgxFc2KCZXum7rFjeLtfXmywvNttb6PivkA0Ko35iV8p4PD++Kd+JTu8u
  X6Oz81n/n5N3b0avUHo8GrcuA4uhF3Puvc2ZEbXWzkcqVt6Csq7h9JnaotwWAu2+P/GpNs7Pt4fh
  AwqnSiTxHRiZEcHWzouPvbcwPupOy9MNqKTP1NzYPZqTsLGdZ+oF5fB5mjk/G0HpIWrX3MDC3v2A
  j3ZueQIxUiI6C18mmLOwY7jeZNv8Rl/qEO3LoGQRSB7fEZGB+C7tfof2rVCErXgDzPPVpp0NwqMY
  Usd3EmCwbKWdr/qtPIZF3nBc1X0PBUxBf0seE1/Fz0B4l3a/rIErCGEkNJDgb6o9ZhDd4Mpb9oN4
  dHZ/WvlWiIMoagAHZUJkn9C+qedkQNSAtEs5CtKbCEp9hwUKxby0+5PKt0IbRlcdtBFy3NJFd3S1
  HzZRLqIEc3+6oBuUdn9W+VZ4wwirww5SvpQkkKFxg7AuypdS5ux+k/KtgAQpXwqtDBbD4XG96AL6
  0CPR+0mvi0220uji/r5oE7gH5OxTzesjcGGFIiKxf3rCnFHa+Qi6yltYctWd/h6Be/jkk8Qkwso4
  6nrySYx0VztoMP+Zs/AJbL3U6cmRgC1pAVNJoIpJ+1ienMtJevCzthAVSaDgQc56LyhgcXZmQT9t
  bzbL62ukN9f3q5tCo+yu876pEAQtchPI0wrCW3OacBkJ5V9yicDOzk6O6fRDf1pkxTYPLiEVkjAq
  GoBOz89H7bFTGCKo9I+dMWdnP2YACZcX3cPcOw0Ls+F7URQPg6MjvZhnkSt20ZU+up/nD0c7QP8D
  ccBHUg0KZW5kc3RyZWFtCmVuZG9iago1IDAgb2JqCjw8Ci9Gb250IDYgMCBSCj4+CmVuZG9iago2
  IDAgb2JqCjw8Ci9GMSA3IDAgUgovRjIgOCAwIFIKL0YzIDkgMCBSCj4+CmVuZG9iago3IDAgb2Jq
  Cjw8Ci9UeXBlIC9Gb250Ci9TdWJ0eXBlIC9UeXBlMQovQmFzZUZvbnQgL0hlbHZldGljYS1Cb2xk
  T2JsaXF1ZQovRW5jb2RpbmcgL1dpbkFuc2lFbmNvZGluZwo+PgplbmRvYmoKOCAwIG9iago8PAov
  VHlwZSAvRm9udAovU3VidHlwZSAvVHlwZTEKL0Jhc2VGb250IC9IZWx2ZXRpY2EKL0VuY29kaW5n
  IC9XaW5BbnNpRW5jb2RpbmcKPj4KZW5kb2JqCjkgMCBvYmoKPDwKL1R5cGUgL0ZvbnQKL1N1YnR5
  cGUgL1R5cGUxCi9CYXNlRm9udCAvSGVsdmV0aWNhLUJvbGQKL0VuY29kaW5nIC9XaW5BbnNpRW5j
  b2RpbmcKPj4KZW5kb2JqCnhyZWYKMCAxMAowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMTUg
  MDAwMDAgbg0KMDAwMDAwMDA3OCAwMDAwMCBuDQowMDAwMDAwMTM1IDAwMDAwIG4NCjAwMDAwMDAy
  NDcgMDAwMDAgbg0KMDAwMDAwMjAxOCAwMDAwMCBuDQowMDAwMDAyMDUxIDAwMDAwIG4NCjAwMDAw
  MDIxMDIgMDAwMDAgbg0KMDAwMDAwMjIxMSAwMDAwMCBuDQowMDAwMDAyMzA4IDAwMDAwIG4NCnRy
  YWlsZXIKPDwKL1Jvb3QgMSAwIFIKL0lEIFs8Q0YwOEE5NjJBNDcyQ0EzQzE3OTQzNTc5NENFNkYz
  MDM+IDxDRjA4QTk2MkE0NzJDQTNDMTc5NDM1Nzk0Q0U2RjMwMz5dCi9TaXplIDEwCj4+CnN0YXJ0
  eHJlZgoyNDEwCiUlRU9GCg==
  ------=_Part_16_1977848886.1681742225100--

```

# KIM Fehlernachricht

|Header                    |Inhalt                                          |verpflichtend|
|------                    |-------                                          |-------------|
|X-KIM-Dienstkennung      |eEB;Fehler;V1.0                                  |ja|
|X-KIM-Ursprungssystem    |\<PVS-Bezeichnung>;\<Releaseversion>             |nein|
|X-KIM-Sendersystem        |\<Kasse-Bezeichnung>;\<Releaseversion>           |nein|
|X-KIM-Support             |\<Support-Email-Adresse Kasse>                   |nein|
|In-Reply-To               |Message-ID der Anfrage                           |ja|
|Subject                   |\<T/E>EEB0_FEH_\<UUID> |ja<br /><br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Type              |application/xml;<br />name="<T/E>EEB0_FEH_\<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Transfer-Encoding |base64                                          |ja|
|Content-Disposition       |attachment;<br />filename="<T/E>EEB0_FEH_\<UUID>.xml"  |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Description       |eEB_FEH                                          |ja|

Der Anhang enthält eine Fehlermeldung als FHIR-Ressource `OperationOutcome`

## KIM Fehler Beispielnachricht

```xml
  Date: Fri, 16 Dec 2022 14:34:51 +0100 (CET)
  From: tk@dgn.kim.telematik-test
  To: ehex-22@arv.kim.telematik-test
  Message-ID: <235818581.18.1671197691939@MX-PF1XKCBH.dst.tk-inline.net>
  Subject: TEEB0_FEH_8e1977b6-fadb-4cec-8019-d55131a6de03
  MIME-Version: 1.0
  Content-Type: multipart/mixed;
  boundary="----=_Part_21_1298487754.1671197811998"
  X-System: DT02
  X-KIM-Ursprungssystem: easyTI;2.0.4-SNAPSHOT
  X-KIM-Sendersystem: Test-TK;1.0
  X-KIM-Support: v-eeb@tk.de
  X-KIM-Dienstkennung: eEB;Fehler;V1.0
  X-KIM-Fehlercode: 101
  X-TK-OBJECT-ID: 13901:000100000000005285890500000001A3
  X-TK-ARCHIVE-ID: SENT/EEB0/1.0/ehex-22@arv.kim.telematik-test/2022/12/16/1/<235818581.18.1671197691939@MX-PF1XKCBH.dst.tk-inline.net>

  ------=_Part_21_1298487754.1671197811998
  Content-Type: text/plain;charset=UTF-8
  Content-Transfer-Encoding: quoted-printable



  <DT02 - MX-PF1XKCBH/10.252.17.28>

  101 - Die übermittelte eEB entspricht nicht den Vorgaben und/oder ist =
  nicht lesbar. - Es gab 1 Fehler beim Validieren der FHIR-Nachricht: 1) Fail=
  ed to parse input, it does not appear to be valid XML:Content ist nicht zul=
  ?ssig in Prolog.
  ---------------------------------------------
  Die Nachricht wurde entschlüsselt.
  Die Signatur wurde erfolgreich geprüft.
  ------=_Part_21_1298487754.1671197811998
  Content-Type: application/xml; charset=utf-8;
  name=TEEB0_FEH_8e1977b6-fadb-4cec-8019-d55131a6de03.xml
  Content-Transfer-Encoding: base64
  Content-Disposition: attachment;
  filename=TEEB0_FEH_8e1977b6-fadb-4cec-8019-d55131a6de03.xml
  Content-Description: eEB_FEH

  PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4NCjxPcGVyYXRpb25PdXRjb21l
  IHhtbG5zPSJodHRwOi8vaGw3Lm9yZy9maGlyIj4KICAgPGlkIHZhbHVlPSI4ZTE5NzdiNi1mYWRi
  LTRjZWMtODAxOS1kNTUxMzFhNmRlMDMiIC8+CiAgIDxtZXRhPgogICAgICA8cHJvZmlsZSB2YWx1
  ZT0iaHR0cHM6Ly9nZW1hdGlrLmRlL2ZoaXIvZWViL1N0cnVjdHVyZURlZmluaXRpb24vRUVCRmVo
  bGVyIiAvPgogICA8L21ldGE+CiAgIDxpc3N1ZT4KICAgICAgPGV4dGVuc2lvbiB1cmw9Imh0dHBz
  Oi8vZ2VtYXRpay5kZS9maGlyL2VlYi9TdHJ1Y3R1cmVEZWZpbml0aW9uL0VFQk9wZXJhdGlvbk91
  dGNvbWVJc3N1ZUlkZW50aWZpZXIiPgogICAgICAgICA8ZXh0ZW5zaW9uIHVybD0iTWVzc2FnZS1J
  RCI+CiAgICAgICAgICAgIDx2YWx1ZUlkZW50aWZpZXI+CiAgICAgICAgICAgICAgIDxzeXN0ZW0g
  dmFsdWU9Imh0dHBzOi8vZ2VtYXRpay5kZS9maGlyL2VlYi9TdHJ1Y3R1cmVEZWZpbml0aW9uL01l
  c3NhZ2VfSURfS0lNIiAvPgogICAgICAgICAgICAgICA8dmFsdWUgdmFsdWU9IjU2MTE2MDk4Ny44
  LjE2NzExOTQ4NjYxOTVAbG9jYWxob3N0IiAvPgogICAgICAgICAgICA8L3ZhbHVlSWRlbnRpZmll
  cj4KICAgICAgICAgPC9leHRlbnNpb24+CiAgICAgIDwvZXh0ZW5zaW9uPgogICAgICA8c2V2ZXJp
  dHkgdmFsdWU9ImZhdGFsIiAvPgogICAgICA8Y29kZSB2YWx1ZT0icHJvY2Vzc2luZyIgLz4KICAg
  ICAgPGRldGFpbHM+CiAgICAgICAgIDxjb2Rpbmc+CiAgICAgICAgICAgIDxzeXN0ZW0gdmFsdWU9
  Imh0dHBzOi8vZ2VtYXRpay5kZS9maGlyL2VlYi9Db2RlU3lzdGVtL0VFQkVycm9yY29kZUNTIiAv
  PgogICAgICAgICAgICA8Y29kZSB2YWx1ZT0iMTAxIiAvPgogICAgICAgICAgICA8ZGlzcGxheSB2
  YWx1ZT0iRGllIMO8YmVybWl0dGVsdGUgZUVCIGVudHNwcmljaHQgbmljaHQgZGVuIFZvcmdhYmVu
  IHVuZC9vZGVyIGlzdCBuaWNodCBsZXNiYXIuIiAvPgogICAgICAgICA8L2NvZGluZz4KICAgICAg
  ICAgPHRleHQgdmFsdWU9IkVzIGdhYiAxIEZlaGxlciBiZWltIFZhbGlkaWVyZW4gZGVyIEZISVIt
  TmFjaHJpY2h0OiAxKSBGYWlsZWQgdG8gcGFyc2UgaW5wdXQsIGl0IGRvZXMgbm90IGFwcGVhciB0
  byBiZSB2YWxpZCBYTUw6Q29udGVudCBpc3QgbmljaHQgenVsP3NzaWcgaW4gUHJvbG9nLiIgLz4K
  ICAgICAgPC9kZXRhaWxzPgogICA8L2lzc3VlPgo8L09wZXJhdGlvbk91dGNvbWU+
  ------=_Part_21_1298487754.1671197811998
  Content-Type: application/pdf; name=Signaturpruefungsbericht.pdf
  Content-Transfer-Encoding: base64
  Content-Disposition: attachment; filename=Signaturpruefungsbericht.pdf

  JVBERi0xLjQKJfbk/N8KMSAwIG9iago8PAovVHlwZSAvQ2F0YWxvZwovVmVyc2lvbiAvMS40Ci9Q
  YWdlcyAyIDAgUgo+PgplbmRvYmoKMiAwIG9iago8PAovVHlwZSAvUGFnZXMKL0tpZHMgWzMgMCBS
  XQovQ291bnQgMQo+PgplbmRvYmoKMyAwIG9iago8PAovVHlwZSAvUGFnZQovTWVkaWFCb3ggWzAu
  MCAwLjAgNjEyLjAgNzkyLjBdCi9Db250ZW50cyA0IDAgUgovUmVzb3VyY2VzIDUgMCBSCi9QYXJl
  bnQgMiAwIFIKPj4KZW5kb2JqCjQgMCBvYmoKPDwKL0xlbmd0aCAxNjkzCi9GaWx0ZXIgL0ZsYXRl
  RGVjb2RlCj4+CnN0cmVhbQ0KeJy9WV1T2zoQfc+v0GM70xh9y85c7gxxEtppCx2S3pnb6YsJguQS
  AhM7/fr1dyUrsQ2httROISEQZ71nj1a7Z8Vw1jsa6S/Lub44HaJ53sPIfOfz3tGEICLR7LpHMVKC
  otlV7y/BZCKVHEuiuBKKKqzoJJVSUgl/wTUmY8X/RrP/euPGndOpu/M07cF94RtcEPTV3pywSCQS
  EwT3QCSOOOZoo3vD3nBWx0NRYuFwsFDOwoDiHBwLih+Do1gp8yq5uWoBSjmRqVTwmyjBwvsKrrgw
  FKfjHfg9XBwlaPesQMuERgKLJLagKYlwcggzQ4Q40ODQWQDoFycRmi5v1lmx3VzpIluu8pePHT/m
  SSoRUREjokgkMYbogQbK48NcxTu3KrFWxunO4w+9LB6269sCrbJtgT6uC23emy/WejP4OQ6S7Jzv
  4HCMI5bAVzsckoi9cYWKYkr7BB4SET5gfCB4OxcijjApOfBiQ1Jn5zLH5oocQR5waXPmuRSHT42l
  YidP8uM5evYIwwiqA31MkRwI0k4Rx5GSYOlLEefOzlE0kUNDEWyZseJm80zkaGK3VCLHFHOqEmXI
  Yx7k7LGFkVOH+IIBEnT5vdAdthCFUkNMffHkhCpnZxy+zvJFtrq53yyLxd02775j9t7Dom6AmL4+
  oUK2R4xlBHUPC9+ICXZ29cIRFPUeQVjUDSAX05MP02lr1CJOYPfEWHlGLRLm7Fy3gxYh00mqmGKQ
  /6lMx9yUgXr2S8h+n9yvsAXx0YAIhYHH7WwAB0ph7Ns6BFT40s646rrelbew+BpOR3qDvtzfNVsU
  yiEdl3pTaGS24lf4DT1keV6gH1t0pdfV9TUaZfDzCfTDPV0IHMkYQ6p17elCcGdhwA4j9Am8Lq+X
  t1mRd23rgtGIKtglneUP5KWzaDZ1f9dERJjG/olBEmdnALxZL7JLWJUrndfj71wgKhRhCdMAk54d
  z96i2duL/kxDQszG01n//Ozdv61c8ERFCpYy8eUCE2dn3M++P3SOu/IYFnfD8dm2+KFrOdAeb4wj
  SD1fAcVjXprZ1NObpV6vt3d3sPyfXyz0t88vu4e/AxAUfQMH/kY5nZOYXSeckHl77JJFNObEVxqB
  +nF2tj2cGMWozPQh4Tk0ihHagrR6MTaCyMgiEE1GoCh4L7WfVTCXmGYCbaN706gQh7FVB27UJO7j
  pM/AAA/so50yLiPMJGG+lEFNLe1+Qpnrqs8TJk2X9eixFdowuuqgDV3C0EUTRNlAJPBop4vGsDlj
  4iu7ODSD0m5Hl5UX2E4fQ0uWm1N4jSAgsvwcC51WKrxhhNVhB00rHEMXTCipK3MqI57IFsKMurR2
  dqreggrQq9UvdKMKSMVEK5AaE9DMBMdE7rrR6fh9NH2fDvvpCcDd96NX6Pzj8Zt1XiyLbbG8X1u8
  pzrfrq8WMJ3nX3Wu1zkYwYUNmumVvsuK5e1yfb3J8mKzvYWO/wrZoDDqJ3aljMfz45vyk+j07vI1
  Ojuf9f85efdm9Aqlx6Nx6zKwGHox597bnBlRa+18pGLlLSjrGk6fqS3KbSHQ7vsDn2rj/Hx7GD6g
  cKpEEt+BkRkRbO28+Nh7C+Oj7rQ83IBK+kzNjd2rOQgb23mmXlAOH6eZ47MRlB6ids0NLOzdD/ho
  55YnECMlorPwZYI5CzuG6022zW/0pQ7RvgxKFoHk8R0RGYjv0u53aN8KRdiKN8A8X23a2SA8iiF1
  fCcBBstW2vmq38pjWOQNx1Xd91DAFPS35DHxVfwMhHdp98sauIIQRkIDCf6m2mMG0Q2uvGU/iEdn
  96eVb4U4iKIGcFAmRFplAvWcDIgakHYpR0F6E0Gp77BAoZiXdn9S+VZow+iqgzZCjlu66I6u9sMm
  ykWUYO5PF3SD0u7PKt8KbxhhddhBypeSBDI0bhDWRflSypzdb1K+FZAg5UuhlcFiODyuF11AH3ok
  ej/pdbHJVhpd3N8XbQL3gJx9qnl9BC6sUEQk9k9PmDNKOx9BV3kLS666098jcA+ffJKYRFgZR11P
  PomR7moHDeY/cxY+ga2XOj05ErAlLWAqCVQxaV/Lk3M5SQ/+qy1ERRIoeJCz3gsKWJydWdBP25vN
  8voa6c31/eqm0Ci767xvKgRBi9wE8rSCtJ/NEC4jofxLLhHY2dnJMZ1+6E+LrNjmwSWkQhJGRQPQ
  6fn5qD12CkMElf6xM+bs7L8ZQMLlRfcw907Dwmz4XhTFw+DoSC/mWeSKXXSlj+7n+cPRDtD/24lH
  BQ0KZW5kc3RyZWFtCmVuZG9iago1IDAgb2JqCjw8Ci9Gb250IDYgMCBSCj4+CmVuZG9iago2IDAg
  b2JqCjw8Ci9GMSA3IDAgUgovRjIgOCAwIFIKL0YzIDkgMCBSCj4+CmVuZG9iago3IDAgb2JqCjw8
  Ci9UeXBlIC9Gb250Ci9TdWJ0eXBlIC9UeXBlMQovQmFzZUZvbnQgL0hlbHZldGljYS1Cb2xkT2Js
  aXF1ZQovRW5jb2RpbmcgL1dpbkFuc2lFbmNvZGluZwo+PgplbmRvYmoKOCAwIG9iago8PAovVHlw
  ZSAvRm9udAovU3VidHlwZSAvVHlwZTEKL0Jhc2VGb250IC9IZWx2ZXRpY2EKL0VuY29kaW5nIC9X
  aW5BbnNpRW5jb2RpbmcKPj4KZW5kb2JqCjkgMCBvYmoKPDwKL1R5cGUgL0ZvbnQKL1N1YnR5cGUg
  L1R5cGUxCi9CYXNlRm9udCAvSGVsdmV0aWNhLUJvbGQKL0VuY29kaW5nIC9XaW5BbnNpRW5jb2Rp
  bmcKPj4KZW5kb2JqCnhyZWYKMCAxMAowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMTUgMDAw
  MDAgbg0KMDAwMDAwMDA3OCAwMDAwMCBuDQowMDAwMDAwMTM1IDAwMDAwIG4NCjAwMDAwMDAyNDcg
  MDAwMDAgbg0KMDAwMDAwMjAxNSAwMDAwMCBuDQowMDAwMDAyMDQ4IDAwMDAwIG4NCjAwMDAwMDIw
  OTkgMDAwMDAgbg0KMDAwMDAwMjIwOCAwMDAwMCBuDQowMDAwMDAyMzA1IDAwMDAwIG4NCnRyYWls
  ZXIKPDwKL1Jvb3QgMSAwIFIKL0lEIFs8MDhCMThCODVBRjFENEQ0NTQwNTRDQjA0REU5ODIyMzE+
  IDwwOEIxOEI4NUFGMUQ0RDQ1NDA1NENCMDRERTk4MjIzMT5dCi9TaXplIDEwCj4+CnN0YXJ0eHJl
  ZgoyNDA3CiUlRU9GCg==
  ------=_Part_21_1298487754.1671197811998--

```
