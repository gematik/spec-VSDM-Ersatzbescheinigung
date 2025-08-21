---
parent:
---
# Testdatensatz Allianz

```xml
<Bundle xmlns="http://hl7.org/fhir">
    <id value="bcb6e562-ea4c-40a0-adee-d8ababb73f7f"/>
    <meta>
        <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"/>
    </meta>
    <identifier>
        <system value="urn:ietf:rfc:3986"/>
        <value value="urn:uuid:bcb6e562-ea4c-40a0-adee-d8ababb73f7f"/>
    </identifier>
    <type value="message"/>
    <timestamp value="2025-07-02T16:19:45+02:00"/>
    <entry>
        <fullUrl value="https://gematik.de/fhir/MessageHeader/7f17157d-1a87-432a-b851-c3d7996cfc48"/>
        <resource>
            <MessageHeader xmlns="http://hl7.org/fhir">
                <id value="7f17157d-1a87-432a-b851-c3d7996cfc48"/>
                <meta>
                    <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"/>
                </meta>
                <eventCoding>
                    <system value="https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID"/>
                    <code value="1.2.276.0.76.4.59"/>
                    <display value="Betriebsstätte Kostenträger"/>
                </eventCoding>
                <source>
                    <endpoint value="https://kbvbc-appliance01-ru-rz05.app.rtu.kbvbc.vrz0506.riseops.de/KIM/risePkvDemo"/>
                </source>
                <focus>
                    <reference value="Patient/73c75f0b-85d8-4081-815e-79b83dc073d7"/>
                </focus>
                <focus>
                    <reference value="Coverage/55acaeb8-881b-427b-831a-3c288fec5bdd"/>
                </focus>
            </MessageHeader>
        </resource>
    </entry>
    <entry>
        <fullUrl value="https://gematik.de/fhir/Patient/73c75f0b-85d8-4081-815e-79b83dc073d7"/>
        <resource>
            <Patient xmlns="http://hl7.org/fhir">
                <id value="73c75f0b-85d8-4081-815e-79b83dc073d7"/>
                <meta>
                    <profile value="https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"/>
                </meta>
                <identifier>
                    <type>
                        <coding>
                            <system value="http://fhir.de/CodeSystem/identifier-type-de-basis"/>
                            <code value="PKV"/>
                        </coding>
                    </type>
                    <system value="http://fhir.de/sid/pkv/kvid-10"/>
                    <value value="P684351840"/>
                </identifier>
                <name>
                    <use value="official"/>
                    <family value="Allzeit">
                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                            <valueString value="Alina"/>
                        </extension>
                    </family>
                    <given value="Alina"/>
                </name>
                <birthDate value="1995-07-25"/>
                <address>
                    <type value="both"/>
                    <line value="Apfelallee 18">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                            <valueString value="Apfelallee"/>
                        </extension>
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                            <valueString value="18"/>
                        </extension>
                    </line>
                    <line value="Etage 5">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                            <valueString value="Etage 5"/>
                        </extension>
                    </line>
                    <city value="München"/>
                    <postalCode value="81245"/>
                    <country value="D"/>
                </address>
            </Patient>
        </resource>
    </entry>
    <entry>
        <fullUrl value="https://gematik.de/fhir/Coverage/55acaeb8-881b-427b-831a-3c288fec5bdd"/>
        <resource>
            <Coverage xmlns="http://hl7.org/fhir">
                <id value="55acaeb8-881b-427b-831a-3c288fec5bdd"/>
                <meta>
                    <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"/>
                </meta>
                <extension url="http://fhir.de/StructureDefinition/gkv/version-vsdm">
                    <valueString value="5.2.0"/>
                </extension>
                <extension url="https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten">
                    <valueBase64Binary value="H4sIAAAAAAAAA71U207jMBB971dEfqduSrObIseoosBWohdtReGtMsmURDgOsp2y9Hv4DN74sZ0EaHNhpX0iD47meGbO8Ykn7PRPKp0taJNkKiBut0ccUGEWJeo+IJPl/Mj3veGR6xHHWKEiITMFAXkGQ055h12frRdYm4GSSRjDquiDb20BU3G5nV45Z+PpenX+ezmZzwLidfsFBZIqE5DY2scTSp9M9x5SYZOHbgR0I+jWRGmx0C3mE95x8GGV5vodasJqPRnzxQ9/cOy5/qDHaHPvUFWqVgegBC/hLtfWoPI85e5w6PV+9j1Ga3C9YpVpJVLgI5kogXwfYT1pJsL4I0vuILGM7pEmvwljCWFs+U1Bu49apEbY3VOmLb/QIi9590iTOwVldnmxzS/128smUQV/Ba0XLDJjNyhvFGkwpqFwnyHxGDsRS+67/QFaVMPaJXPUNX17VfgpkH3eVFkj5u7xe78yaOdd4S1sw+XWTRYrgyKkwOsHGm8x8DGjX8HtvrTd+KDjSzfY0mqBqPp2r77Rg+pB+ehxA1JICcDoJ9bO/iVyo/I0xTF1fUYrYcPdf/qHJlXmszbH2ITR//jt8M5fSjm639sEAAA="/>
                </extension>
                <extension url="https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten">
                    <valueBase64Binary value="H4sIAAAAAAAAA42TXU/CMBSG7/kVS+9ZNwQyTVeCYAhBPiIRjTekboexMM5MW6by6+2Q6AbzYxddct7T523ftqzztk2sDKSKU/SJazvEAgzSMMbIJ8P5tO55rcu62yKW0gJDkaQIPnkHRTq8xu57y26SRLCFGGGRU4I1yB1GKhQa8HF8a/X64+Xi5m4+nE580rIbuYPxROWTtdYvV5S+KtsQhI43dgh0JWimwm0+0Mz0E16zzMe+6BrkZ6lczk1VsN7p/bd66LiGKEbkDafRcjzXY/RYKHeNUmUWrKWAqMiv1jeAaPy42/bcpnPRbDNaqf+BSQRgCNKkDbx/gihq55iJ2AI3yccC99ZMxplJ2xpJgcY5KyZS7w4YPXSXt0t/2C+jvwbKnnZK6H2Mq1SdEAvKYLSoWHPhAFFIzd2C17F0PqlAXXafJQTrPNhlpcNhwsN0xh2H0fx/jqP/5ZU6S2pJOd5NWr6cjP79LnjtAysmK417AwAA"/>
                </extension>
                <status value="active"/>
                <type>
                    <coding>
                        <system value="http://fhir.de/CodeSystem/versicherungsart-de-basis"/>
                        <code value="PKV"/>
                        <display value="private Krankenversicherung"/>
                    </coding>
                </type>
                <beneficiary>
                    <reference value="Patient/73c75f0b-85d8-4081-815e-79b83dc073d7"/>
                </beneficiary>
                <period>
                    <start value="2025-08-18"/>
                    <end value="2025-08-18"/>
                </period>
                <payor>
                    <identifier>
                        <system value="http://fhir.de/sid/arge-ik/iknr"/>
                        <value value="168140346"/>
                    </identifier>
                    <display value="Allianz Private Krankenversicherungs-AG"/>
                </payor>
            </Coverage>
        </resource>
    </entry>
</Bundle>
```

