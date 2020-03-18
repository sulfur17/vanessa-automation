# language: ru
# encoding: utf-8
#parent ua:
@UA9_загружать_features
#parent uf:
@UF1_загрузка_и_обработка_features


@tree

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb


Функционал: Проверка загрузки фич из каталога иерархически
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность проверить правильность загрузки иерархии фич
	Для того чтобы я мог убедиться, что загрузка работает правильно
 
 

		
	Сценарий: Загрузка фич из каталога иерархически

		Когда Я открываю VanessaAutomation в режиме TestClient	
		И В поле с именем "КаталогФичСлужебный" я указываю путь к каталогу фич "StepsRunner"
		И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
		И Дерево фич загрузилось корректно согласно иерархии каталогов