for i in `seq 1 2000`
do
sed -i "7c inf = open('$i".cube"')" circle.py
sed -i "6c outf = open('$i".dat"','w')" circle.py
python3 circle.py
done
