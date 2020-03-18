﻿//начало текста модуля
&НаКлиенте
Перем Ванесса;

&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ОчищеныВременныеФайлыРезультатовПрошлыхГенераций()","ОчищеныВременныеФайлыРезультатовПрошлыхГенераций","Дано Очищены временные файлы результатов прошлых генераций");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ОжидаемыйФайлEpfУжеСуществует()","ОжидаемыйФайлEpfУжеСуществует","И ожидаемый файл epf уже существует");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВОжидаемомФайлеУжеЕстьРеализованныеШаги()","ВОжидаемомФайлеУжеЕстьРеализованныеШаги","И в ожидаемом файле уже есть реализованные шаги");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВФичеЕстьШагиКоторыхНетВОжидаемомEpfФайле()","ВФичеЕстьШагиКоторыхНетВОжидаемомEpfФайле","И в фиче есть шаги, которых нет в ожидаемом epf файле");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерации()","СгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерации","И сгенерированный epf прошел проверку на корректность после перегенерации");

	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
	ИмяОжидаемогоФайла = Ванесса.Объект.КаталогИнструментов + "\features\Support\Templates\step_definitions\ФичаДляПроверкиПерегенерацииEPF.epf";
	Контекст.Вставить("ИмяОжидаемогоФайла",ИмяОжидаемогоФайла);
	ФайлПроверкаСуществования = Новый Файл(ИмяОжидаемогоФайла);
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяОжидаемогоФайла);
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	ИмяОжидаемогоФайла = Контекст.ИмяОжидаемогоФайла;
	ФайлПроверкаСуществования = Новый Файл(ИмяОжидаемогоФайла);
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяОжидаемогоФайла);
	КонецЕсли;	 
	
	//безусловное закрытие формы если она осталась
	Попытка
	    ОткрытаяФормаVanessaBehavoir = Контекст.ОткрытаяФормаVanessaBehavoir;
		ОткрытаяФормаVanessaBehavoir.Закрыть();
	Исключение
	
	КонецПопытки;
КонецПроцедуры


//&НаКлиенте
////я открыл форму VanessaBehavoir в режиме самотестирования
////@ЯОткрылФормуVanessaBehavoirВРежимеСамотестирования()
//Процедура ЯОткрылФормуVanessaBehavoirВРежимеСамотестирования() Экспорт
//	ВызватьИсключение "Не реализовано.";
//КонецПроцедуры

//&НаКлиенте
////я загрузил специальную тестовую фичу "ФичаДляПроверкиПерегенерацииEPF"
////@ЯЗагрузилСпециальнуюТестовуюФичу(Парам01Строка)
//Процедура ЯЗагрузилСпециальнуюТестовуюФичу(Парам01Строка) Экспорт
//	ВызватьИсключение "Не реализовано.";
//КонецПроцедуры

//&НаКлиенте
////я перешел на закладку генератор EPF
////@ЯПерешелНаЗакладкуГенераторEPF()
//Процедура ЯПерешелНаЗакладкуГенераторEPF() Экспорт
//	ВызватьИсключение "Не реализовано.";
//КонецПроцедуры

&НаСервере
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Макет = ОбъектСервер.ПолучитьМакет(ИмяМакета);
	Возврат  Макет;
КонецФункции	

