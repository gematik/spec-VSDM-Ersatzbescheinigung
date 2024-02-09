---
parent:
---
# FHIR-Profile

Als Ergebnis einer Anfrage für eine Ersatzbescheinigung per KIM aus einer Praxis antwortet die angefragte Krankenkasse mittels einer KIM-Nachricht, die im Positiv-Fall ein signiertes Bescheinigungsbundle (Ersatzbescheinigung) enthält.

Gesetzlich Versicherte können die Anfrage einer Ersatzbescheinigung auch über ihre Kassen-App per Scan eines QR-Codes auslösen. Der QR-Code enthält die KIM-Adresse der Praxis, die die Ersatzbescheinigung erhalten soll. Bei positiver Prüfung sendet die Kasse das Bescheinigungsbundle (Ersatzbescheinigung) mittels einer KIM-Nachricht an die Praxis. Negative Prüfungen werden in diesem Fall nur dem Versicherten nicht aber der Praxis mitgeteilt.

Ebenso sendet das Versicherungsunternehmen einer Praxis eine KIM-Nachricht mit einem Bescheinigungsbundle (Versichertennachweis) bei einer versichertenseitigen Anforderung in einer Versicherten-App.

- [FHIR-Profile](#fhir-profile)
  - [Signatur](#signatur)
  - [FHIR Datenstruktur Bescheinigung](#fhir-datenstruktur-bescheinigung)
    - [Patient](#patient)
    - [Coverage](#coverage)
    - [Sonderfall Coverage ohne KVNR](#sonderfall-coverage-ohne-kvnr)
  - [Bescheinigungsbundle (Beispiel)](#bescheinigungsbundle-beispiel)
  - [Fehlerfälle (Anfrage für GKV-Ersatzbescheinigung fehlgeschlagen)](#fehlerfälle-anfrage-für-gkv-ersatzbescheinigung-fehlgeschlagen)

## Signatur

Die Signatur ist als Base64-Codierter PKCS#7-Container der KIM-Nachricht des Versicherungsunternehmens zu entnehmen.
Sie trägt die signierte Bescheinigung innerhalb des Signaturcontainers (enveloping Signatur).
Mit der Konnektoroperation `verifyDocument` kann die Signatur der Kasse geprüft werden.

```xml
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:m0="http://ws.gematik.de/conn/ConnectorContext/v2.0"
    xmlns:m1="http://ws.gematik.de/conn/ConnectorCommon/v5.0"
    xmlns:m2="urn:oasis:names:tc:dss:1.0:core:schema"
    xmlns:m3="<http://www.w3.org/2000/09/xmldsig>#"
    xmlns:m4="urn:oasis:names:tc:dss-x:1.0:profiles:verificationreport:schema#">
    <SOAP-ENV:Body>
        <m:VerifyDocument xmlns:m="http://ws.gematik.de/conn/SignatureService/v7.4">
            <m0:Context>
                <m1:MandantId>Mandant1</m1:MandantId>
                <m1:ClientSystemId>ClientID1</m1:ClientSystemId>
                <m1:WorkplaceId>CATS</m1:WorkplaceId>
            </m0:Context>
            <m:TvMode>NONE</m:TvMode>
            <m:OptionalInputs>
                <m:UseVerificationTime>
                    <m2:CurrentTime/>
                </m:UseVerificationTime>
                <m4:ReturnVerificationReport>
                    <m4:IncludeVerifier>true</m4:IncludeVerifier>
                    <m4:IncludeCertificateValues>true</m4:IncludeCertificateValues>
                    <m4:IncludeRevocationValues>true</m4:IncludeRevocationValues>
                    <m4:ExpandBinaryValues>false</m4:ExpandBinaryValues>
                </m4:ReturnVerificationReport>
            </m:OptionalInputs>
            <m2:SignatureObject>
                <m2:Base64Signature Type="urn:ietf:rfc:5652">MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwGggCSABIID
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
    vqE8HXDRPWl0ypk2X9kIcXQ8bRjQBgLaYufGnA+6tUfmmKGc0BA15QUAAAAAAAA=</m2:Base64Signature>
            </m2:SignatureObject>
            <m:IncludeRevocationInfo>false</m:IncludeRevocationInfo>
        </m:VerifyDocument>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

Im Ergebnis der Signaturprüfung liefert der Konnektor eine `verifyDocumentResponse`, die im einfachen Fall ein ein-eindeutiges `VALID` zurückliefert (siehe folgendes XML-Fragment).

```xml
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
 <SOAP-ENV:Header/>
 <SOAP-ENV:Body>
  <ns8:VerifyDocumentResponse xmlns:ns10="urn:oasis:names:tc:dss-x:1.0:profiles:verificationreport:schema#"
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
   <ns3:Status>
    <ns3:Result>OK</ns3:Result>
   </ns3:Status>
   <ns8:VerificationResult>
    <ns8:HighLevelResult>VALID</ns8:HighLevelResult>
    <ns8:TimestampType>USER_DEFINED_TIMESTAMP</ns8:TimestampType>
    <ns8:Timestamp>2022-11-07T13:37:07Z</ns8:Timestamp>
   </ns8:VerificationResult>
  </ns8:VerifyDocumentResponse>
 </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

Gibt es Hinweise im Zusammenhang mit ggfs. veralteten, eingebetteten OCSP-Responses antwortet der Konnektor mit einem HighLevelResult `INCONCLUSIVE` und Status:Result `Warning`, das zusätzliche Informationen liefert.

## FHIR Datenstruktur Bescheinigung

Das Bescheinigungs-Bundle besteht aus einem Bescheinigungs-Header `MessageHeader`, Patienteninformationen `Patient` und der Deckungsinformation `Coverage`.

Der `MessageHeader` enthält eine Statusinformation und einen `event`-Coding-Code über die Herkunft der Anfrage zur Ausstellung einer Ersatzbescheinigung als `OID` über die fachlichen Rollen der Telematikinfrastruktur. Die Liste der zulässigen OIDs findet sich als `ProfessionOID` in gemSpec_OID bzw. als CodeSystem des [VZD-FHIR-Projekts](https://simplifier.net/vzd-fhir-directory/practitionerprofessionoid).
Der Header ist für den Bundle-Type `message` verpflichtend.

> **Hinweis** zur Bescheinigung via Kassen-App
>
> Erfolgt die EEB-Anforderung nicht von einem Leistungserbringer, sondern durch den Versicherten über die Kassen-App, ergeben sich folgende zwei Änderungen im Profil des EEBBescheinigungHeader
>
> 1. Das Element response ist im MessageHeader nicht mehr enthalten, da kein Bezug zu einem EEBAnfrageBundle hergestellt werden kann
> 2. Im Element eventCoding wird zur Kennzeichnung des Auslösers der EEB-Bescheinigung die ProfessionOID eines Versicherten (1.2.276.0.76.4.49) statt der einer Organization (z.B. 1.2.276.0.76.4.50 -  Betriebsstätte Arzt) gesetzt
>
> Als Beispiel einer EEB-Bescheinigung auf Basis einer App-Anforderung siehe [EEB-Bescheinigung-App.xml](https://github.com/gematik/spec-VSDM-Ersatzbescheinigung/blob/master/guides/eEB-OCI/samples/EEB-Bescheinigung-App.xml)

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle}}

### Patient

Die Patient-Ressource vom Typ `KBV_PR_FOR_Patient` enthält die der Kasse bekannten Patientendaten gemäß KBV-Profilierung,
wie sie in den Anwendungen *eAU*, *eRezept*, etc. verwendet werden.
Dieses Profil hat ausschließlich informativen Charakter für die Verarbeitung der Bescheinigung, da es als Referenz im MUSS-element `beneficiary` des Profils der nachfolgend beschriebenen `EEBCoverageEgk` verwendet wird.

<iframe src="https://www.simplifier.net/embed/render?id=for/kbvprforpatient" style="width: 100%;height: 320px;"></iframe>

### Coverage

In der Coverage-Ressource werden von den Krankenkassen der GKV die Ersatzbescheinigung und von Versicherungsunternehmen der PKV Versichertenstammdaten wie insbesondere die Krankenversichertennummer geliefert.

Das Feld period mit `period.start` und `period.end` wird unterschiedlich von GKV und PKV verwendet.

- Die Krankenkassen der GKV prüfen, ob zum angefragten Leistungsdatum der eEB-Anfrage ein Versicherungsverhältnis (inkl. Leistungsanspruch) besteht. Ist dieses „Versicherungsverhältnis“ vorhanden, so wird als Beginn (`period.start`) das angefragte Leistungsdatum gesetzt. Als Ende-Datum (`period.end`) wird in der Regel das zugehörige Quartalsendedatum bescheinigt. In Ausnahmefällen wird das Ende-Datum vor dem Quartalsende liegen, z.B. wenn bereits bekannt ist, dass das Versicherungsverhältnis vor dem Quartalsende beendet sein wird. Eine Bescheinigung über mehrere Quartale ist nicht vorgesehen.
- Die Versicherungsunternehmen der PKV übertragen mit der Bescheinigung die Versichertenstammdaten, so dass im Feld period der Zeitpunkt der Stammdatenübertragung angegeben wird. Daher wird `period.start = period.end` gesetzt.

Zudem enthält die Coverage in den Extensions `allgemeineVersicherungsdaten`, `persoenlicheVersichertendaten` und `geschuetzteVersichertendaten` die Versichertenstammdaten (insbesondere die KVNR als `Versicherten_ID` in den `allgemeineVersicherungsdaten`), um für PKV-Versicherten die Anwendungen der Telematikinfrastruktur nutzen zu können.
Die Versichertenstammdaten sind dort in `base64`-Codierung und `gzip`-komprimiert enthalten.

Die Extension `Coverage.extension:versionEgk` gibt die verwendete Schemaversion der Versichertenstammdaten an.

Für GKV-Versicherte werden diese gemäß [VSD-Schema](https://github.com/gematik/api-telematik/blob/OPB4/fa/vsds/Schema_VSD.xsd) formatiert (aktuelle Version 5.2.0).

Für PKV-Versicherte wurde festgelegt, dass hier ebenfalls das GKV-Schema verwendet wird [VSD-Schema](https://github.com/gematik/api-telematik/blob/OPB4/fa/vsds/Schema_VSD.xsd) formatiert (aktuelle Version 5.2.0). Hintergrund ist die Definition des VSD-Schema_PKV für die in der Vergangenheit avisierte Ausgabe von elektronischen Gesundheitskarten. Da diese beim Online Check-In nicht benötigt wird, soll das GKV-Schema verwendet werden, was die Implementierung im Primärsystemen vereinfacht.

Details zur Befüllung der VSD für PKV-Versicherte sind auf der folgenden Unterseite angegeben {{pagelink:Einfuehrung/OCI/VU-Backend.page.md}}

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk}}

### Sonderfall Coverage ohne KVNR

In wenigen Fällen der EEB-Anfrage kommt es vor, dass die zuständige Krankenkasse noch **keine KVNR** für den Versicherten vorliegen bzw. erhalten hat **(z.B. für Kassen-Wechsler und Säuglinge)**. Hat der Versicherte gem. Prüfung der EEB-Anfrage einen Anpruch auf Leistungen, aber die eGK kann jedoch wegen aktuell fehlender KVNR noch nicht erstellt werden, dann kann in der EEB-Bescheinigung eine Coverage mit dem Profil `EEBCoverageNoEgK` verwendet werden. Die Extensions `allgemeineVersicherungsdaten`, `persoenlicheVersichertendaten` und `geschuetzteVersichertendaten` des Profils `EEBCoverageEgK` sind daher **nicht im Profil EEBCoverageNoEgK enthalten**.

Mit dem Profil `EEBCoverageNoEgK` werden nur die Versichertendaten geliefert, die für eine Abrechnung von Leistungen benötigt werden. Hierzu gehören die Versichertenart, das Wohnortprinzip, die Besondere Personengruppe und der Zuzahlungsstatus des Versicherten sowie das Abrechnungsinstitutionskennzeichen der Krankenkasse. Die zugehörigen Adress- und persönlichen Daten des Versicherten werden nach wie vor über das Profil `KBV_PR_FOR_Patient` beigestellt.
Anstelle der noch nicht bekannten KVNR muss eine kassen-individuelle "Ersatznummer", die den Versicherten eineindeutig referenziert, mit der Bescheinigung bereitgestellt werden. Die Ersatznummer wird im Element `versichertennummer_kvk` (ehemalige Versichertennummer der Krankenversichertenkarte) des Profils `KBV_PR_FOR_Patient` geliefert.

## Bescheinigungsbundle (Beispiel)

Unter folgendem Link ist ein ["Beispiel-Bescheinigungs-Bundle"](https://simplifier.net/vsdm-ersatzbescheinigung/9b6ac30d-246d-4eab-af83-544564792089) dargestellt.
Dieses ist innerhalb des oben genannten Signaturcontainers (PKCS#7 enveloping) enthalten.

## Fehlerfälle (Anfrage für GKV-Ersatzbescheinigung fehlgeschlagen)

Im Fall von Fehlern antwortet die Kasse mit einer Fehler-Nachricht `EEBFehler` als FHIR-Ressource `OperationOutcome`.
Diese enthält Details mit StatusCodes und lesbaren Fehlertexten in einer Liste von Fehlern als `issue`|s.

Details dazu sind auf der Seite {{pagelink:Einfuehrung/eEB/Error-Handling.page.md}} zusammengestellt.
