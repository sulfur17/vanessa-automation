﻿ИмяФайла = АргументыКоманднойСтроки[0];

Текст = Новый ЧтениеТекста;
Текст.Открыть(ИмяФайла,"UTF-8");
ТекстКоманды = Текст.Прочитать();
Текст.Закрыть();

retCode = -1;
ЗапуститьПриложение(ТекстКоманды,,Истина,retCode);
Сообщить("retCode="+retCode);