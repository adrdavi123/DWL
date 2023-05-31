% Supplementary Material A - Dwl script
% Script for extracting dominant wavelength in digitalized stylolites
% Accompanies the manuscript "Dominant wavelength: A tool for morphological simplification of stylolites"
% Ferreira A.D., Pinto-Coelho C.V., Oliveira S.P., Assis J.P., Camargo M.H.T., Cavallari M.L.

% Steps:
%  1. Read CSV files, with X and Y coordinates; 
%  2. Remove trends by polynomial regression;
%  3. Spatial grid information; 
%  4. Fabricate new grid by Y-interpolation;
%  5. Frequency grid;
%  6. Fast Fourier Transform;
%  7. Dominant frequency and wavelength;
%  8. Bandpass filter; 
%  9. Show results;

clear, close all
set(0, "defaultlinelinewidth", 2);
set(0, 'DefaultAxesFontSize', 16)

% 1. Read CSV files

g=dlmread('working_sample_1.csv');
X = g(:,1)'; 
Y = g(:,2)'; 

% 2. Remove trends by polynomial regression;

P=polyfit(X,Y,2);
Y=Y-polyval(P,X); 

% 3. Spatial grid information;

a = min(X); b = max(X);

% 4. Fabricate new grid by Y-interpolation;

x = linspace(a,b,2*ceil(length(X)/2));
dx = x(2)-x(1);
N = length(X); % number of X intervals 
y = interp1(X,Y,x,'linear');

% 5. Frequency grid;

kappa = ((-N/2):(N/2-1))/(b-a);

% 6. Fast Fourier Transform;

F = dx*exp(-i*2*pi*a*kappa).*fftshift(fft( Y(1:N) ));

% 7. Dominant frequency and wavelength;

[z,i]=max(abs(F));
frequency = abs(kappa (i));
1/abs(frequency) % dominant wavelength

% 8. Bandpass filter (see the Bandpass script)

fH=Bandpass(X,Y,frequency-0.5,frequency+0.5);

% 9. Show results

figure
subplot(3,1,1)
plot(X,Y)
axis tight              
title('Original digitalized stylolite - trend removal');
grid

subplot(3,1,2)
plot(kappa,abs(F))
title('Fast Fourier Transform')  
axis tight  
grid

subplot(3,1,3)
plot(x,y)
title('Stylolite Grid')
axis tight  
grid

figure
subplot(3,1,1)
plot(X,Y)
title('Original digitalized stylolite - trend removal');
axis tight
grid

subplot (3,1,2)
plot(X,fH)
title ('Dominant Frequencies')
axis tight
grid 

subplot (3,1,3)
plot(X,Y,X,fH)
title ('Dominant Wavelength vs Digitalized Stylolite')
axis tight
grid
