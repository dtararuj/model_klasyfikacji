## model klasyfikacji (analiza recenzji filmow na bazie zbioru imdb)

**cel:** okreslenie czy dana recenzja jest pozytywna czy negatywna

------------------------------------------------------------------------

## podstawowe informacje

1)  model jest oparty na sieci konwolucyjnej jednowymiarowej, wykonany za pomoc� biblioteki keras

2)  w celu maksymalizacji dokladnosci klasyfikacji i zwalczenia tzw. nadmiernego dopasowania *wykorzystanu nast�pujace metody:*

-   wartswy embedding w modelu

-   po�aczenie sieci konwolucyjnej jednowymiarowej oraz g�stej sieci neuronowej

-   wywo�ania zwrotne

3)  jako optymalizator modelu posluzono sie wskaznikiem - rmsprop

4)  jako funkcje straty wykorzystano funkcje binary_crossentropy

5)  dane do wyliczenia modelu podzielono na zbior walidacyjny (20% zbioru treningowego), testowy oraz treningowy

6)  model byl trenowany przez 20 epok (iteracji)

## podsumowanie modelu:

model osiagnal dokladnosc dopasowania na zbiorze walidacyjnym na poziomie ok 86,5%, zas na zbiorze testowym 86,4%
