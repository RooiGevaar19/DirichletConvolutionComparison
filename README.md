# Badanie szybkości obliczeniowej algorytmów obliczających wartość splotu Dirichleta

**Autor:** Paweł Lipkowski

## Języki i oprogramowania użyte w eksperymencie
Języki ogólnego zastosowania
- FreePascal
- C++
- Python
- Java Standard Edition
- JavaScript

Oprogramowania matematyczne 
- Maxima
- R
- Wolfram Mathematica
- bc
- [RPN Calculator – interpreter języka PapajScript](https://github.com/RooiGevaar19/RPNCalculator/wiki) – autorskie oprogramowanie

## Algorytmy użyte w eksperymencie

Użyto algorytmu obliczającego wartość splotu Dirichleta w punkcie dla każdego języka. W zależności od rodzaju i możliwości języka użyto różnych algorytmów.

**Języki ogólnego zastosowania:** 
- wersja podstawowa (obliczająca pożądaną wartość z matematycznej definicji)
- wersja zoptymalizowana
- wersje stosujące metody wysokopoziomowe (dotyczy Pythona i JavaScriptu)

**Oprogramowania matematyczne:**
- wersja zoptymalizowana jak z poprzedniej kategorii języków – dotyczy bc, R i Maximy
- użyto możliwie jak najbardziej zoptymalizowanej wersji algorytmu, na jaki technologia pozwala (np. z wykorzystaniem wbudowanych funkcji) – dotyczy 

## Przykładowe wyniki eksperymentu

Wyniki szczegółowe zawarto w plikach `.csv`. 

W pliku `badanie1.png` przedstawiono wykres 
zestawiający algorytmy i języki programowania ogólnego zastosowania 
i dla każdego algorytmu przedstawiający zależność szybkości obliczenia wyniku w zależności od wielkości `n`.
Na wykresie użyto skali logarytmicznej.

## Samodzielne wykonanie badania

Wymagane:
- system linuksowy
- kompilator g++ (zazwyczaj wbudowany w systemy linuksowe) 
- kompilator FreePascal Compiler (fpc) w wersji 3.0.4 lub wyższej
- interpreter Python3 (rekomendowana wersja 3.8.5)
- interpreter JavaScript – oprogramowania node i npm
- Java w wersji 8 lub wyższej
- bc (zazwyczaj wbudowany w systemy linuksowe) 
- Rscript 
- [RPN Calculator – interpreter języka PapajScript](https://github.com/RooiGevaar19/RPNCalculator/wiki) w wersji 0.5.1.2 lub wyższej

Dodatkowo:
- wxMaxima
- Mathematica lub dostęp do Wolfram Cloud

Jak uruchomić badanie?
- dla języków ogólnego zastosowania wykonać skrypt `./sourcecode/run_testGen.sh` (**uwaga** – test może trwać kilkanaście/kilkadziesiąt minut lub kilka godzin, w zależności od mocy obliczeniowej komputera)
- dla oprogramowań matematycznych wykonać skrypt `./sourcecode/run_testMath.sh` (najczęściej trwa ok. 10 sekund)