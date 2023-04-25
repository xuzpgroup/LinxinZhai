clear;
close all;
clc;

fig = figure;
load coord;
npt = 500;
%scatter(coord(:,1),coord(:,2));
axis equal;
for i = 1:224
    for j = i+1:225
        if sqrt((coord(i,1)-coord(j,1))^2+(coord(i,2)-coord(j,2))^2) < 2
            %plot3([coord(i,1) coord(j,1)],[coord(i,2) coord(j,2)],[coord(i,3) coord(j,3)],'k');
            %hold on;
        end
    end
end
daspect([1 1 20000]);

x=[-1.844634110061000  -1.844634110061000  -1.844634110061000  -1.537195091717500  -1.537195091717500 -1.537195091717500  -1.229756073374000  -1.229756073374000  -1.229756073374000  -0.922317055030500 -0.922317055030500  -0.922317055030500  -0.614878036687000  -0.614878036687000  -0.614878036687000 -1.844634110061000  -1.537195091717500  -1.537195091717500  -1.229756073374000  -1.229756073374000 -1.229756073374000  -0.922317055030500  -0.922317055030500  -0.922317055030500  -0.922317055030500 -0.614878036687000  -0.614878036687000  -0.614878036687000  -0.614878036687000  -0.614878036687000];
y=[6.800000000000000   6.426666666666667   6.053333333333333   6.800000000000000   6.426666666666667 6.053333333333333   6.800000000000000   6.426666666666667   6.053333333333333   6.800000000000000 6.426666666666667   6.053333333333333   6.800000000000000   6.426666666666667   6.053333333333333 5.680000000000000   5.680000000000000   5.502500000000000   5.680000000000000   5.502500000000000 5.324999999999999   5.680000000000000   5.502500000000000   5.324999999999999   5.147500000000000 5.680000000000000   5.502500000000000   5.324999999999999   5.147500000000000   4.970000000000000];

%x=[-0.605321090305000  -0.605321090305000  -0.605321090305000  -0.605321090305000  -0.131542510305000 -0.131542510305000  -0.131542510305000   0.342236069695000   0.342236069695000   0.816014649695000 -0.605321090305000  -0.605321090305000  -0.605321090305000  -0.605321090305000  -0.605321090305000 -0.605321090305000  -0.131542510305000  -0.131542510305000  -0.131542510305000  -0.131542510305000 -0.131542510305000  -0.131542510305000   0.342236069695000   0.342236069695000   0.342236069695000 0.342236069695000   0.342236069695000   0.342236069695000   0.816014649695000   0.816014649695000 0.816014649695000   0.816014649695000   0.816014649695000   0.816014649695000   1.242189959695000 1.242189959695000   1.242189959695000   1.668365269695000   1.668365269695000   2.094540579695000 1.242189959695000   1.242189959695000   1.242189959695000   1.668365269695000   1.668365269695000 1.668365269695000   2.094540579695000   2.094540579695000   2.094540579695000];
%y=[2.705622760000000   2.947534303333333   3.189445846666667   3.431357390000000   2.705622760000000 2.947534303333333   3.189445846666667   2.705622760000000   2.947534303333333   2.705622760000000 -0.000000020000000   0.450937110000000   0.901874240000000   1.352811370000000   1.803748500000000 2.254685630000000  -0.000000020000000   0.450937110000000   0.901874240000000   1.352811370000000 1.803748500000000   2.254685630000000  -0.000000020000000   0.450937110000000   0.901874240000000 1.352811370000000   1.803748500000000   2.254685630000000  -0.000000020000000   0.450937110000000 0.901874240000000   1.352811370000000   1.803748500000000   2.254685630000000   0.715044680000000 0.893505053333333   1.071965426666666   0.715044680000000   0.893505053333333   0.715044680000000 -0.000000020000000   0.238348213333333   0.476696446666667  -0.000000020000000   0.238348213333333 0.476696446666667  -0.000000020000000   0.238348213333333   0.476696446666667];

%x=[-0.617492080000000  -0.617492080000000  -0.617492080000000  -0.617492080000000  -0.617492080000000 -0.617492080000000  -0.617492080000000  -0.218949830101667  -0.218949830101667  -0.218949830101667 -0.218949830101667  -0.218949830101667  -0.218949830101667  -0.218949830101667   0.179592419796667 0.179592419796667   0.179592419796667   0.179592419796667   0.179592419796667   0.179592419796667 0.179592419796667   0.578134669695000   0.578134669695000   0.578134669695000   0.578134669695000 0.578134669695000   0.578134669695000   0.578134669695000];
%y=[0.761707600000000   0.159444863333333  -0.442817873333333  -1.045080610000000  -1.647343346666667 -2.249606083333334  -2.851868820000000   0.761707600000000   0.159444863333333  -0.442817873333333 -1.045080610000000  -1.647343346666667  -2.249606083333334  -2.851868820000000   0.761707600000000 0.159444863333333  -0.442817873333333  -1.045080610000000  -1.647343346666667  -2.249606083333334 -2.851868820000000   0.761707600000000   0.159444863333333  -0.442817873333333  -1.045080610000000 -1.647343346666667  -2.249606083333334  -2.851868820000000];
cd edge/;
for i = 1:30
    filename = [num2str(i-1),'-curr.data'];
    clear B;
    B = load (filename);
    z(i) = max(abs(B(:,2)));
