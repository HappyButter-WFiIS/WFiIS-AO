clear; clc;

im = imread('Zubr.jpg');
im = double(im)/255;

rim = im;
% rim(:,:,[1 2]) = 0;
rim = im(:,:,2);
imshow(rim);

gim = mean(im,3);
imshow(gim);

% % YUV - jak widzi człowiek kolory RGB - wagi
w = [.299, .587, .114]; 
w = permute(w, [1,3,2]);
gim = sum(im.*w, 3);
imshow(gim);

gim = rgb2gray(im);
% imshow(gim);
% 
% subplot obrazu 
% h = 4;
% w = 3;
% i = 1; 
% 
% % inwersja
% gim = 1 - gim;
% subplot(h,w,i); i=i+1;
% imshow(gim);
% 
% subplot(h,w,i); i=i+2;
% imhist(gim);


h = 4;
w = 3;
i= 1;

subplot(h,w,i); i = i+1;
imshow(gim);
subplot(h,w,i); i = i+1;
imhist(gim);


x = linspace(0,1,256);
y = x;
y(y<0) = 0;
y(y>1) = 1;
subplot(h,w,i); i = i+1;
plot(x,y);
ylim([0,1]);

% inwersja
gim = 1 - gim;
y = 1 - x;

% 
% b = .2; 
% bim = gim+b;
% bim(bim<0) = 0;
% bim(bim>1) = 1;
% 
% y = x+b;
% y(y<0) = 0;
% y(y>1) = 1;

subplot(h,w,i); i = i+1;
imshow(gim);
subplot(h,w,i); i = i+1;
imhist(gim);
subplot(h,w,i); i = i+1;
plot(x,y);
ylim([0,1]);

c = 1.2;
b = -.5*c+.5;
cim = (gim-.5)*c+.5;
% cim = gim*c+b;
cim(cim<0) = 0;
cim(cim>1) = 1;

y = (x-.5)*c+.5;
y(y<0) = 0;
y(y>1) = 1;

subplot(h,w,i); i = i+1;
imshow(cim);
subplot(h,w,i); i = i+1;
imhist(cim);
subplot(h,w,i); i = i+1;
plot(x,y);
ylim([0,1]);

gamma = 2;                %A stała
gammaim = gim.^(1/gamma);	% korekcja gamma	
gammaim(gammaim<0) = 0; 
gammaim(gammaim>1) = 1;

y = x.^(1/gamma);
subplot(h,w,i); i = i+1;
imshow(gammaim);
subplot(h,w,i); i = i+1;
imhist(gammaim);
subplot(h,w,i); i = i+1;
plot(x,y);
ylim([0,1]);


% %%%%%%%%%%
% 
% x = linspace(0,1,256); % rysujemy odcinek i dzielimy go na 256 kroków
% 
% % zmieniamy jasność = dodajemy stałą
% b = +0.2;
% bim = gim+b;
% 
% bim(bim<0) = 0; %prevent negative values
% bim(bim>1) = 1; 
% 
% y = x+b;
% y(y<0) = 0;
% y(y>1) = 1;
% 
% subplot(h,w,i); i=i+1;
% imshow(bim);
% 
% subplot(h,w,i); i=i+1;
% imhist(bim);
% 
% subplot(h,w,i); i=i+1;
% plot(x,y);
% xlim([0,1]);
% ylim([0,1]);
% 
% % zmieniamy kontrast
% c = 1.2; %0,+inf) 
% cim = (gim-0.5)*c + .5;
% 
% cim(cim<0) = 0;
% cim(cim>1) = 1;
% 
% subplot(h,w,i); i=i+1;
% imshow(cim);
% 
% subplot(h,w,i); i=i+1;
% imhist(cim);
% 
% y = (x-.5)*c + .5;
% 
% subplot(h,w,i); i=i+1;
% plot(x,y);
% xlim([0,1]);
% ylim([0,1]);
% 
% % Gamma
% 
% gamma = 3; % (o,+inf) - sensowne wartości
% gammaim = gim.^(1/gamma);
% gammaim(gammaim<0) = 0;
% gammaim(gammaim>1) = 1;
% 
% subplot(h,w,i); i=i+1;
% imshow(gammaim);
% 
% subplot(h,w,i); i=i+1;
% imhist(gammaim);
% 
% y = x.^(1/gamma);
% 
% subplot(h,w,i); i=i+1;
% plot(x,y);
% xlim([0,1]);
% ylim([0,1]);
% 
% %%%%%%%%%
% 
% figure;
% i = 1;
% subplot(2,2,i); i = i+1;
% imshow(gim);
% subplot(2,2,i); i = i+1;
% imhist(gim);
% 
% subplot(2,2,i); i = i+1;
% histeq(gim);
% 
% subplot(2,2,i); i = i+1;
% imhist(histeq(gim));

% figure;
% 
% subplot(1,2,1);
% histeq(gim);
% subplot(1,2,2);
% imhist(histeq(gim));

