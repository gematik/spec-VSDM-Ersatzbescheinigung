# Inhalt

- [Inhalt](#inhalt)
  - [Verwendung von KIM](#verwendung-von-kim)
  - [KIM Dienstkennungen](#kim-dienstkennungen)
  - [KIM Anfrage einer Ersatzbescheinigung](#kim-anfrage-einer-ersatzbescheinigung)
    - [KIM Anfrage Beispielnachricht](#kim-anfrage-beispielnachricht)
  - [KIM Bescheinigung](#kim-bescheinigung)
    - [KIM Bescheinigung Beispielnachricht](#kim-bescheinigung-beispielnachricht)
  - [KIM Fehlernachricht](#kim-fehlernachricht)

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

## KIM Anfrage einer Ersatzbescheinigung

Die FHIR-Datensätze in Anfrage- und Antwortnachrichten werden ausschließlich als Anhang in der KIM Nachricht übertragen.
**siehe unten**

|KIM-Header              |Inhalt                                 |verpflichtend|
|------------------------|---------------------------------------|-------------|
|X-KIM-Dienstkennung     |eEB;Anfrage;V1.0                       |ja|
|X-KIM-Sendersystem      |\<PVS-Bezeichnung>;\<Releaseversion>   |ja|
|X-KIM-Support           |\<Support-Email-Adresse PVS-Hersteller>|nein|
|Subject                 |\<T/E>EEB0_ANF_\<UUID>                 |ja <br />T/E: *T*estsystem (RU) / *E*chtsystem (PU)<br />UUID: bundle-identifier (AZ des LE)|
|Content-Type            | application/xml;<br />name="<T/E>EEB0_ANF_<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ des LE)<br />
|Content-Transfer-Encoding |base64 |ja|
|Content-Disposition     |attachment; filename="<T/E>EEB0_ANF_<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ des LE)|
|Content-Description     |eEB_ANF                                |ja|

Der Anhang enthält die Anfrage als FHIR-Ressource `EEBAnfrageBundle`
### KIM Anfrage Beispielnachricht

    Date: Fri, 4 Nov 2022 13:02:59 +0100 (CET)
    From: ehex-22@arv.kim.telematik-test
    Reply-To: ehex-22@arv.kim.telematik-test
    To: tk@dgn.kim.telematik-test
    Message-ID: <1022545854.7.1667563379499@localhost>
    Subject: TEEB0_ANF_cb67de30-a309-4f1d-9dd1-6cc73a65a3a6
    MIME-Version: 1.0
    Content-Type: multipart/mixed;
     boundary="----=_Part_6_1831919254.1667563379306"
    X-KIM-Dienstkennung: eEB;Anfrage;V1.0
    X-KIM-Sendersystem: easyTI;1.7.3-SNAPSHOT

    ------=_Part_6_1831919254.1667563379306
    Content-Type: text/plain; charset=utf-8
    Content-Transfer-Encoding: 7bit

    eEB Anfrage TEEB0_ANF_cb67de30-a309-4f1d-9dd1-6cc73a65a3a6
    ------=_Part_6_1831919254.1667563379306
    Content-Type: application/xml;
     name=TEEB0_ANF_cb67de30-a309-4f1d-9dd1-6cc73a65a3a6.xml
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment;
     filename=TEEB0_ANF_cb67de30-a309-4f1d-9dd1-6cc73a65a3a6.xml
    Content-Description: eEB

    PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48QnVuZGxlIHhtbG5zPSJodHRw
    Oi8vaGw3Lm9yZy9maGlyIj48aWQgdmFsdWU9ImQ5OGZjZTcyLWNiNGEtNDY3OC04M2UwLTQ5OTNj
    ODFjZGYwOCIvPjxtZXRhPjxwcm9maWxlIHZhbHVlPSJodHRwczovL2ZoaXIuZWhleC5kZS9TdHJ1
    Y3R1cmVEZWZpbml0aW9uL0VFQkFuZnJhZ2VCdW5kbGV8MS4wLjAiLz48L21ldGE+PGlkZW50aWZp
    ZXI+PHN5c3RlbSB2YWx1ZT0idXJuOmlldGY6cmZjOjM5ODYiLz48dmFsdWUgdmFsdWU9ImNiNjdk
    ZTMwLWEzMDktNGYxZC05ZGQxLTZjYzczYTY1YTNhNiIvPjwvaWRlbnRpZmllcj48dHlwZSB2YWx1
    ZT0ibWVzc2FnZSIvPjx0aW1lc3RhbXAgdmFsdWU9IjIwMjItMTEtMDRUMTM6MDI6NTcuNTczKzAx
    OjAwIi8+PGVudHJ5PjxmdWxsVXJsIHZhbHVlPSJodHRwczovL2Vhc3l0aS5laGV4LmRlL2ZoaXIv
    TWVzc2FnZUhlYWRlci8xNTdhNDUzOC0zYWZiLTQyZGMtOGQ2NS0zNzg2Njg1ZTA5MjciLz48cmVz
    b3VyY2U+PE1lc3NhZ2VIZWFkZXI+PGlkIHZhbHVlPSIxNTdhNDUzOC0zYWZiLTQyZGMtOGQ2NS0z
    Nzg2Njg1ZTA5MjciLz48bWV0YT48cHJvZmlsZSB2YWx1ZT0iaHR0cHM6Ly9maGlyLmVoZXguZGUv
    U3RydWN0dXJlRGVmaW5pdGlvbi9FRUJBbmZyYWdlSGVhZGVyfDEuMC4wIi8+PC9tZXRhPjxleHRl
    bnNpb24gdXJsPSJodHRwczovL2ZoaXIuZWhleC5kZS9TdHJ1Y3R1cmVEZWZpbml0aW9uL0xlaXN0
    dW5nc2RhdHVtIj48dmFsdWVEYXRlIHZhbHVlPSIyMDIyLTExLTAzIi8+PC9leHRlbnNpb24+PGV4
    dGVuc2lvbiB1cmw9Imh0dHBzOi8vZmhpci5laGV4LmRlL1N0cnVjdHVyZURlZmluaXRpb24vRWlu
    dmVyc3RhZW5kbmlzIj48dmFsdWVCb29sZWFuIHZhbHVlPSJ0cnVlIi8+PC9leHRlbnNpb24+PGV2
    ZW50VXJpIHZhbHVlPSJodHRwczovL2ZoaXIuZWhleC5kZS9FRUJBbmZyYWdlIi8+PHNlbmRlcj48
    cmVmZXJlbmNlIHZhbHVlPSJPcmdhbml6YXRpb24vNDY0MWI4NmUtMjBjYy00ZTlkLWFiODctYmFi
    ZWRhYzY4NjVhIi8+PC9zZW5kZXI+PHNvdXJjZT48ZW5kcG9pbnQgdmFsdWU9Imh0dHBzOi8vZWhl
    eC5kZS9LSU0iLz48L3NvdXJjZT48L01lc3NhZ2VIZWFkZXI+PC9yZXNvdXJjZT48L2VudHJ5Pjxl
    bnRyeT48ZnVsbFVybCB2YWx1ZT0iaHR0cHM6Ly9lYXN5dGkuZWhleC5kZS9maGlyL1BhdGllbnQv
    Y2Y1MDRiZmUtMWJlOS00ZTQ1LTg5Y2ItN2ZiMjczZWEyNzhlIi8+PHJlc291cmNlPjxQYXRpZW50
    PjxpZCB2YWx1ZT0iY2Y1MDRiZmUtMWJlOS00ZTQ1LTg5Y2ItN2ZiMjczZWEyNzhlIi8+PG1ldGE+
    PHByb2ZpbGUgdmFsdWU9Imh0dHBzOi8vZmhpci5laGV4LmRlL1N0cnVjdHVyZURlZmluaXRpb24v
    VW5rbm93blBhdGllbnR8MS4wLjAiLz48L21ldGE+PG5hbWU+PHVzZSB2YWx1ZT0ib2ZmaWNpYWwi
    Lz48ZmFtaWx5IHZhbHVlPSJUSy1lQVUtTcO8bGxlciI+PGV4dGVuc2lvbiB1cmw9Imh0dHA6Ly9o
    bDcub3JnL2ZoaXIvU3RydWN0dXJlRGVmaW5pdGlvbi9odW1hbm5hbWUtb3duLW5hbWUiPjx2YWx1
    ZVN0cmluZyB2YWx1ZT0iVEstZUFVLU3DvGxsZXIiLz48L2V4dGVuc2lvbj48L2ZhbWlseT48Z2l2
    ZW4gdmFsdWU9IlBldGVyIi8+PC9uYW1lPjxiaXJ0aERhdGUgdmFsdWU9IjE5OTItMDEtMDEiLz48
    YWRkcmVzcz48cG9zdGFsQ29kZSB2YWx1ZT0iNDAyMjEiLz48L2FkZHJlc3M+PC9QYXRpZW50Pjwv
    cmVzb3VyY2U+PC9lbnRyeT48ZW50cnk+PGZ1bGxVcmwgdmFsdWU9Imh0dHBzOi8vZWFzeXRpLmVo
    ZXguZGUvZmhpci9Pcmdhbml6YXRpb24vNDY0MWI4NmUtMjBjYy00ZTlkLWFiODctYmFiZWRhYzY4
    NjVhIi8+PHJlc291cmNlPjxPcmdhbml6YXRpb24+PGlkIHZhbHVlPSI0NjQxYjg2ZS0yMGNjLTRl
    OWQtYWI4Ny1iYWJlZGFjNjg2NWEiLz48bWV0YT48cHJvZmlsZSB2YWx1ZT0iaHR0cHM6Ly9maGly
    Lmtidi5kZS9TdHJ1Y3R1cmVEZWZpbml0aW9uL0tCVl9QUl9GT1JfT3JnYW5pemF0aW9ufDEuMC4z
    Ii8+PC9tZXRhPjxpZGVudGlmaWVyPjx0eXBlPjxjb2Rpbmc+PHN5c3RlbSB2YWx1ZT0iaHR0cDov
    L3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS92Mi0wMjAzIi8+PGNvZGUgdmFsdWU9IkJT
    TlIiLz48L2NvZGluZz48L3R5cGU+PHN5c3RlbSB2YWx1ZT0iaHR0cHM6Ly9maGlyLmtidi5kZS9O
    YW1pbmdTeXN0ZW0vS0JWX05TX0Jhc2VfQlNOUiIvPjx2YWx1ZSB2YWx1ZT0iMDEyMzQ1Njc4Ii8+
    PC9pZGVudGlmaWVyPjxuYW1lIHZhbHVlPSJQcmF4aXMgQsO8bG93LUJvZ2VuIi8+PHRlbGVjb20+
    PHN5c3RlbSB2YWx1ZT0icGhvbmUiLz48dmFsdWUgdmFsdWU9IjAxMjM0NTY3ODkiLz48L3RlbGVj
    b20+PGFkZHJlc3M+PHR5cGUgdmFsdWU9ImJvdGgiLz48bGluZSB2YWx1ZT0iRW1pbC1GaWdnZS1T
    dHJhw59lIDIiPjxleHRlbnNpb24gdXJsPSJodHRwOi8vaGw3Lm9yZy9maGlyL1N0cnVjdHVyZURl
    ZmluaXRpb24vaXNvMjEwOTAtQURYUC1zdHJlZXROYW1lIj48dmFsdWVTdHJpbmcgdmFsdWU9IkVt
    aWwtRmlnZ2UtU3RyYcOfZSIvPjwvZXh0ZW5zaW9uPjxleHRlbnNpb24gdXJsPSJodHRwOi8vaGw3
    Lm9yZy9maGlyL1N0cnVjdHVyZURlZmluaXRpb24vaXNvMjEwOTAtQURYUC1ob3VzZU51bWJlciI+
    PHZhbHVlU3RyaW5nIHZhbHVlPSIyIi8+PC9leHRlbnNpb24+PC9saW5lPjxjaXR5IHZhbHVlPSJE
    b3J0bXVuZCIvPjxwb3N0YWxDb2RlIHZhbHVlPSI0NDIyNyIvPjxjb3VudHJ5IHZhbHVlPSJEIi8+
    PC9hZGRyZXNzPjwvT3JnYW5pemF0aW9uPjwvcmVzb3VyY2U+PC9lbnRyeT48L0J1bmRsZT4=
    ------=_Part_6_1831919254.1667563379306--

## KIM Bescheinigung

|Header                  |Inhalt                                 |verpflichtend|
|------------------------|---------------------------------------|-------------|
|X-KIM-Dienstkennung     |eEB;Bescheinigung;V1.0                 |ja|
|X-KIM-Sendersystem      |\<Kasse-Bezeichnung>;\<Releaseversion> |nein|
|X-KIM-Support           |\<Support-Email-Adresse Kasse> |nein|
|In-Reply-To             |Message-ID der Anfrage                 |ja - wenn die Anfrage über eine KIM-Nachricht gestellt wurde <br />Andernfalls nein|
|Subject                 |\<T/E>EEB0_BES_\<UUID>                 |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Type            |application/octet-stream; name="<T/E>EEB0_BES_<UUID>.p7s" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Transfer-Encoding |base64 |ja|
|Content-Disposition     |attachment; filename="<T/E>EEB0_BES_<UUID>.p7s" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Description     |eEB_BES |ja|

Der Anhang enthält die signierte Bescheinigung (SMC-B signiert) als `PKCS7`-Datei

### KIM Bescheinigung Beispielnachricht

    Date: Fri, 4 Nov 2022 13:03:45 +0100 (CET)
    From: tk@dgn.kim.telematik-test
    To: ehex-22@arv.kim.telematik-test
    Message-ID: <244928484.108.1667563425333@reai20v01.dst.tk-inline.net>
    Subject: TEEB0_BES_f2197b7b-7859-4f0d-9028-29db19cfa99d
    MIME-Version: 1.0
    Content-Type: multipart/mixed;
     boundary="----=_Part_8_1818972272.1667563520030"
    X-System: DT02
    X-KIM-Dienstkennung: eEB;Bescheinigung;V1.0
    X-TK-OBJECT-ID: 13901:0001000000000051795805000007996E
    X-TK-ARCHIVE-ID: SENT/EEB0/1.0/ehex-22@arv.kim.telematik-test/2022/11/04/1/<244928484.108.1667563425333@reai20v01.dst.tk-inline.net>

    ------=_Part_8_1818972272.1667563520030
    Content-Type: text/plain;charset=UTF-8
    Content-Transfer-Encoding: quoted-printable
    <DT02 - reai20v01.dst.tk-inline.net/10.183.101.43>

    ---------------------------------------------

    Die Nachricht wurde entschlüsselt.
    Die Signatur wurde erfolgreich geprüft.

    ------=_Part_8_1818972272.1667563520030
    Content-Type: application/octet-stream; charset=utf-8;
     name=TEEB0_BES_f2197b7b-7859-4f0d-9028-29db19cfa99d.p7s
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment;
     filename=TEEB0_BES_f2197b7b-7859-4f0d-9028-29db19cfa99d.p7s
    Content-Description: eEB_BES

    MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwGggCSABIID
    6Dw/eG1sIHZlcnNpb249IjEuMCIgZW5jb2Rpbmc9IlVURi04Ij8+CjxCdW5kbGUgeG1sbnM9Imh0
    dHA6Ly9obDcub3JnL2ZoaXIiPgogICA8aWQgdmFsdWU9Ijg3NjE5M2U0LWY4ODAtNDY2Yy1hYjZj
    LWQ5Yzk0ZjdlNDNlMSIgLz4KICAgPG1ldGE+CiAgICAgIDxwcm9maWxlIHZhbHVlPSJodHRwczov
    L2ZoaXIuZWhleC5kZS9TdHJ1Y3R1cmVEZWZpbml0aW9uL0VFQkJlc2NoZWluaWd1bmdCdW5kbGV8
    MS4wLjAiIC8+CiAgIDwvbWV0YT4KICAgPGlkZW50aWZpZXI+CiAgICAgIDxzeXN0ZW0gdmFsdWU9
    InVybjppZXRmOnJmYzozOTg2IiAvPgogICAgICA8dmFsdWUgdmFsdWU9ImYyMTk3YjdiLTc4NTkt
    NGYwZC05MDI4LTI5ZGIxOWNmYTk5ZCIgLz4KICAgPC9pZGVudGlmaWVyPgogICA8dHlwZSB2YWx1
    ZT0ibWVzc2FnZSIgLz4KICAgPHRpbWVzdGFtcCB2YWx1ZT0iMjAyMi0xMS0wNFQxMzowMzo0NS4x
    OTcrMDE6MDAiIC8+CiAgIDxlbnRyeT4KICAgICAgPGZ1bGxVcmwgdmFsdWU9Imh0dHBzOi8vZWFz
    eXRpLmVoZXguZGUvZmhpci9NZXNzYWdlSGVhZGVyL2EwZGM0Y2UzLWY5NTktNDZiNS04NGI2LWE5
    ZTJhMzQwZDVkYyIgLz4KICAgICAgPHJlc291cmNlPgogICAgICAgICA8TWVzc2FnZUhlYWRlciB4
    bWxucz0iaHR0cDovL2hsNy5vcmcvZmhpciI+CiAgICAgICAgICAgIDxpZCB2YWx1ZT0iYTBkYzRj
    ZTMtZjk1OS00NmI1LTg0YjYtYTllMmEzNDBkNWRjIiAvPgogICAgICAgICAgICA8bWV0YT4KICAg
    ICAgICAgICAgICAgPHByb2ZpbGUgdmFsdWU9Imh0dHBzOi8vZmhpci5laGV4LmRlL1N0cnVjdHVy
    ZURlZmluaXRpb24vRUVCQmVzY2hlaW5pZ3VuZ0J1bmRsZXwxLjAuMCIgLz4KICAgICAgICAgICAg
    PC9tZXRhPgogICAgICAgICAgICA8ZXZlbnRVcmkgdmFsdWU9Imh0dHBzOi8vZmhpci5laGV4LmRl
    L0VFQkJlc2NoZWluaWd1bmciIC8+CiAgICAgICAgICAgIDxzb3VyY2U+CiAgICAgICAgICAgICAg
    IDxlbmRwb2ludCB2YWx1ZT0iaHR0cDovL3d3dy50ay4EggPoZGUiIC8+CiAgICAgICAgICAgIDwv
    c291cmNlPgogICAgICAgICAgICA8cmVzcG9uc2U+CiAgICAgICAgICAgICAgIDxpZGVudGlmaWVy
    IHZhbHVlPSJjYjY3ZGUzMC1hMzA5LTRmMWQtOWRkMS02Y2M3M2E2NWEzYTYiIC8+CiAgICAgICAg
    ICAgICAgIDxjb2RlIHZhbHVlPSJvayIgLz4KICAgICAgICAgICAgPC9yZXNwb25zZT4KICAgICAg
    ICAgPC9NZXNzYWdlSGVhZGVyPgogICAgICA8L3Jlc291cmNlPgogICA8L2VudHJ5PgogICA8ZW50
    cnk+CiAgICAgIDxmdWxsVXJsIHZhbHVlPSJodHRwczovL2Vhc3l0aS5laGV4LmRlL2ZoaXIvQ292
    ZXJhZ2UvMzQ0YTA0MjItNmJiNi00YTA0LTg3MDUtOWQ1ZDc0NTE3MTM2IiAvPgogICAgICA8cmVz
    b3VyY2U+CiAgICAgICAgIDxDb3ZlcmFnZSB4bWxucz0iaHR0cDovL2hsNy5vcmcvZmhpciI+CiAg
    ICAgICAgICAgIDxpZCB2YWx1ZT0iMzQ0YTA0MjItNmJiNi00YTA0LTg3MDUtOWQ1ZDc0NTE3MTM2
    IiAvPgogICAgICAgICAgICA8bWV0YT4KICAgICAgICAgICAgICAgPHByb2ZpbGUgdmFsdWU9Imh0
    dHBzOi8vZmhpci5laGV4LmRlL1N0cnVjdHVyZURlZmluaXRpb24vRUVCQ292ZXJhZ2VFZ2t8MS4w
    LjAiIC8+CiAgICAgICAgICAgIDwvbWV0YT4KICAgICAgICAgICAgPGV4dGVuc2lvbiB1cmw9Imh0
    dHA6Ly9maGlyLmRlL1N0cnVjdHVyZURlZmluaXRpb24vZ2t2L3ZlcnNpb24tdnNkbSI+CiAgICAg
    ICAgICAgICAgIDx2YWx1ZVN0cmluZyB2YWx1ZT0iNS4yLjAiIC8+CiAgICAgICAgICAgIDwvZXh0
    ZW5zaW9uPgogICAgICAgICAgICA8ZXh0ZW5zaW9uIHVybD0iaHR0cHM6Ly9maGlyLmVoZXguZGUv
    U3RydWN0dXJlRGVmaW5pdGlvbi9BbGxnZW1laW5lVmVyc2ljaGVydW5nc2RhdGVuIj4KICAgICAg
    ICAgICAgICAgPHZhbHVlQmFzZTY0QmluYXJ5IHZhbHVlPSJQRDk0Yld3Z2RtVnljMmx2YmowaU1T
    NHdJaUJsYm1OdlpHbHVaejBpU1ZOUExUZzROVGt0TVRVaUlITjBZVzVrWVd4dmJtVTlJbmxsY3lJ
    L1BqeFZRMTlCYgSCA+hHeG5aVzFsYVc1bFZtVnljMmxqYUdWeWRXNW5jMlJoZEdWdVdFMU1JRU5F
    VFY5V1JWSlRTVTlPUFNJMUxqSXVNQ0lnZUcxc2JuTTlJbWgwZEhBNkx5OTNjeTVuWlcxaGRHbHJM
    bVJsTDJaaEwzWnpaRzB2ZG5Oa0wzWTFMaklpUGp4V1pYSnphV05vWlhKMFpYSStQRlpsY25OcFky
    aGxjblZ1WjNOelkyaDFkSG8rUEVKbFoybHViajR5TURJd01ERXdNVHd2UW1WbmFXNXVQanhMYjNO
    MFpXNTBjbUZsWjJWeVBqeExiM04wWlc1MGNtRmxaMlZ5YTJWdWJuVnVaejR4TURFMU56VTFNVGs4
    TDB0dmMzUmxiblJ5WVdWblpYSnJaVzV1ZFc1blBqeExiM04wWlc1MGNtRmxaMlZ5YkdGbGJtUmxj
    bU52WkdVK1JEd3ZTMjl6ZEdWdWRISmhaV2RsY214aFpXNWtaWEpqYjJSbFBqeE9ZVzFsUGxSbFky
    aHVhV3RsY2lCTGNtRnVhMlZ1YTJGemMyVThMMDVoYldVK1BFRmljbVZqYUc1bGJtUmxja3R2YzNS
    bGJuUnlZV1ZuWlhJK1BFdHZjM1JsYm5SeVlXVm5aWEpyWlc1dWRXNW5QakV3TkRBM056VXdNVHd2
    UzI5emRHVnVkSEpoWldkbGNtdGxibTUxYm1jK1BFdHZjM1JsYm5SeVlXVm5aWEpzWVdWdVpHVnlZ
    MjlrWlQ1RVBDOUxiM04wWlc1MGNtRmxaMlZ5YkdGbGJtUmxjbU52WkdVK1BFNWhiV1UrVkVzOEww
    NWhiV1UrUEM5QlluSmxZMmh1Wlc1a1pYSkxiM04wWlc1MGNtRmxaMlZ5UGp3dlMyOXpkR1Z1ZEhK
    aFpXZGxjajQ4TDFabGNuTnBZMmhsY25WdVozTnpZMmgxZEhvK1BGcDFjMkYwZW1sdVptOXpQanhh
    ZFhOaGRIcHBibVp2YzBkTFZqNDhWbVZ5YzJsamFHVnlkR1Z1WVhKMFBqRThMMVpsY25OcFkyaGxj
    blJsYm1GeWRENDhXblZ6WVhSNmFXNW1iM05mUVdKeVpXTm9iblZ1WjE5SFMxWStQRmRQVUQ0ek9E
    d3ZWMDlRUGp3dlduVnpZWFI2YVc1bWIzTmZRV0p5WldOb2JuVnVaMTlIUzFZK1BDOWFkWE5oZEhw
    cGJtWnZjMGRMVmo0OEwxcDFjMkYwZW1sdVptOXpQand2Vm1WeWMybGphR1Z5ZEdWeVBqd3ZWVU5m
    UVd4c1oyVnRaV2x1WlZabGNuTnBZMmhsY25WdVozTmtZWFJsYmxoTlREND0iBIID6CAvPgogICAg
    ICAgICAgICA8L2V4dGVuc2lvbj4KICAgICAgICAgICAgPGV4dGVuc2lvbiB1cmw9Imh0dHBzOi8v
    Zmhpci5laGV4LmRlL1N0cnVjdHVyZURlZmluaXRpb24vUGVyc29lbmxpY2hlVmVyc2ljaGVydGVu
    ZGF0ZW4iPgogICAgICAgICAgICAgICA8dmFsdWVCYXNlNjRCaW5hcnkgdmFsdWU9IlBEOTRiV3dn
    ZG1WeWMybHZiajBpTVM0d0lpQmxibU52WkdsdVp6MGlTVk5QTFRnNE5Ua3RNVFVpSUhOMFlXNWtZ
    V3h2Ym1VOUlubGxjeUkvUGp4VlExOVFaWEp6YjJWdWJHbGphR1ZXWlhKemFXTm9aWEowWlc1a1lY
    UmxibGhOVENCRFJFMWZWa1ZTVTBsUFRqMGlOUzR5TGpBaUlIaHRiRzV6UFNKb2RIUndPaTh2ZDNN
    dVoyVnRZWFJwYXk1a1pTOW1ZUzkyYzJSdEwzWnpaQzkyTlM0eUlqNDhWbVZ5YzJsamFHVnlkR1Z5
    UGp4V1pYSnphV05vWlhKMFpXNWZTVVErVkRBeU9UWTFNekk1TUR3dlZtVnljMmxqYUdWeWRHVnVY
    MGxFUGp4UVpYSnpiMjQrUEVkbFluVnlkSE5rWVhSMWJUNHhPVGt5TURFd01Ud3ZSMlZpZFhKMGMy
    UmhkSFZ0UGp4V2IzSnVZVzFsUGxCbGRHVnlQQzlXYjNKdVlXMWxQanhPWVdOb2JtRnRaVDVVU3kx
    bFFWVXRUY084Ykd4bGNqd3ZUbUZqYUc1aGJXVStQRWRsYzJOb2JHVmphSFErVFR3dlIyVnpZMmhz
    WldOb2RENDhVM1J5WVhOelpXNUJaSEpsYzNObFBqeFFiM04wYkdWcGRIcGhhR3crTkRBeU1qRThM
    MUJ2YzNSc1pXbDBlbUZvYkQ0OFQzSjBQa1REdkhOelpXeGtiM0ptUEM5UGNuUStQRXhoYm1RK1BG
    ZHZhRzV6YVhSNmJHRmxibVJsY21OdlpHVStSRHd2VjI5b2JuTnBkSHBzWVdWdVpHVnlZMjlrWlQ0
    OEwweGhibVErUEZOMGNtRnpjMlUrVTNCbFpHbDBhVzl1YzNSeUxqd3ZVM1J5WVhOelpUNDhTR0Yx
    YzI1MWJXMWxjajR4T1R3dlNHRjFjMjUxYlcxbGNqNDhMMU4wY21GemMyVnVRV1J5WlhOelpUNDhM
    MUJsY25OdmJqNDhMMVpsY25OcFkyaGxjblJsY2o0OEwxVkRYMUJsY25OdlpXNXNhV05vWlZabGNu
    TnBZMmhsY25SbGJtUmhkR1Z1V0UxTVAEggPoZz09IiAvPgogICAgICAgICAgICA8L2V4dGVuc2lv
    bj4KICAgICAgICAgICAgPGV4dGVuc2lvbiB1cmw9Imh0dHBzOi8vZmhpci5laGV4LmRlL1N0cnVj
    dHVyZURlZmluaXRpb24vR2VzY2h1ZXR6dGVWZXJzaWNoZXJ0ZW5kYXRlbiI+CiAgICAgICAgICAg
    ICAgIDx2YWx1ZUJhc2U2NEJpbmFyeSB2YWx1ZT0iUEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWlC
    bGJtTnZaR2x1WnowaVNWTlBMVGc0TlRrdE1UVWlJSE4wWVc1a1lXeHZibVU5SW5sbGN5SS9QanhW
    UTE5SFpYTmphSFZsZEhwMFpWWmxjbk5wWTJobGNuUmxibVJoZEdWdVdFMU1JRU5FVFY5V1JWSlRT
    VTlPUFNJMUxqSXVNQ0lnZUcxc2JuTTlJbWgwZEhBNkx5OTNjeTVuWlcxaGRHbHJMbVJsTDJaaEwz
    WnpaRzB2ZG5Oa0wzWTFMaklpUGp4YWRYcGhhR3gxYm1kemMzUmhkSFZ6UGp4VGRHRjBkWE0rTUR3
    dlUzUmhkSFZ6UGp3dlduVjZZV2hzZFc1bmMzTjBZWFIxY3o0OFUyVnNaV3QwYVhaMlpYSjBjbUZs
    WjJVK1BFRmxjbnAwYkdsamFENDVQQzlCWlhKNmRHeHBZMmcrUEZwaGFHNWhaWEo2ZEd4cFkyZytP
    VHd2V21Gb2JtRmxjbnAwYkdsamFENDhMMU5sYkdWcmRHbDJkbVZ5ZEhKaFpXZGxQand2VlVOZlIy
    VnpZMmgxWlhSNmRHVldaWEp6YVdOb1pYSjBaVzVrWVhSbGJsaE5URDQ9IiAvPgogICAgICAgICAg
    ICA8L2V4dGVuc2lvbj4KICAgICAgICAgICAgPHN0YXR1cyB2YWx1ZT0iYWN0aXZlIiAvPgogICAg
    ICAgICAgICA8YmVuZWZpY2lhcnk+CiAgICAgICAgICAgICAgIDxpZGVudGlmaWVyPgogICAgICAg
    ICAgICAgICAgICA8dHlwZT4KICAgICAgICAgICAgICAgICAgICAgPGNvZGluZz4KICAgICAgICAg
    ICAgICAgICAgICAgICAgPHN5c3RlbSB2YWx1ZT0iaHR0cDovL2ZoaXIuZGUvQ29kZVN5c3RlbS9p
    ZGVudGlmaWVyLXR5cGUtZGUtYmFzaXMiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxjb2Rl
    IHZhbHVlPSJHS1YiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxkaXNwbGF5IHZhbHVlPSJH
    ZQSCAuRzZXR6bGljaGUgS3JhbmtlbnZlcnNpY2hlcnVuZyIgLz4KICAgICAgICAgICAgICAgICAg
    ICAgPC9jb2Rpbmc+CiAgICAgICAgICAgICAgICAgIDwvdHlwZT4KICAgICAgICAgICAgICAgICAg
    PHN5c3RlbSB2YWx1ZT0iaHR0cDovL2ZoaXIuZGUvTmFtaW5nU3lzdGVtL2drdi9rdmlkLTEwIiAv
    PgogICAgICAgICAgICAgICAgICA8dmFsdWUgdmFsdWU9IlQwMjk2NTMyOTAiIC8+CiAgICAgICAg
    ICAgICAgIDwvaWRlbnRpZmllcj4KICAgICAgICAgICAgPC9iZW5lZmljaWFyeT4KICAgICAgICAg
    ICAgPHBlcmlvZD4KICAgICAgICAgICAgICAgPHN0YXJ0IHZhbHVlPSIyMDIyLTExLTAzIiAvPgog
    ICAgICAgICAgICAgICA8ZW5kIHZhbHVlPSIyMDIyLTExLTAzIiAvPgogICAgICAgICAgICA8L3Bl
    cmlvZD4KICAgICAgICAgICAgPHBheW9yPgogICAgICAgICAgICAgICA8aWRlbnRpZmllcj4KICAg
    ICAgICAgICAgICAgICAgPHN5c3RlbSB2YWx1ZT0iaHR0cDovL2ZoaXIuZGUvTmFtaW5nU3lzdGVt
    L2FyZ2UtaWsvaWtuciIgLz4KICAgICAgICAgICAgICAgICAgPHZhbHVlIHZhbHVlPSIxMDE1NzU1
    MTkiIC8+CiAgICAgICAgICAgICAgIDwvaWRlbnRpZmllcj4KICAgICAgICAgICAgICAgPGRpc3Bs
    YXkgdmFsdWU9IlRlY2huaWtlciBLcmFua2Vua2Fzc2UiIC8+CiAgICAgICAgICAgIDwvcGF5b3I+
    CiAgICAgICAgIDwvQ292ZXJhZ2U+CiAgICAgIDwvcmVzb3VyY2U+CiAgIDwvZW50cnk+CjwvQnVu
    ZGxlPgAAAAAAAKCAMIIExjCCA66gAwIBAgIHAkLBg/lBHDANBgkqhkiG9w0BAQsFADCBmjELMAkG
    A1UEBhMCREUxHzAdBgNVBAoMFmdlbWF0aWsgR21iSCBOT1QtVkFMSUQxSDBGBgNVBAsMP0luc3Rp
    dHV0aW9uIGRlcyBHZXN1bmRoZWl0c3dlc2Vucy1DQSBkZXIgVGVsZW1hdGlraW5mcmFzdHJ1a3R1
    cjEgMB4GA1UEAwwXR0VNLlNNQ0ItQ0EyNCBURVNULU9OTFkwHhcNMjAwOTI5MjIwMDAwWhcNMjUw
    OTI5MjE1OTU5WjBsMQswCQYDVQQGEwJERTEbMBkGA1UECgwSMTIzNDU2NzggTk9ULVZBTElEMSAw
    HgYDVQQFExcyMy44MDI3Njg4MzExMDAwMDEyOTE1MzEeMBwGA1UEAwwVVEsgVEtSLVRlc3QgVEVT
    VC1PTkxZMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkzLkYfaYTQP4cNgG7/LliHzf
    5IsFP/aikx13H1dhiRFhN3XbbepmX0gdvh4yEGdVGEoVcjolTjX3U7hyomF27lZ0SNDKgs/9Z0hc
    jngj/J7QBlMHFp4fubdaK/htaYYwlZml6lBC6JDTGp/63oVHEiS74joQKJ6soMHmw/7Oa2QkN8xF
    8uEpvEOAPyI873k0G1OFJ7uHsPH9VxCaQmDurk41SbeG9htGZGbrHXT32A5qMchB1jkOQirWDkP/
    IsXwl5Deei5KcAfAJnLlTtI49Tlm8+ElRCqkZDE8ljjNg7DLeUyd49cgha43VCkHYcAmYq4z4c2w
    7YlgsngyJpVo6wIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAUeunhb+oUWRYF7gPp0/0hq97p2Z4w
    fAYFKyQIAwMEczBxpCwwKjELMAkGA1UEBhMCREUxGzAZBgNVBAoMEkdLViBTcGl0emVudmVyYmFu
    ZDBBMD8wPTA7MB8MHUJldHJpZWJzc3TDpHR0ZSBLb3N0ZW50csOkZ2VyMAkGByqCFABMBDsTDTgt
    MjBhMTIwMS0wMDIwHQYDVR0OBBYEFCPvQudhmgVYpEU1SaY05RAFeRuyMCAGA1UdIAQZMBcwCgYI
    KoIUAEwEgSMwCQYHKoIUAEwETjAMBgNVHRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIGQDA4BggrBgEF
    BQcBAQQsMCowKAYIKwYBBQUHMAGGHGh0dHA6Ly9laGNhLmdlbWF0aWsuZGUvb2NzcC8wDQYJKoZI
    hvcNAQELBQADggEBAFVdbzpebf3v+/PS7UsMk035UdZUjoX/ERgafRmdIfG+SZ/Mnyl4SpPRR9jI
    dy1hTC4MGs81tbSXf8sZEy3wIYbck3T/Hz5KlvKjuq4i4wg0+8C8Jt/sSJNncw7rdIg96HuzDGvW
    qXnB1SfN4NTUZjSgYkxpJ4sjt2oqTQHwf833SELa3s/gexmS00E8wCG0eYMLjKN80GzPTh5ngTrH
    jvaQNY0Ke/wZtkkC49TFx79oce3pLOmWDQzy3eW4mWdgZ0Y+ZxhX3LO4UTEK/DLE0tGoXpAGUF2r
    PBFsT17lxIU4EU4oCcuCW+BVUnSR0ccmjgiwgz7r3H7/lve3uPR7W/kAADGCA8MwggO/AgEBMIGm
    MIGaMQswCQYDVQQGEwJERTEfMB0GA1UECgwWZ2VtYXRpayBHbWJIIE5PVC1WQUxJRDFIMEYGA1UE
    Cww/SW5zdGl0dXRpb24gZGVzIEdlc3VuZGhlaXRzd2VzZW5zLUNBIGRlciBUZWxlbWF0aWtpbmZy
    YXN0cnVrdHVyMSAwHgYDVQQDDBdHRU0uU01DQi1DQTI0IFRFU1QtT05MWQIHAkLBg/lBHDANBglg
    hkgBZQMEAgEFAKCCAbkwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
    MjIxMTA0MTIwMzQ1WjAvBgkqhkiG9w0BCQQxIgQgMt25KK7eYMargRYXEicbIDrzsiMhFxanhidx
    VuNoZFwwYQYJKoZIhvcNAQk0MVQwUjANBglghkgBZQMEAgEFAKFBBgkqhkiG9w0BAQowNKAPMA0G
    CWCGSAFlAwQCAQUAoRwwGgYJKoZIhvcNAQEIMA0GCWCGSAFlAwQCAQUAogMCASAwgeoGCyqGSIb3
    DQEJEAIvMYHaMIHXMIHUMIHRBCBiuv08VE1N7lL9T0kIE+t83l53nfWcFLPewrxURPOUijCBrDCB
    oKSBnTCBmjELMAkGA1UEBhMCREUxHzAdBgNVBAoMFmdlbWF0aWsgR21iSCBOT1QtVkFMSUQxSDBG
    BgNVBAsMP0luc3RpdHV0aW9uIGRlcyBHZXN1bmRoZWl0c3dlc2Vucy1DQSBkZXIgVGVsZW1hdGlr
    aW5mcmFzdHJ1a3R1cjEgMB4GA1UEAwwXR0VNLlNNQ0ItQ0EyNCBURVNULU9OTFkCBwJCwYP5QRww
    QQYJKoZIhvcNAQEKMDSgDzANBglghkgBZQMEAgEFAKEcMBoGCSqGSIb3DQEBCDANBglghkgBZQME
    AgEFAKIDAgEgBIIBAFaAA0Y4RqvJk0jDN7lgdIlcsYAf5LOKOG9zQx7XB0HSXN5fzhTDOc4jrGxQ
    K+ePidQ/OZVF+bjZsniSiJGPSDtedLbg+1LNrp5KWX20VYcAYQeOl7G1PCP+SCtMP3vhtofY7wqb
    TDnin1+Na8aMK12eNrmCQIdXnpB11XP6NUqNpecqiGTt8QtGzwn8E4t0aVvIFK26M2MJsaiaMbC0
    qqrH42bc8qGGMqf3l4b1iQuvE5VwG58ZSh3lfMWjtROGAbXd8MLLGA1dt7vwJFDdeSZ9bJqFmEq5
    vqE8HXDRPWl0ypk2X9kIcXQ8bRjQBgLaYufGnA+6tUfmmKGc0BA15QUAAAAAAAA=

    ------=_Part_8_1818972272.1667563520030
    Content-Type: application/pdf; name=Signaturpruefungsbericht.pdf
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment; filename=Signaturpruefungsbericht.pdf

    JVBERi0xLjQKJfbk/N8KMSAwIG9iago8PAovVHlwZSAvQ2F0YWxvZwovVmVyc2lvbiAvMS40Ci9Q
    YWdlcyAyIDAgUgo+PgplbmRvYmoKMiAwIG9iago8PAovVHlwZSAvUGFnZXMKL0tpZHMgWzMgMCBS
    XQovQ291bnQgMQo+PgplbmRvYmoKMyAwIG9iago8PAovVHlwZSAvUGFnZQovTWVkaWFCb3ggWzAu
    MCAwLjAgNjEyLjAgNzkyLjBdCi9Db250ZW50cyA0IDAgUgovUmVzb3VyY2VzIDUgMCBSCi9QYXJl
    bnQgMiAwIFIKPj4KZW5kb2JqCjQgMCBvYmoKPDwKL0xlbmd0aCAxNjk1Ci9GaWx0ZXIgL0ZsYXRl
    RGVjb2RlCj4+CnN0cmVhbQ0KeJy9WVtz2joQfudX6LGdKY7uspmTMxMMpJ22SSfQM3M6fXGIEjgh
    JINNb7/+rGSB7YTUltppbhDMer/9tNr9VgxnvaOR/rKc64vTIZrnPYzMdz7vHU0IIhLNrnsUIyUo
    ml31/hJMJlLJsSSKK6GowopOUikllfAfXGMyVvxvNPuvN27cOZ26O0/THtwXvsEFQV/tzQmLRCIx
    QXAPROKIY442ujfsDWd1PBQlFg4HC+UsDCjOwbGg+DE4ipUyj5KbqxaglBOZSgXPRAkWXldwxYWh
    OB3vwO/h4ihBu98KtExoJLBIYguakggnhzAzRIgDDQ6dBYB+cRKh6fJmnRXbzZUusuUqf/nY8WOe
    pBIRFTEiikQSY4geaKA8PsxVvHOrEmtlnO48/tDL4mG7vi3QKtsW6OO60Oa1+WKtN4Of4yDJzvkO
    Dsc4Ygl8tcMhidgbV6goprRPSB9WnbABZgMu27kQcYRJyYEXG5I6O5c5NlfkCPKAS5szz6U4vGss
    FTt5kh/P0bNHGEZQHehjisSAJO0UcRwpCZa+FHHu7BxFEzk0FMGWGStuNs9EjiZ2SyVyTDGnKlGG
    POZBzh5bGDl1iC8IJQyjy++F7rCHKNQaYgqMJylUOTvj8XWWL7LVzf1mWSzutnn3LbP3HhZ2A8T0
    9QkVHXYKlhEUPix8IybY2dUrR1DUewRhUTeAXExPPkynrVGLOIHtE2PlGbVImLNz7Q56hEwnqWKK
    wQZIZTrmpg7U019C+vskf4UtiI8GRKgMPG5nAzhQCmPf3iGgxJd2xlXX9a68hcXXcDrSG/Tl/q7Z
    o1AO6bjUm0IjsxW/wjP0kOV5gX5s0ZVeV9fXaJTB3yfQDzd1IXAkYwyp1rWpC8GdhQE7jNAn8Lq8
    Xt5mRd61rwtGI6pgl3TWP5CXzqLZ1f1dExFhGvsnBkmcnQHwZr3ILmFVrnRej79zgahQhCVMA0x6
    djx7i2ZvL/ozDQkxG09n/fOzd/+2csETFSlYysSXC0ycnXE/+/7QOe7KY1jcDcdn2+KHruVAe7wx
    jiD1fBUUj3lpZlNPb5Z6vd7e3cHyf36x0N8+v+we/g5AUPQNHPgb5XROYnadcELm7bFLFtGYE19t
    BPLH2dn2cGIkozLjh4TfoZGM0BakFYyxUURGF4FqYmbMgNdS+14Fg4lpJtA2ujeNCnEYW3XgRk7i
    Pk76IJswHtifdsq4jDCThPlSBjW1tPsJZa6rPk+YNF3Wo8dWaMPoqoM2dAlDF00QZQORwE87XTSG
    zRkTX9nFoRmUdju6rLzAdvwYWrLcoMJrBAGR5ftY6LhS4Q0jrA47aFzhGLpgQkldmVMZ8US2EGbU
    pbWzY/UWVIBerX6hG1VAKiZagdSYgGYmOCZy141Ox++j6ft02E9PAO6+H71C5x+P36zzYllsi+X9
    2uI91fl2fbWA8Tz/qnO9zsEILmzQTK/0XVYsb5fr602WF5vtLXT8V8gGhVE/sStlPJ4f35TvRKd3
    l6/R2fms/8/JuzejVyg9Ho1bl4HF0Is5997mzIhaa+cjFStvQVnXcPpMbVFuC4F235/4VBvn59vD
    8AGFUyWS+A6MzIhga+fFx95bGB91p+XpBlTSZ2pu7B7NSdjYzjP1gnL4PM2cn42g9BC1a25gYe9+
    wEc7tzyBGCkRnYUvE8xZ2DFcb7JtfqMvdYj2ZVCyCCSP74jIQHyXdr9D+1Yowla8Aeb5atPOBuFR
    DKnjOwkwWLbSzlf9Vh7DIm84ruq+hwKmoL8lj4mv4mcgvEu7X9bAFYQwEhpI8DfVHjOIbnDlLftB
    PDq7P618K8RBFDWAgzIhsk9AnEA9JwOiuigTCtKbCEp9hwUKxby0+5PKt0IbRlcdtBFy3NJFd3S1
    HzZRLqIEc3+6oBuUdn9W+VZ4wwirww5SvpQkkKFxg7AuypdS5ux+k/KtgAQpXwqtDBbD4XG96AL6
    0CPR+0mvi0220uji/r5oE7gH5OxTzesjcGGFIiKxf3rCnFHa+Qi6yltYctWd/h6Be/jkk8Qkwso4
    6nrySYx0VztoMP+Zs/AJbL3U6cmRgC1pAVNJoIpJ+1ienMtJevCzthAVSaDgQc56LyhgcXZmQT9t
    bzbL62ukN9f3q5tCo+yu876pEAQtchPI0wrSXnIJl5FQ/iWXCOzs7OSYTj/0p0VWbPPgElIhCaOi
    Aej0/HzUHjuFIYJK/9gZc3b2YwaQcHnRPcy907AwG74XRfEwODrSi3kWuWIXXemj+3n+cLQD9D/H
    bEcVDQplbmRzdHJlYW0KZW5kb2JqCjUgMCBvYmoKPDwKL0ZvbnQgNiAwIFIKPj4KZW5kb2JqCjYg
    MCBvYmoKPDwKL0YxIDcgMCBSCi9GMiA4IDAgUgovRjMgOSAwIFIKPj4KZW5kb2JqCjcgMCBvYmoK
    PDwKL1R5cGUgL0ZvbnQKL1N1YnR5cGUgL1R5cGUxCi9CYXNlRm9udCAvSGVsdmV0aWNhLUJvbGRP
    YmxpcXVlCi9FbmNvZGluZyAvV2luQW5zaUVuY29kaW5nCj4+CmVuZG9iago4IDAgb2JqCjw8Ci9U
    eXBlIC9Gb250Ci9TdWJ0eXBlIC9UeXBlMQovQmFzZUZvbnQgL0hlbHZldGljYQovRW5jb2Rpbmcg
    L1dpbkFuc2lFbmNvZGluZwo+PgplbmRvYmoKOSAwIG9iago8PAovVHlwZSAvRm9udAovU3VidHlw
    ZSAvVHlwZTEKL0Jhc2VGb250IC9IZWx2ZXRpY2EtQm9sZAovRW5jb2RpbmcgL1dpbkFuc2lFbmNv
    ZGluZwo+PgplbmRvYmoKeHJlZgowIDEwCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAxNSAw
    MDAwMCBuDQowMDAwMDAwMDc4IDAwMDAwIG4NCjAwMDAwMDAxMzUgMDAwMDAgbg0KMDAwMDAwMDI0
    NyAwMDAwMCBuDQowMDAwMDAyMDE3IDAwMDAwIG4NCjAwMDAwMDIwNTAgMDAwMDAgbg0KMDAwMDAw
    MjEwMSAwMDAwMCBuDQowMDAwMDAyMjEwIDAwMDAwIG4NCjAwMDAwMDIzMDcgMDAwMDAgbg0KdHJh
    aWxlcgo8PAovUm9vdCAxIDAgUgovSUQgWzwyRDI0N0NDOEFFOTEyNTMxMDMyRDUyNkYyNTBFMTdD
    Rj4gPDJEMjQ3Q0M4QUU5MTI1MzEwMzJENTI2RjI1MEUxN0NGPl0KL1NpemUgMTAKPj4Kc3RhcnR4
    cmVmCjI0MDkKJSVFT0YK
    ------=_Part_8_1818972272.1667563520030--

## KIM Fehlernachricht

|Header	                   |Inhalt	                                         |verpflichtend|
|------                    |-------                                          |-------------|
|X-KIM-Dienstkennung	     |eEB;Fehler;V1.0	                                 |ja|
|X-KIM-Ursprungssystem	   |\<PVS-Bezeichnung>;\<Releaseversion>             |nein|
|X-KIM-Sendersystem        |\<Kasse-Bezeichnung>;\<Releaseversion>           |nein|
|X-KIM-Support             |\<Support-Email-Adresse Kasse>                   |nein|
|In-Reply-To               |Message-ID der Anfrage                           |ja|
|Subject                   |\<T/E>EEB0_FEH_<UUID> |ja<br /><br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Type              |application/xml; name="<T/E>EEB0_FEH_<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Transfer-Encoding |base64	                                         |ja|
|Content-Disposition       |attachment; filename="<T/E>EEB0_FEH_<UUID>.xml"  |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Description       |eEB_FEH                                          |ja|

Der Anhang enthält eine Fehlermeldung als FHIR-Ressource `OperationOutcome`
