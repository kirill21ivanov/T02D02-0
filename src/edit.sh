#!/bin/bash
echo 'Введите путь до файла'
read path

parentdir=$(dirname "${path}")
if [ -d "${path}" ]; then
 echo "$(cd "${path}" && pwd)"
elif [ -d "${parentdir}" ]; then
  echo "$(cd "${parentdir}" && pwd)/$(basename "${path}")"
fi
if [ -f $path ]; then
echo 'Путь указан верно'
echo 'Введите текст который хотите заменить.'
read text1
if  grep -q $text1 $path; then
 echo "Символы имеются в файле"
else
 echo "Нет символов в файле"
 exit
 fi
echo 'Введите текст для замены.'
read text2
u=($(shasum -a 256 $path))
sed -i '' "s/"$text1"/"$text2"/g" $path
echo src/$path - $(stat -f %z $path) - $(date -r $path +"%Y-%m-%d %H:%M") - $u - sha256 >> files.log
else
echo 'Файл не существует'
fi
