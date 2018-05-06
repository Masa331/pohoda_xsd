FILES=`find . -name '*.xsd' -type f`

for FILE in $FILES
do
  chmod 644 $FILE
  `expand -t 2 $FILE > /tmp/e && mv /tmp/e $FILE`

  `iconv -f Windows-1250 -t UTF-8 $FILE -o ./iconv.tmp`
  `mv ./iconv.tmp $FILE`

  `sed -i 's/encoding="Windows-1250"/encoding="UTF-8"/g' $FILE`
done
