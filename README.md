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