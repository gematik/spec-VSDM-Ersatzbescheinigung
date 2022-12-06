---
topic: bescheinigung
---
# Inhalt

Als Ergebnis einer Bescheinigungsanfrage antwortet die Kasse eine KIM-Nachricht, die im Positiv-Fall ein signiertes Bescheinigungsbundle enthält.

- [Inhalt](#inhalt)
  - [Signatur](#signatur)
  - [FHIR Datenstruktur Bescheinigung](#fhir-datenstruktur-bescheinigung)
    - [Patient (optional)](#patient-optional)
    - [Coverage](#coverage)
  - [Bescheinigungsbundle (Beispiel)](#bescheinigungsbundle-beispiel)
  - [Fehlerfälle und Fehlerbundle](#fehlerfälle-und-fehlerbundle)

## Signatur

Die Signatur ist als Base64-Codierter PKCS#7-Container der KIM-Antwort zu entnehmen.
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

Im Ergebnis liefert der Konnektor eine `verifyDocumentResponse`, die im einfachen Fall ein ein-eindeutiges `VALID` zurückiliefert (siehe folgendes XML-Fragment).

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

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle}}

### Patient (optional)

Die Patient-Ressource vom Typ `KBV_PR_FOR_Patient` enthält die der Kasse bekannten Patientendaten gemäß KBV-Profilierung,
wie sie in den Anwendungen *eAU*, *eRezept*, etc. verwendet werden.

### Coverage

In der Coverage-Ressource werden die Informationen zum Versicherungsverhältnis mitgeliefert.
Mit dem Institutionskennzeichen `iknr` der Kasse und der `KVNR` des Patienten liegen der Praxis alle notwendigen Informationen zur späteren Abrechnung vor.

## Bescheinigungsbundle (Beispiel)

Im Folgenden ist ein Beispiel-Bescheinigungs-Bundle dargestellt. Dieses ist innerhalb des Signaturcontainers (PKCS#7 enveloping) enthalten.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Bundle xmlns="http://hl7.org/fhir">
   <id value="876193e4-f880-466c-ab6c-d9c94f7e43e1" />
   <meta>
      <profile value="https://fhir.ehex.de/StructureDefinition/EEBBescheinigungBundle|1.0.0" />
   </meta>
   <identifier>
      <system value="urn:ietf:rfc:3986" />
      <value value="f2197b7b-7859-4f0d-9028-29db19cfa99d" />
   </identifier>
   <type value="message" />
   <timestamp value="2022-11-04T13:03:45.197+01:00" />
   <entry>
      <fullUrl value="https://easyti.ehex.de/fhir/MessageHeader/a0dc4ce3-f959-46b5-84b6-a9e2a340d5dc" />
      <resource>
         <MessageHeader xmlns="http://hl7.org/fhir">
            <id value="a0dc4ce3-f959-46b5-84b6-a9e2a340d5dc" />
            <meta>
               <profile value="https://fhir.ehex.de/StructureDefinition/EEBBescheinigungBundle|1.0.0" />
            </meta>
            <eventUri value="https://fhir.ehex.de/EEBBescheinigung" />
            <source>
               <endpoint value="http://www.tk.de" />
            </source>
            <response>
               <identifier value="cb67de30-a309-4f1d-9dd1-6cc73a65a3a6" />
               <code value="ok" />
            </response>
         </MessageHeader>
      </resource>
   </entry>
   <entry>
      <fullUrl value="https://easyti.ehex.de/fhir/Coverage/344a0422-6bb6-4a04-8705-9d5d74517136" />
      <resource>
         <Coverage xmlns="http://hl7.org/fhir">
            <id value="344a0422-6bb6-4a04-8705-9d5d74517136" />
            <meta>
               <profile value="https://fhir.ehex.de/StructureDefinition/EEBCoverageEgk|1.0.0" />
            </meta>
            <extension url="http://fhir.de/StructureDefinition/gkv/version-vsdm">
               <valueString value="5.2.0" />
            </extension>
            <extension url="https://fhir.ehex.de/StructureDefinition/AllgemeineVersicherungsdaten">
               <valueBase64Binary value="PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iSVNPLTg4NTktMTUiIHN0YW5kYWxvbmU9InllcyI/
PjxVQ19BbGxnZW1laW5lVmVyc2ljaGVydW5nc2RhdGVuWE1MIENETV9WRVJTSU9OPSI1LjIuMCIgeG1s
bnM9Imh0dHA6Ly93cy5nZW1hdGlrLmRlL2ZhL3ZzZG0vdnNkL3Y1LjIiPjxWZXJzaWNoZXJ0ZXI+PFZl
cnNpY2hlcnVuZ3NzY2h1dHo+PEJlZ2lubj4yMDIwMDEwMTwvQmVnaW5uPjxLb3N0ZW50cmFlZ2VyPjxL
b3N0ZW50cmFlZ2Vya2VubnVuZz4xMDE1NzU1MTk8L0tvc3RlbnRyYWVnZXJrZW5udW5nPjxLb3N0ZW50
cmFlZ2VybGFlbmRlcmNvZGU+RDwvS29zdGVudHJhZWdlcmxhZW5kZXJjb2RlPjxOYW1lPlRlY2huaWtl
ciBLcmFua2Vua2Fzc2U8L05hbWU+PEFicmVjaG5lbmRlcktvc3RlbnRyYWVnZXI+PEtvc3RlbnRyYWVn
ZXJrZW5udW5nPjEwNDA3NzUwMTwvS29zdGVudHJhZWdlcmtlbm51bmc+PEtvc3RlbnRyYWVnZXJsYWVu
ZGVyY29kZT5EPC9Lb3N0ZW50cmFlZ2VybGFlbmRlcmNvZGU+PE5hbWU+VEs8L05hbWU+PC9BYnJlY2hu
ZW5kZXJLb3N0ZW50cmFlZ2VyPjwvS29zdGVudHJhZWdlcj48L1ZlcnNpY2hlcnVuZ3NzY2h1dHo+PFp1
c2F0emluZm9zPjxadXNhdHppbmZvc0dLVj48VmVyc2ljaGVydGVuYXJ0PjE8L1ZlcnNpY2hlcnRlbmFy
dD48WnVzYXR6aW5mb3NfQWJyZWNobnVuZ19HS1Y+PFdPUD4zODwvV09QPjwvWnVzYXR6aW5mb3NfQWJy
ZWNobnVuZ19HS1Y+PC9adXNhdHppbmZvc0dLVj48L1p1c2F0emluZm9zPjwvVmVyc2ljaGVydGVyPjwv
VUNfQWxsZ2VtZWluZVZlcnNpY2hlcnVuZ3NkYXRlblhNTD4=" />
            </extension>
            <extension url="https://fhir.ehex.de/StructureDefinition/PersoenlicheVersichertendaten">
               <valueBase64Binary value="PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iSVNPLTg4NTktMTUiIHN0YW5kYWxvbmU9InllcyI/
PjxVQ19QZXJzb2VubGljaGVWZXJzaWNoZXJ0ZW5kYXRlblhNTCBDRE1fVkVSU0lPTj0iNS4yLjAiIHht
bG5zPSJodHRwOi8vd3MuZ2VtYXRpay5kZS9mYS92c2RtL3ZzZC92NS4yIj48VmVyc2ljaGVydGVyPjxW
ZXJzaWNoZXJ0ZW5fSUQ+VDAyOTY1MzI5MDwvVmVyc2ljaGVydGVuX0lEPjxQZXJzb24PEdlYnVydHNkY
XR1bT4xOTkyMDEwMTwvR2VidXJ0c2RhdHVtPjxWb3JuYW1lPlBldGVyPC9Wb3JuYW1lPjxOYWNobmFtZ
T5USy1lQVUtTcO8bGxlcjwvTmFjaG5hbWU+PEdlc2NobGVjaHQ+TTwvR2VzY2hsZWNodD48U3RyYXNzZ
W5BZHJlc3NlPjxQb3N0bGVpdHphaGw+NDAyMjE8L1Bvc3RsZWl0emFobD48T3J0PkTDvHNzZWxkb3JmP
C9PcnQ+PExhbmQ+PFdvaG5zaXR6bGFlbmRlcmNvZGU+RDwvV29obnNpdHpsYWVuZGVyY29kZT48L0xhb
mQ+PFN0cmFzc2U+U3BlZGl0aW9uc3RyLjwvU3RyYXNzZT48SGF1c251bW1lcj4xOTwvSGF1c251bW1lc
j48L1N0cmFzc2VuQWRyZXNzZT48L1BlcnNvbj48L1ZlcnNpY2hlcnRlcj48L1VDX1BlcnNvZW5saWNoZ
VZlcnNpY2hlcnRlbmRhdGVuWE1MPg==" />
            </extension>
            <extension url="https://fhir.ehex.de/StructureDefinition/GeschuetzteVersichertendaten">
               <valueBase64Binary value="PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iSVNPLTg4NTktMTUiIHN0YW5kYWxvbmU9InllcyI/
PjxVQ19HZXNjaHVldHp0ZVZlcnNpY2hlcnRlbmRhdGVuWE1MIENETV9WRVJTSU9OPSI1LjIuMCIgeG1s
bnM9Imh0dHA6Ly93cy5nZW1hdGlrLmRlL2ZhL3ZzZG0vdnNkL3Y1LjIiPjxadXphaGx1bmdzc3RhdHVz
PjxTdGF0dXM+MDwvU3RhdHVzPjwvWnV6YWhsdW5nc3N0YXR1cz48U2VsZWt0aXZ2ZXJ0cmFlZ2U+PEFl
cnp0bGljaD45PC9BZXJ6dGxpY2g+PFphaG5hZXJ6dGxpY2g+OTwvWmFobmFlcnp0bGljaD48L1NlbGVr
dGl2dmVydHJhZWdlPjwvVUNfR2VzY2h1ZXR6dGVWZXJzaWNoZXJ0ZW5kYXRlblhNTD4=" />
            </extension>
            <status value="active" />
            <beneficiary>
               <identifier>
                  <type>
                     <coding>
                        <system value="http://fhir.de/CodeSystem/identifier-type-de-basis" />
                        <code value="GKV" />
                        <display value="Gesetzliche Krankenversicherung" />
                     </coding>
                  </type>
                  <system value="http://fhir.de/NamingSystem/gkv/kvid-10" />
                  <value value="T029653290" />
               </identifier>
            </beneficiary>
            <period>
               <start value="2022-11-03" />
               <end value="2027-11-03" />
            </period>
            <payor>
               <identifier>
                  <system value="http://fhir.de/NamingSystem/arge-ik/iknr" />
                  <value value="101575519" />
               </identifier>
               <display value="Techniker Krankenkasse" />
            </payor>
         </Coverage>
      </resource>
   </entry>
</Bundle>
```

## Fehlerfälle und Fehlerbundle

Im Fall von Fehlern, antwortet die Kasse mit einer Fehler-Nachricht `EEBFehlerBundle`, die in einer FHIR-Ressource `OperationOutcome` StatusCodes und lesbare Fehlertexte in einer Liste von Fehlern `issue`|s transportieren.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerBundle}}
