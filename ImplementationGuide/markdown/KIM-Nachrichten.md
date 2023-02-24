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
- Übermittlung der Daten eines Versicherten von der Kasse zum Leistungserbringer (eEB Bescheinigung) oder Rückgabe einer Fehlermeldung (eEB Fehler)

## KIM Dienstkennungen

Dienstkennungen in KIM-Nachrichten kennzeichnen den transportierten Inhalt für das Empfangssystem. Diese erlauben damit eine Dunkelverarbeitung bei Nachrichtenempfang und ggfs. die vollautomatisierte Erstellung und den Versand einer Antwortnachricht.

|Anwendung                          |elektronische Ersatzbescheinigung (eEB)|
|:--------                          |:--------------------------------------|
|Verantwortlich                     |gematik                                |
|Anwendungsbeschreibung             |Verfahren zur Übertragung von Versichertenstammdaten (VSD) aus einem PKV Versicherungsunternehmen und Erstzbescheinigung nach §19 Abs. 2 BMV von einer Gesetzlichen Krankenkasse zu einem Leistungserbringer|
|Dienstkennung & Kurzbeschreibung|**eEB;Anfrage;V1.0** <br /> Nachrichten-Typ: Anfragedaten zum Erhalt von Versichertendaten <br /> Verwendung: Vertragsärzte, Vertragszahnärzte, Krankenhäuser <br /><br />  **eEB;Bescheinigung;V1.0** <br /> Nachrichten-Typ: Versichertendaten in verschiedenen Ausprägungen <br /> Verwendung: Krankenkassen, Versicherungsunternehmen <br /> <br /> **eEB;Fehler;V1.0** <br /> Nachrichten-Typ: Fehlermeldung bzgl. der Ermittlung der Daten des Versicherten <br />  Verwendung: Krankenkassen, Versicherungsunternehmen |

## KIM Anfrage einer Ersatzbescheinigung

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

### KIM Anfrage Beispielnachricht

