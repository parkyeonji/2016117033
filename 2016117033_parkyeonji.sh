#!/bin/bash

#p.question1.(score : 1)
LINE_SIZE=`ls -l | wc -l`
TOTAL_SIZE=`expr $LINE_SIZE - 1`
echo "==========print file information============================================"
echo "current directory : $PWD"
echo "the number of elements : $TOTAL_SIZE"

#p.question2.
Index=1
#directory file
SORT_FILE=`ls | sort -df`
for file in $SORT_FILE
do
FILE_TYPE=`stat -c %F $file`
if [ "$FILE_TYPE" = "디렉토리" ]
then
echo "┌[$Index] $file" 
echo "│---------INFORMATION-------------------------------------------------------"
echo -e "│\033[0;34mfile type : $FILE_TYPE \033[0m"
FILE_SIZE=`stat -c %s $file`
echo "│file size : $FILE_SIZE"
LAST_MODIFITION_TIME=`stat -c %y $file`
echo "│last modifition time : $LAST_MODIFITION_TIME"
PERMISSION=`stat -c %a $file`
echo "│permission : $PERMISSION"
echo "│absolute path : $PWD/$file"
echo "│relative path : ./$file"
echo "└---------------------------------------------------------------------------"
Index=`expr $Index + 1`


if [ "$FILE_SIZE" != "0" ]
then
index=1
cd $PWD/$file
SORT_INFILE=`ls | sort -df`

for infile in $SORT_INFILE
do
FILE_TYPE2=`stat -c %F $infile`
if [ "$FILE_TYPE2" = "디렉토리" ]
then
echo "		┌[$index] $file/$infile" 
echo "		│---------INFORMATION---------------------------------------------"
echo -e "		│\033[0;34mfile type : $FILE_TYPE2 \033[0m"
FILE_SIZE2=`stat -c %s $infile`
echo "		│file size : $FILE_SIZE2"
LAST_MODIFITION_TIME2=`stat -c %y $infile`
echo "		│last modifition time : $LAST_MODIFITION_TIME2"
PERMISSION2=`stat -c %a $infile`
echo "		│permission : $PERMISSION2"
echo "		│absolute path : $PWD/$infile"
echo "		│relative path : ./$file/$infile"
echo "		└-----------------------------------------------------------------"
index=`expr $index + 1`
fi
done

for infile in $SORT_INFILE
do
FILE_TYPE2=`stat -c %F $infile`
if [ "$FILE_TYPE2" = "일반 파일" ] || [ "$FILE_TYPE2" = "일반 빈 파일" ]
then
echo "		┌[$index] $file/$infile" 
echo "		│---------INFORMATION---------------------------------------------"
echo "		│file type : $FILE_TYPE2"
FILE_SIZE2=`stat -c %s $infile`
echo "		│file size : $FILE_SIZE2"
LAST_MODIFITION_TIME2=`stat -c %y $infile`
echo "		│last modifition time : $LAST_MODIFITION_TIME2"
PERMISSION2=`stat -c %a $infile`
echo "		│permission : $PERMISSION2"
echo "		│absolute path : $PWD/$infile"
echo "		│relative path : ./$file/$infile"
echo "		└-----------------------------------------------------------------"
index=`expr $index + 1`
fi
done

for infile in $SORT_INFILE
do
FILE_TYPE2=`stat -c %F $infile`
if [ "$FILE_TYPE2" = "FIFO" ]
then
echo "		┌[$index] $file/$infile" 
echo "		│---------INFORMATION---------  ----------------------------------"
echo -e "  		│\033[0;32mfile type : $FILE_TYPE2 \033[0m"
FILE_SIZE2=`stat -c %s $infile`
echo "		│file size : $FILE_SIZE2"
LAST_MODIFITION_TIME2=`stat -c %y $infile`
echo "		│last modifition time : $LAST_MODIFITION_TIME2"
PERMISSION2=`stat -c %a $infile`
echo "		│permission : $PERMISSION2"
echo "		│absolute path : $PWD/$infile"
echo "		│relative path : ./$file/$infile"
echo "		└-----------------------------------------------------------------"
index=`expr $index + 1`
fi
done

fi
cd ..
fi

done

#general file
for file in $SORT_FILE
do
FILE_TYPE=`stat -c %F $file`
if [ "$FILE_TYPE" = "일반 파일" ] || [ "$FILE_TYPE" = "일반 빈 파일" ]
then
echo "┌[$Index] $file" 
echo "│---------INFORMATION-------------------------------------------------------"
echo "│file type : $FILE_TYPE"
FILE_SIZE=`stat -c %s $file`
echo "│file size : $FILE_SIZE"
LAST_MODIFITION_TIME=`stat -c %y $file`
echo "│last modifition time : $LAST_MODIFITION_TIME"
PERMISSION=`stat -c %a $file`
echo "│permission : $PERMISSION"
echo "│absolute path : $PWD/$file"
echo "│relative path : ./$file"
echo "└---------------------------------------------------------------------------"
Index=`expr $Index + 1`
fi
done


#special file
for file in $SORT_FILE
do
FILE_TYPE=`stat -c %F $file`
if [ "$FILE_TYPE" = "FIFO" ]
then
echo "┌[$Index] $file" 
echo "│---------INFORMATION-------------------------------------------------------"
echo -e "│\033[0;32mfile type : $FILE_TYPE \033[0m"
FILE_SIZE=`stat -c %s $file`
echo "│file size : $FILE_SIZE"
LAST_MODIFITION_TIME=`stat -c %y $file`
echo "│last modifition time : $LAST_MODIFITION_TIME"
PERMISSION=`stat -c %a $file`
echo "│permission : $PERMISSION"
echo "│absolute path : $PWD/$file"
echo "│relative path : ./$file"
echo "└---------------------------------------------------------------------------"
Index=`expr $Index + 1`
fi
done
