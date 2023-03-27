# Release Notes

Für die Elektronische Ersatzbescheinigung der gesetzlichen Krankenkassen (eEB) und der Bereitstellung von Versichertenstammdaten für PKV-Versicherte (Online Check-In OCI) stehen die abgestimmten FHIR-Profile in einem FHIR-Package unter https://simplifier.net/packages/de.gematik.elektronische-versicherungsbescheinigung/1.0.0-rc3 zum Download bereit.

Dieser Implementation Guide beschreibt die UseCases und Schnittstellen an verwendeten Komponenten und Diensten der Telematikinfratruktur dieses Projekts. Eine darüber hinausgehende technische Spezifikation ist nicht vorgesehen, da mit dem Versand von FHIR-Ressourcen über das etablierte KIM-Verfahren keine neuen technischen Komponenten definiert werden.

Bis zur Klärung rechtlicher Fragestellungen zwischen den Bundesmantelvertagspartnern wird diese Anwendung in einer "Beta-Version" auf Basis der FHIR-Profile als Release Candidate in der Telematikinfrastruktur pilotiert. Aus den Erkenntnissen der Pilotierung und der Abstimmung unter den Bundesmantelvertagspartnern ergeben sich ggfs. Anpassungsbedarfe an den FHIR-Profilen, die noch in einer finalen Release-Version 1.0.0 Berücksichtigung finden können.

## Hinweis

Für die Pilotierung (bis zur Klärung der rechtlichen Fragestellungen) in der Produktivumgebung werden folgenden Institutions-Typen Ersatzbescheinigungen über das eEB-Verfahren bereitgestellt:

| Anfragende OID Rolle | Bedeutung |
|----------------------|---|
| 1.2.276.0.76.4.30 | Ärztin/Arzt |
| 1.2.276.0.76.4.45 | Psychotherapeut/-in |
| 1.2.276.0.76.4.46 | Psychologische/-r Psychotherapeut/-in |
| 1.2.276.0.76.4.47 | Kinder- und Jugendlichenpsychotherapeut/-in |
| 1.2.276.0.76.4.50 | Betriebsstätte Arzt |
| 1.2.276.0.76.4.52 | Betriebsstätte Psychotherapeut |
| 1.2.276.0.76.4.53 | Krankenhaus |
| 1.2.276.0.76.4.57 | Betriebsstätte Mobile Einrichtung Rettungsdienst |

Demnächst auch:

| Anfragende OID Rolle | Bedeutung |
|----------------------|---|
| 1.2.276.0.76.4.31 | Zahnärztin/Zahnarzt |
| 1.2.276.0.76.4.51 | Zahnarztpraxis |


Die in der RU bereitstehenden Testsysteme unterstützen alle oben gelisteten, anfragenden Personen- und Institutions-Rollen.