&НаКлиенте
//ожидаемый файл epf уже существует
//@ОжидаемыйФайлEpfУжеСуществует()
Процедура ОжидаемыйФайлEpfУжеСуществует() Экспорт
	ИмяОжидаемогоФайла = Контекст.ИмяОжидаемогоФайла;
	Контекст.Вставить("ИмяОжидаемогоФайла",ИмяОжидаемогоФайла);
	ФайлСуществует = Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла);
	Если ФайлСуществует Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяОжидаемогоФайла);
	КонецЕсли;	 
	
	ФайлСуществует = Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла);
	Ванесса.ПроверитьНеРавенство(ФайлСуществует,Истина,"В этот момент Файл " + ИмяОжидаемогоФайла + " НЕ должен существовать.");
	
	КопияКонтекст = Контекст;
	Контекст      = "";
	
	Макет = ПолучитьМакетСервер("Макет");
	Макет.Записать(ИмяОжидаемогоФайла);
	
	Контекст = КопияКонтекст;
	
	ФайлСуществует = Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла,"должен существовать после записи макета");
	Ванесса.ПроверитьРавенство(ФайлСуществует,Истина,"Файл " + ИмяОжидаемогоФайла + " должен существовать после записи макета.");
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаПослеПомещенияФайлаВОжидаемомФайлеУжеЕстьРеализованныеШаги(Результат, АдресХранилища, ВыбранноеИмяФайла, ДополнительныеПараметры) Экспорт
	ДопПараметры = Новый Структура;
	ДопПараметры.Вставить("АдресХранилища",АдресХранилища);
	ИмяОбработки = Ванесса.ПодключитьВнешнююОбработкуСервер(Контекст.ИмяОжидаемогоФайла,Ложь,ДопПараметры);
	
	Попытка
		ФормаОбработки = ПолучитьФорму("ВнешняяОбработка." + ИмяОбработки + ".Форма.Форма",,,Истина);
	Исключение
		Ванесса.ПродолжитьВыполнениеШагов(Истина,ОписаниеОшибки());
		Возврат;
	КонецПопытки;
	
	Попытка
		ФормаОбработки.ЯМогуЭтотШагВыполнить();
	Исключение
		Ванесса.ПродолжитьВыполнениеШагов(Истина,ОписаниеОшибки());
		Возврат;
	КонецПопытки;
	
	Контекст.Вставить("ОбработкаДоПерегенерации",ФормаОбработки);
	
	Ванесса.ПродолжитьВыполнениеШагов();
КонецПроцедуры


&НаКлиенте
//в ожидаемом файле уже есть реализованные шаги
//@ВОжидаемомФайлеУжеЕстьРеализованныеШаги()
Процедура ВОжидаемомФайлеУжеЕстьРеализованныеШаги() Экспорт
	Ванесса.ЗапретитьВыполнениеШагов();
	ИмяОжидаемогоФайла = Контекст.ИмяОжидаемогоФайла;
	
	ДополнительныеПараметры = Новый Структура;
	Оповещение = Вычислить("Новый ОписаниеОповещения(""ОбработкаПослеПомещенияФайлаВОжидаемомФайлеУжеЕстьРеализованныеШаги"", ЭтаФорма, ДополнительныеПараметры)");
	Выполнить("НачатьПомещениеФайла(Оповещение, , ИмяОжидаемогоФайла, Ложь, УникальныйИдентификатор);");
КонецПроцедуры

&НаКлиенте
//в фиче есть шаги, которых нет в ожидаемом epf файле
//@ВФичеЕстьШагиКоторыхНетВОжидаемомEpfФайле()
Процедура ВФичеЕстьШагиКоторыхНетВОжидаемомEpfФайле() Экспорт
	ОбработкаДоПерегенерации = Контекст.ОбработкаДоПерегенерации;
	
	МетодЕсть = Ложь;
	Попытка
		ОбработкаДоПерегенерации.ВEpfПоявилсяШагКоторогоНеБылоРаньше();
		МетодЕсть = Истина;
	Исключение
	
	КонецПопытки;
	
	Ванесса.ПроверитьРавенство(МетодЕсть,Ложь,"Метода ВEpfПоявилсяШагКоторогоНеБылоРаньше в epf не должно быть.");
КонецПроцедуры

//&НаКлиенте
////я нажал на кнопку "СоздатьШаблоныОбработок"
////@ЯНажалНаКнопку(Парам01Строка)
//Процедура ЯНажалНаКнопку(Парам01Строка) Экспорт
//	ВызватьИсключение "Не реализовано.";
//КонецПроцедуры

//&НаКлиенте
////я получил сгенерированный epf файл в ожидаемом каталоге
////@ЯПолучилСгенерированныйEpfФайлВОжидаемомКаталоге()
//Процедура ЯПолучилСгенерированныйEpfФайлВОжидаемомКаталоге() Экспорт
//	ВызватьИсключение "Не реализовано.";
//КонецПроцедуры




