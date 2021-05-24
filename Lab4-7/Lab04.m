clear; clc;

% transformata Fouriera

im = double(imread('tapestry.png'))/255;
gim = rgb2gray(im);



imshow(gim);

% % sum_n x e^(-i pi n*k/N)
% % chcemy przedstawić nasz obraz za pomocą sumy funkcji typu sinus
% %  najszybciej można to zrobić za pomocą szybkiej transformaty Fouriera
% 
f = fft2(gim);
% 
% %  wynikiem transformaty Fouriera jest liczba zespolona - pracujemy w
% %  dziedzinie liczb zespolonych. 
% % z = a + ib;
% % z = |z|*e^(i*phi)
% % z = |z|*(cos(phi) + i*sin(phi))
% % liczbt te chcemy przenieść do postaci rzeczywistej 
% 
amp = abs(f);
phase = angle(f);


% 
% %  sum_n amp e^(i*phase)
% 
% % x = 0:.1:10;
% % y1 = sin(x);
% % y2 = sin(2*x);
% % y3 = sin(3*x);
% % 
% % plot(x,y1,y2,y3);
% 
% % mając nieskończenie wiele funkcji sinus możemy przedstawić dowolną
% % funkcje za pomocą sumy takich przesuniętych w fazie funkcji sinus
% 
% amp(40,1260) = 100000; % dodajemy 'fakture'
% phase(1,1) = phase(1,1) + pi; % inwersja kolorów
% phase = fftshift(phase); % zmieniamy faze w róznych kierunkach
% % faza jest istotna 
% % zmiany w amplitudzie są akceptowalne bo nie psują obrazu
% 
maxamp = max(amp,[],'all');
% 
% % na podstawie widma amplitudowego jesteśmy w stanie wyczytać gdzie na
% % obrazie pojawiają się linie. Dzięki temu możemy stwierdzić że w
% % jaśniejszych miejscach są bardziej interesujące nas miejsca i chcemy je z
% % obrazka wyróżnić
% 
% 
% %[0,maxamp]-zakres do jakiego rozciągamy nasze widmo 
% % fft2 - fast fourier transform
% % po dodaniu fftshith uzyskujemy symetryczność obrazka względem środka
% 
% % przywracanie obrazka do normalnej postaci rzeczywistej
[h,w] = size(gim);
mask = zeros(h,w);
mask(200:h-200, 300:w-300) = 1;
subplot(1,2,2);
imshow(mask);
% amp = amp.*fftshift(mask);
% 
% 
% subplot(1,2,2);
% imshow(fftshift(log(amp)),[0,log(maxamp)]);
% 
fil = fspecial('gaussian',[h,w],4);
imshow(fil,[0,max(fil,[],'all')])
% % im = imfil(gim,fil);
ffil = fft2(fil);
famp = abs(ffil);
fphase = angle(ffil);
fampmax = max(famp,[],'all');
fampmin = min(famp,[],'all');
imshow(fftshift(log(famp)), [log(fampmin),log(fampmax)]);
% amp = amp.*famp;
imshow(fftshift(log(amp)), [0,log(maxamp)]);
% subplot(1,2,2);
% imshow(fftshift(log(famp)),[log(min(famp,[],'all')),log(max(famp,[],'all'))]);
subplot(1,2,1);
imshow(fftshift(fphase),[pi,pi]);
% 
% amp = amp.*famp; % widmo obrazu razy widmo filtra
% 
% % amp = fftshift(fftshift(amp).*mask);
f = amp .* exp(1i*phase); % zmaiana na postać kanoniczną
im2 = abs(ifft2(f));
subplot(1,2,1);
imshow(im2);
% 
% 
% 
% % teraz faza
% % przyjmuje wartości z zakresu [-pi;pi];
% % w widnmie fazowym nie spodziewamy sie widzieć zbyt wiele
% % mimo wszystko widzimy dużo... 
% % po zmianie obrazka widać w widmie fazowym znaczne nieregularności
% 


subplot(1,2,1);
imshow(phase,[-pi;pi]);
subplot(1,2,2);
imshow(fftshift(log(amp)),[0,log(maxamp)]);