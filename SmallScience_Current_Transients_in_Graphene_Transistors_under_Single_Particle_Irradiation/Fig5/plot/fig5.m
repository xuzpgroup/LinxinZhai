load 0005.mat
sma=current(1000:51000);
load 005.mat
ge=current(1000:51000);
load 05.mat
bne=current(1000:51000);
load 5.mat
he=current(1000:51000);
t=t(1000:51000)-t(1000);
h4=subplot(4,1,1);
plot(t,sma,'-','Color',[0,0.45,0.74],'LineWidth',1) %,'LineWidth',1.0,'MarkerSize',8.0,'MarkerFaceColor',[0,0.45,0.74]
axis([0 500 0 4e4])
set(gca,'xticklabel',[]);
lh = legend('{\itF} << 0.01');
set(lh,'box','off');
h1=subplot(4,1,2);
plot(t,ge,'-','Color',[0,0.45,0.74],'LineWidth',1) %,'LineWidth',1.0,'MarkerSize',8.0,'MarkerFaceColor',[0,0.45,0.74]
axis([0 500 0 4e4])
set(gca,'xticklabel',[]);
% set(gca,'position',[0.15 0.7 0.75 0.27]);
lh = legend('{\itF} = 0.05');
set(lh,'box','off')
h2=subplot(4,1,3);
plot(t,bne,'-','Color',[0.64,0.08,0.18],'LineWidth',1)
ylabel('Current (nA)')
axis([0 500 0 10e4])
set(gca,'xticklabel',[]);
% set(gca,'position',[0.15 0.43 0.75 0.27]);
lh = legend('{\itF} = 0.5');
set(lh,'box','off')
% set([h1,h2],'Xcolor','w','XTick',[])
h3=subplot(4,1,4);
plot(t,he,'-k','LineWidth',1)
axis([0 500 0 4e5])
% set(gca,'position',[0.15 0.16 0.75 0.27]);
lh = legend('{\itF} = 50');
set(lh,'box','off')
xlabel('Time (fs)')
set(h1,'FontSize',20);
set(h2,'FontSize',20);
set(h3,'FontSize',20);
set(h4,'FontSize',20);