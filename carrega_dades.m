%Netejem pantalla i buidem la memòria del programa
clear all;
clc;

%Missatge de benvinguda
fprintf(1, '\t*****************************************************************\n'); 
fprintf(1, '\t***------Benvingut al programa de Reconeixement de cares------***\n'); 
fprintf(1, '\t*****************************************************************\n\n');

%Carreguem la base de dades
fprintf(1, '-->Processant la càrrega de "dades.mat".........'); 
load dades.mat
fprintf(1,'OK\n\n');

%Copiem les matrius en unes noves variables per tal de tenir una còpia de l'original
fprintf(1, '-->Copiant les matrius..........................'); 
matriu_originaltest = matriu_test;
matriu_originalcares = matriu_cares;
fprintf(1,'OK\n\n');

%Descomposem en valors singulars
fprintf(1, '-->Descomposant en valors singulars.............'); 
[U,S,V] = svd(matriu_cares);
fprintf(1,'OK\n\n');

%Trasposem U i apliquem el càlcul a matriu_test
fprintf(1, '-->Transposant les matrius......................'); 
Ut = transpose(U);
matriu_test = Ut*matriu_test;
fprintf(1,'OK\n\n');

%L' usuari escull un valor de truncament
p = input('-->Escull un valor de truncament (De 0 a 100): ');
fprintf(1,'\n');
while p>100 || p<=0
    fprintf(1,'\t');
    p = input('Valor erroni! Torna a introduir-lo(De 0 a 100): ');
    fprintf(1,'\n');
end

%Es trunquen les matrius i s'aplica el càlcul a matriu_test i matriu_cares
fprintf(1, '-->Truncant valors ---> %d components..........',p); 
 
Ut = U(:,1:p); 
St = S(1:p,1:p);  
Vt = V(:,1:p);
matriu_test=matriu_test(1:p,:);
matriu_cares=St*transpose(Vt);

fprintf(1,'OK\n\n');

%Missatge de confirmació
fprintf(1, '\t\t  ---------->Dades carregades correctament<----------\n');