end
clear A;
A = [x' y' z'];
xx = linspace(min(A(:,1)),max(A(:,1)),npt);
yy = linspace(min(A(:,2)),max(A(:,2)),npt);
yy = yy';
for jj = 1:npt
    xx(jj,:) = xx(1,:);
end

for jj = 1:npt
    yy(:,jj) = yy(:,1);
end

zz = griddata(A(:,1),A(:,2),A(:,3),xx,yy,'v4');
%h = fspecial('gaussian',[5,5],5);
%znc = conv2(zz, h, 'same');
%K = (1/1000)*ones(3);
%Xsm = conv2(xx,K,'same');
%Ysm = conv2(yy,K,'same');
%Zsm = conv2(zz,K,'same');
%Zsm = smoothdata(zz);
%smooth(xx);
%smooth(yy);
%smooth(zz);
%contourf(xx, yy,zz,1000,'linestyle','none');
%surf(xx, yy,zz,'edgecolor','none','linestyle','none');
%shading interp;
%pcolor(xx,yy,zz);
zlim([0 60000]);
clim([0 60000]);
%xlim([-10 30]);
%ylim([-10 10]);
daspect([1 1 8000]);
%axis equal;
%colormap turbo;
cd ..;

wtr1=[linspace(0,1,100)',linspace(0,1,100)',linspace(0.49,1,100)'];
wtr2=[linspace(1,0.49,100)',linspace(1,0,100)',linspace(1,0,100)'];
%wtr = [wtr1 ; wtr2];

b = 0.49;
r = 0.49;

rr = linspace(1,1,100)';
tmp1 = linspace(1,0.04,100)';
for i =1: 100
    tmpmod1(i) = tmp1(i)^(1/2.2);
end

tmp2 = linspace(0.04,1,100)';
for i =1: 100
    tmpmod2(i) = tmp2(i)^(1/2.2);
end
wtr3=[tmpmod2',tmpmod2',linspace(1,1,100)'];
wtr4=[linspace(1,1,100)',tmpmod1',tmpmod1'];
wtr = [wtr3 ; wtr4];

%wtr=[linspace(1,1,100)',gg',bb'];
%contourf(xx,yy,zz,100,'LineStyle','none');
colormap(wtr);
set(gcf,'renderer','painters');
colorbar
%set(gcf,'unit','centimeters','position',[10 5 14 10]);
%xlim([-0.614878036687000,0.63]);
%xticks([-0.5 0 0.5]);
%xticklabels({'-0.05', '0', '0.05'});
%ylim([0,0.72]);
%yticks([0 0.2 0.4 0.6]);
%yticklabels({'0', '0.02', '0.04', '0.06'});
%xlabel('x (nm)');
%ylabel('y (nm)');

cd sw;
x1=[-0.605321090305000  -0.605321090305000  -0.605321090305000  -0.605321090305000  -0.131542510305000 -0.131542510305000  -0.131542510305000   0.342236069695000   0.342236069695000   0.816014649695000 -0.605321090305000  -0.605321090305000  -0.605321090305000  -0.605321090305000  -0.605321090305000 -0.605321090305000  -0.131542510305000  -0.131542510305000  -0.131542510305000  -0.131542510305000 -0.131542510305000  -0.131542510305000   0.342236069695000   0.342236069695000   0.342236069695000 0.342236069695000   0.342236069695000   0.342236069695000   0.816014649695000   0.816014649695000 0.816014649695000   0.816014649695000   0.816014649695000   0.816014649695000   1.242189959695000 1.242189959695000   1.242189959695000   1.668365269695000   1.668365269695000   2.094540579695000 1.242189959695000   1.242189959695000   1.242189959695000   1.668365269695000   1.668365269695000 1.668365269695000   2.094540579695000   2.094540579695000   2.094540579695000];
y1=[2.705622760000000   2.947534303333333   3.189445846666667   3.431357390000000   2.705622760000000 2.947534303333333   3.189445846666667   2.705622760000000   2.947534303333333   2.705622760000000 -0.000000020000000   0.450937110000000   0.901874240000000   1.352811370000000   1.803748500000000 2.254685630000000  -0.000000020000000   0.450937110000000   0.901874240000000   1.352811370000000 1.803748500000000   2.254685630000000  -0.000000020000000   0.450937110000000   0.901874240000000 1.352811370000000   1.803748500000000   2.254685630000000  -0.000000020000000   0.450937110000000 0.901874240000000   1.352811370000000   1.803748500000000   2.254685630000000   0.715044680000000 0.893505053333333   1.071965426666666   0.715044680000000   0.893505053333333   0.715044680000000 -0.000000020000000   0.238348213333333   0.476696446666667  -0.000000020000000   0.238348213333333 0.476696446666667  -0.000000020000000   0.238348213333333   0.476696446666667];
x1 = x1 + 14.144-3.077+4.3+5.588 -8+6.77;

for i = 1:49
    filename = [num2str(i-1),'-curr.data'];
    clear B;
    B = load (filename);
    z1(i) = max(abs(B(:,2)));
end
clear A;
A = [x1' y1' z1'];
xx1 = linspace(min(A(:,1)),max(A(:,1)),npt);
yy1 = linspace(min(A(:,2)),max(A(:,2)),npt);
yy1 = yy1';
for jj = 1:npt
    xx1(jj,:) = xx1(1,:);
end

for jj = 1:npt
    yy1(:,jj) = yy1(:,1);
end

zz1 = griddata(A(:,1),A(:,2),A(:,3),xx1,yy1,'v4');
%surfc(xx1, yy1,zz1,'edgecolor','none','linestyle','none');
cd ..;


x2=[-0.617492080000000  -0.617492080000000  -0.617492080000000  -0.617492080000000  -0.617492080000000 -0.617492080000000  -0.617492080000000  -0.218949830101667  -0.218949830101667  -0.218949830101667 -0.218949830101667  -0.218949830101667  -0.218949830101667  -0.218949830101667   0.179592419796667 0.179592419796667   0.179592419796667   0.179592419796667   0.179592419796667   0.179592419796667 0.179592419796667   0.578134669695000   0.578134669695000   0.578134669695000   0.578134669695000 0.578134669695000   0.578134669695000   0.578134669695000];
y2=[0.761707600000000   0.159444863333333  -0.442817873333333  -1.045080610000000  -1.647343346666667 -2.249606083333334  -2.851868820000000   0.761707600000000   0.159444863333333  -0.442817873333333 -1.045080610000000  -1.647343346666667  -2.249606083333334  -2.851868820000000   0.761707600000000 0.159444863333333  -0.442817873333333  -1.045080610000000  -1.647343346666667  -2.249606083333334 -2.851868820000000   0.761707600000000   0.159444863333333  -0.442817873333333  -1.045080610000000 -1.647343346666667  -2.249606083333334  -2.851868820000000];
x2 = x2 + (6.763658403557+4.3061) -8+6.77;

cd sv/;
for i = 1:28
    filename = [num2str(i-1),'-curr.data'];
    clear B;
    B = load (filename);
    z2(i) = max(abs(B(:,2)));
end
clear A;
A = [x2' y2' z2'];
xx2 = linspace(min(A(:,1)),max(A(:,1)),npt);
yy2 = linspace(min(A(:,2)),max(A(:,2)),npt);
yy2 = yy2';
for jj = 1:npt
    xx2(jj,:) = xx2(1,:);
end

for jj = 1:npt
    yy2(:,jj) = yy2(:,1);
end

zz2 = griddata(A(:,1),A(:,2),A(:,3),xx2,yy2,'v4');
surf(xx2, yy2,zz2,'edgecolor','none','linestyle','none');
cd ..;
grid on;

%x3=[-0.614878036687000     -0.614878036687000      -0.614878036687000      -0.614878036687000      -0.614878036687000      -0.614878036687000      -0.614878036687000      -0.614878036687000      -0.614878036687000      -0.461158527515250      -0.461158527515250      -0.461158527515250      -0.461158527515250      -0.461158527515250      -0.461158527515250      -0.461158527515250      -0.461158527515250      -0.307439018343500      -0.307439018343500      -0.307439018343500      -0.307439018343500      -0.307439018343500      -0.307439018343500      -0.307439018343500      -0.153719509171750      -0.153719509171750      -0.153719509171750      -0.153719509171750      -0.153719509171750      -0.153719509171750      0       0       0       0       0       0.153719509171750       0.153719509171750       0.153719509171750       0.153719509171750       0.307439018343500       0.307439018343500       0.307439018343500       0.461158527515250       0.461158527515250       0.614878036687000];
%y3=[0      0.0887500000000000      0.177500000000000       0.266250000000000       0.355000000000000       0.443750000000000       0.532500000000000       0.621250000000000       0.710000000000000       0       0.0887500000000000      0.177500000000000       0.266250000000000       0.355000000000000       0.443750000000000       0.532500000000000       0.621250000000000       0       0.0887500000000000      0.177500000000000       0.266250000000000       0.355000000000000       0.443750000000000       0.532500000000000       0       0.0887500000000000      0.177500000000000       0.266250000000000       0.355000000000000       0.443750000000000       0       0.0887500000000000      0.177500000000000       0.266250000000000       0.355000000000000       0       0.0887500000000000      0.177500000000000       0.266250000000000       0       0.0887500000000000      0.177500000000000       0       0.0887500000000000      0];

%x=[-1.844634110061000  -1.844634110061000  -1.844634110061000  -1.537195091717500  -1.537195091717500 -1.537195091717500  -1.229756073374000  -1.229756073374000  -1.229756073374000  -0.922317055030500 -0.922317055030500  -0.922317055030500  -0.614878036687000  -0.614878036687000  -0.614878036687000 -1.844634110061000  -1.537195091717500  -1.537195091717500  -1.229756073374000  -1.229756073374000 -1.229756073374000  -0.922317055030500  -0.922317055030500  -0.922317055030500  -0.922317055030500 -0.614878036687000  -0.614878036687000  -0.614878036687000  -0.614878036687000  -0.614878036687000];
%y=[6.800000000000000   6.426666666666667   6.053333333333333   6.800000000000000   6.426666666666667 6.053333333333333   6.800000000000000   6.426666666666667   6.053333333333333   6.800000000000000 6.426666666666667   6.053333333333333   6.800000000000000   6.426666666666667   6.053333333333333 5.680000000000000   5.680000000000000   5.502500000000000   5.680000000000000   5.502500000000000 5.324999999999999   5.680000000000000   5.502500000000000   5.324999999999999   5.147500000000000 5.680000000000000   5.502500000000000   5.324999999999999   5.147500000000000   4.970000000000000];

%x=[-0.617492080000000  -0.617492080000000  -0.617492080000000  -0.617492080000000  -0.617492080000000 -0.617492080000000  -0.617492080000000  -0.218949830101667  -0.218949830101667  -0.218949830101667 -0.218949830101667  -0.218949830101667  -0.218949830101667  -0.218949830101667   0.179592419796667 0.179592419796667   0.179592419796667   0.179592419796667   0.179592419796667   0.179592419796667 0.179592419796667   0.578134669695000   0.578134669695000   0.578134669695000   0.578134669695000 0.578134669695000   0.578134669695000   0.578134669695000];
%y=[0.761707600000000   0.159444863333333  -0.442817873333333  -1.045080610000000  -1.647343346666667 -2.249606083333334  -2.851868820000000   0.761707600000000   0.159444863333333  -0.442817873333333 -1.045080610000000  -1.647343346666667  -2.249606083333334  -2.851868820000000   0.761707600000000 0.159444863333333  -0.442817873333333  -1.045080610000000  -1.647343346666667  -2.249606083333334 -2.851868820000000   0.761707600000000   0.159444863333333  -0.442817873333333  -1.045080610000000 -1.647343346666667  -2.249606083333334  -2.851868820000000];
x3=[-0.614878036687000  -0.614878036687000  -0.614878036687000  -0.614878036687000  -0.614878036687000 -0.307439018343500  -0.307439018343500  -0.307439018343500  -0.307439018343500                   0.0 0.0                 0.0   0.307439018343500   0.307439018343500   0.614878036687000];
y3=[0.0   0.177500000000000   0.355000000000000   0.532500000000000   0.710000000000000 0.0   0.177500000000000   0.355000000000000   0.532500000000000                   0.0 0.177500000000000   0.355000000000000                   0.0   0.177500000000000                   0.0];
cd pris;
clear z3;
for i = 1:15
    filename = [num2str(i-1),'-curr.data'];
    clear B;
    B = load (filename);
    z3(i) = max(abs(B(:,2)));
end
clear A;
A = [x3' y3' z3'];
xx3 = linspace(min(A(:,1)),max(A(:,1)),npt);
yy3 = linspace(min(A(:,2)),max(A(:,2)),npt);
yy3 = yy3';
for jj = 1:npt
    xx3(jj,:) = xx3(1,:);
end

for jj = 1:npt
    yy3(:,jj) = yy3(:,1);
end

zz3 = griddata(A(:,1),A(:,2),A(:,3),xx3,yy3,'v4');
%surfc(xx3, yy3,zz3,'edgecolor','none','linestyle','none');
cd ..;
view(-10,30);
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);
set(gca,'zticklabel',[]);
%set(gcf,'unit','centimeters','position',[10 5 28 10]);
%axis off;
zlim([0 60000]);
clim([0 60000]);
saveas(fig, 'test','pdf');