clc;
close all;
clear all;
fs=8000;


% PREPARE DTMF SIGNALS ACCORDING TO SPECS

t=(0:799)/fs;
%in time domain
sig1=sin(2*pi*697*t)+sin(2*pi*1209*t);
sig2=sin(2*pi*697*t)+sin(2*pi*1366*t);
sig3=sin(2*pi*697*t)+sin(2*pi*1477*t);
sig4=sin(2*pi*770*t)+sin(2*pi*1209*t);
sig5=sin(2*pi*770*t)+sin(2*pi*1366*t);
sig6=sin(2*pi*770*t)+sin(2*pi*1477*t);
sig7=sin(2*pi*852*t)+sin(2*pi*1209*t);
sig8=sin(2*pi*852*t)+sin(2*pi*1366*t);
sig9=sin(2*pi*852*t)+sin(2*pi*1477*t);
sigstar=sin(2*pi*941*t)+sin(2*pi*1209*t);
sig0=sin(2*pi*941*t)+sin(2*pi*1366*t);
sighash=sin(2*pi*941*t)+sin(2*pi*1477*t);

figure(1);

subplot(4,3,1);
plot(t,sig1);
ylabel('Magnitude');

title('a) Key "1"');
p = audioplayer(sig1,fs);
play(p);
pause(0.5);



subplot(4,3,2);
plot(t,sig2);
title('b) Key "2"');
p = audioplayer(sig2,fs);
play(p);
pause(0.5);



subplot(4,3,3);
plot(t,sig3);
title('c) Key "3"');
p = audioplayer(sig3,fs);
play(p);
pause(0.5);

subplot(4,3,4);
plot(t,sig4);
title('d) Key "4"');
p = audioplayer(sig4,fs);
play(p);
pause(0.5);

subplot(4,3,5);
plot(t,sig5);
title('e) Key "5"');
p = audioplayer(sig5,fs);
play(p);
pause(0.5);


subplot(4,3,6);
plot(t,sig6);
title('f) Key "6"');
p = audioplayer(sig6,fs);
play(p);
pause(0.5);

subplot(4,3,7);
plot(t,sig7);
title('g) Key "7"');
p = audioplayer(sig7,fs);
play(p);
pause(0.5);

subplot(4,3,8);
plot(t,sig8);
title('h) Key "8"');
p = audioplayer(sig8,fs);
play(p);
pause(0.5);

subplot(4,3,9);
plot(t,sig9);
title('i) Key "9"');
p = audioplayer(sig9,fs);
play(p);
pause(0.5);

subplot(4,3,10);
plot(t,sigstar);
title('j) Key "*"');
p = audioplayer(sigstar,fs);
play(p);
pause(0.5);

subplot(4,3,11);
plot(t,sig0);
title('k) Key "0"');
p = audioplayer(sig0,fs);
play(p);
pause(0.5);

subplot(4,3,12);
plot(t,sighash);
title('l) Key "#"');
xlabel('Time');
p = audioplayer(sighash,fs);
play(p);
pause(0.5);



% END OF FIRST PART OF QUESTION: DTMF TONES GENERATED

% Magnitude of Fourier Transforms of the signals
[Htemp,w]=freqz(sig1);
sigf1=abs(freqz(sig1));
sigf2=abs(freqz(sig2));
sigf3=abs(freqz(sig3));
sigf4=abs(freqz(sig4));
sigf5=abs(freqz(sig5));
sigf6=abs(freqz(sig6));
sigf7=abs(freqz(sig7));
sigf8=abs(freqz(sig8));
sigf9=abs(freqz(sig9));
sigfstar=abs(freqz(sigstar));
sigf0=abs(freqz(sig0));
sigfhash=abs(freqz(sighash));
%

% Lower Freq GRID with bandlenght 2-(-2)=4Hz
fs=8000;
[zl1,pl1]=butter(4,[695/(fs/2) 699/(fs/2)],'bandpass');
[zl2,pl2]=butter(4,[768/(fs/2) 772/(fs/2)],'bandpass');
[zl3,pl3]=butter(4,[850/(fs/2) 854/(fs/2)],'bandpass');
[zl4,pl4]=butter(4,[939/(fs/2) 943/(fs/2)],'bandpass');

[Hl1,wl1]=freqz(zl1,pl1);
[Hl2,wl2]=freqz(zl2,pl2);
[Hl3,wl3]=freqz(zl3,pl3);
[Hl4,wl4]=freqz(zl4,pl4);
%
% High Freq GRID with 4 Hz band width
[zh1,ph1]=butter(4,[1207/(fs/2) 1211/(fs/2)],'bandpass');
[zh2,ph2]=butter(4,[1364/(fs/2) 1368/(fs/2)],'bandpass');
[zh3,ph3]=butter(4,[1475/(fs/2) 1479/(fs/2)],'bandpass');

