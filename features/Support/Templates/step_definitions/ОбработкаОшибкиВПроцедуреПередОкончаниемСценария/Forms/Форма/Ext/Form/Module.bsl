﻿//начало текста модуля
&НаКлиенте
Перем Ванесса;
 
&НаКлиенте
Перем Контекст Экспорт;
 
&НаКлиенте
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
КонецПроцедуры

&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	Если КонтекстСохраняемый.Свойство("УжеБылаОшибкаВПередОкончаниемСценария") Тогда
		Возврат;
	КонецЕсли;	
	
	КонтекстСохраняемый.Вставить("УжеБылаОшибкаВПередОкончаниемСценария");
	
	ВызватьИсключение "Исключение в ПередОкончаниемСценария";
КонецПроцедуры


//окончание текста модуля

