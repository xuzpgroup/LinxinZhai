#!/bin/sh

#for i in 100 150 80 200 500 120 180 800 1000 5000 10000 50 30 10
#for i in 20 40 60 70 90 140 130 300 400 600 700 2000 3000 4000 8000
#for i in 13 15 18 630 650 680 1500 1300 1800
##add data
#for i in 13 16 20 25 32 40 50 63 79 100 126 159 200 251 316 398 501 630 794 1000 1259 1585 1995 2511 3162 3981 5011 6309 7943
#    10000 12589 15848 19952 25118 31622 39810 50118 63095 79432 100000 125892 158489 199526
#for i in 251188 316227 398107 501187 630957 794328 1000000  1258925 1584893 1995262 2511886 3162277 3981071 5011827 6309573 7943282 10000000
for i in 10 30 14 15 18 22 24 70 90 110 118 134 142 150 225 270 280 290 302 350 450 1300 1350 1400 1450 1500 1550 2200 2400
do
rm -r $i
mkdir $i
cp in.td job lead1.dat lead2.dat $i
cd $i
#a=$(echo "scale=6;0.06/sqrt($i)*sqrt(10000000)"|bc)
a=$(echo "scale=6;sqrt($i/74.0585663563)*100"|bc)
b=$(echo "scale=2;9*100/$a"|bc)
#b=$(echo "scale=2;7.5*100/$a"|bc)
if [ $i -lt 1001 ]; then
sed -i "11c \ \$tdinput dt=0.005 tmax=$b outDt=0.01 voltType=10 voltPara(1,1)=5.d-2  voltPara(1,2)=-5.d-2 voltPara(2,1)=0 voltPara(2,2)=0 wblScheme='awbl' lMD=true \$end " in.td
sed -i "15c \ \$initMomentum initMv(3,56)=-$a \$end" in.td
elif [ $i -lt 100001 ]; then
sed -i "11c \ \$tdinput dt=0.0005 tmax=$b outDt=0.01 voltType=10 voltPara(1,1)=5.d-2  voltPara(1,2)=-5.d-2 voltPara(2,1)=0 voltPara(2,2)=0 wblScheme='awbl' lMD=true \$end " in.td
sed -i "15c \ \$initMomentum initMv(3,56)=-$a \$end" in.td
else
sed -i "11c \ \$tdinput dt=0.0001 tmax=$b outDt=0.01 voltType=10 voltPara(1,1)=5.d-2  voltPara(1,2)=-5.d-2 voltPara(2,1)=0 voltPara(2,2)=0 wblScheme='awbl' lMD=true \$end " in.td
sed -i "15c \ \$initMomentum initMv(3,56)=-$a \$end" in.td
fi
sbatch < job
cd ..
done