[Hh1,wh1]=freqz(zh1,ph1);
[Hh2,wh2]=freqz(zh2,ph2);
[Hh3,wh3]=freqz(zh3,ph3);

o=(fs*w)/2*pi; % omega in our units (unnormalized) 

%



%
display('PRESSED KEY DETECTOR FROM SIGNAL');
display('---------------------------------');

prompt='Please choose one of the 12 Key signals in fig.1[a,b,c,...,k,l] :';
str=input(prompt,'s');

display('Passing through BAND PASS Filters to detect frequencies present...');


%.......................................................................
%--- THE FOLLOWING PART REPEATES IN CODE FOR EACH DIGIT IE 12 NOS...
%..........................................................................
if str=='a' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf1.*abs(Hl1);
    booll(1,1)=all(fill1(:)<50); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 50 
    
    fill2=sigf1.*abs(Hl2);
    booll(2,1)=all(fill2(:)<50);
    
    fill3=sigf1.*abs(Hl3);
    booll(3,1)=all(fill3(:)<50);
    
    fill4=sigf1.*abs(Hl4);
    booll(4,1)=all(fill4(:)<50);
    
    filh1=sigf1.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<50);
        
    filh2=sigf1.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<50);
    
    filh3=sigf1.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<50);
    
    
    %Detection
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
           
end
%.....................................................................
%REPETITION CODE ENDS
%....................................................................


if str=='b' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf2.*abs(Hl1);
    booll(1,1)=all(fill1(:)<50); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 50 
    
    fill2=sigf2.*abs(Hl2);
    booll(2,1)=all(fill2(:)<50);
    
    fill3=sigf2.*abs(Hl3);
    booll(3,1)=all(fill3(:)<50);
    
    fill4=sigf2.*abs(Hl4);
    booll(4,1)=all(fill4(:)<50);
    
    filh1=sigf2.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<50);
        
    filh2=sigf2.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<50);
    
    filh3=sigf2.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<50);
    
    
    %Detection
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................

%....................................................................
if str=='c' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf3.*abs(Hl1);
    booll(1,1)=all(fill1(:)<50); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 50 
    
    fill2=sigf3.*abs(Hl2);
    booll(2,1)=all(fill2(:)<50);
    
    fill3=sigf3.*abs(Hl3);
    booll(3,1)=all(fill3(:)<50);
    
    fill4=sigf3.*abs(Hl4);
    booll(4,1)=all(fill4(:)<50);
    
    filh1=sigf3.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<50);
        
    filh2=sigf3.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<50);
    
    filh3=sigf3.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<50);
    
    
    %Detection
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................

%....................................................................
if str=='d' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf4.*abs(Hl1);
    booll(1,1)=all(fill1(:)<20); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 20 
    
    fill2=sigf4.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<20);
    
    fill3=sigf4.*abs(Hl3);
    booll(3,1)=all(fill3(:)<20);
    
    fill4=sigf4.*abs(Hl4);
    booll(4,1)=all(fill4(:)<20);
    
    filh1=sigf4.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<20);
        
    filh2=sigf4.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<20);
    
    filh3=sigf4.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<20);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................
if str=='e' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf5.*abs(Hl1);
    booll(1,1)=all(fill1(:)<20); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 20 
    
    fill2=sigf5.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<20);
    
    fill3=sigf5.*abs(Hl3);
    booll(3,1)=all(fill3(:)<20);
    
    fill4=sigf5.*abs(Hl4);
    booll(4,1)=all(fill4(:)<20);
    
    filh1=sigf5.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<20);
        
    filh2=sigf5.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<20);
    
    filh3=sigf5.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<20);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................
if str=='f' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf6.*abs(Hl1);
    booll(1,1)=all(fill1(:)<20); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 20 
    
    fill2=sigf6.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<20);
    
    fill3=sigf6.*abs(Hl3);
    booll(3,1)=all(fill3(:)<20);
    
    fill4=sigf6.*abs(Hl4);
    booll(4,1)=all(fill4(:)<20);
    
    filh1=sigf6.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<20);
        
    filh2=sigf6.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<20);
    
    filh3=sigf6.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<20);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................

if str=='g' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf7.*abs(Hl1);
    booll(1,1)=all(fill1(:)<20); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 20 
    
    fill2=sigf7.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<20);
    
    fill3=sigf7.*abs(Hl3);
    booll(3,1)=all(fill3(:)<20);
    
    fill4=sigf7.*abs(Hl4);
    booll(4,1)=all(fill4(:)<20);
    
    filh1=sigf7.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<20);
        
    filh2=sigf7.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<20);
    
    filh3=sigf7.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<20);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................

