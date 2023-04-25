rm ehdata
for i in `seq 1 2000`
do
cat "$i".dat >> ehdata
echo -e "" >> ehdata
done
