# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA49_макеты_для_запуска_сценариев

@IgnoreOnCIMainBuild
@SpecialTag

Функционал: Проверка выполнить сценарий с произвольного шага с продолжением
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность загрузить произвольную тестовую фичу в vanessa-behavior
 

Сценарий: Проверка выполнить сценарий с произвольного шага с продолжением один

	Когда Я увеличил значение "СлужебныйПараметр" в КонтекстСохраняемый на 1
	И я увеличил значение "СлужебныйПараметр" в КонтекстСохраняемый на 1
	И я увеличил значение "СлужебныйПараметр" в КонтекстСохраняемый на 1
	
Сценарий: Проверка выполнить сценарий с произвольного шага с продолжением два
	И я увеличил значение "СлужебныйПараметр" в КонтекстСохраняемый на 1
	И я увеличил значение "СлужебныйПараметр" в КонтекстСохраняемый на 1
	И я могу продолжить выполнение шагов в хост системе