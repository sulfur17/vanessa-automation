# language: ru
# encoding: utf-8
#parent uf:
@UF11_Прочее
#parent ua:
@UA44_Прочая_активность_по_проверке

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb




Функционал: Проверка исключений сервер



Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой



Сценарий: Проверка исключений сервер
		
	И     В поле с именем "КаталогФичСлужебный" я указываю путь к каталогу фич "Support\Templates\ПроверкаИсключений"

	И я перехожу к закладке с именем "ГруппаНастройки"
	И я перехожу к закладке с именем "СтраницаВыполнениеСценариев"
	И я снимаю флаг с именем 'ОбновлятьСтатистикуВДереве'
	И я снимаю флаг с именем 'ОбновлятьДеревоПриНачалеВыполненияСценария'
	И я перехожу к закладке с именем "ГруппаЗапускТестов"
	
	
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
	И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient
	
	Тогда таблица "ДеревоТестов" стала равной:
		| 'Наименование'                                                        | 'Статус'  |
		| 'ПроверкаИсключений'                                                  | ''        |
		| 'ПроверкаИсключений 1'                                                | ''        |
		| 'ПроверкаИсключений 1'                                                | 'Failed'  |
		| 'И Я запоминаю значение выражения \'1\' в переменную "ИмяПеременной"' | ''        |
		| 'ПроверкаИсключений 2'                                                | ''        |
		| 'ПроверкаИсключений 2'                                                | 'Failed'  |
		| 'И Я запоминаю значение выражения \'2\' в переменную "ИмяПеременной"' | 'Success' |
		| 'ПроверкаИсключений 3'                                                | ''        |
		| 'ПроверкаИсключений 3'                                                | 'Success' |
		| 'И Я запоминаю значение выражения \'3\' в переменную "ИмяПеременной"' | 'Success' |


	