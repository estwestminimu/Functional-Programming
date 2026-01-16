# **Programowanie funkcyjne**
<div style="text-align: right">Szymon Tomaszewski</div>


***
**Zadanie 1** Docker

:white_check_mark: 3.0 Zaimplementuj funkcję isSorted, która sprawdza czy dana funkcja jest posortowana zgodnie z podaną funkcją porównawczą [Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/37150e4a06f649e3a7d4a2d0a84fe9d042ac26fd)

https://github.com/user-attachments/assets/28b86da8-a0c0-43cb-b3a1-cb217fad462f


:white_check_mark: 3.5 Zaimplementuj funkcję, która zsumuje liczby po wierszach z trzech list na wejściu; wykorzystaj funkcję sprowadzi funkcję z trzema argumentami, do funkcji z dwoma [Link do commita2 ](https://github.com/estwestminimu/Functional-Programming/commit/a05159be29bc9d8047abae1287295c27cc85d17d)

https://github.com/user-attachments/assets/efe88d80-5c28-47dd-87e2-039139b6aa23

:white_check_mark: 4.0 Zaimplementuj funkcję setHead, która doda element na początku listy [Link do commita 3](https://github.com/estwestminimu/Functional-Programming/commit/cd15db7d53616541f9ff5ea4b472580e25e56b4e)

https://github.com/user-attachments/assets/1fb9acc2-dd72-41f0-a957-d0f105ccaab1


:white_check_mark:4.5 Zaimplementuj funkcję append, która doda element we wskazanym miejscu w liście [Link do commita 4](https://github.com/estwestminimu/Functional-Programming/commit/6e9462f14f22fc25087c092cbc3ccd35b9c427ec)

https://github.com/user-attachments/assets/df15d334-848b-497b-bb47-38c0c8ad2299

:x: 5.0 Zaimplementuj funkcję, która policzy kwadrat liczb z dwóch list (po wierszach) za pomocą funkcji map oraz funkcji anonimowej


Kod: [Link do zadania 1](./example/src/main/scala/Example.scala )





***
**Zadanie 2** Ubuntu LTS

Stwórz obraz dockerowy, który bazuje na najnowszej wersji Ubuntu LTS
oraz który zawiera paczki:
- :white_check_mark: Java 8
- :white_check_mark: Python 3
- :white_check_mark: Scala (dowolna wersja)
- :white_check_mark: sbt
- :white_check_mark: vim

#### Rozwiązanie: 
Kod: [Link do  dockerhub](https://hub.docker.com/r/estwestminimu/ubuntu_24_lts-java_8-python_3-scala-sbt-vim )


https://github.com/user-attachments/assets/11aec74d-fd79-4f7f-9204-53c7e296445e


***
**Zadanie 3** Struktury danych 

:white_check_mark:  3.0 zwrócą wynik funkcji tail, która usuwa pierwszy element z listy
(parameter); należy rozważyć przypadek Nil jako parametr 
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/0e7eb31c84501ec27d2e410126116409b0879b67)

https://github.com/user-attachments/assets/07c621f9-8c45-4b9b-9a4e-e543608d3364

:x:  3.5 zwróci wynik funkcji drop, która usuwa n elementów z listy
dwukierunkowej

:x:  4.0 zwróci wynik funkcji dropWhile, która usuwa n elementów z listy
dwukierunkowej, które spełniają warunek funkcji (parametr); należy
wykorzystać podejście pattern match

:x:  4.5 zwróci wynik funkcji foldLeft wykorzystując do tego companion
object


:x: 5.0 zwróci wynik funkcji concatenate na dwóch listach (parametry),
która zwraca jedną listę


Kod: [Link do zadania 1](./example/src/main/scala/Example.scala)




***
**Zadanie 4**  Typ opcjonalny

Należy wykorzystać typ opcjonalny i rozszerzyć endpointy o endpoint,
który:

:white_check_mark:3.0 zwróci taki sam wynik jak zad.1 4.5 ale wykorzysta typ opcjonalny
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/8b0ba600e7c0c73934dc389baf346aed500bb295)

https://github.com/user-attachments/assets/15728af6-32f1-46a3-8ca4-2d2d00cd561b

:white_check_mark:3.5 zwroci wariancję z listy; do implementacji wykorzystać należy typ opcjonalny
[Link do commita 2](https://github.com/estwestminimu/Functional-Programming/commit/8b0ba600e7c0c73934dc389baf346aed500bb295)

https://github.com/user-attachments/assets/f33cb8f2-2f55-4900-9118-f58fe92c1c30

:x: 4.0 zwróci listę (option), która jest wynikiem połączenia dwóch list (option); w przypadku gdy jedna z list jest None, funkcja powinna zwrócić None

:x: 4.5 zwróci listę za pomocą metody mojeMap[A,B,C](a: Option[A], b: Option[B])(f:(A,B)=>C):Option[C]; należy wykorzystać metodę flatMap oraz map

:x: 5.0 zwróci taki średnią (mean) z listy zwracając Either


Kod: [Link do zadania](./example/src/main/scala/Example.scala)









***
**Zadanie 5**


Należy rozszerzyć endpointy o endpoint, który:

:white_check_mark: 3.0 zwróci słownik z liczbą powtarzających się liczb za pomocą funkcji mapreduce dla list z liczbami
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/9fd1da182d6d4bb01423dd381b0ee961f1a8b473)

https://github.com/user-attachments/assets/17833eea-61b2-4843-b3d0-858d57a21949

:white_check_mark: 3.5 zwróci słownik z liczbami podniesionymi do sześcianu za pomocą
funkcji mapreduce dla list z liczbami
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/c1a22b1ed4f6274ae063e53ea603596202e59136)


https://github.com/user-attachments/assets/ab5abcc6-8af2-47bc-9636-bbf9ce21b188

:x: 4.0  zwróci słownik (student, godziny nauki), która wykorzysta funkcją
mapreduce oraz groupBy dla słownika na wejściu




:x: 4.5 zwróci słownik (zdanie, wektor), która wykorzysta funkcję
mapreduce oraz bagOfWords

:x: 5.0 zwróci słownik (student, średnia ocen), która wykorzysta funkcję
mapreduce oraz join; na wejściu  są dwie listy: (numer_indeksu,
student), (numer_indeksu, kurs, ocena)

Kod: [Link do zadania](./example/src/main/scala/Example.scala)



***
**Zadanie 6**




:white_check_mark: 3.0 Zaimplementuj funkcję isSorted, która sprawdza czy dana funkcja jest posortowana zgodnie z podaną funkcją porównawczą 
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/df377b8c4126b218e22b339cc1afd90537c31c25)