```xml
    Date: Thu, 05 Jan 2023 13:30:01 +0100 (CET)
    From: tk-bc-test@akquinet.kim.telematik-test
    To: tk-bc-test@akquinet.kim.telematik-test
    Message-ID: <167292180138.23780.17343150633605543113@MX-PF25MB4V.dst.tk-inline.net>
    Content-Type: multipart/mixed;
    boundary="===============5461036781536416417=="
    MIME-Version: 1.0
    X-KIM-Dienstkennung: eEB;Anfrage;V1.0
    X-KIM-Sendersystem: Megapraxisprogramm;V1.0
    X-KIM-Support: kim-servicedesk@tk.de
    Subject: TEEB0_ANF_e71108ff-a936-44fa-9d7d-215a09428900
    Return-Path: <tk-bc-test@akquinet.kim.telematik-test>
    X-Signature: 1
    X-Encoding: 1

    --===============5461036781536416417==
    MIME-Version: 1.0
    Content-Transfer-Encoding: base64
    Content-Type: application/octet-stream; name="TEEB0_ANF_e71108ff-a936-44fa-9d7d-215a09428900.p7s"
    Content-Disposition: attachment; filename="TEEB0_ANF_e71108ff-a936-44fa-9d7d-215a09428900.p7s"
    Content-Description: eEB_ANF

    MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwGggCSABIID
    6Dw/eG1sIHZlcnNpb249IjEuMCIgZW5jb2Rpbmc9IlVURi04Ij8+DQo8QnVuZGxlIHhtbG5zPSJo
    dHRwOi8vaGw3Lm9yZy9maGlyIj4NCgk8aWQgdmFsdWU9IjFmMzExYzQwLWZlZTktNGIwMy1iMGM0
    LWMyOWQ0MzJmMjM3MSIvPg0KCTxtZXRhPg0KCQk8cHJvZmlsZSB2YWx1ZT0iaHR0cHM6Ly9nZW1h
    dGlrLmRlL2ZoaXIvZWViL1N0cnVjdHVyZURlZmluaXRpb24vRUVCQW5mcmFnZUJ1bmRsZSIvPg0K
    CTwvbWV0YT4NCgk8aWRlbnRpZmllcj4NCgkJPHN5c3RlbSB2YWx1ZT0idXJuOmlldGY6cmZjOjM5
    ODYiLz4NCgkJPHZhbHVlIHZhbHVlPSJ1cm46dXVpZDplNzExMDhmZi1hOTM2LTQ0ZmEtOWQ3ZC0y
    MTVhMDk0Mjg5MDAiLz4NCgk8L2lkZW50aWZpZXI+DQoJPHR5cGUgdmFsdWU9Im1lc3NhZ2UiLz4N
    Cgk8dGltZXN0YW1wIHZhbHVlPSIyMDIyLTA4LTI5VDAyOjEwOjM3LjE1NCswMjowMCIvPg0KCTxl
    bnRyeT4NCgkJPGZ1bGxVcmwgdmFsdWU9Imh0dHBzOi8vZ2VtYXRpay5kZS9maGlyL01lc3NhZ2VI
    ZWFkZXIvYmIwM2E0MzctZmU1Ni00NmY5LTg2MjItZmZjMzc2NmU3YzcwIi8+DQoJCTxyZXNvdXJj
    ZT4NCgkJCTxNZXNzYWdlSGVhZGVyPg0KCQkJCTxpZCB2YWx1ZT0iYmIwM2E0MzctZmU1Ni00NmY5
    LTg2MjItZmZjMzc2NmU3YzcwIi8+DQoJCQkJPG1ldGE+DQoJCQkJCTxwcm9maWxlIHZhbHVlPSJo
    dHRwczovL2dlbWF0aWsuZGUvZmhpci9lZWIvU3RydWN0dXJlRGVmaW5pdGlvbi9FRUJBbmZyYWdl
    SGVhZGVyIi8+DQoJCQkJPC9tZXRhPg0KCQkJCTxleHRlbnNpb24gdXJsPSJodHRwczovL2dlbWF0
    aWsuZGUvZmhpci9lZWIvU3RydWN0dXJlRGVmaW5pdGlvbi9MZWlzdHVuZ3NkYXR1bSI+DQoJCQkJ
    CTx2YWx1ZURhdGUgdmFsdWU9IjIwMjItMTItMTMiLz4NCgkJCQk8L2V4dGVuc2lvbj4NCgkJCQk8
    ZXh0ZW5zaW9uIHVybD0iaHR0cHM6Ly9nZW1hdGlrLmRlL2ZoaXIvZWViL1N0cnVjdHVyZURlZmlu
    aXRpb24vRWludmVyc3RhZW5kbmlzIj4NCgkJCQkJPHYEggPoYWx1ZUJvb2xlYW4gdmFsdWU9InRy
    dWUiLz4NCgkJCQk8L2V4dGVuc2lvbj4NCgkJCQk8ZXZlbnRDb2Rpbmc+DQoJCQkJCTxzeXN0ZW0g
    dmFsdWU9Imh0dHBzOi8vZ2VtYXRpay5kZS9maGlyL2RpcmVjdG9yeS9Db2RlU3lzdGVtL09yZ2Fu
    aXphdGlvblByb2Zlc3Npb25PSUQiLz4NCgkJCQkJPGNvZGUgdmFsdWU9IjEuMi4yNzYuMC43Ni40
    LjUwIi8+DQoJCQkJCTxkaXNwbGF5IHZhbHVlPSJCZXRyaWVic3N0JiMyMjg7dHRlIEFyenQiLz4N
    CgkJCQk8L2V2ZW50Q29kaW5nPg0KCQkJCTxzZW5kZXI+DQoJCQkJCTxyZWZlcmVuY2UgdmFsdWU9
    Ik9yZ2FuaXNhdGlvbi9mYWQxNTM0Ny1hNGIzLTQ4OTktYTQ1NC05ZmI0M2JkYjBmMzAiLz4NCgkJ
    CQk8L3NlbmRlcj4NCgkJCQk8c291cmNlPg0KCQkJCQk8ZW5kcG9pbnQgdmFsdWU9Imh0dHBzOi8v
    cHZzLmRlL0tJTSIvPg0KCQkJCTwvc291cmNlPg0KCQkJPC9NZXNzYWdlSGVhZGVyPg0KCQk8L3Jl
    c291cmNlPg0KCTwvZW50cnk+DQoJPGVudHJ5Pg0KCQk8ZnVsbFVybCB2YWx1ZT0iaHR0cHM6Ly9n
    ZW1hdGlrLmRlL2ZoaXIvUGF0aWVudC9iOGYwZjY5Yy1hZjFhLTQ4MGItOGFiZi00NGFiMTFhYTIz
    YzUiLz4NCgkJPHJlc291cmNlPg0KCQkJPFBhdGllbnQ+DQoJCQkJPGlkIHZhbHVlPSJiOGYwZjY5
    Yy1hZjFhLTQ4MGItOGFiZi00NGFiMTFhYTIzYzUiLz4NCgkJCQk8bWV0YT4NCgkJCQkJPHByb2Zp
    bGUgdmFsdWU9Imh0dHBzOi8vZ2VtYXRpay5kZS9maGlyL2VlYi9TdHJ1Y3R1cmVEZWZpbml0aW9u
    L0VFQktub3duUGF0aWVudCIvPg0KCQkJCTwvbWV0YT4NCgkJCQk8aWRlbnRpZmllcj4NCgkJCQkJ
    PHR5cGU+DQoJCQkJCQk8Y29kaW5nPg0KCQkJCQkJCTxzeXN0ZW0gdmFsdWU9Imh0dHA6Ly9maGly
    LmRlL0NvZGVTeXN0ZW0vaWRlbnRpZmllci10eXBlLWRlLWJhc2lzIi8+DQoJCQkJCQkJPGNvZGUg
    dmFsdWU9IkdLViIvPg0KCQkJCQkJPC9jb2Rpbmc+DQoJCQkJCTwvdHlwZT4NCgkJCQkJPHN5c3Rl
    bSB2YWx1ZT0iaASCA+h0dHA6Ly9maGlyLmRlL3NpZC9na3Yva3ZpZC0xMCIvPg0KCQkJCQk8dmFs
    dWUgdmFsdWU9IlQwMjk2NTMyOTAiLz4NCgkJCQk8L2lkZW50aWZpZXI+DQoJCQk8L1BhdGllbnQ+
    DQoJCTwvcmVzb3VyY2U+DQoJPC9lbnRyeT4NCgk8ZW50cnk+DQoJCTxmdWxsVXJsIHZhbHVlPSJo
    dHRwczovL2dlbWF0aWsuZGUvZmhpci9PcmdhbmlzYXRpb24vZmFkMTUzNDctYTRiMy00ODk5LWE0
    NTQtOWZiNDNiZGIwZjMwIi8+DQoJCTxyZXNvdXJjZT4NCgkJCTxPcmdhbml6YXRpb24+DQoJCQkJ
    PGlkIHZhbHVlPSJmYWQxNTM0Ny1hNGIzLTQ4OTktYTQ1NC05ZmI0M2JkYjBmMzAiLz4NCgkJCQk8
    bWV0YT4NCgkJCQkJPHByb2ZpbGUgdmFsdWU9Imh0dHBzOi8vZmhpci5rYnYuZGUvU3RydWN0dXJl
    RGVmaW5pdGlvbi9LQlZfUFJfRk9SX09yZ2FuaXphdGlvbnwxLjEuMCIvPg0KCQkJCTwvbWV0YT4N
    CgkJCQk8aWRlbnRpZmllcj4NCgkJCQkJPHR5cGU+DQoJCQkJCQk8Y29kaW5nPg0KCQkJCQkJCTxz
    eXN0ZW0gdmFsdWU9Imh0dHA6Ly90ZXJtaW5vbG9neS5obDcub3JnL0NvZGVTeXN0ZW0vdjItMDIw
    MyIvPg0KCQkJCQkJCTxjb2RlIHZhbHVlPSJCU05SIi8+DQoJCQkJCQk8L2NvZGluZz4NCgkJCQkJ
    PC90eXBlPg0KCQkJCQk8c3lzdGVtIHZhbHVlPSJodHRwczovL2ZoaXIua2J2LmRlL05hbWluZ1N5
    c3RlbS9LQlZfTlNfQmFzZV9CU05SIi8+DQoJCQkJCTx2YWx1ZSB2YWx1ZT0iMTA5NTAwOTcwIi8+
    DQoJCQkJPC9pZGVudGlmaWVyPg0KCQkJCTxpZGVudGlmaWVyPg0KCQkJCQk8dHlwZT4NCgkJCQkJ
    CTxjb2Rpbmc+DQoJCQkJCQkJPHN5c3RlbSB2YWx1ZT0iaHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5v
    cmcvQ29kZVN5c3RlbS92Mi0wMjAzIi8+DQoJCQkJCQkJPGNvZGUgdmFsdWU9IlBOUiIvPg0KCQkJ
    CQkJPC9jb2Rpbmc+DQoJCQkJCTwvdHlwZT4NCgkJCQkJPHN5c3RlbSB2YWx1ZT0iaHR0cHM6Ly9n
    ZW1hdGlrLmRlL2ZoaXIvc2lkL3RlbGVtYXRpay1pZCIvPg0KCQkJCQk8dmFsBIIC63VlIHZhbHVl
    PSIxLVNNQy1CLVRlc3RrYXJ0ZS04ODMxMTAwMDAwOTU5NzciLz4NCgkJCQk8L2lkZW50aWZpZXI+
    DQoJCQkJPG5hbWUgdmFsdWU9IlByYXhpcyBUZXN0Ii8+DQoJCQkJPHRlbGVjb20+DQoJCQkJCTxz
    eXN0ZW0gdmFsdWU9InBob25lIi8+DQoJCQkJCTx2YWx1ZSB2YWx1ZT0iMDEyMzQ1Njc4OSIvPg0K
    CQkJCTwvdGVsZWNvbT4NCgkJCQk8YWRkcmVzcz4NCgkJCQkJPHR5cGUgdmFsdWU9ImJvdGgiLz4N
    CgkJCQkJPGxpbmUgdmFsdWU9Ik1hcmlhIFRyb3N0IDIxIj4NCgkJCQkJCTxleHRlbnNpb24gdXJs
    PSJodHRwOi8vaGw3Lm9yZy9maGlyL1N0cnVjdHVyZURlZmluaXRpb24vaXNvMjEwOTAtQURYUC1o
    b3VzZU51bWJlciI+DQoJCQkJCQkJPHZhbHVlU3RyaW5nIHZhbHVlPSIyMSIvPg0KCQkJCQkJPC9l
    eHRlbnNpb24+DQoJCQkJCQk8ZXh0ZW5zaW9uIHVybD0iaHR0cDovL2hsNy5vcmcvZmhpci9TdHJ1
    Y3R1cmVEZWZpbml0aW9uL2lzbzIxMDkwLUFEWFAtc3RyZWV0TmFtZSI+DQoJCQkJCQkJPHZhbHVl
    U3RyaW5nIHZhbHVlPSJNYXJpYSBUcm9zdCIvPg0KCQkJCQkJPC9leHRlbnNpb24+DQoJCQkJCTwv
    bGluZT4NCgkJCQkJPGNpdHkgdmFsdWU9IktvYmxlbnoiLz4NCgkJCQkJPHBvc3RhbENvZGUgdmFs
    dWU9IjU2MDcwIi8+DQoJCQkJCTxjb3VudHJ5IHZhbHVlPSJEIi8+DQoJCQkJPC9hZGRyZXNzPg0K
    CQkJPC9Pcmdhbml6YXRpb24+DQoJCTwvcmVzb3VyY2U+DQoJPC9lbnRyeT4NCjwvQnVuZGxlPgAA
    AAAAAKCAMIIExjCCA66gAwIBAgIHAkLBg/lBHDANBgkqhkiG9w0BAQsFADCBmjELMAkGA1UEBhMC
    REUxHzAdBgNVBAoMFmdlbWF0aWsgR21iSCBOT1QtVkFMSUQxSDBGBgNVBAsMP0luc3RpdHV0aW9u
    IGRlcyBHZXN1bmRoZWl0c3dlc2Vucy1DQSBkZXIgVGVsZW1hdGlraW5mcmFzdHJ1a3R1cjEgMB4G
    A1UEAwwXR0VNLlNNQ0ItQ0EyNCBURVNULU9OTFkwHhcNMjAwOTI5MjIwMDAwWhcNMjUwOTI5MjE1
    OTU5WjBsMQswCQYDVQQGEwJERTEbMBkGA1UECgwSMTIzNDU2NzggTk9ULVZBTElEMSAwHgYDVQQF
    ExcyMy44MDI3Njg4MzExMDAwMDEyOTE1MzEeMBwGA1UEAwwVVEsgVEtSLVRlc3QgVEVTVC1PTkxZ
    MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkzLkYfaYTQP4cNgG7/LliHzf5IsFP/ai
    kx13H1dhiRFhN3XbbepmX0gdvh4yEGdVGEoVcjolTjX3U7hyomF27lZ0SNDKgs/9Z0hcjngj/J7Q
    BlMHFp4fubdaK/htaYYwlZml6lBC6JDTGp/63oVHEiS74joQKJ6soMHmw/7Oa2QkN8xF8uEpvEOA
    PyI873k0G1OFJ7uHsPH9VxCaQmDurk41SbeG9htGZGbrHXT32A5qMchB1jkOQirWDkP/IsXwl5De
    ei5KcAfAJnLlTtI49Tlm8+ElRCqkZDE8ljjNg7DLeUyd49cgha43VCkHYcAmYq4z4c2w7Ylgsngy
    JpVo6wIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAUeunhb+oUWRYF7gPp0/0hq97p2Z4wfAYFKyQI
    AwMEczBxpCwwKjELMAkGA1UEBhMCREUxGzAZBgNVBAoMEkdLViBTcGl0emVudmVyYmFuZDBBMD8w
    PTA7MB8MHUJldHJpZWJzc3TDpHR0ZSBLb3N0ZW50csOkZ2VyMAkGByqCFABMBDsTDTgtMjBhMTIw
    MS0wMDIwHQYDVR0OBBYEFCPvQudhmgVYpEU1SaY05RAFeRuyMCAGA1UdIAQZMBcwCgYIKoIUAEwE
    gSMwCQYHKoIUAEwETjAMBgNVHRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIGQDA4BggrBgEFBQcBAQQs
    MCowKAYIKwYBBQUHMAGGHGh0dHA6Ly9laGNhLmdlbWF0aWsuZGUvb2NzcC8wDQYJKoZIhvcNAQEL
    BQADggEBAFVdbzpebf3v+/PS7UsMk035UdZUjoX/ERgafRmdIfG+SZ/Mnyl4SpPRR9jIdy1hTC4M
    Gs81tbSXf8sZEy3wIYbck3T/Hz5KlvKjuq4i4wg0+8C8Jt/sSJNncw7rdIg96HuzDGvWqXnB1SfN
    4NTUZjSgYkxpJ4sjt2oqTQHwf833SELa3s/gexmS00E8wCG0eYMLjKN80GzPTh5ngTrHjvaQNY0K
    e/wZtkkC49TFx79oce3pLOmWDQzy3eW4mWdgZ0Y+ZxhX3LO4UTEK/DLE0tGoXpAGUF2rPBFsT17l
    xIU4EU4oCcuCW+BVUnSR0ccmjgiwgz7r3H7/lve3uPR7W/kAADGCA8MwggO/AgEBMIGmMIGaMQsw
    CQYDVQQGEwJERTEfMB0GA1UECgwWZ2VtYXRpayBHbWJIIE5PVC1WQUxJRDFIMEYGA1UECww/SW5z
    dGl0dXRpb24gZGVzIEdlc3VuZGhlaXRzd2VzZW5zLUNBIGRlciBUZWxlbWF0aWtpbmZyYXN0cnVr
    dHVyMSAwHgYDVQQDDBdHRU0uU01DQi1DQTI0IFRFU1QtT05MWQIHAkLBg/lBHDANBglghkgBZQME
    AgEFAKCCAbkwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTA0
    MTI1MzI4WjAvBgkqhkiG9w0BCQQxIgQgdt8HGCLMeKOFSAzrK+JjIqnMcSAnV/OrK1GEH4AbTPAw
    YQYJKoZIhvcNAQk0MVQwUjANBglghkgBZQMEAgEFAKFBBgkqhkiG9w0BAQowNKAPMA0GCWCGSAFl
    AwQCAQUAoRwwGgYJKoZIhvcNAQEIMA0GCWCGSAFlAwQCAQUAogMCASAwgeoGCyqGSIb3DQEJEAIv
    MYHaMIHXMIHUMIHRBCBiuv08VE1N7lL9T0kIE+t83l53nfWcFLPewrxURPOUijCBrDCBoKSBnTCB
    mjELMAkGA1UEBhMCREUxHzAdBgNVBAoMFmdlbWF0aWsgR21iSCBOT1QtVkFMSUQxSDBGBgNVBAsM
    P0luc3RpdHV0aW9uIGRlcyBHZXN1bmRoZWl0c3dlc2Vucy1DQSBkZXIgVGVsZW1hdGlraW5mcmFz
    dHJ1a3R1cjEgMB4GA1UEAwwXR0VNLlNNQ0ItQ0EyNCBURVNULU9OTFkCBwJCwYP5QRwwQQYJKoZI
    hvcNAQEKMDSgDzANBglghkgBZQMEAgEFAKEcMBoGCSqGSIb3DQEBCDANBglghkgBZQMEAgEFAKID
    AgEgBIIBAHaKn4XLj4oRKAePzSFaBxS+hPNqhPYbMFn6oGsd20J1efA/OKohcgTu4jvd8DGU1tys
    qkLylu+vHr88vGBTaxekSHbHErX3I9EbW5TZkChwW8fYuk+0AmfSQJFOx+5WL+5YhT+j5KIeFt2G
    X/oHiyXIkWCFESQcEvueySpQWtzM58Hb1N8DlHltAViUlsCHErdBLy06TdFzow3RkXHNj1dn8XqG
    76gZ1V5M12J5RhUaCLMv6TeGAuHkGmvbO5cktnA++BbW8Faa2p9i55MiT+D+QDo0oly36tAMWGyU
    e9yqPO/Q7d+D0+Nvw8sZhISJ/MkEhj1blWOiUvALmoxYCH4AAAAAAAA=

    --===============5461036781536416417==
    Content-Type: text/plain; charset=UTF-8; name="Pruefungsdetails_20230105_1330.txt"
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment; filename="Pruefungsdetails_20230105_1330.txt"

    RGllIE5hY2hyaWNodCB3dXJkZSBlbnRzY2hsw7xzc2VsdC4NCkRpZSBTaWduYXR1ciB3dXJkZSBl
    cmZvbGdyZWljaCBnZXByw7xmdC4=
    --===============5461036781536416417==
    Content-Type: application/pdf; name="Signaturpruefungsbericht_20230105_1330.pdf"
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment; filename="Signaturpruefungsbericht_20230105_1330.pdf"

    JVBERi0xLjUKJeLjz9MKMiAwIG9iago8PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDEyMDI+
    PnN0cmVhbQp4nMVXXW/bNhR996/gYwvUGklRshQgD07sOUHbpI3VASsKFIpNS5ptORWlpc2f3ct+
    w57ysEvZ+qBNhRpQYIiTyL485x5e3g/624CgxwFG8uduNnAwYh5DzHcQ8SnK+GAOxtkAWw4sA6vL
    MFg8ZLsHY2mgzCst1B8dWSSEuCWEshMIWCREtQDEAd96iLToIa7XBQGLHsJYFwQsegjFXRCK9RAZ
    T33EpKUdsV4ncbyI2KNyER25muOyPb9Dr7Ro9dqu0wUBix7CSBcELHoIGXVBwKKFUN/ugEiLHuJ2
    bV9a9BC8h7j4BIL3ENUij2Bkd5ywtGhrQp5aB8QevZgU2vP+OPg2uAikeQTQYAkfDm0sH375FQ4A
    nlYHkiwavJonURrmRfaQPa+KNBL3PEsWcf46+AMWReXCPQUEp3yogOh0CfEqL4SqXiYJR5Un9Fhk
    S454ttptooyDNxRx6T63Tik9s1NaO2XSKbzNIITMdd1RO1xaErm0VUeHnRL5YOYZW/WeljwPk40w
    ENebaf4x2IDbFbWK/Ykn+UORrnO0CYv6aIasoaBqmD6lOZeoRZzy7OwYAHndVkIxfUkEdixMLFgE
    eW2f2fgMk5pQQg+UewKZaq5xXxPY1BYteYaOsk8j1aEK788RW5O65kOY7NbFlqd5lP3zF0dJii5+
    5FxolI5chdSg1CcO00mrWTxmlHYVijjcRLssyeNtodNEMFboDKLmV+MhdVzt+dZMBHu9M9egruop
    FadB3vXk6918PJ+Pv36Yz7UiG0KbmkUu4s2zEHyz+TuN9keb5FqdzFNpDTopZp5WXsPjmKtkmkX8
    Pk1EWSjbMI85/EnEIuZpjxbwYV9RSpXptuYxVZJhaxOg+3O3RUqHQQIcJDzLOZIp+QhP6CEUIkdP
    xWkc9h6O5C552rCkCDoETy1tDBvBflXF/98IuLDQZ1CcrJJ1mIt+U2CvlkgOixIoN0SQvODZPgq2
    2qDXakuQXG5bNqsQw/JNe6jUo/jUidzYVjtiunZR+SQetjCrGKASyrdHbv/rhLtO4xBuHJCloh1I
    XaK6/UfW5c158BYFb++GAYckDKbzYHh78+73F+cWNffb4MeDRhlTb0gGbTdF/sRb4dZpqhlZj04L
    9zWepsV2C2H88irm37+81oh0mUJpGqPfKaML4tkrnxGy0GmsCUfmRtucLFplz9C/BFS3QNHzJk8i
    JOB2o1HseYoDg2KZjb4c/PABTH350qmuSX1z/22plgNC0XyfaHO06moHetOY8A+a4QJvnzk+vLQZ
    Spo+Z66oz/VdUXb+WSl3DZ+J7isWsV3VwU+6ETa0zFxb4wLmBYzins0Aq9TmhjCbvrfm7y8vhpdj
    WadVS3iDbj+dX0NCJnmRJ7u097gSaMZFkS5jGdtHLiA5gFoGvSdFwDflQF8n6SoLRZ4Va+jDoOc8
    2n+OZtv7K3RzGwx7Mv42fnc9eYMuzydT7Xn4davD5vNQbh/yC8gm6Xnz6JVz1KaqGMMJtoqxEnOo
    Rd1WKW16srlklK3q7k09Ni0Toknhpxezl7qeqs505wrb9YBi+OVJyg/7b32xhotZz1TRSdVet1pa
    999MpsHg4+BfkVq3vgplbmRzdHJlYW0KZW5kb2JqCjQgMCBvYmoKPDwvQ29udGVudHMgMiAwIFIv
    VHlwZS9QYWdlL1Jlc291cmNlczw8L1Byb2NTZXQgWy9QREYgL1RleHQgL0ltYWdlQiAvSW1hZ2VD
    IC9JbWFnZUldL0ZvbnQ8PC9GMSAxIDAgUj4+Pj4vUGFyZW50IDMgMCBSL01lZGlhQm94WzAgMCA1
    OTUgODQyXT4+CmVuZG9iago1IDAgb2JqCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggOTM1
    Pj5zdHJlYW0KeJylVttO4zAQfc9X+BEkktquc2klHqB0CxJLWZpdaREvAZw02zQtjrvL8r37GTzs
    OGnapjgkCFVVLuNzfGY8M5kng6A/BkbqdzMybIxs7CLWsxF1GBLcmIBxZGDLhmVgdZmLSM9DtDTm
    Bsq83EJ77p5FQWi3DgIWLcTp9WogyqKHuHYdBCx6iE3qIGDRQ2id+8qihdhu4Qus2YMoi4JULQrC
    ioh1nTcQVkSsalmfWg0EuxVIq/PeX9T1aL7I0+UEY7QmKMqiDQojXh0ELFqIkqD3UFne81An/pvx
    ZJz6eXoC0n+ElybsDDdEIS1KqO0ggtQCOCZ/bnS+QLZQ5IdrbhEZB+dcBKss4vdcvHAh4zCeBTJ7
    5DKIk+zQ/wVLo4IQqChmlktLOpPY+SMuNl9fTK/ymF8YKHPUjU7BRToNYHf0yDN0u5XQLzc3WclV
    cKw5KabvsQ6ujkfDr9bk6+DUHJzAUfjDiW+Ory5/bngVwx6zqRY26PX/LjXaGK4wNKg7WWWZ5Emy
    G3Sdrg0r8xp1TbiIeZqu5nMI5t3BlD/fHWqEOqxC2SAUP7s6XRsSOP4mXdszRaF4nfIUPE8zFL0m
    Mo5QxmOpUel5lQ0aVBJmEWpRDCsI6RO3T3o61RvSnvMR1cm/NKpovo+12Ulohb5JMy00Q76sNXva
    zNywEtpcS7cQzeUqnUmoJoFGudwZvMuW4jVcpZFOdtepbtCUEbaFidINDb7b7+I+JlrdW1rWXFPb
    emjVBnCVul0ruIE2sO0CR2j8/fiWp1IECUc3i4WENvHWkYKaln2nIFSx9XnC54GMZ3EaiiCTYjWT
    KwGsx1HxHo3m9+foauybLVl/nFxenB2hwfHZUBtQr6w50msuuqGAlp7GWZ4HL5ABSfwApbcfTPZW
    RqukoRRXxTQcwU41lWLWxaRzleKyUClt7nsVV68Lyfn9JI7SAA6lhdMq6XQ9WZd+6qtaUdfg+1mw
    m9BoCn8ep3ztP9/IRL8X85apopNqaSO51bpp2QVZrpQppfAoYBRhjuO4u2PHdjtUUuN86c5wteYm
    udJGnoGFxmkCvpuTJRciuIfKgQCEr9uzevs5rNnzo1PG7SoScRgiLsJFEkmOgvknJ4xqI6Ss3+1+
    drQYDybX5kRCILIWffBjI0e0WDx+dsQ4i9XX+9NDxVTKZb/T4dOHwJQceicPrdlivjQfAkuWfbVt
    21QEfQ97uJPlgessHrKlzlG3PIiikQ59mKD/AwBQV3IKZW5kc3RyZWFtCmVuZG9iago2IDAgb2Jq
    Cjw8L0NvbnRlbnRzIDUgMCBSL1R5cGUvUGFnZS9SZXNvdXJjZXM8PC9Qcm9jU2V0IFsvUERGIC9U
    ZXh0IC9JbWFnZUIgL0ltYWdlQyAvSW1hZ2VJXS9Gb250PDwvRjEgMSAwIFI+Pj4+L1BhcmVudCAz
    IDAgUi9NZWRpYUJveFswIDAgNTk1IDg0Ml0+PgplbmRvYmoKMSAwIG9iago8PC9TdWJ0eXBlL1R5
    cGUxL1R5cGUvRm9udC9CYXNlRm9udC9IZWx2ZXRpY2EvRW5jb2RpbmcvV2luQW5zaUVuY29kaW5n
    Pj4KZW5kb2JqCjMgMCBvYmoKPDwvS2lkc1s0IDAgUiA2IDAgUl0vVHlwZS9QYWdlcy9Db3VudCAy
    L0lUWFQoMS4zLjI1KT4+CmVuZG9iago3IDAgb2JqCjw8L1R5cGUvQ2F0YWxvZy9QYWdlcyAzIDAg
    Uj4+CmVuZG9iago4IDAgb2JqCjw8L01vZERhdGUoRDoyMDIzMDEwNTEzMzAxMSswMScwMCcpL0Ny
    ZWF0aW9uRGF0ZShEOjIwMjMwMTA1MTMzMDExKzAxJzAwJykvVGl0bGUoU2lnbmF0dXJwcvxmdW5n
    c2JlcmljaHQpPj4KZW5kb2JqCnhyZWYKMCA5CjAwMDAwMDAwMDAgNjU1MzUgZiAKMDAwMDAwMjYw
    MSAwMDAwMCBuIAowMDAwMDAwMDE1IDAwMDAwIG4gCjAwMDAwMDI2ODkgMDAwMDAgbiAKMDAwMDAw
    MTI4NSAwMDAwMCBuIAowMDAwMDAxNDQyIDAwMDAwIG4gCjAwMDAwMDI0NDQgMDAwMDAgbiAKMDAw
    MDAwMjc1OSAwMDAwMCBuIAowMDAwMDAyODA0IDAwMDAwIG4gCnRyYWlsZXIKPDwvSW5mbyA4IDAg
    Ui9JRCBbPGExZjNjMDZhOGJkZmFkYmIxMTM1YTllYmI1N2JjYTBiPjw3ZjA1YmNmNjJhY2IyNjkx
    YWQ2MDEzMmY3ODFiNDk3NT5dL1Jvb3QgNyAwIFIvU2l6ZSA5Pj4Kc3RhcnR4cmVmCjI5MjYKJSVF
    T0YK
    --===============5461036781536416417==--
    .
```

