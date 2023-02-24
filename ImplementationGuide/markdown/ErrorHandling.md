---
topic: errorhandling
---
# Inhalt

Auf dieser Seite wird das Error-Handling vorgestellt.
Dazu werden die Liste der verwendeten Fehlercodes aus dem entsprechenden ValueSet und
die Struktur des OperationOutcome zum Transport der Fehlermeldung vorgestellt.

- [Inhalt](#inhalt)
  - [Liste der verwendeten Fehlercodes](#liste-der-verwendeten-fehlercodes)
  - [OperationOutcome](#operationoutcome)

## Liste der verwendeten Fehlercodes

Es werden die Fehlercodes aus dem Projekteigenen `ValueSet` [https://gematik.de/fhir/eeb/ValueSet/EEBErrorcodeVS](https://simplifier.net/vsdm-ersatzbescheinigung/eeberrorcodevs) verwendet.
In der FHIR-Resource `OperationOutcome` muss in `issue.details.coding` ein Wert der Tabelle des folgenden Codesystems gemäß Definition des ValueSets verwendet werden. Die folgenden Codes sind gemäß der festgestellten Fehlerursache (siehe Beschreibung) vorgesehen:

@```
from
  CodeSystem
where
  name = 'EEBErrorcodeCS'
for concept select
  *
```

## OperationOutcome

Die FHIR-Resource `OperationOutcome` transportiert die Fehlermeldung inkl. Fehlerursache, weshalb eine angefragte elektronische Ersatzbescheinigung nicht ausgestellt werden konnte.
Die Resource wird dabei analog zur Bescheinigung in einer KIM-Nachricht transportiert, OHNE ein klammerndes Bundle.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/EEBFehler}}

Im OperationOutcome wird genau ein `issue` mit entsprechenden Details übertragen.
Die `severity` ist dabei immer `#fatal`, es werden keine Warnungen angegeben.
Das Feld `issue.details.coding` enthält den von der Kasse angegebenen Fehlercode zur Begründung,
weshalb keine elektronische Ersatzbescheinigung ausgestellt werden konnte, der dem Endnutzer mitgeteilt werden kann.

Der optionale Text in `OperationOutcome.issue.details.text` dient der Unterstützung in der Entwicklung und wird ggfs. nur in Testsystemen gefüllt.

Der OperationOutcome.issue enthält immer eine `Extension` die das fehlerverursachende Element (eEB-Anfrage-Bundle **oder** fehlerhafte KIM-Anfrage-Nachricht) referenziert.

Nachfolgend ist eine Beispiel-Fehlermeldung ["Patient hier nicht versichert"](https://simplifier.net/vsdm-ersatzbescheinigung/generated-resources-operationoutcome-bbd0690c-6939-4c90-979c-9ab9b1ed1552) dargestellt. D.h. die Fehlerursache ist im AnfrageBundle zu lokalisieren, anhand der Patienteninformationen kann kein Versicherungsverhältnis im Kassensystem lokalisiert werden.

<iframe src="https://www.simplifier.net/embed/render?id=vsdm-ersatzbescheinigung/generated-resources-operationoutcome-bbd0690c-6939-4c90-979c-9ab9b1ed1552" style="width: 100%;height: 320px;"></iframe>

Ein weiteres Beispiel einer Fehlermeldung im OperationOutcome ist hier zu finden, nach welchem die [KIM-Anfrage-Nachricht fehlerhaft](https://simplifier.net/vsdm-ersatzbescheinigung/generated-resources-operationoutcome-3f624395-be34-4fac-9773-d735cb3a1f73) ist.
