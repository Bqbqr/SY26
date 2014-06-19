function [imgPredite] = blockmatch( imgRef, imgCour, N, W)

%tabResults de la forme :
%[
%{currentBloc,msdValue,vecteurDeplacement, bestBloc, NMSE}
%        ...
%pour chaque bloc courant
%        ...
%]

% N=1;

%taille des blocs
M=2*N+1;

%param taille zone recherche
% W=5;

%taile de la zone de recherche
Z=2*W+M;

[ligne, colonne] = size(imgRef);
%nbBlocs=0;

% démarrage du timer
tic;

% imgPredite = uint8(zeros([ligne colonne]));
imgPredite=imgCour;
%Pour chaque bloc
for i = 1 : ligne / M
    for j = 1 : colonne / M
        %nbBlocs = nbBlocs + 1;
        
        %découpage du bloc courant
        blocCour = double(imgCour((i-1) * M + 1 : i * M, (j-1)*M + 1 : j*M));
        
        % Centre du bloc:
        centreX=(i-1)*M+(M+1)/2;
        centreY=(j-1)*M+(M+1)/2;

        % On a la zone qui s'étale a Z autour du centre
        debutXRech=centreX-Z;
        if debutXRech<1
            debutXRech=1;
        end

        debutYRech=centreY-Z;
        if debutYRech<1
            debutYRech=1;
        end

        finXRech=centreX+Z;
        if finXRech>ligne
            finXRech=ligne;
        end

        finYRech=centreY+Z;
        if finYRech>colonne
            finYRech=colonne;
        end

        %Parcours des blocs de la zone de recherche
        %initialisations
        msdValue=inf;
        for k = debutXRech : finXRech-M
            for l = debutYRech : finYRech-M
                blocCompare=double(imgRef(k:k+M-1,l:M+l-1));
                %calcul du critère de matching
                % Raccourci de fou pour faire la MSD!!!
                newMsdValue = (sum((blocCour-blocCompare).^2))/M^2;
                
                %on met à jour les valeurs du meilleur bloc
                if(newMsdValue<msdValue)
                    msdValue=newMsdValue;
                    bestPosX=k;
                    bestPosY=l;
                end
            end
        end
        imgPredite(bestPosX: bestPosX+M-1, bestPosY: bestPosY+M-1)=blocCour;

    end
end
%erreur de prédiction
[ NMSE, SNR ] = q1( imgRef, imgPredite );
[NMSE,toc,W]
imwrite(imgPredite,'prediction.jpg','jpg','Quality',100);
%récuperation de la durée de traitement
end
