# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA27_Макеты_для_проверки_парсинга

@IgnoreOnCIMainBuild
@Tree

Функционал: Проверка работы сценария тег tree часть два
	Как Разработчик
	Я Хочу чтобы я мог использовать тег tree
	Чтобы в дереве шагов была иерархия
 

Сценарий: Проверка работы сценария тег tree часть два
И ПерваяГруппа
        И ВтораяГруппа
                            Когда Я создаю и запоминаю ПартнераИКонтрагента с случайными реквизитами
        И ТретьяГруппа
            Тогда открылось окно "Партнеры"
            И  в списке есть запомненый Партнер
 И Шаг в первую группу
И ЧетвертаяГруппа
    И ПятаяГруппа
        Когда я создаю Спецификацию с датой начала периода действия "01.01.2017"
    И ШестаяГруппа
        И в ТЧ "УсловияСпецификации" я нажимаю на кнопку "Поставка"
        Тогда открылось окно "Поставка новых дистрибутивов (создание)"
        И я открываю выпадающий список "Прейскурант"