&НаКлиенте
Процедура ОбработкаПослеПомещенияФайлаСгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерации(Результат, АдресХранилища, ВыбранноеИмяФайла, ДополнительныеПараметры) Экспорт
	ДопПараметры = Новый Структура;
	ДопПараметры.Вставить("АдресХранилища",АдресХранилища);
	ИмяОбработки = Ванесса.ПодключитьВнешнююОбработкуСервер(Контекст.ИмяОжидаемогоФайла,Ложь,ДопПараметры);
	
	Попытка
		ФормаОбработки = ПолучитьФорму("ВнешняяОбработка." + ИмяОбработки + ".Форма.Форма",,,Истина);
	Исключение
		Ванесса.ПродолжитьВыполнениеШагов(Истина,ОписаниеОшибки());
		Возврат;
	КонецПопытки;
	
	
	
	//Нашли1 = Ложь;
	Нашли2 = Ложь;
	//в списке тестов должно быть снипеты УМеняЕстьПростойШаг и ЕстьПростойШаг
	СписокТестов = ФормаОбработки.ПолучитьСписокТестов(Ванесса);
	Для Каждого Снипет Из СписокТестов Цикл
		//Сообщить("" + Снипет.Снипет);
		//Если Снипет.Снипет = "УМеняЕстьПростойШаг()" Тогда
		//	Нашли1 = Истина;
		//КонецЕсли;	 
		Если Снипет.Снипет = "ЕстьПростойШаг()" Тогда
			Нашли2 = Истина;
		КонецЕсли;	 
	КонецЦикла;	
	
	//Если Не Нашли1 Тогда
	//	ВызватьИсключение "В списке шагов не нашли УМеняЕстьПростойШаг().";
	//КонецЕсли;	 
	Если Не Нашли2 Тогда
		Ванесса.ПродолжитьВыполнениеШагов(Истина,"В списке шагов не нашли ЕстьПростойШаг().");
		Возврат;
	КонецЕсли;	 
	
	
	
	//этот шаг уже был и должен остаться
	Попытка
		ФормаОбработки.УМеняЕстьПростойШаг();	
	Исключение
		Ванесса.ПродолжитьВыполнениеШагов(Истина,"Исчез шаг УМеняЕстьПростойШаг().");
		Возврат;
	КонецПопытки;	
	
	
	//должен был появиться этот шаг
	Попытка
		ФормаОбработки.ЕстьПростойШаг();
	Исключение
		Стр = ОписаниеОшибки();
		Если Найти(Стр,"Не реализовано.") = 0 Тогда
			Ванесса.ПродолжитьВыполнениеШагов(Истина,"Должен был появиться метод ЕстьПростойШаг, но не появился.");
			Возврат;
		КонецЕсли;	 
	КонецПопытки;
	
	
	//должен был появиться этот шаг
	Попытка
		ФормаОбработки.ВEpfПоявилсяШагКоторогоНеБылоРаньше();
	Исключение
		Стр = ОписаниеОшибки();
		Если Найти(Стр,"Не реализовано.") = 0 Тогда
			Ванесса.ПродолжитьВыполнениеШагов(Истина,"Должен был появиться метод ВEpfПоявилсяШагКоторогоНеБылоРаньше, но не появился.");
			Возврат;
		КонецЕсли;	 
	КонецПопытки;
	
	Ванесса.ПродолжитьВыполнениеШагов();
КонецПроцедуры


&НаКлиенте
//сгенерированный epf прошел проверку на корректность после перегенерации
//@СгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерации()
Процедура СгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерации() Экспорт
	Ванесса.ЗапретитьВыполнениеШагов();
	ИмяОжидаемогоФайла = Контекст.ИмяОжидаемогоФайла;
	
	ДополнительныеПараметры = Новый Структура;
	Оповещение = Вычислить("Новый ОписаниеОповещения(""ОбработкаПослеПомещенияФайлаСгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерации"", ЭтаФорма, ДополнительныеПараметры)");
	Выполнить("НачатьПомещениеФайла(Оповещение, , ИмяОжидаемогоФайла, Ложь, УникальныйИдентификатор);");
КонецПроцедуры

//окончание текста модуля

&НаКлиенте
//Дано Очищены временные файлы результатов прошлых генераций
//@ОчищеныВременныеФайлыРезультатовПрошлыхГенераций()
Процедура ОчищеныВременныеФайлыРезультатовПрошлыхГенераций() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	
	
	//ВызватьИсключение "Не реализовано.";
КонецПроцедуры
