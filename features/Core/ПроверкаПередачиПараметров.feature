﻿# encoding: utf-8
# language: ru



Функционал: Передача параметров разных типов в процедуры
	Как Разработчик
	Я Хочу чтобы была возможность передавать параметры разных типов в сгенерированнфе процедуры
 
	Сценарий: Передача параметров в обычных сценариях типа Число
		Когда я выполняю шаг с параметром 1
		Тогда я получаю в процедуру параметр типа "Число"

	Сценарий: Передача параметров в обычных сценариях типа Строка
		Когда я выполняю шаг с параметром "Просто строка"
		Тогда я получаю в процедуру параметр типа "Строка"

		Сценарий: Передача параметров в обычных сценариях типа Дата
		Когда я выполняю шаг с параметром 08.04.1981
		Тогда я получаю в процедуру параметр типа "Дата"
