echo 'Введите путь до файла'
read path

parentdir=$(dirname "${path}")
if [ -d "${path}" ]; then
 echo "$(cd "${path}" && pwd)"
elif [ -d "${parentdir}" ]; then
  echo "$(cd "${parentdir}" && pwd)/$(basename "${path}")"
fi
if [ -f $path ] ; then
echo 'Путь указан верно'
else
echo 'Файл не существует'
exit
fi
if [ -s $path ]; then
echo 'файл не пустой'
else
echo 'файл пуст'
exit
fi
u=($(cat $path | wc -l))
y=($(sort $path | uniq -u | wc -l))
z=($(awk '{print $8}' $path | sort | uniq | wc -l))
echo $u $y $z
