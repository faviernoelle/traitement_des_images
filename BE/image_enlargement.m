function main()
	I=double(imread('cameraman.png'))/255;
	figure
	imshow(I); axis image; colormap gray;
	factor=2.4;			
	J=enlargement(I,factor);
	figure
	imshow(J); axis image; colormap gray;
end


function J = enlargement(I,factor);	
% Fonction servant à agrandir une image I d'un facteur f 
	[sizey,sizex]=size(I);
	sizeJx=floor(sizex*factor);
	sizeJy=floor(sizey*factor);
	J=zeros(sizeJy,sizeJx);  %va contenir l'image agrandie
	for kx=1:sizeJx		%boucle sur chaque pixel de l'image J
		for ky=1:sizeJy
			
			%here put your code
            posx = floor(kx/factor) ; % Place où on va mettre la nouveau valeur
            posy = floor(ky/factor) ; % Place où on va mettre la nouveau valeur
            
            for lx=max(ceil(posx-2),1):min(floor(posx+2),sizex) 
				for ly=max(ceil(posy-2),1):min(floor(posy+2),sizey)
					J(ky,kx)=J(ky,kx)+I(ly,lx)*keys2D(ly-posy,lx-posx);
				end
			end
			
		end
	end
end


%Keys' cubic interpolation function. Its support is [-2,2]
function v = keys2D(x,y)
	v=keys1D(x)*keys1D(y);
end


%Keys' cubic interpolation function. Its support is [-2,2]
function v = keys1D(x)
	x=abs(x);
	if x>=2, v=0;
	elseif x>1, v=x*(-4+x*(5-x)/2)+2; 
	else v=1+x*x*(3*x-5)/2;
	end;
end