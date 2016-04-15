clear all;
vid=videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');
triggerconfig(vid,'manual');
Set(vid,'FramesPerTrigger',1);
Set(vid,'TriggerRepeat',1000000);
Start(vid);

vid1=videoinput('winvideo',2,'YUY2_640x480');
set(vid1,'ReturnedColorSpace','rgb');
triggerconfig(vid1,'manual');
Set(vid1,'FramesPerTrigger',1);
Set(vid1,'TriggerRepeat',1000000);
Start(vid1);
flushdata(vid) ;


while(1)
trigger(vid);
img=getdata(vid,1);
%img_d = im2double(img);
trigger(vid1);
img1=getdata(vid1,1);
%img1_d = im2double(img1);

%------ join Images -----------------
[a b c] = size(img);
[d e f] = size(img1);
% img2(1:a,1:b+e,1:3)=255;
% img2(1:a,1:b,1:3) = img_d;
% img2(1:a,b+1:b+e,1:3) = img1_d;

img_c = img(1:300,230:b-170,1:3);                %250:b-80
img1_c = img1(150:329,230:b-170,1:3);                       % 

 img2(1:a,1:b,1:3) = 255;                                                   %240
 img2(1:180,160:400,1:3) = img1_c;         %212:b-187
 img2(181:480,160:400,1:3) = img_c;           %247:b-153
 img2 = uint8(img2) ;
%----->>>>>>>>>>>>>>>--------------

%============= 3D view======================
% %view(3);
% img_bw = im2bw(img_d) ;
% img1_bw = im2bw(img1_d) ;
% X = img_bw;
% Y = img1_bw ;
% Z = peaks(X,Y);
%====================================================

subplot(2,2,1)
imshow(img);      % first camera
subplot(2,2,2)
imshow(img1);     % second camera 
subplot(2,2,3);
% axis(volumebounds(a,b,d));
% view(3)
drawnow;
imshow(img2);     % After joining
subplot(2,2,4);
% dm(1:640,1:640)=0;
% meshc(dm,dm,dm);
% hold on;
% x = -2:0.01:2;
% f = sqrt(1-(abs(x)-1).^2);
% g = -3*sqrt(1-sqrt(abs(x)/2));
% view(3)
% plot(x,f,'r',x,g,'r','LineWidth',3);


% imshow(img1_c);
title('hello');
end