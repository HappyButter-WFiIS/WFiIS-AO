% clear; clc;
% 
% im = double(imread('Zubr.jpg'))/255;
% gim = rgb2gray(im);
% 
% w = ones(30);
% b = zeros(30);
% 
% chess = [w,b,w;b,w,b;w,b,w];
% chess = [chess, 1-chess, chess; 1-chess, chess, 1-chess; chess, 1-chess, chess];
% % sąsiedztwo Moore'a - kwadraty mają wspólne wierzchołki 
% % sąsiedztwo Von Neumana - wspólne krawędzie
% % można też mówić o sąsiedztwie w odległości
% % segment podstawowy - nasz własny opis które piksele ze sobą sąsiadują
% 
% imshow(chess); 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % subplot(1,2,1);
% % imshow(gim);
% % subplot(1,2,2);
% 
% % chcemy wyświetlić wartość piksela w zależnośi od jego otoczenia
% % piksel - macierz z wagami w otoczeniu
% % 
% % f = ones(7);
% % % 
% % % normalizujemy nasz filtr
% % f = f/sum(f,'all');
% % fim = imfilter(gim, f);
% % imshow(fim); 
% 
% % f = fspecial('sobel');
% % fim = imfilter(gim, f);
% % imshow(fim);
% % % przetwarzając obraz gubimy pewne informacje z obrazu
% % % w tym wypadku rozmyliśmy krawędzie, a piksele mniej wyróżniają się z tła
% % 
% % % a może by tak uzależnić te wagi(f) od środkowego piksela - robimy
% % % 2-wymiarowy rozkład Gauusa - Gaussan blur;
% % 
% % f = fspecial('gaussian', 11, 1);
% % % % hsize - nieistotne; sigma - odchylenie standardowe
% % fim = imfilter(gim, f);
% % imshow(fim);
% % % % 
% % % % a co gdyby wagi były negatywne?
% % % % suma wag pozostaje taka sama = 1
% % % % jednak tym razem różnice pomiędzy pikselem środkowym a otoczeniem wzrosły
% % % % taki filtr nazywamy górnoprzepustowym - filtr wyostrzający
% % f = -ones(3);
% % f(2,2) = 9;
% % fim = imfilter(fim, f);
% % % % %subplot(1,2,1);
% % imshow(fim);
% % % % rozmywając i odszumiając jednocześnie zyskujemy lepszą jakość obrazka
% % % 
% % % 
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % teraz wykorzystajmy medianę
% % % % mediana nie tworzy nowych wartości 
% % % % a jedynie bierze środkową wartość
% % % 
% % fim = medfilt2(gim);
% % imshow(fim);
% 
% % t = .7;
% % bim = gim;
% % bim(bim<t) = 0;
% % bim(bim>=t) = 1;
% % imshow(bim);
% % 
% imhist(gim);
% % 
% % %%%%%%%%%%%%%%%%
% % % istnieje pewien algorytm do odnajdywania progu (t)
% % t = .6 %graythresh(gim);
% t = graythresh(gim);
% bim = imbinarize(gim, t);
% subplot(1,2,1);
% imshow(bim);
% 
% t = 0.6;
% bim = ~imbinarize(gim, 'adaptiv');
% subplot(1,2,2);
% imshow(bim);
% % 
% % % szukamy wariancji  
% % % w ogólności chcemy osiągnć biały obiekt i czarne tło
% % bim = ~imbinarize(gim, t); % (gim, 'adaptiv');
% % subplot(1,2,1);
% % imshow(bim);
% % subplot(1,2,2);
% % 
% % %bim = medfilt2(bim,[10,10]);
% % %imshow(bim);
% % 
% % 
% % bim = medfilt2(bim);
% % imshow(bim);
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % biorąc funkcje maksimum
% % % przy każdej krawędzi zwiększamy grubość krawędzi o 1
% % 
% % % biorąc minimum 
% % % jeśli piksel jest czarnu = 0 - to bardziej czarny nie będzie
% % % biały piksel który sąsiaduje z czarnymi usuniemy wartste białych pikseli
% % 
% % % zdzierając jedną warstwe z obiektu wykonujemy operacje morfologiczne
% % % (erozja) 
% % % dodawanie warst nazywamy dylatacją 
% % 
% bim = imerode( bim, ones(3));
% % %bim = imerode( bim, ones(3));
% % 
% % %bim = imerode(bim, ones(5));
% % %bim = imdilate(bim, ones(5)); OTWARCIE
% % 
% % % wykonując dwie powyżesz operacje (1. dylatacja 2. erozja - operacja zakmnięcia) 
% % % uzyskaliśmy niezmienione tło i 'czystszego' żubra.
% % 
% % %bim = imdilate(bim, ones(5));
% % %bim = imerode(bim, ones(5)); ZAMKNIĘCIE
% % 
% % bim = imclose(bim, ones(5));
% % bim = imopen(bim, ones(5));
% imshow(bim);
% % 
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % ale po co to?
% % % chcemy wyświetlić żubra bez tła
% % % wykonujemy operacje maskowania
% % %mask = fspecial('gaussian', [642, 1000], 300);
% % %mask = mask/max(mask,[],'all');
% % %imshow(im.*mask); % (im.*bim)
% % 
% % %bim = bim - imerode(bim, ones(5)); % uzyskamy ciągłe krawędzie
% % 
% % f = -ones(3);
% % f(2,2) = 8;
% % % teraz obraz nie będzie czarny tylko tam gdzie obiekt spotyka krawędź
% % f = fspecial('sobel');
% % bim = imfilter(bim, f);
% % 
% % imshow(bim);
clear; clc;
im = double(imread('Zubr.jpg'))/255;
gim = rgb2gray(im);

w = ones(30);
b = zeros(30);
chess  = [w,b,w;b,w,b;w,b,w];
% chess = [chess,1-chess,chess;1-chess,chess,1-chess;chess,1-chess,chess;]
imshow(chess);

f = ones(7);
f = f/sum(f,'all');
% f = fspecial('gaussian',11,1);
fim = imfilter(gim,f);

subplot(1,2,1);
imshow(gim);
subplot(1,2,2);
imshow(fim);

f = -ones(3);
f(2,2) = 9;
fim = imfilter(fim,f);
imshow(fim);

fim = medfilt2(gim);
imshow(fim);


imhist(gim);
t = .6;
bim = ~imbinarize(gim,t);
subplot(1,2,1);
imshow(bim);
subplot(1,2,2);

% bim = imdilate(bim,ones(5));  
% bim = imerode(bim,ones(5)); % zamknięcie
bim = imclose(bim,ones(5));
% bim = imerode(bim,ones(5));
% bim = imdilate(bim,ones(5)); % otwarcie
bim = imopen(bim,ones(5));

% imshow(bim);

zubr = im.*bim;
imshow(zubr);

