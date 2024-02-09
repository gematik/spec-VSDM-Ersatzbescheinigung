---
parent:
---
# Testsystem der Techniker Krankenkasse in der Referenzumgebung (RU)

Die Techniker Krankenkasse stellt in der RU ein Testsystem bereit. Die KIM-Adressen und weitere Details können dem Verzeichnisdienst VZD-Eintrag der TK entnommen werden.

|VZD-Attribut| Inhalt|
|---|---|
|Institutionskennzeichen (DomainID) |101575519|
|KIM-eMail-Adressen RU |*tk@akquinet.kim.telematik-test<br/>* tk-eau@akquinet.kim.telematik-test<br/>*tk@arv.kim.telematik-test<br/>* tk@cgm-ref.komle.telematik-test<br/>*tk@dgn.kim.telematik-test<br/>* tk@tsi.kim.telematik-test|
|TelematikID | 8-20a1201-002|

Zum Testen der EEB-Use Cases sind nachfolgende Testversicherte für EEB-Anfragen bei der TK nutzbar. **Testversicherte, deren Versicherungsverhältnis beendet ist (s. Spalte Bemerkung), werden entsprechend mit einer Fehler-Nachricht (Fehlercode: 100) beantwortet.** Bei allen anderen Versicherten wird bei korrekter EEB-Anfrage mit einer EEB-Bescheinigung geantwortet.

Für den Test der beiden Sonderfälle:

* EEB-Bescheinigung mit dem Profil EEBCoverageNoEgk
* EEB-Bescheinigung über eine Kassen-App

werden 2 Testversicherte (TK31 und TK32) bereitgestellt.

Mit dem Testversicherten TK31 – Max TK-eEB – kann eine EEB-Bescheinigung mit dem  Profil EEBCoverageNoEgk angefordert werden. Diese Form der Bescheinigung verwendet, wenn der Versicherte einen Leistungsanspruch zum angefragten Zeitpunkt hat, bei der Kasse jedoch noch keine KVNR vorliegt.

Mit dem Testversicherten TK32 – Lisa TK-eEB-QR-Code – kann eine EEB-Anforderung gestellt simuliert werden, als hätte der Versicherte über seine Kassen-App die EEB-anforderung gestellt, d.h. im EEBBescheinigungBundle wird als Anfragender (Feld eventCoding) die professionOID eines Versicherten eingetragen (1.2.276.0.76.4.49) und der Bezug zur EEB-Anforderung (Feld response) fehlt.



