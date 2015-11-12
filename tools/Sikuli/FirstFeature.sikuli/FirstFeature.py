# Посимвольный вывод символов
def VyvestiStrokuPosimvolno(stroka):
    dlina = len(stroka)
    i = 0
    while i < dlina:
        tekSimvol = stroka[i]
        paste(tekSimvol)
        i = i + 1

# Паузы
ShortBreak = 1
MiddleBreak = 3
BigBreak = 5

step = sys.argv[1]

# Открытие текстового редактора
if step == "1":
    type('r', KeyModifier.WIN)
    type(Key.DELETE)
    sleep(ShortBreak)
    VyvestiStrokuPosimvolno(u"notepad++")
    sleep(MiddleBreak)
    type(Key.ENTER)
    sleep(MiddleBreak)
    exit(0)
# Ввод текста
elif step == "2":
    path2file = sys.argv[2]
    file = open(path2file, 'r')
    while True:
        line = file.readline()
        if not line:
            break
        stroka = unicode(line, 'utf-8')
        VyvestiStrokuPosimvolno(stroka)
    sleep(BigBreak)
    exit(0)
# Сохранение текста
elif step == "3":
    path2VanessaBehavoirFeature = sys.argv[2]
    type('s', KeyModifier.CTRL)
    type(Key.DELETE)
    paste(path2VanessaBehavoirFeature)
    sleep(BigBreak)
    type(Key.ENTER)
    sleep(BigBreak)
    exit(0)