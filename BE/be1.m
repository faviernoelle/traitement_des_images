%% BE 1 : Traitement des images

% Favier _ Nguyen

%% Clean Matlab 

clear all
close all
clc 

%% Load image

I=double(imread('barbara.tif')); % To load an image
figure()
imshow(I/255); %Transforme les valeurs du tableau pour qu'elles soient entre 0 et 1
colormap gray; axis image;

%% Divide size 

% Sous échantillonage

[H W] = size(I) ; 
I2 = zeros(H,W) ; % Création d'un tableau pour obtenir les nouvelles valeurs de l'image
I2 = I(2:2:H,2:2:W) ; % Définition de la taille du tableau 

figure()
imshow(I2/255) ; 
colormap gray ; axis image ;

% On observe que le résultat n'est pas satisfaisant car de l'aliazing
% apparait on va donc utiliser un filtre passe bas 

%% Filtrage avant réduction 

filter1 = [ -1/32 , 0 , 9/32 , 1/2 , 9/32 , 0 , -1/32 ] ; % Création du filtre passe bas
I3 = imfilter(I,filter1,'symmetric','conv') ; % Filtrage dans une direction
I3_filtre = imfilter(I3,filter1','symmetric','conv') ; % Filtrage dans l'autre direction

I3bis = I3_filtre(2:2:H,2:2:W) ; % Division de la taille par 2
figure()
imshow(I3bis/255) ;
colormap gray; axis image;

% On observe que l'image ne présente plus d'aliazing 

%% Visualisation de la fft du filtre 

figure()
plot(abs(fftshift(fft([zeros(1,46),filter1,zeros(1,46)])))); 

%% Agrandissement de l'image 

% Sur-échantillonage

I4 = zeros(2 * H, 2 * W ) ; % Creation du tableau pour obtenir les nouvelles valeurs de l'image
I4(1:2:2*H , 1:2:2*W ) = I ; % Ajout des valeurs de I dans une case sur 2 du tableau créé
I4_filtre = imfilter(I4,2*filter1,'symmetric','conv') ; % Filtrage dans une direction
I4_filtre_2 = imfilter(I4_filtre, 2*filter1','symmetric','conv') ; % Filtrage dans l'autre direction
figure()
imshow(I4_filtre_2/255) ; 
colormap gray; 


%% Affichage cameraman 


I=double(imread('cameraman.tif')); % To load an image
figure()
imshow(I/255);

%% Aggrandissement 2 

% Voir fichier image_enlargement.m 

%% Couleurs 

I=double(imread('imcolor1.tif')); % To load an image
figure()
imshow(I/255);

IL=(I(:,:,1)+I(:,:,2)+I(:,:,3))/sqrt(3);
IC1=(I(:,:,1)+I(:,:,2)-2*I(:,:,3))/sqrt(6);
IC2=(I(:,:,1)-I(:,:,2))/sqrt(2);

coeff_sqrt3 = sqrt(3) ; 
coeff_sqrt6 = sqrt(6) ; 
coeff_sqrt12 = sqrt(12) ; 


% p=[1/coeff_sqrt6 1/coeff_sqrt6