if str=='h' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf8.*abs(Hl1);
    booll(1,1)=all(fill1(:)<20); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 20 
    
    fill2=sigf8.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<20);
    
    fill3=sigf8.*abs(Hl3);
    booll(3,1)=all(fill3(:)<20);
    
    fill4=sigf8.*abs(Hl4);
    booll(4,1)=all(fill4(:)<20);
    
    filh1=sigf8.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<20);
        
    filh2=sigf8.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<20);
    
    filh3=sigf8.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<20);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................

if str=='i' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf9.*abs(Hl1);
    booll(1,1)=all(fill1(:)<20); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 20 
    
   
   
    fill2=sigf9.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<20);
    
    fill3=sigf9.*abs(Hl3);
    booll(3,1)=all(fill3(:)<20);
    
    fill4=sigf9.*abs(Hl4);
    booll(4,1)=all(fill4(:)<20);
    
    filh1=sigf9.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<20);
        
    filh2=sigf9.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<20);
    
    filh3=sigf9.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<20);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................

if str=='j' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigfstar.*abs(Hl1);
    booll(1,1)=all(fill1(:)<20); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 20 
    
    fill2=sigfstar.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<20);
    
    fill3=sigfstar.*abs(Hl3);
    booll(3,1)=all(fill3(:)<20);
    
    fill4=sigfstar.*abs(Hl4);
    booll(4,1)=all(fill4(:)<20);
    
    filh1=sigfstar.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<20);
        
    filh2=sigfstar.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<20);
    
    filh3=sigfstar.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<20);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................

if str=='k' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigf0.*abs(Hl1);
    booll(1,1)=all(fill1(:)<30); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 50 
    
    fill2=sigf0.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<30);
    
    fill3=sigf0.*abs(Hl3);
    booll(3,1)=all(fill3(:)<30);
    
    fill4=sigf0.*abs(Hl4);
    booll(4,1)=all(fill4(:)<30);
    
    filh1=sigf0.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<30);
        
    filh2=sigf0.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<30);
    
    filh3=sigf0.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<30);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................

if str=='l' % PASS SIGNAL 1 TO ALL THE FILTERS, FILTERED SIGNAL CALL 
    fill1=sigfhash.*abs(Hl1);
    booll(1,1)=all(fill1(:)<20); % Using ALL Fucntion to check if all the values are above certain value here 50 (pass magnitude)
   %ALL returns 0 if that signal is there or else 1 since it returns 0 if
   %any element of fill1 exceeds 20 
    
    fill2=sigfhash.*abs(Hl2);
    
    booll(2,1)=all(fill2(:)<20);
    
    fill3=sigfhash.*abs(Hl3);
    booll(3,1)=all(fill3(:)<20);
    
    fill4=sigfhash.*abs(Hl4);
    booll(4,1)=all(fill4(:)<20);
    
    filh1=sigfhash.*abs(Hh1);
    boolh(1,1)=all(filh1(:)<20);
        
    filh2=sigfhash.*abs(Hh2);
    boolh(1,2)=all(filh2(:)<20);
    
    filh3=sigfhash.*abs(Hh3);
    boolh(1,3)=all(filh3(:)<20);
    
    
    %Detection
    lowfreq_id=8;
    
    for i=1:4
        if booll(i,1)==0
            lowfreq_id=i
        end
    end
    for j=1:3
        if boolh(1,j)==0
            highfreq_id=j
        end
    end
         % DISPLAY RESULTS
    if lowfreq_id==1 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 1')
    end
    if lowfreq_id==1 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 2')
    end
    if lowfreq_id==1 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 3')
    end
    if lowfreq_id==2 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 4')
    end
    if lowfreq_id==2 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 5')
    end
    if lowfreq_id==2 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 6')
    end
    if lowfreq_id==3 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: 7')
    end
    if lowfreq_id==3 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 8')
    end
    if lowfreq_id==3 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: 9')
    end
    if lowfreq_id==4 && highfreq_id==1
        display('THIS SIGNAL CORRESPONDS TO KEY: *')
    end
    if lowfreq_id==4 && highfreq_id==2
        display('THIS SIGNAL CORRESPONDS TO KEY: 0')
    end
    if lowfreq_id==4 && highfreq_id==3
        display('THIS SIGNAL CORRESPONDS TO KEY: #')
    end
    
    %
        
    
    
    
end
%..................................................................



































































































































































% B.S. Vineeth (c) Copyright BTECH Engineering Physics 2012/
%----------------------------------------
%B.S.Vineeth <b.vineeth@iitg.ernet.in>
%BTech EP, Class of 2016,NOV 2013 Copyright (c)
%----------------------------------------
