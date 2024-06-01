# Разработка экспертной системы для определения родственных связей
Экспертная система - это система искусственного интеллекта, включающая знания о некоторой слабо структурированной и трудно формализуемой узкой предметной области и способная предлагать и объяснять пользователю «разумные» решения.

ЭС устанавливает тип отношений между членами семьи (кто кому в семье приходится). ЭС также подразумевают работу с различными поколениями (например, определение следующих отношений: бабушка, прадедушка, прапрабабушка и т.д.), с различной степенью родства (например, определение следующих отношений: тетя, двоюродный дядя, троюродная тетя и т.д.) <br>
Способ задания фактов: [status] [who] [whom], где [status] – тип отношений, [who] – кто, [whom] – для кого.
[who] является [status] для [whom]. Например, Евгений([who]) является дядей([status]) для Маши([whom]). <br>
ЭС сначала предлагает ввести некоторые известные отношения родства, затем из известных выводит новые. <br>
Рассмотрим простой пример для того, чтобы понять работу ЭС. В ЭС вводятся следующие факты в заданном выше формате команд: Брат Николай Александр, Отец Павел Александр, Мать Екатерина Павел. Следующие правила будут участвовать в выводе новых фактов (исходя из введенных фактов):<br>
(Правило 1 <br>
(Брат ?x ?y) <br>
=>  <br>
(Брат ?y ?x)  <br>
) <br>
(Правило 2 <br>
(Брат ?x ?y) <br>
(Отец ?z ?x) <br>
=> <br>
(Отец ?z ?y) <br>
) <br>
(Правило 3 <br>
(Мать ?x ?y) <br>
(Отец ?y ?z) <br>
=> <br>
(Бабушка ?z ?y) <br>
) <br>
Новые добавленные факты: Брат Александр Николай, Отец Павел Николай, Бабушка Екатерина Александр, Бабушка Екатерина Николай.
