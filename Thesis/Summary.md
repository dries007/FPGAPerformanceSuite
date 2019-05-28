# Korte Samenvatting {.unnumbered}
\markboth{\MakeUppercase{Korte Samenvatting}}{}

## Inleiding {.unnumbered .unlisted}

In de wereld van hardware worden FPGAs gebruikt om functionaliteit te implementeren die normaal onbetaalbare, op maat gemaakte chips, zou vereisen. De ruimtevaartindustrie is hiervan het schoolvoorbeeld door de zeer kleine oplagen van de meeste projecten. Maar in deze industrie is er nog een toegevoegde complexiteit: de gebruikte componenten moeten geschikt zijn voor de extreme omgeving. Dit vereist specifieke versies die lang op voorhand besteld moeten worden. Hierdoor is de karakterisatie van de FPGA en de specificaties van het project extra belangrijk.

Ontwerpers van projecten die FPGAs gebruiken zijn traditioneel afhankelijk van de fabrikanten en hun eigen ervaring voor het kiezen van een geschikt model. We zijn er van overtuigd dat objectieve, relevante cijfers kunnen helpen bij deze selectie.

## Literatuurstudie {.unnumbered .unlisted}

De FPGA industrie is een niche, traditioneel zeer gesloten industrie. Dit maakt dat er weinig gepubliceerde werken zijn over dit onderwerp. Veel studies die we vonden zijn oud of toetsen andere onderwerpen af.

Wel relevant is de zogenoemde "stamping methodology" ofwel postzegelmethode. Die bestaat er uit een FPGA maximaal te vullen met identieke kopieën van hetzelfde ontwerp. Als de FPGA volledig vol zit wordt dan de kloksnelheid gemeten. Deze methode is vandaag de industriestandaard. Het ontwerp dat gekozen wordt is daarbij zeer belangrijk. Spijtig genoeg kan de fabrikant hier gemakkelijk een ontwerp kiezen dat alleen de eigen sterktes benadrukt en dat de zwakke punten negeert.

Nadat we onze werkingsmethode hadden uitgeschreven hebben we een project uit 2017 van de European Space Agency (ESA) ontdekt. De methodologie van dit project, de “Open ESA FPGA Benchmark Suite”, lijkt op de onze maar is beperkter in implementatie.

## Methodologie en Implementatie {.unnumbered .unlisted}

Het doel van deze thesis is het ontwikkelen van een platform dat een projectontwikkelaar in staat stelt objectieve, relevante cijfers te genereren over de FPGA en het project. Deze cijfers kunnen dan gebruikt worden tijdens de selectieprocedure.

Hiervoor hebben we een softwarepakket ontwikkeld in Python dat het proces bijna volledig automatiseert. De gebruiker kan een lijst met code bestanden doorgeven samen met een lijst van parameters. De software stuurt dan volautomatisch de software van de FPGA fabrikant aan. Deze zet de code om naar een hardware ontwerp voor de FPGA en bepaalt daarbij eigenschappen zoals de maximale klokfrequentie en de hoeveelheid middelen van de FPGA het ontwerp gebruikt.

Het ontwerpen van een benchmark wordt ook besproken. Vooral belangrijk is dat code geen IO pinnen aanspreekt maar interne registers gebruikt. IO pinnen zijn namelijk in snelheid gelimiteerd en bevinden zich enkel langs de buitenkant van de chip.

De verkregen data is vooral interessant als ze zou kunnen worden voorgesteld als een eenzijdig getal dat eenvoudig vergelijkbaar is met andere resultaten. Spijtig genoeg bestaat dit niet, omdat een FPGA te toepassingsspecifiek is. Daarom stellen we de resultaten voor als een grafiek die de gebruiker zelf kan interpreteren.

Per softwarepakket van de fabrikant is er een andere aanpak nodig. We kozen voor Vivado (van Xilinx) en nxPython (van NanoXplore) omdat Xilinx de grootste fabrikant is en omdat Antwerp Space (onze industriepartner) een specifieke interesse heeft voor NanoXplore. De integratie van deze softwarepakketten in onze software wordt uitgebreid besproken. Ten slotte kiezen we ook een FPGA model per fabrikant om onze benchmarks mee te testen.

## Benchmarks en Resultaten {.unnumbered .unlisted}

Onze belangrijkste testgevallen zijn de ISCAS’89 benchmark set en een zelfgemaakte combinatie tussen een van deze ISCAS’89 benchmarks en een FIR filter.

De ISCAS’89 set is een lijst van benchmarks die is ontworpen om digitale logica mee te testen. De benchmarks bevatten alleen maar simpele gates waardoor het een ideale basis vormt waar bovenop  een ander, complexer, ontwerp kan worden getest.

Om de combinatie van achtergrond- en voorgrond-ontwerp te kunnen testen hebben we een bovenlaag ontworpen die ervoor zorgt dat de verschillende ontwerpen niet van elkaar gescheiden kunnen worden. Dit levert realistischere resultaten op.

De combinatietest resulteerde in bruikbare informatie voor ons testgeval van Xilinx. De software van NanoXplore heeft nog enkele problemen die door tijdgebrek niet zijn opgelost of omzeild, waardoor we hiervoor geen resultaten hebben van de combinatietest.

## Conclusie {.unnumbered .unlisted}

Onze software maakt het overbodig om manueel vele iteraties van een ontwerp te testen in de zoektocht naar een optimum in performantie. Door de vergaande automatisering kunnen er veel meer datapunten worden berekend. Dit maakt het gemakkelijker om zowel de performantie van de FPGA te bestuderen als de performantie van (een onderdeel van) een ontwerp. Dit was het beoogde resultaat van deze thesis.
