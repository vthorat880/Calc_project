file="log.txt"
while read line
do

echo $line

for word in $line
do

echo $word

done

done < $file

####

file="log.txt"
addstatus=0
removedstatus=0
while read line
do
for word in $line
do
if [ $addstatus -eq 1 ]
then
path='echo $word | sed 's/ \r //g'
cp ${path} added
addstatus=0
removedstatus=0
elif [ $removedstatus -eq 1 ]
then
path='echo $word | sed 's/ \r //g'
echo $path
cp ${path} removed
addstatus=0
removedstatus=0
elif [ $word == 'M' ] || [ $word == 'A' ]
then
addstatus=1
removestatus=0
if [ ! -d added }
then 
mkdir added 
fi
elif  [ $word == 'R' ] || [ $word == 'D' ]
then
removestatus=1
addstatus=0
if [ ! -d removed }
then 
mkdir removed
 
fi
fi
done

done < $file
