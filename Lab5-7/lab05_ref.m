clear;clc;
im = double(imread('kaczki.jpg'))/255;
imshow(im);
gim = rgb2gray(im);
imshow(gim);
imhist(gim);
bim = ~imbinarize(gim, .61);

bim = imclose(bim, ones(7));
% 
bim = imopen(bim, ones(3));
% imshow(bim);
% 
% imshow(im.*bim);
% bim = bwmorph(bim, 'clean');
% bim = bwmorph(bim, 'fill');
% bim = bwmorph(bim, 'majority');
% bim = bwmorph(bim, 'remove');
% 
% bim = bwmorph(bim, 'skel',Inf);
% % bim = bwmorph(bim, 'branchpoints');
% % bim = bwmorph(bim, 'branchpoints');
% % [y,x] = find(bim);

% bim = bwmorph(bim, 'thin',Inf);
% bim = bwmorph(bim, 'shrink',Inf);

seg = bwmorph(bim, 'thicken',Inf);
% 
imshow(bim);
% imshow(max(im,bim));
l = bwlabel(seg);

imshow(label2rgb(l));

imshow(im.*(l==2).*bim);

d = bwdist(bim,'cityblock');
imshow(d, [0, max(d,[],'all')]);
l = watershed(d);

imshow(label2rgb(l));
imshow(im.*(l==1));


