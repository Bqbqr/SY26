function ret = blockmatch( imgRef, imgCour )


N=2;

%taille des blocs
M=2*N+1;

%taille zone recherche
W=5;

%taile de la zone de recherche
Z=2*W+M;

[ligne, colonne] = size(imgRef);
nbBlocs=0;
msdValue=0;
bestBloc=[];

for i = 1 : ligne / M
    for j = 1 : colonne / M
        nbBlocs = nbBlocs + 1;
        blocCour = imgCour((i-1) * M + 1 : i * M, (j-1)*M + 1 : j*M);
        zoneRecherche = imgRef((i+(M/2)-1) * Z + 1 : (i+(M/2)) * Z, (j+(M/2)-1)*Z + 1 : (j+(M/2))*Z);
    %Parcours des blocs de la zone de recherche
    for k = 1 : Z
        for l = 1 : Z
            blocCompare=zoneRecherche(k : k+M, l : l+M);
            newMsdValue = msd(blocCour, blocCompare);
            
            %on met à jour la valeur du bloc le plus proche
            if(newMsdValue>msdValue)
                msdValue=newMsdValue;
                bestBloc=blocCompare;
            end
            [ NMSE, SNR ] = q1( blocCour, blocCompare )
         end
    end        
    end
end

%remplacer la valeur de retour par le vecteur de mouvement ?
ret = bestBloc;
end


%TODO
%gérer les dépassements de blocs
%corrections indices
%calcul vecteur déplacement
