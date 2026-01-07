---
parent:
---

# eEB

- [eEB](#eeb)
  - [Implementierungsleitfaden elektronische Ersatzbescheinigung (eEB/GKV)](#implementierungsleitfaden-elektronische-ersatzbescheinigung-eebgkv)
    - [UseCase und Funktionsweise (Anforderung aus der Praxis)](#usecase-und-funktionsweise-anforderung-aus-der-praxis)
  - [Erfassung personenbezogener Daten](#erfassung-personenbezogener-daten)
    - [Patient ist im PVS bekannt](#patient-ist-im-pvs-bekannt)
    - [Patient ist im PVS unbekannt](#patient-ist-im-pvs-unbekannt)
  - [Angaben zur anfragenden Praxis](#angaben-zur-anfragenden-praxis)
  - [Signatur der Anfrage](#signatur-der-anfrage)
  - [KIM-Empfängeradresse der Krankenkasse](#kim-empfängeradresse-der-krankenkasse)
  - [Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM](#anforderung-zur-ausstellung-einer-ersatzbescheinigung-via-kim)
    - [Anfrage Header](#anfrage-header)
    - [Anfrage Bundle](#anfrage-bundle)
  - [Ausgestaltung der Bescheinigung](#ausgestaltung-der-bescheinigung)
    - [KVNR für Patient vorhanden](#kvnr-für-patient-vorhanden)
    - [KVNR für Patient nicht vorhanden](#kvnr-für-patient-nicht-vorhanden)

## Implementierungsleitfaden elektronische Ersatzbescheinigung (eEB/GKV)

Die UseCases der elektronischen Ersatzbescheinigung digitalisieren den papierbasierten Prozess für Anwendungsfälle in der (Zahn-)Arztpraxis, in denen keine eGK als Versicherungsnachweis vorgelegt werden kann. Der bisherige papierbasierte Prozess für die Übermittlung von Ersatzbescheinigungen wie bspw. Fax, Papierausstellung usw. und der anschließenden händischen Übernahme der Daten sind langwierig, fehleranfällig und unkomfortabel für einen Großteil der Beteiligten.

Mit dem eEB-Verfahren wird die Anforderung und Ausstellung einer Ersatzbescheinigung für Versicherte der gesetzlichen Krankenkassen automatisierbar.

Mit Verabschiedung des DigiG am 02.02.2024 können die Versicherten gemäß §291 SGB V Absatz (9) einen Nachweis der Berechtigung zur Inanspruchnahme von Leistungen im Rahmen der vertragsärztlichen Versorgung von ihrer gesetzlichen Krankenkasse für die Vorlage bei einem Leistungserbringer anfordern, der unmittelbar von der Krankenkasse über ein sicheres Übermittlungsverfahren nach § 311 Absatz 6 (KIM) an den Leistungserbringer übermittelt wird.

Die Leistungserbringer stellen dazu den Versicherten ihre KIM-Adresse in maschinenlesbarer Form zur Verfügung (QR-Code-Scan), damit die Versicherten die KIM-Adresse mit der eEB-Beantragung ihrer Kasse übermitteln können.

Damit Versicherte, die nicht über die technischen Voraussetzungen verfügen, an diesem KIM-Verfahren teilnehmen zu können, können den Leistungserbringer bitten, die Anforderung zur Ausstellung einer elektronischen Ersatzbescheinigung via KIM durch das Praxispersonal zu initiieren. In diesem Fall kann ein Leistungserbringer für eine zu behandelnde Person, die keine Gesundheitskarte als Versicherungsnachweis vorlegen kann, eine Anfrage einer Ersatzbescheinigung bei der von der Person benannten oder bereits im System bekannten Krankenkasse erfolgen. Damit die Kasse die versicherte Person in ihrem Bestandssystem identifizieren kann, müssen der Anfrage ein Mindestsatz an personenbezogenen Daten der versicherten Person mitgegeben werden.

> <span style="color:red">**Hinweis** zur Behandlung auf Basis einer Ersatzbescheinigung</span>
>
> <span style="color:red">Werden dem Patienten im Rahmen der Behandlung Medikamente verschrieben, muss der  Einlöseweg eines E-Rezepts für den Patienten berücksichtigt werden.
> Ist die mitgeführte eGK nicht funktionsfähig, sollte dem Patienten der **E-Rezept-Einlösecode als Ausdruck mitgegeben** werden.</span>

### UseCase und Funktionsweise (Anforderung aus der Praxis)

Die Anforderung zur Ausstellung einer Ersatzbescheinigung für eine gesetzlich versicherte Person kann durch das Praxispersonal initiiert werden.
Für die Anforderung einer Ersatzbescheinigung muss in der Praxis ein minimaler Satz an Informationen zur zu behandelnden Person erfasst und aus dem Praxisverwaltungssystem via KIM an die bekannte bzw. benannte Kasse als Anfrage gesendet werden.
Die Kasse erstellt zur angefragten Person automatisiert, anhand der in ihrem Backend vorliegenden Versicherungsdaten einen FHIR-Datensatz, der dann via KIM der Praxis zugestellt wird.

Das Praxisverwaltungssystem kann die bereits erfassten bzw. vorhandenen Patientendaten mit den von der Kasse bereitgestellten Versichertenstammdaten aktualisieren.

{{render:guides-eeb-oci-images-gkv-ersatzverfahren}}

## Erfassung personenbezogener Daten

Bei der Abfrage nach einer Ersatzbescheinigung zu einer Person sind zwei Fälle zu unterscheiden, ist die 10-stellige Versicherten-ID `KVNR` der Person bekannt oder unbekannt. Da diese `KVNR` für eine Person (i.d.R.) lebenslang gültig ist, ergibt sich die Antwort aus der Frage, ob der Patient in dieser Praxis in der Vergangenheit bereits vorstellig war.

Es hat sich bei Nutzung der KVNR als sinnvoll erwiesen, die KVNR vor Verwendung in der EEB-Anfrage ggf. einmal formal zu prüfen (Länge, Aufbau und Prüfziffer - siehe auch <https://gkv-datenaustausch.de/kvnr/kvnr.jsp>). Diese Hinweise helfen, Tippfehler zu vermeiden.

### Patient ist im PVS bekannt

Um der Kasse Hilfe zum Auffinden der versicherten Person in ihrem Bestandssystem zu geben, müssen personenbezogene Informationen in einer FHIR-Ressource `Patient` mitgegeben werden. Ist die Person bereits im PVS als Patient hinterlegt (wurden bspw. in der Vergangenheit Behandlungen in der Praxis durchgeführt) können die Daten in einer Patienten-Ressource `KBV_PR_FOR_Patient` zusammengefasst werden, wie sie in anderen formularbasierten Anwendungen bereits genutzt wird. Es genügt auch der Eintrag der `kvnr` im `identifier` einer `KnownPatient`-Ressource. Weitere Angaben sind optional.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/EEBKnownPatient}}

### Patient ist im PVS unbekannt

Ist die zu behandelnde Person als Patient im PVS unbekannt, sind folgende Angaben mindestens erforderlich, um der Kasse eine Suche nach einem Versichertenverhältnis zu ermöglichen:

- Der Familienname `name`
- mindestens ein Vorname `given`
- die Postleitzahl `postalCode` der Wohn`address` (Straßenname und Hausnummer sind nicht erforderlich) und
- das `birthDate`

Diese Angaben sind in einer Patienten-Ressource `KBV_PR_FOR_Patient` einzutragen.

Es wird empfohlen, dass das Praxispersonal darauf hingewiesen wird, die versicherte Person nach der aktuellen Krankenkasse zu befragen und ggfs. die hinterlegte Krankenkasse für die Anfrage zu aktualisieren.

## Angaben zur anfragenden Praxis

Die Kasse benötigt für die Ausstellung einer Ersatzbescheinigung Informationen über die anfragende Praxis, um das Ausstellen von "Blanko"-Bescheinigungen zu unterbinden.
Dazu muss jeder Anfrage eine FHIR-Ressource `Organization` des Profils [KBV_PR_FOR_Organization](https://simplifier.net/for/kbv_pr_for_organization "KBV formularübergreifende Festlegungen") mitgegeben werden.
Die Anfrage muss entweder die Betriebsstättennummer `BSNR`, die KZV Abrechnungsnummer `KZVA`, Standortnummer des Krankenhauses oder das Institutionskennzeichen enthalten, um die anfragende Praxis zu identifizieren, zusätzlich kann die `TelematikID` angegeben werden.
Ebenso müssen die Angaben zur `address` und `telecom`-Kontaktinformationen für Rückfragen angegeben sein.

## Signatur der Anfrage

Die Anfrage (das FHIR-Bundle) muss mittels der Institutionsidentität (SMC-B OSIG) signiert werden, um der angefragten Kasse einen Authentizitäts-Nachweis bereitzustellen.
Die Signatur der KIM-Nachricht reicht dabei nicht aus, da diese nur die Integrität des Transports und Authentizität des KIM-Absenders sicherstellt, aber nicht, ob der Absender auch tatsächlich die Institution ist, gegenüber der der Patient eingewilligt hat.
Daher ist der FHIR-Datensatz als Base64-Codierter PKCS#7-Container bereitzustellen (enveloping Signatur) in die KIM-Anfrage einzubetten.

Mittels der Konnektoroperation `signDocument` wird die Signatur erstellt.

```xml
<?xml version="1.0" encoding="utf-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:m0="http://ws.gematik.de/conn/ConnectorCommon/v5.0"
    xmlns:m1="http://ws.gematik.de/conn/ConnectorContext/v2.0"
    xmlns:m2="urn:oasis:names:tc:dss:1.0:core:schema"
    xmlns:m3="http://www.w3.org/2000/09/xmldsig#"
    xmlns:m4="urn:oasis:names:tc:dss-x:1.0:profiles:SignaturePolicy:schema#">
    <SOAP-ENV:Body>
        <m:SignDocument xmlns:m="http://ws.gematik.de/conn/SignatureService/v7.4">
            <m0:CardHandle>SMCB1</m0:CardHandle>
            <m1:Context>
                <m0:MandantId>Mandant1</m0:MandantId>
                <m0:ClientSystemId>ClientID1</m0:ClientSystemId>
                <m0:WorkplaceId>Tisch2</m0:WorkplaceId>
                <m0:UserId>4711</m0:UserId>
            </m1:Context>
            <m:TvMode>NONE</m:TvMode>
            <m:JobNumber>MMD-636</m:JobNumber>
            <m:SignRequest RequestID="Doc1">
                <m:OptionalInputs>
                    <m2:SignatureType>urn:ietf:rfc:5652</m2:SignatureType>
                    <m:IncludeEContent>true</m:IncludeEContent>
                </m:OptionalInputs>
                <m:Document ID="CMS-Doc1" ShortText="eEB-Anfrage">
                    <m2:Base64Data MimeType="text/plain; charset=utf-8">PEJ1bmRsZSB4bWxucz0iaHR0cDovL2hsNy5vcmcvZmhpciI
                    +CiAgICA8aWQgdmFsdWU9IjFmMzExYzQwLWZlZTktNGIwMy1iMGM0LWMyOWQ0MzJmMjM3MSIgLz4K
                    ICAgIDxtZXRhPgogICAgICAgIDwhLS0gZWluIHN0YXJrIGdla/xyenRlcyBCZWlzcGllbCAtLT4KI
                    CAgIDwvbWV0YT4KICAgIDxpZGVudGlmaWVyPgogICAgICAgIDxzeXN0ZW0gdmFsdWU9InVybjppZX
                    RmOnJmYzozOTg2IiAvPgogICAgICAgIDx2YWx1ZSB2YWx1ZT0idXJuOnV1aWQ6Nzk5MzllMzQtYzV
                    jYy00ZGE2LWJhNTUtZjRiZDg1ODMyNzYwIiAvPgogICAgPC9pZGVudGlmaWVyPgogICAgPHRpbWVz
                    dGFtcCB2YWx1ZT0iMjAyMi0wOC0yOVQwMjoxMDozNy4xNTQrMDI6MDAiIC8+CjwvQnVuZGxlPg==</m2:Base64Data>
                </m:Document>
                <m:IncludeRevocationInfo>true</m:IncludeRevocationInfo>
            </m:SignRequest>
        </m:SignDocument>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

Hinweis: Der ShortText darf nicht länger als 30 Zeichen sein.

Im Ergebnis liefert der Konnektor eine `SignDocumentResponse`, die anschließend in die zu verschickende KIM-Anfrage eingebettet wird.

```xml
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Header/>
    <SOAP-ENV:Body>
        <ns8:SignDocumentResponse
            xmlns:ns10="urn:oasis:names:tc:dss-x:1.0:profiles:verificationreport:schema#"
            xmlns:ns11="http://uri.etsi.org/01903/v1.3.2#"
            xmlns:ns12="http://uri.etsi.org/02231/v2#"
            xmlns:ns2="http://ws.gematik.de/conn/EncryptionService/v6.1"
            xmlns:ns3="http://ws.gematik.de/conn/ConnectorCommon/v5.0"
            xmlns:ns4="http://ws.gematik.de/conn/ConnectorContext/v2.0"
            xmlns:ns5="urn:oasis:names:tc:dss:1.0:core:schema"
            xmlns:ns6="http://www.w3.org/2000/09/xmldsig#"
            xmlns:ns7="http://ws.gematik.de/tel/error/v2.0"
            xmlns:ns8="http://ws.gematik.de/conn/SignatureService/v7.4"
            xmlns:ns9="urn:oasis:names:tc:dss-x:1.0:profiles:SignaturePolicy:schema#">
            <ns8:SignResponse RequestID="Doc1">
                <ns3:Status>
                    <ns3:Result>OK</ns3:Result>
                </ns3:Status>
                <ns8:OptionalOutputs>
                    <ns8:DocumentWithSignature ID="CMS-Doc1" ShortText="eEB-Anfrage">
                        <ns5:Base64Data MimeType="text/plain; charset=utf-8"/>
                    </ns8:DocumentWithSignature>
                </ns8:OptionalOutputs>
                <ns5:SignatureObject>
                    <ns5:Base64Signature Type="urn:ietf:rfc:5652">TG9yZW0gSW1zcHVtIQpJIGFtIGEgQ0FkRVMgZW52ZWxvcGluZyBzaWdudGF0dXJlIG9mIGEgZUVCL
                    UFuZnJhZ2UgRkhJUi1CdW5kbGUgaW4gWE1MIHJlcHJlc2VudGF0aW9uLg==</ns5:Base64Signature>
                </ns5:SignatureObject>
            </ns8:SignResponse>
        </ns8:SignDocumentResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

## KIM-Empfängeradresse der Krankenkasse

Die Suche nach der KIM-Empfängeradresse der Kasse erfolgt im zentralen Verzeichnisdienst VZD. Folgendes Beispiel für einen Konsolenaufruf mittels `ldapsearch` im VZD der TI-Referenzumgebung RU mit der Suche nach einer Krankenkasse OID=`1.2.276.0.76.4.59` und Teil des Namens `Techniker` in einem kombinierten LDAP-Filter `(&(professionOID=1.2.276.0.76.4.59)(displayName=Techniker*))`:

    ldapsearch  -x -H ldaps://10.24.11.11:1636  -b dc=data,dc=vzd  "(&(professionOID=1.2.276.0.76.4.59)(displayName=Techniker*))"

Zur Vereinfachung der Praxisabläufe sollte die Suche ins Praxisverwaltungssystem integriert werden.
Bei bekannten Patienten kann die KIM-Adresse aus dem Verzeichnisdienst über den Filter des Haupt-IK (gemäß er Kostenträgerstammdatei) der Krankenkasse abgefragt werden
(XML-Element `./kostentraeger/ik_liste/ik@V`).

Hier der Einfachheit halber ebenfalls als Konsolenaufruf:

    ldapsearch  -x -H ldaps://10.24.11.11:1636  -b dc=data,dc=vzd  "(&(domainID=101577501)(entryType=5))"

Diese liefert folgendes Ergebnis

    # extended LDIF

    #

    # LDAPv3

    # base <dc=data,dc=vzd> with scope subtree

    # filter: (&(domainID=101577501)(entryType=5))

    # requesting: ALL

    #

    # fc695fd6-b6e9-4754-9684-fee70f743086, data.vzd

    dn: uid=fc695fd6-b6e9-4754-9684-fee70f743086,dc=data,dc=vzd
    objectClass: vzd-komleview
    objectClass: top
    mail: tk-intern@akquinet.kim.telematik-test
    mail: tk-dt03@akquinet.kim.telematik-test
    mail: tk-dt01@akquinet.kim.telematik-test
    mail: tk-dt02@akquinet.kim.telematik-test
    mail: tk-dein@akquinet.kim.telematik-test
    otherName: -
    displayName: Techniker Krankenkasse
    cn: Techniker Krankenkasse
    organization: Techniker Krankenkasse NOT-VALID
    userCertificate;binary:: MIIFQzCCBCugAwIBAgICBWIwDQYJKoZIhvcNAQELBQAwgbYxCzAJB
    gNVBAYTAkRFMTowOAYDVQQKDDFULVN5c3RlbXMgSW50ZXJuYXRpb25hbCBHbWJIIC0gRzIgTG9zID
    MgTk9ULVZBTElEMUgwRgYDVQQLDD9JbnN0aXR1dGlvbiBkZXMgR2VzdW5kaGVpdHN3ZXNlbnMtQ0E
    gZGVyIFRlbGVtYXRpa2luZnJhc3RydWt0dXIxITAfBgNVBAMMGFRTWVNJLlNNQ0ItQ0EzIFRFU1Qt
    T05MWTAeFw0yMTA3MTIwNzUzMTJaFw0yNjA3MTIyMzU5NTlaMIHFMQswCQYDVQQGEwJERTEQMA4GA
    1UEBwwHSGFtYnVyZzEOMAwGA1UEEQwFMjIzMDUxHDAaBgNVBAkME0JyYW1mZWxkZXIgU3RyLiAxND
    AxKTAnBgNVBAoMIFRlY2huaWtlciBLcmFua2Vua2Fzc2UgTk9ULVZBTElEMSAwHgYDVQQFExcxMi4
    4MDI3NjAwMzQ0MTIwMDA3NTA4NTEpMCcGA1UEAwwgVGVjaG5pa2VyIEtyYW5rZW5rYXNzZSBURVNU
    LU9OTFkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCFAAwf1Xov5A8x4079MacZm3wb4
    DFN2c0ugwZdvTZLWacLHWfWOUi4Ct06rxuSgsEcyX4P0uU/IDul+BDhpE3hjhV26eoQzHfbNbUl0O
    DTSnWhBqEzjnG3bj4FNqK3rWkeZNmeR1mTp3PjtpPJ4mjGKDDXpNzj+2zhVLe54NI+G2HIllb0tWa
    lmq/kmdQTafPTHjD6nhcKX7Di51/mLebNW8+xiWr3087RfsguxOpELdRzgsE4jYJ3nUNZSKZv3JIU
    TsYwvhrg50gjPLh1XEelv4dcjJWDj0whmo1qEOKEw0AKnnKXnGRWNzFprVxR2Y0wyG5AG+QeSSiM1
    mqVrvgHAgMBAAGjggFIMIIBRDAdBgNVHQ4EFgQUIamKsyVjeh+/jROwwH6/W8lQw5QwDgYDVR0PAQ
    H/BAQDAgQwMAwGA1UdEwEB/wQCMAAwIAYDVR0gBBkwFzAKBggqghQATASBIzAJBgcqghQATARMMEI
    GCCsGAQUFBwEBBDYwNDAyBggrBgEFBQcwAYYmaHR0cDovL29jc3Auc21jYi50ZXN0LnRlbGVzZWMu
    ZGUvb2NzcHIwHwYDVR0jBBgwFoAUMz3U691kvP0AL8E2m1wVWEUrriwwfgYFKyQIAwMEdTBzpCwwK
    jELMAkGA1UEBhMCREUxGzAZBgNVBAoMElNNLUIgS1RSIFN1YmRvbWFpbjBDMEEwPzA9MB8MHUJldH
    JpZWJzc3TDpHR0ZSBLb3N0ZW50csOkZ2VyMAkGByqCFABMBDsTDzgtMDEtMDAwMDAwMDA5MDANBgk
    qhkiG9w0BAQsFAAOCAQEAFgX+0xMfQujIxwpTk/oAOqEJ40LckYsCxs1nJPJlfo3xLdvwu7ADlnYQ
    Zpv89/j+VVjsntSUknOQ508P6N1WsvEwW1knLTloCIUY8g0cAtbPFMjo9cJwuCFbip2vWJxUXVuFk
    x4vTqMw24N+aXzfOoO1EYTusuvRasG3pdjzjBeGvMtWPjjPuXiSyHbyVn3zn3FkIP8ss4z7iLPLDM
    gIm1MHwWVE5u/s1eKWgYm6H6O0D/3uwTAXA+sbTCGCW2CAizAqzCinZAgaFWslCMbSFxef2gUuFsp
    OmpvYt4gnT3iQ6I5aSO5wSYKL/t1vsk8q5YTXmxFS641CIfM9RimalQ==
    userCertificate;binary:: MIIDuTCCA2CgAwIBAgICAN8wCgYIKoZIzj0EAwIwgbgxCzAJBgNVB
    AYTAkRFMTwwOgYDVQQKDDNEZXV0c2NoZSBUZWxla29tIFNlY3VyaXR5IEdtYkggLSBHMiBMb3MgMy
    BOT1QtVkFMSUQxSDBGBgNVBAsMP0luc3RpdHV0aW9uIGRlcyBHZXN1bmRoZWl0c3dlc2Vucy1DQSB
    kZXIgVGVsZW1hdGlraW5mcmFzdHJ1a3R1cjEhMB8GA1UEAwwYVFNZU0kuU01DQi1DQTQgVEVTVC1P
    TkxZMB4XDTIxMDcxMjA3NTMxMloXDTI2MDcxMjIzNTk1OVowgcUxCzAJBgNVBAYTAkRFMRAwDgYDV
    QQHDAdIYW1idXJnMQ4wDAYDVQQRDAUyMjMwNTEcMBoGA1UECQwTQnJhbWZlbGRlciBTdHIuIDE0MD
    EpMCcGA1UECgwgVGVjaG5pa2VyIEtyYW5rZW5rYXNzZSBOT1QtVkFMSUQxIDAeBgNVBAUTFzEyLjg
    wMjc2MDAzNDQxMjAwMDc1MDg1MSkwJwYDVQQDDCBUZWNobmlrZXIgS3Jhbmtlbmthc3NlIFRFU1Qt
    T05MWTBaMBQGByqGSM49AgEGCSskAwMCCAEBBwNCAASJVInVJ+T7m9Cb15TnGktiMH0S7u2hySspy
    3JDMp4IqEx0CtwRxlVdXQDAga+Cpy4p445yDtRKdM61ZHO14Mt3o4IBSDCCAUQwHQYDVR0OBBYEFK
    PYQvWf9gVo9c1pHtbrTkMDdat5MA4GA1UdDwEB/wQEAwIDCDAMBgNVHRMBAf8EAjAAMCAGA1UdIAQ
    ZMBcwCgYIKoIUAEwEgSMwCQYHKoIUAEwETDBCBggrBgEFBQcBAQQ2MDQwMgYIKwYBBQUHMAGGJmh0
    dHA6Ly9vY3NwLnNtY2IudGVzdC50ZWxlc2VjLmRlL29jc3ByMB8GA1UdIwQYMBaAFDOvpKthm/Vi6
    OIprNaG66+yVXttMH4GBSskCAMDBHUwc6QsMCoxCzAJBgNVBAYTAkRFMRswGQYDVQQKDBJTTS1CIE
    tUUiBTdWJkb21haW4wQzBBMD8wPTAfDB1CZXRyaWVic3N0w6R0dGUgS29zdGVudHLDpGdlcjAJBgc
    qghQATAQ7Ew84LTAxLTAwMDAwMDAwOTAwCgYIKoZIzj0EAwIDRwAwRAIgb0N3jrN1ylNYC8hlb26l
    8EGsw0Vv5Ne5T1FR1JRIloYCIEpvsMlUGxVwGMj+fh/9blAcpWcNga8RhcbvjPLp80PY
    personalEntry: false
    title: -
    KOM-LE-Version: 1.0
    domainID: 101577501
    entryType: 5
    telematikID: 8-01-0000000090
    dataFromAuthority: TRUE
    countryCode: DE
    street: Bramfelder Str. 140
    holder: dtsg
    professionOID: 1.2.276.0.76.4.59
    komLeData: 1.0,tk-dt03@akquinet.kim.telematik-test
    komLeData: 1.0,tk-intern@akquinet.kim.telematik-test
    komLeData: 1.0,tk-dt01@akquinet.kim.telematik-test
    komLeData: 1.0,tk-dt02@akquinet.kim.telematik-test
    komLeData: 1.0,tk-dein@akquinet.kim.telematik-test
    st: -
    l: Hamburg
    postalCode: 22305
    changeDateTime: 2021-10-12T10:45:25.537594+02:00
    uid: fc695fd6-b6e9-4754-9684-fee70f743086

    # search result

    search: 2
    result: 0 Success

    # numResponses: 2

    # numEntries: 1

Im Attribut `komLeData` steht die zu verwendende KIM-Adresse hier `komLeData: 1.0,tk-dt03@akquinet.kim.telematik-test`.

Sollten zu dem ausgewählten Kostenträger mehrere Verzeichniseinträge hinterlegt sein (in der PU - Produktivumgebung - kann das aktuell jedoch nicht vorkommen),
dann sollte geprüft werden, für welchen dieser Verzeichniseinträge eine KIM-Adresse hinterlegt ist.
Sind mehrere KIM-Adressen hinterlegt - auch dieser Fall ist aktuell in der PU nicht vorgesehen, empfiehlt sich der Versand an die erste gefundene KIM-Adresse der jeweiligen Krankenkasse.

Kann kein Empfänger aus dem VZD der TI ermittelt werden, muss der Anwendungsfall mit einer Fehlermeldung abgebrochen werden, demzufolge die Empfängeradresse der Krankenkasse mit den bereitgestellten Informationen nicht ermittelt werden konnte. Ggfs. müssen die Angaben durch den Patienten konkretisiert werden, bei welcher Krankenkasse er versichert ist.

> **Hinweis**
>
> Im obigen Beispiel sind 5 KIM-Adressen im VZD-Eintrag enthalten.
> Gängige E-Mail-Clients mit LDAP-Integration verwenden **die erste** gefundene Adresse.
> Der VZD-Eintrag der Techniker Krankenkasse enthält in der Produktiv-Umgebung genau eine KIM-Adresse.

Details und weitere Hinweise zur Suche finden sich in der [API-Beschreibung zum VZD](https://github.com/gematik/api-vzd/blob/main/docs/LDAP_Search.adoc#suche-bei-bekanntem-namen).

## Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM

Liegen alle Informationen im PVS vor, werden diese in einer FHIR-Ressource `EEBAnfrageBundle` zusammengestellt und als Anhang einer KIM-Nachricht an die Kasse gesendet.

### Anfrage Header

Der für den genutzten Bundle-Typ `message` verpflichtende Header transportiert neben Metainformationen (Leistungsdatum, Referenz auf die anfragende Praxis `KBV_PR_FOR_Organization`) das Einverständnis des Patienten (`true` = eingewilligt), das zuvor vom Praxispersonal eingeholt wurde.
Das Feld `MessageHeader.source.endpoint` ist dabei ein vom FHIR-Standard vorgesehenes Pflichtfeld, das mit einer vom PVS gewählten URL belegt werden kann.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageHeader}}

### Anfrage Bundle

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle}}

Im folgenden Link ist ein Beispiel-Bundle [Patient mit bekannter KVNR](https://simplifier.net/vsdm-ersatzbescheinigung/1f311c40-fee9-4b03-b0c4-c29d432f2371) dargestellt.

## Ausgestaltung der Bescheinigung

EEB-Anfragen über KIM werden nach erfolgreicher Prüfung von der Kasse mit den Coverage Profilen EEBCovergaEgkNoAddressLine bzw. EEBCoverageNoEgk abhängig beantwortet, ob der angefragte Patient eine KNVR hat oder nicht.

### KVNR für Patient vorhanden

Ist die KVNR für den angefragten Patienten vorhanden, so wird in der EEBBescheinigung für die Coverage das Profil `EEBCoverageEgkNoAddressLine` und für den Patienten das Profil `KBV_PR_FOR_Patient` verwendet.

- Im VSD-Container `persoenlicheVersicherungsdaten` des Profils EEBCoverageNoAddressLine werden in der Straßenadresse die Werte für Straße und Hausnummer nicht gesetzt.
- Im VSD-Container `allgemeineVersicherungsdaten` ist der Versicherungsbeginn ein muss-Feld. Daher wird ein fiktiver Versicherungsbeginn konstant auf 01.01.1900 gesetzt. Dieses Datum repräsentiert nicht den wahren Versicherungsbeginn des Versicherten und darf für weitere Geschäftsfunktionen, z.B. Abrechnungsmodalitäten, nicht verwendet werden.
- Im Profil `KBV_PR_FOR_Patient` wird das Feld `address.line` inklusive der extensions der Straßenanschrift weggelassen, damit entfallen zusätzlich die Felder Strasse, Hausnummer und Adresszusatz.

### KVNR für Patient nicht vorhanden

Besitzt der Patient noch keine KVNR (z.B. Neugeborene) sowie wird das Coverage Profil `EEBCoverageNoEgk` verwendet. In diesem Profil gibt es weder einen Versicherungsbeginn noch eine Straßenadresse, so dass sich die geforderten Adresseinschränkungen nur im Profil `KBV_PR_FOR_Patient` auswirken. D.h. auch in dieser Konstellation (`EEBCoverageNoEgk`) werden im Profil `KBV_PR_FOR_Patient` das Feld line der Straßenanschrift weggelassen.
