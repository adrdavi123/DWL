% Supplementary Material A - Bandpass funtion
% Apply bandpass filter to the profile f(x), considering the frequency interval [kappa0,kappa1]
% Accompanies the manuscript "Dominant wavelength: A tool for morphological simplification of stylolites"
% Ferreira A.D., Pinto-Coelho C.V., Oliveira S.P., Assis J.P., Camargo M.H.T., Cavallari M.L.

% Steps:
  % 1. Spatial grid information;
  % 2. Frequency grid;
  % 3. Fast Fourier Transform;
  % 4. Multiplication by the filter and inverse transform;
  

function fH = Bandpass(x,f,kappa0,kappa1)

% 1. Spatial grid information;

a = min(x); b = max(x);
dx = x(2)-x(1);
N = length(x); 

% 2. Frequency grid;

kappab = ((-N/2):(N/2-1))/(b-a);
kappab = reshape(kappab,size(x(1:N)));

% 3. Fast Fourier Transform;

Fb = fftshift(fft( f(1:N) ));

% 4. Multiplication by the filter and inverse transform;

H = (kappa0 <= abs(kappab)).*(abs(kappab)<= kappa1);


fH  = ifft(ifftshift( H.*Fb ));
fH  = real(fH);
fH  = fH*sqrt(sum(f.^2)/sum(fH.^2));  % energy normalization

figure

subplot(3,1,1);
plot(kappab,Fb);
title('Fast Fourier Transform')
axis tight
grid

subplot(3,1,2);
plot(kappab,H);
title('Bandpass filter')
axis tight  
grid

subplot(3,1,3);
plot(kappab,H.*Fb);
title('Filtered Frequency')
axis tight  
grid