# Testdatensatz Hallesche

```xml
<Bundle xmlns="http://hl7.org/fhir">
    <id value="bcb6e562-ea4c-40a0-adee-d8ababb73f7f"/>
    <meta>
        <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"/>
    </meta>
    <identifier>
        <system value="urn:ietf:rfc:3986"/>
        <value value="urn:uuid:bcb6e562-ea4c-40a0-adee-d8ababb73f7f"/>
    </identifier>
    <type value="message"/>
    <timestamp value="2025-07-02T16:19:45+02:00"/>
    <entry>
        <fullUrl value="https://gematik.de/fhir/MessageHeader/7f17157d-1a87-432a-b851-c3d7996cfc48"/>
        <resource>
            <MessageHeader xmlns="http://hl7.org/fhir">
                <id value="7f17157d-1a87-432a-b851-c3d7996cfc48"/>
                <meta>
                    <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"/>
                </meta>
                <eventCoding>
                    <system value="https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID"/>
                    <code value="1.2.276.0.76.4.59"/>
                    <display value="Betriebsstätte Kostenträger"/>
                </eventCoding>
                <source>
                    <endpoint value="https://kbvbc-appliance01-ru-rz05.app.rtu.kbvbc.vrz0506.riseops.de/KIM/risePkvDemo"/>
                </source>
                <focus>
                    <reference value="Patient/fb1a0b97-2562-4b64-ac83-385918a38c5a"/>
                </focus>
                <focus>
                    <reference value="Coverage/55acaeb8-881b-427b-831a-3c288fec5bdd"/>
                </focus>
            </MessageHeader>
        </resource>
    </entry>
    <entry>
        <fullUrl value="https://gematik.de/fhir/Patient/fb1a0b97-2562-4b64-ac83-385918a38c5a"/>
        <resource>
            <Patient xmlns="http://hl7.org/fhir">
                <id value="fb1a0b97-2562-4b64-ac83-385918a38c5a"/>
                <meta>
                    <profile value="https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"/>
                </meta>
                <identifier>
                    <type>
                        <coding>
                            <system value="http://fhir.de/CodeSystem/identifier-type-de-basis"/>
                            <code value="PKV"/>
                        </coding>
                    </type>
                    <system value="http://fhir.de/sid/pkv/kvid-10"/>
                    <value value="P541254120"/>
                </identifier>
                <name>
                    <use value="official"/>
                    <family value="Porter">
                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                            <valueString value="Iris"/>
                        </extension>
                    </family>
                    <given value="Iris"/>
                </name>
                <birthDate value="1962-08-18"/>
                <address>
                    <type value="both"/>
                    <line value="Häusleweg 5">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                            <valueString value="Häusleweg"/>
                        </extension>
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                            <valueString value="5"/>
                        </extension>
                    </line>
                    <line value="Hinterhof">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                            <valueString value="Hinterhof"/>
                        </extension>
                    </line>
                    <city value="Stuttgart"/>
                    <postalCode value="70597"/>
                    <country value="D"/>
                </address>
            </Patient>
        </resource>
    </entry>
    <entry>
        <fullUrl value="https://gematik.de/fhir/Coverage/55acaeb8-881b-427b-831a-3c288fec5bdd"/>
        <resource>
            <Coverage xmlns="http://hl7.org/fhir">
                <id value="55acaeb8-881b-427b-831a-3c288fec5bdd"/>
                <meta>
                    <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"/>
                </meta>
                <extension url="http://fhir.de/StructureDefinition/gkv/version-vsdm">
                    <valueString value="5.2.0"/>
                </extension>
                <extension url="https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten">
                    <valueBase64Binary value="H4sIAAAAAAAAA71U0W7aQBB85yusew+HSVwgOh+KoC1IJKCgkr6hq71gK/a5uj1Dw/f0T/pjWTspYJtKfYol29q52Znx6s5i+CtNnB0YjDPtM7fdYQ7oIAtjvfXZdDm/6ve9wZXrMQet0qFKMg0+ewFkQ9kS30brBfVmoJM4iGBV6NDbWCAqPb7fz5zR+H69+vy4nM4ffOa1u4UFmWr0WWTtz1vO99jeQqps/NwOgW8U32GYFg++Iz6TLYcucSZu3qA6rNfTsVx4N263uDuC19dOXWVqfQJK8Cv8yI1FSp6n0h186nb6bl/wClztWGVGqxTk1MRIdu9VlfOggqiEF1kRXfAjUHfHIEogiKx8KkyPVcMSlT3sSUx+MSovbY9I3ToFjYe8WCYyxJuyoQJXOxYZ2g3luwsNINYiHhkJxPagokT2Ot6gJ3gFa7bMKdjS5tZulbGCz+s5K87SvX4TLIsmb0a7sAmXS09ZpJFSJIq2HxjaxSDHgl+Cm7q8KXzKcXEcYmmNIlR//LA+cAjnXyonf37nmMAetoL/xZrsicpR52lK59QT/KyqTfef86MhnZ3PyjkmEcH/47cjW69vqXvH2wQAAA=="/>
                </extension>
                <extension url="https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten">
                    <valueBase64Binary value="H4sIAAAAAAAAA42TUU/CMBSF3/kVS99ZN2Q6TVeDYJAgYCSi8WWp22Vb2O7MWlD59XZIdAMU97Al95x+p/e2Y5fvWWqsoJBJjh6xTYsYgEEeJhh5ZDCdNF3XOW/aDjGkEhiKNEfwyAdIcskb7KHrd9I0ggwShFlJCWIolhjJUCjAp9Gt0e2N/Nn1/XQwGXvEMVtlgs5E6ZFYqdcLSt+kqQlCJQszBDoXdCXDrHzRlfYT3jD0w77pCoqvUr1chsogXqr1j7pxXEGUIPKW1XIst2Uxui3UXcNc6g2rQkBU5R/WF4Co87h96tptq31yxuhB/QgmFYAhFHrawHs7iKq2jxmLDPiNSFPQLYMxLATqzFV1FoYw+yajG2e9VfpLr4z+OUz2vJRCrROc53KHWFH6w9mB/VYOD0WhuF3J2pb2F1WofuelgCAuh+ofTNgseJzccUsfcPndx9H/8mrOmlpTtveS1i8mo8f/Cd74BCq+OZx3AwAA"/>
                </extension>
                <status value="active"/>
                <type>
                    <coding>
                        <system value="http://fhir.de/CodeSystem/versicherungsart-de-basis"/>
                        <code value="PKV"/>
                        <display value="private Krankenversicherung"/>
                    </coding>
                </type>
                <beneficiary>
                    <reference value="Patient/fb1a0b97-2562-4b64-ac83-385918a38c5a"/>
                </beneficiary>
                <period>
                    <start value="2025-08-20"/>
                    <end value="2025-08-20"/>
                </period>
                <payor>
                    <identifier>
                        <system value="http://fhir.de/sid/arge-ik/iknr"/>
                        <value value="168140437"/>
                    </identifier>
                    <display value="Hallesche Krankenversicherungs a.G."/>
                </payor>
            </Coverage>
        </resource>
    </entry>
</Bundle>
```

