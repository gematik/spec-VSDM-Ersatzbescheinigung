# Inhalt

Bei der Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM wird durch das Praxispersonal initiiert. Kann eine zu behandelnde Person keine Gesundheitskarte als Versicherungsnachweis vorlegen, erfolgt eine Anfrage einer Ersatzbescheinigung bei der von der Person benannten oder bereits im System bekannten Krankenkasse. Damit die Kasse die versicherte Person in ihrem Bestandssystem identifizieren kann, müssen der Anfrage personenbezogene Daten mitgegeben werden.

- [Inhalt](#inhalt)
  - [Erfassung personenbezogener Daten](#erfassung-personenbezogener-daten)
    - [Patient ist im PVS bekannt](#patient-ist-im-pvs-bekannt)
    - [Patient ist im PVS unbekannt](#patient-ist-im-pvs-unbekannt)
  - [Angaben zur anfragenden Praxis](#angaben-zur-anfragenden-praxis)
  - [KIM-Empfängeradresse der Krankenkasse](#kim-empfängeradresse-der-krankenkasse)
  - [Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM](#anforderung-zur-ausstellung-einer-ersatzbescheinigung-via-kim)
    - [Anfrage Header](#anfrage-header)
    - [Anfrage Bundle](#anfrage-bundle)

## Erfassung personenbezogener Daten

Bei der Abfrage nach einer Ersatzbescheinigung zu einer Person sind zwei Fälle zu unterscheiden, ist die 10-stellige Krankenversicherungsnummer `KVNR` der Person bekannt oder unbekannt. Da diese `KVNR` für eine Person (i.d.R.) lebenslang gültig ist, ergibt sich die Antwort aus der Frage, ob der Patient in dieser Praxis in der Vergangenheit bereits einmal vorstellig war.

### Patient ist im PVS bekannt

Um der Kasse Hilfe zum Auffinden der versicherten Person in ihrem Bestandssystem zu geben, müssen personenbezogene Informationen in einer FHIR-Ressource `Patient` mitgegeben werden. Ist die Person bereits im PVS als Patient hinterlegt, genügt ein Eintrag in einer `KnownPatient`-Ressource mit Angabe der `kvnr` im `identifier`. Weitere Angaben sind optional.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/KnownPatient}}

### Patient ist im PVS unbekannt

Ist die zu behandelnde Person als Patient im PVS unbekannt, sind Angaben in einer `UnknownPatient`-Ressource erforderlich. `name`, Ẁohn`address` und `birthDate` sind dabei mindestens anzugeben, um eine Suche in den Systemen der Kasse zu ermöglichen.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/UnknownPatient}}

## Angaben zur anfragenden Praxis

Die Kasse benötigt für die Ausstellung einer Ersatzbescheinigung Informationen über die anfragende Praxis, um das Ausstellen von "Blanko"-Bescheinigungen zu unterbinden. Dazu muss jeder Anfrage eine FHIR-Ressource `Organization` des Profils [KBV_PR_FOR_Organization](https://simplifier.net/for/kbvprfororganization "KBV formularübergreifende Festlegungen") mitgegeben werden. Die Angaben zur `address` und `telecom`-Kontaktinformationen für Rückfragen sind dabei mindestens anzugeben.

<iframe src="https://www.simplifier.net/embed/render?id=for/kbvprfororganization" style="width: 100%;height: 320px;"></iframe>

## KIM-Empfängeradresse der Krankenkasse

Die Suche nach der KIM-Empfängeradresse der Kasse erfolgt im zentralen Verzeichnisdienst VZD mittels LDAP-Query und kann über das KIM-Clientmodul oder direkt durch das PVS über den Konnektor erfolgen. Folgendes Beispiel für einen Konsolenaufruf mittels `ldapsearch` im VZD der TI-Referenzumgebung RU mit der Suche nach einer Krankenkasse OID=`1.2.276.0.76.4.59` und Teil des Namens `Techniker` in einem kombinierten LDAP-Filter `(&(professionOID=1.2.276.0.76.4.59)(displayName=Techniker*))`:

    $ ldapsearch  -x -H ldaps://10.24.11.11:1636  -b dc=data,dc=vzd  "(&(professionOID=1.2.276.0.76.4.59)(displayName=Techniker*))"

Diese liefert folgendes Ergebnis

    # extended LDIF

    #

    # LDAPv3

    # base <dc=data,dc=vzd> with scope subtree

    # filter: (&(professionOID=1.2.276.0.76.4.59)(displayName=Techniker*))

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


> **Hinweis**
>
> Im obigen Beispiel sind 5 KIM-Adressen im VZD-Eintrag enthalten.
> Gängige E-Mail-Clients mit LDAP-Integration verwenden **die erste** gefundene Adresse.
> Der VZD-Eintrag der Techniker Krankenkasse enthält in der Produktiv-Umgebung genau eine KIM-Adresse.

Details und weitere Hinweise zur Suche finden sich in der [API-Beschreibung zum VZD](https://github.com/gematik/api-vzd/blob/main/docs/LDAP_Search.adoc#suche-bei-bekanntem-namen).

## Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM

Liegen alle Informationen im PVS vor, werden diese in einer FHIR-Ressource `EEBAnfrageBundle` zusammengestellt und als Anhang einer KIM-Nachricht an die Kasse gesendet.

### Anfrage Header

> TODO Hendrik

### Anfrage Bundle

{{tree:<https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle>}}

Im folgenden ist ein Beispiel-Bundle dargestellt

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Bundle xmlns="http://hl7.org/fhir">
 <id value="d98fce72-cb4a-4678-83e0-4993c81cdf08"/>
 <meta>
  <profile value="https://fhir.ehex.de/StructureDefinition/EEBAnfrageBundle|1.0.0"/>
 </meta>
 <identifier>
  <system value="urn:ietf:rfc:3986"/>
  <value value="cb67de30-a309-4f1d-9dd1-6cc73a65a3a6"/>
 </identifier>
 <type value="message"/>
 <timestamp value="2022-11-04T13:02:57.573+01:00"/>
 <entry>
  <fullUrl value="https://easyti.ehex.de/fhir/MessageHeader/157a4538-3afb-42dc-8d65-3786685e0927"/>
  <resource>
   <MessageHeader>
    <id value="157a4538-3afb-42dc-8d65-3786685e0927"/>
    <meta>
     <profile value="https://fhir.ehex.de/StructureDefinition/EEBAnfrageHeader|1.0.0"/>
    </meta>
    <extension url="https://fhir.ehex.de/StructureDefinition/Leistungsdatum">
     <valueDate value="2022-11-03"/>
    </extension>
    <extension url="https://fhir.ehex.de/StructureDefinition/Einverstaendnis">
     <valueBoolean value="true"/>
    </extension>
    <eventUri value="https://fhir.ehex.de/EEBAnfrage"/>
    <sender>
     <reference value="Organization/4641b86e-20cc-4e9d-ab87-babedac6865a"/>
    </sender>
    <source>
     <endpoint value="https://ehex.de/KIM"/>
    </source>
   </MessageHeader>
  </resource>
 </entry>
 <entry>
  <fullUrl value="https://easyti.ehex.de/fhir/Patient/cf504bfe-1be9-4e45-89cb-7fb273ea278e"/>
  <resource>
   <Patient>
    <id value="cf504bfe-1be9-4e45-89cb-7fb273ea278e"/>
    <meta>
     <profile value="https://fhir.ehex.de/StructureDefinition/UnknownPatient|1.0.0"/>
    </meta>
    <name>
     <use value="official"/>
     <family value="TK-eAU-Müller">
      <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
       <valueString value="TK-eAU-Müller"/>
      </extension>
     </family>
     <given value="Peter"/>
    </name>
    <birthDate value="1992-01-01"/>
    <address>
     <postalCode value="40221"/>
    </address>
   </Patient>
  </resource>
 </entry>
 <entry>
  <fullUrl value="https://easyti.ehex.de/fhir/Organization/4641b86e-20cc-4e9d-ab87-babedac6865a"/>
  <resource>
   <Organization>
    <id value="4641b86e-20cc-4e9d-ab87-babedac6865a"/>
    <meta>
     <profile value="https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.0.3"/>
    </meta>
    <identifier>
     <type>
      <coding>
       <system value="http://terminology.hl7.org/CodeSystem/v2-0203"/>
       <code value="BSNR"/>
      </coding>
     </type>
     <system value="https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"/>
     <value value="012345678"/>
    </identifier>
    <name value="Praxis Bülow-Bogen"/>
    <telecom>
     <system value="phone"/>
     <value value="0123456789"/>
    </telecom>
    <address>
     <type value="both"/>
     <line value="Emil-Figge-Straße 2">
      <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
       <valueString value="Emil-Figge-Straße"/>
      </extension>
      <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
       <valueString value="2"/>
      </extension>
     </line>
     <city value="Dortmund"/>
     <postalCode value="44227"/>
     <country value="D"/>
    </address>
   </Organization>
  </resource>
 </entry>
</Bundle>
```
