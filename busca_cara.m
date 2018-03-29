%Netejem pantalla
clc;

%Missatge de benvinguda
fprintf(1, '\t\t\t*****************************************************************\n'); 
fprintf(1, '\t\t\t***------Benvingut al programa de Reconeixement de cares------***\n'); 
fprintf(1, '\t\t\t*****************************************************************\n\n'); 

%Missatge de confirmació
fprintf(1, '\t\t\t\t\t   ---------->Cercador de cares 1.0<----------\n\n');

%Declaració de variables
cont=1;
min=999999999;

%Selecció de la matriu test a cercar
id = input('  -->Escull quina de les matrius tests vols testejar(Introdueix un numero entre 1 i 25):');
while id>25 || id<1
   fprintf(1,'\n\t');
   id = input('Valor erroni! Torna a introduir-lo(De 1 a 25): ');
   fprintf(1,'\n');
end
numtreballador= ident_test(id);
vectreballador = matriu_test(:,id);

%Comparació 
for cont=1:375
    veccomparacio = matriu_cares(:,cont);
	vecdiferencia = vectreballador-veccomparacio;
	diferencia = abs(norm(vecdiferencia,2));
	if (diferencia<min)
		min = diferencia;
		pos = cont;
    end
end

%Mostrar els resultats per pantalla
figure;
im=reshape(matriu_originaltest(:,id),75,65);  
imshow(mat2gray(im))

figure;
im=reshape(matriu_originalcares(:,pos),75,65); 
imshow(mat2gray(im))

%Misstage de confirmació
fprintf(1,'\n');
fprintf(1, '\t\t\t\t\t|-----------------------------------------------|\n'); 
fprintf(1, '\t\t\t\t\t|---Aqui tens els resultats del reconeixement---|\n'); 
fprintf(1, '\t\t\t\t\t|-----------------------------------------------|\n');

%Misstage d'avís en cas necessari
if min>=1600
    fprintf(1,'\n-->La imatge més semblant és aquesta, però el treballador no es troba a la base de dades del sistema<--\n\n');
end

%Només s'equivoca en la imatge 7, però preferim no deixar passar en cas de dubte que no permetre el pas a una persona que dubtes