https://github.com/user-attachments/assets/63a15f22-e0ac-48a9-8bd4-331cfa22c297

:white_check_mark: 3.5 Zaimplementuj funkcję, która zsumuje liczby po wierszach z trzech list na wejściu; wykorzystaj funkcję sprowadzi funkcję z trzema argumentami, do funkcji z dwoma

[Link do commita 2](https://github.com/estwestminimu/Functional-Programming/commit/df377b8c4126b218e22b339cc1afd90537c31c25)

https://github.com/user-attachments/assets/8f3b310b-18eb-43ac-8d13-33e22db55925

:x: 4.0 Zaimplementuj funkcję setHead, która doda element na początku listy


:x: 4.5 Zaimplementuj funkcję append, która doda element we wskazanym miejscu w liście 

:x: 5.0 Zaimplementuj funkcję, która policzy kwadrat liczb z dwóch list (po wierszach) za pomocą funkcji map oraz funkcji anonimowej


Kod: [Link do zadania 1](./app/Main.hs )





***
**Zadanie 7 Maszyna stanów**

Należy zaimplementować w Haskellu endpointy, które:

:white_check_mark: 3.0 zwróci wartość między 0, a maxvalue of Int włącznie
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/9bafd0421bf2c8d50d628a210695d8e11fad9acf)


