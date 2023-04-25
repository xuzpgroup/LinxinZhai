%% 
% major/minor event
% based on (1) sampling of graphene (2) irradiation flux (superposition of single event)
%%

clear;
clc;

%% Input
dt = 0.01;
tolt = 550;
bufft = 5;
flux = 0.05;
load triangle.mat % cc (k) and p (probablibity)%三角形区域生成采样点
ave = 350;
tdec = 2; % exp decay

step = tolt/dt+1;
toli = ave+ave*0.02*randn(1,step+bufft/dt); % primary noise
pira = flux * dt; %（平均每个dt辐照量）
    
%% irradition
for i=1:step
    % irradiation?
    if (rand(1) < pira)
        % site effect
        nr = rand(1);
        irai = 0;
        for j=1:length(p)-1 % length = 500，面积内均匀撒500各点，看看最后nr撒到哪个点了
            if (nr >= p(j) && nr < p(j+1))
                irai = cc(j);
            end
%         break;
        end
        % add irradiation current
        for j=1:2*tdec/dt
            cdec = irai*exp(-(j-1)*dt);
            toli(i+j-1) = toli(i+j-1)+cdec;
        end
    end
end

%% plot
t=0:dt:tolt;
current=toli(1:step);
plot(t,current,'-','LineWidth',1)
xlabel('{\it t} (fs)')
ylabel('{\it I} (nA)')
set(gca,'FontSize',20);
set(gca,'PlotBoxAspectRatio',[1 0.2 1]);

save 005.mat t current;