# Testdatensatz Wayne Bruce

```xml
<Bundle xmlns="http://hl7.org/fhir">
    <id value="bcb6e562-ea4c-40a0-adee-d8ababb73f7f"/>
    <meta>
        <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"/>
    </meta>
    <identifier>
        <system value="urn:ietf:rfc:3986"/>
        <value value="urn:uuid:bcb6e562-ea4c-40a0-adee-d8ababb73f7f"/>
    </identifier>
    <type value="message"/>
    <timestamp value="2025-07-02T16:19:45+02:00"/>
    <entry>
        <fullUrl value="https://gematik.de/fhir/MessageHeader/7f17157d-1a87-432a-b851-c3d7996cfc48"/>
        <resource>
            <MessageHeader xmlns="http://hl7.org/fhir">
                <id value="7f17157d-1a87-432a-b851-c3d7996cfc48"/>
                <meta>
                    <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"/>
                </meta>
                <eventCoding>
                    <system value="https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID"/>
                    <code value="1.2.276.0.76.4.59"/>
                    <display value="Betriebsstätte Kostenträger"/>
                </eventCoding>
                <source>
                    <endpoint value="https://kbvbc-appliance01-ru-rz05.app.rtu.kbvbc.vrz0506.riseops.de/KIM/risePkvDemo"/>
                </source>
                <focus>
                    <reference value="Patient/018abbc9-72c1-4959-b954-4a5c13bc39b2"/>
                </focus>
                <focus>
                    <reference value="Coverage/55acaeb8-881b-427b-831a-3c288fec5bdd"/>
                </focus>
            </MessageHeader>
        </resource>
    </entry>
    <entry>
        <fullUrl value="https://gematik.de/fhir/Patient/018abbc9-72c1-4959-b954-4a5c13bc39b2"/>
        <resource>
            <Patient xmlns="http://hl7.org/fhir">
                <id value="018abbc9-72c1-4959-b954-4a5c13bc39b2"/>
                <meta>
                    <profile value="https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"/>
                </meta>
                <identifier>
                    <type>
                        <coding>
                            <system value="http://fhir.de/CodeSystem/identifier-type-de-basis"/>
                            <code value="PKV"/>
                        </coding>
                    </type>
                    <system value="http://fhir.de/sid/pkv/kvid-10"/>
                    <value value="X110670799"/>
                </identifier>
                <name>
                    <use value="official"/>
                    <family value="Wayne">
                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                            <valueString value="Wayne"/>
                        </extension>
                    </family>
                    <given value="Bruce"/>
                </name>
                <birthDate value="1970-02-19"/>
                <address>
                    <type value="both"/>
                    <line value="Gotham Boulevard 1a">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                            <valueString value="Gotham Boulevard"/>
                        </extension>
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                            <valueString value="1a"/>
                        </extension>
                    </line>
                    <line value="Block 2">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                            <valueString value="Block 2"/>
                        </extension>
                    </line>
                    <city value="Gotham"/>
                    <postalCode value="12345"/>
                    <country value="D"/>
                </address>
            </Patient>
        </resource>
    </entry>
    <entry>
        <fullUrl value="https://gematik.de/fhir/Coverage/55acaeb8-881b-427b-831a-3c288fec5bdd"/>
        <resource>
            <Coverage xmlns="http://hl7.org/fhir">
                <id value="55acaeb8-881b-427b-831a-3c288fec5bdd"/>
                <meta>
                    <profile value="https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"/>
                </meta>
                <extension url="http://fhir.de/StructureDefinition/gkv/version-vsdm">
                    <valueString value="5.2.0"/>
                </extension>
                <extension url="https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten">
                    <valueBase64Binary value="H4sIAAAAAAAAA71UTU/jMBC991dEvlPHhVK6cowWiqBSS9FWFG6VNxlIRGyvbKds++uZBGjzwUp7IgdH8+bNvJfROPz8r8qDDViXGR0R1g9JADo2SaafIzJdLo7OzobjIzYkgfNSJzI3GiKyBUfORY/fX67vsNaAzrM4hVXZB9/WA1LxeJzPgsvJfL26+rWcLm4jMuwPSgkU1S4iqfd/flD66vrPoKTPXvoJ0CdJNy5R5UE3yCeiF+DDa83tO9SG9Xo6EY+MhaejcDQec9rOHaoq1/oAVOA1/C6sd+i8UIKNR2E4YNilATcrVsZqqUBc2CIG1PsIm6RbGacV/CC3Gln7uK3u4jSHOPViXoruo46kk373aqwXN2BtpbpH2soKtNsVZVrMjE1K8RrUZN8Z55/Q28/EgnMte3tGDpnfyTQXbHB8MuS0gXVLFmjq2vhUKk4XbYMNWcGO37tVQZc3w/XrwlXqwaTaoYVc4t6BxfUFMeH0K7jbl3YbH3x8OQu+9FYiqr95Ut84gfpnfrgKLkyRw0aWW/SZ6dbcyMLpQim8o4zTWtQa8D9HiHOq3c3GHcYmnP7HL0f03gDvL9y71wQAAA=="/>
                </extension>
                <extension url="https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten">
                    <valueBase64Binary value="H4sIAAAAAAAAA42SUU/CMBSF3/kVS99Zt8kCmq4EgRiCCAGdxpelbpdtYdyZtaDy692Q6AZT7MOanHP7nfbusu77OtG2kMk4RYeYukE0QD8NYgwdMlpMm52Ofdk0baJJJTAQSYrgkA+QpMsb7KHv9ZIkhDXECG5B8SPINhjKQCjAp8mt1h9MPHc4X4ymdw6xdatIyDNROiRS6vWK0jep5wSh4pUeAF0KupXBuvjQbV5PeEPLF/umK8i+pKpchEo/2qjdj7uvuIYwRuSWYdlG+8Jk9CBUq8apzC+sMgFhmV/vrwAxz+Om0TKstt1qMVrrn8EkAjCALO828MERouydYu7EGvh8tBhq9yCVNhu7jO616qPoL69i9M+2seeNFGoX4zKVR8SSczN2a25W+k0oMsXNUtZBOj1Uonq9lwz8qGifV5uwP/A4nXHDYLTYT3H0v7xKZcWtOIcJpNURZPT89PPGJ8dRN6VhAwAA"/>
                </extension>
                <status value="active"/>
                <type>
                    <coding>
                        <system value="http://fhir.de/CodeSystem/versicherungsart-de-basis"/>
                        <code value="PKV"/>
                        <display value="private Krankenversicherung"/>
                    </coding>
                </type>
                <beneficiary>
                    <reference value="Patient/018abbc9-72c1-4959-b954-4a5c13bc39b2"/>
                </beneficiary>
                <period>
                    <start value="2025-07-31"/>
                    <end value="2025-07-31"/>
                </period>
                <payor>
                    <identifier>
                        <system value="http://fhir.de/sid/arge-ik/iknr"/>
                        <value value="168149993"/>
                    </identifier>
                    <display value="RISE Test PKV"/>
                </payor>
            </Coverage>
        </resource>
    </entry>
</Bundle>
```