:white_check_mark: 3.5 zwróci wartość między 0, a 1 (Double) z wyłączeniem 1
[Link do commita 2](https://github.com/estwestminimu/Functional-Programming/commit/9bafd0421bf2c8d50d628a210695d8e11fad9acf)


:white_check_mark: 4.0 zwróci pary (Int, Double), (Double, Int) oraz krotki (Double,
Double, Double) wykorzystując funkcje z ocen 3.0 oraz 3.5
[Link do commita 3](https://github.com/estwestminimu/Functional-Programming/commit/9bafd0421bf2c8d50d628a210695d8e11fad9acf)


:x: 4.5 zwróci wartość jak w funkcji 3.5, ale wykorzysta map

:x: 5.0 zwróci wartość jak w funkcji 3.5, ale wykorzysta flatMap

https://github.com/user-attachments/assets/7792eeef-02ab-4cab-bf71-3c2e072f77f7


Kod: [Link do zadania 1](./app/Main.hs )





***
**Zadanie 8 Monoidy, monady, funktory**

Należy zaimplementować w Haskellu endpointy, które:

:white_check_mark: 3.0 wykorzysta metodę map fuktora do wykonania funkcji dodawania lub
odejmowania na dwóch wartość przyjętych na wejściu
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/0b71f964f8a980e0bac5b7155b8ce00ccee34ddf)

:white_check_mark: 3.5 zwróci wartość konkatenacji trzech list za pomocą monoidy
[Link do commita 2](https://github.com/estwestminimu/Functional-Programming/commit/0b71f964f8a980e0bac5b7155b8ce00ccee34ddf)


:x: 4.0 zwróci wartość sumy listy liczb lub zwróci nil; zaimplementuj
wykorzystując monady

:x: 4.5 zwróci zadanie z zestawy 6 na ocenę 4.0 i wykorzysta metodę
combine oraz join

:x: 5.0 zwróci dla listy minimum 3 elementów typu int mapę: liczba
elementów, suma,  wartość minimalna, wartość maksymalna; wykorzysta do
tego monadę oraz metodę foldMap

https://github.com/user-attachments/assets/6935e805-2dae-44fe-9061-5c83f8254c06

Kod: [Link do zadania 1](./app/Main.hs )





***
**Zadanie 9 Wątki**

Należy zaimplementowaś w j. JavaScript endpointy, które:

:white_check_mark: 3.0 zwróci wartość binarną czy podana na wejściu liczba jest liczbą
pierwszą; wykorzysta Promise
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/6e792fc47fcbf3951a0214c5bf4cc43214e4aa07)


:white_check_mark: 3.5  zwróci posortowaną listę; wykorzysta Promise
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/6e792fc47fcbf3951a0214c5bf4cc43214e4aa07)

:white_check_mark: 4.0 zwróci wynik funkcji z zad. 5 na 4.0 (mapreduce); wykorzysta
worker_threads
[Link do commita 1](https://github.com/estwestminimu/Functional-Programming/commit/6e792fc47fcbf3951a0214c5bf4cc43214e4aa07)

 :x: 4.5  zwróci wynik bagOfWords dla danego tekstu na wejściu; stworzy
pulę workterów

 :x: 5.0 zwróci wynik funkcji z zad. 5 na 4.5; wykorzysta Promise.all oraz
funkcję map






https://github.com/user-attachments/assets/f0ace48f-f9f0-43d1-8f19-486a16df255c

Kod: [Link do zadania 1](./app.js )

***
# **Zadanie 10 Funkcje w chmurze**

Przygotuj 3 wybrane funkcje w JS oraz udostępnij w ramach usługi Azure Functions

**Zapytania:**
```c
https://js-funkcyjne.azurewebsites.net/api/
```
[Link do repozytorium przy użyciu którego skonfigurowałem Azure Functions](https://github.com/estwestminimu/Azure-Functions)



Przygotuj 3 wybrane funkcje w Haskellu w ramach Azure App Services. Wykorzystaj obraz dockerowy.

**Zapytania:**
```c
https://haskell-fun-efd2bea2ayegfnfg.polandcentral-01.azurewebsites.net/
```
[Link do repozytorium przy użyciu którego skonfigurowałem Azure App Services](https://github.com/estwestminimu/Azure-App-Services)



https://github.com/user-attachments/assets/181b04ba-eefd-4880-a5a6-42e5b2cb9cdb