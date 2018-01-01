#!/bin/bash

whoami=$(whoami)

if [ $whoami = root ]; then 
        homedir="/root"
else   
cd ~ 
 then   
        homedir="/home/$whoami/"
fi



file=$whoami/somefile.txt
filemd5=`md5sum $file | cut -d " " -f1`
fingerprintfile=$whoami/md5sum




#Проверка не используется ли сейчас файл
#изменить что грепать
while  [[ `lsof | grep keepass` ]]
do
      echo "Ошибка: $file сейчас занят. "
         exit 1
done

#  Проверка существования отпечатка
if [ ! -f $fingerprintfile ]
    then
       touch $fingerprintfile
    exit 1

fi

#  Проверка существования файла
if [ ! -f $file ]
    then
        echo "Ошибка: $file файл не существует."
    exit 1

fi


if [ -f $fingerprintfile ]
    then
        
        savedmd5=`cat $fingerprintfile`

        #  проверка не пустой ли файл
        if [ -z $savedmd5 ]
            then
                echo "Файл MD5 суммы был пустой. Создан новый."
 echo $filemd5 > $fingerprintfile     
     exit 1
      fi

        #Сравнение сохраненной MD5 суммы с полученной
        if [ "$savedmd5" = "$filemd5" ]
            then
                echo "Изменений не произошло."
            else
                echo $filemd5 > $fingerprintfile &&
        echo "Файл изменен. Новая MD5 сумма сохранена. Файл отправлен в телеграм."


               telegram-send -f $file


        fi

fi