## KIM Bescheinigung

|Header                  |Inhalt                                 |verpflichtend|
|------------------------|---------------------------------------|-------------|
|X-KIM-Dienstkennung     |eEB;Bescheinigung;V1.0                 |ja|
|X-KIM-Ursprungssystem   |\<PVS-Bezeichnung>;\<Releaseversion>   |nein|
|X-KIM-Sendersystem      |\<Kasse-Bezeichnung>;\<Releaseversion> |nein|
|X-KIM-Support           |\<Support-Email-Adresse Kasse> |nein|
|In-Reply-To             |Message-ID der Anfrage                 |ja - wenn die Anfrage über eine KIM-Nachricht gestellt wurde <br />Andernfalls nein|
|Subject                 |\<T/E>EEB0_BES_\<UUID>                 |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Type            |application/octet-stream;<br />name="<T/E>EEB0_BES_\<UUID>.p7s" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Transfer-Encoding |base64 |ja|
|Content-Disposition     |attachment;<br />filename="<T/E>EEB0_BES_\<UUID>.p7s" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Description     |eEB_BES |ja|

Der Anhang enthält die signierte Bescheinigung (SMC-B signiert) als `PKCS7`-Datei

### KIM Bescheinigung Beispielnachricht

```xml
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
    X-KIM-Ursprungssystem: Megapraxisprogramm;V1.0
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
```

## KIM Fehlernachricht

|Header	                   |Inhalt	                                         |verpflichtend|
|------                    |-------                                          |-------------|
|X-KIM-Dienstkennung	     |eEB;Fehler;V1.0	                                 |ja|
|X-KIM-Ursprungssystem	   |\<PVS-Bezeichnung>;\<Releaseversion>             |nein|
|X-KIM-Sendersystem        |\<Kasse-Bezeichnung>;\<Releaseversion>           |nein|
|X-KIM-Support             |\<Support-Email-Adresse Kasse>                   |nein|
|In-Reply-To               |Message-ID der Anfrage                           |ja|
|Subject                   |\<T/E>EEB0_FEH_\<UUID> |ja<br /><br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Type              |application/xml;<br />name="<T/E>EEB0_FEH_\<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Transfer-Encoding |base64	                                         |ja|
|Content-Disposition       |attachment;<br />filename="<T/E>EEB0_FEH_\<UUID>.xml"  |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: bundle-identifier (AZ der Kasse)|
|Content-Description       |eEB_FEH                                          |ja|

Der Anhang enthält eine Fehlermeldung als FHIR-Ressource `OperationOutcome`