|Datensatz-nummer|Geschlecht|Vorname|Nachname|KvNr|Geburtsdatum|PLZ|Ort|Straße|Hausnummer|Bemerkung|
|---|---|---|---|---|---|---|---|---|---|---|
|TK1|M|Peter|TK-eAU-Müller|T029653290|01.01.1992|40221|Düsseldorf|Speditionstr.|19|
|TK2|M|Wolfgang|TK-eAU-Schmidt|T025430661|04.01.1991|40221|Düsseldorf|Speditionstr.|19|
|TK3|M|Michael|TK-eAU-Schneider|T024791905|26.12.1989|40221|Düsseldorf|Speditionstr.|19|
|TK4|M|Werner|TK-eAU-Fischer|T028697153|12.02.1994|40221|Düsseldorf|Speditionstr.|19|
|TK5|M|Klaus|TK-eAU-Weber|T026292252|12.03.1990|40221|Düsseldorf|Speditionstr.|19|
|TK6|W|Maria|TK-eAU-Meyer|T022778793|02.04.1998|48149|Münster|Kardinal-von-Galen-Ring|65|
|TK7|W|Ursula|TK-eAU-Wagner|T021801083|01.05.1987|48149|Münster|Kardinal-von-Galen-Ring|65|
|TK8|W|Monika|TK-eAU-Becker|T025771854|27.05.1972|48149|Münster|Kardinal-von-Galen-Ring|65|
|TK9|W|Petra|TK-eAU-Schulz|T029078783|01.04.1965|48149|Münster|Kardinal-von-Galen-Ring|65|
|TK10|W|Elisabeth|TK-eAU-Hoffmann|T026327361|24.12.1991|48149|Münster|Kardinal-von-Galen-Ring|65|
|TK11|W|Sabine|TK-eAU-Schäfer|T026117012|17.06.1961|20354|Hamburg|Fontenay|10|
|TK12|W|Renate|TK-eAU-Koch|T021739143|23.10.2000|20354|Hamburg|Fontenay|10|
|TK13|W|Helga|TK-eAU-Bauer|T020272886|14.08.2001|20354|Hamburg|Fontenay|10|
|TK14|W|Karin|TK-eAU-Richter|T023237886|12.07.1995|20354|Hamburg|Fontenay|10|
|TK15|W|Brigitte|TK-eAU-Wolf|T023967718|01.06.1994|20354|Hamburg|Fontenay|10|
|TK16|M|Thomas|TK-eAU-Klein|T021451127|01.02.2003|80805|München|Berliner Str.|85|
|TK17|M|Manfred|TK-eAU-Schröder|T024466476|14.12.1988|80805|München|Berliner Str.|85|
|TK18|M|Helmut|TK-eAU-Neumann|T021184587|12.08.1997|80805|München|Berliner Str.|85|
|TK19|M|Jürgen|TK-eAU-Schwarz|T020766897|11.06.1967|80805|München|Berliner Str.|85|
|TK20|M|Heinz|TK-eAU-Zimmermann|T029505514|02.07.1971|80805|München|Berliner Str.|85|Fehlerfall: Versicherungsverhältnis beendet zum 31.12.2020
|TK21|W|Ingrid|TK-eAU-Braun|T026916765|01.01.1995|10117|Berlin|Unter den Linden|77|
|TK22|W|Erika|TK-eAU-Krüger|T027142433|02.02.1974|10117|Berlin|Unter den Linden|77|
|TK23|W|Andrea|TK-eAU-Hofmann|T026438810|18.11.1990|10117|Berlin|Unter den Linden|77|
|TK24|W|Gisela|TK-eAU-Hartmann|T021021215|22.01.1990|10117|Berlin|Unter den Linden|77|
|TK25|W|Claudia|TK-eAU-Lange|T027894250|12.01.1989|10117|Berlin|Unter den Linden|77|
|TK26|M|Gerhard|TK-eAU-Schmitt|T027820925|08.06.1991|76135|Karlsruhe|Pulverhausstr.|42|Fehlerfall: Versicherungsverhältnis beendet zum 31.03.2021
|TK27|M|Andreas|TK-eAU-Werner|T027190980|31.12.1984|76135|Karlsruhe|Pulverhausstr.|42|Fehlerfall: Versicherungsverhältnis beendet zum 30.04.2021
|TK28|M|Hans|TK-eAU-Schmitz|T026608281|14.01.1983|76135|Karlsruhe|Pulverhausstr.|42|Fehlerfall: Versicherungsverhältnis beendet zum 31.05.2021
|TK29|M|Josef|TK-eAU-Krause|T021724507|28.02.2003|76135|Karlsruhe|Pulverhausstr.|42|Fehlerfall: Versicherungsverhältnis beendet zum 28.02.2021
|TK30|M|Günter|TK-eAU-Meier|T026508594|28.06.1999|76135|Karlsruhe|Pulverhausstr.|42|Fehlerfall: Versicherungsverhältnis beendet zum 01.08.2020|
|TK31|M|Max|TK-eEB|-|23.02.1969|80805|München|Berliner Str.|85|Vers für Profil EEBCoverageNoEgk
|TK32|W|Lisa|TK-eEB-QR-Code|A819745621|23.02.1969|80805|München|Berliner Str.|85|Vers für Kassen-App-Simulation
