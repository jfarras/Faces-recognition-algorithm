%Netejem pantalla
clc;

%Missatge de benvinguda
fprintf(1, '\t\t\t*****************************************************************\n'); 
fprintf(1, '\t\t\t***------Benvingut al programa de Reconeixement de cares------***\n'); 
fprintf(1, '\t\t\t*****************************************************************\n\n'); 

%Missatge de confirmació
fprintf(1, '\t\t\t\t\t---------->Cercador de cares 2.0(K-NN)<----------\n\n');

%Declaració de variables
con=1;
minim=999999999;
matriu_error = ident_test;
matriu_error_id = ident_test;

%Selecció de la matriu test a cercar
fprintf(1, '\t');
id = input('Escull quina de les matrius tests vols testejar(Introdueix un numero entre 1 i 25):');
while id>25 || id<1
    fprintf(1,'\n\t');
    id = input('Valor erroni! Torna a introduir-lo(De 1 a 25): ');
    fprintf(1,'\n');
end
p1 = ident_test(id);
vec1 = matriu_test(:,p1);

%Comparació 
while (con<=375)

	vec2 = matriu_cares(:,con);
	vec3 = vec1-vec2;
	error = abs(norm(vec3));
    matriu_error(1,con) = error;
    matriu_error_id(1,con) = con;
	if (error<minim)
		minim = error;
		pos = con;
	end
	con = con + 1;
end

%Ordenació Matriu (menor error a major error)
[matriu_error_ordenada,matriu_error_index] = sort(matriu_error,'ascend');

%Truncament
matriu_error_ordenada=matriu_error_ordenada(1,1:10);
matriu_error_index=matriu_error_index(1,1:10);

%Obtenció vector de la identitat dels treballadors que s'assemblen més
for x=1:10
    ident(x)=ident_cares(matriu_error_index(x));
end

%Busquem dins el vector el treballador més repetit
element1=find(ident==ident(1));    
element1=length(element1);

element2=find(ident==ident(2));
element2=length(element2);

element3=find(ident==ident(3));
element3=length(element3);

element4=find(ident==ident(4));
element4=length(element4);

element5=find(ident==ident(5));
element5=length(element5);

element6=find(ident==ident(6));
element6=length(element6);

element7=find(ident==ident(7));
element7=length(element7);

element8=find(ident==ident(8));
element8=length(element8);

element9=find(ident==ident(9));
element9=length(element9);

element10=find(ident==ident(10));
element10=length(element10);

%Creem un vector en base als resultats anteriors
elements(1)=element1;
elements(2)=element2;
elements(3)=element3;
elements(4)=element4;
elements(5)=element5;
elements(6)=element6;
elements(7)=element7;
elements(8)=element8;
elements(9)=element9;
elements(10)=element10;

%Busquem l'element de major valor
maxim=max(elements);

%Busquem la imatge correponent a aquest treballador
boolea=0;
x=1;
while boolea==0 && x<=10
    if elements(x)==maxim
        boolea=1;
        treballadortrobat=ident(x);
    else
        x=x+1;
    end
end

i=1;
boolea=0;

while i<=375 && boolea==0
    if ident_cares(i)==treballadortrobat
        boolea=1;
        trobat=i;
    else
    i=i+1;
    end
end

%Mostrar els resultats per pantalla
figure;
im=reshape(matriu_originaltest(:,id),75,65);  
imshow(mat2gray(im))

figure;
im=reshape(matriu_originalcares(:,i),75,65); 
imshow(mat2gray(im))

%Misstage de confirmació
fprintf(1,'\n');
fprintf(1, '\t\t\t\t\t|-----------------------------------------------|\n'); 
fprintf(1, '\t\t\t\t\t|---Aqui tens els resultats del reconeixement---|\n'); 
fprintf(1, '\t\t\t\t\t|-----------------------------------------------|\n');

%Misstage d'avís
fprintf(1,'\n\t\t\t   -->Aquesta versió del sistema no funciona correctarment<--\n');
fprintf(1,'\t\t-->Consultar amb el servei tècnic de Matlab o amb José Antonio Montero<--\n\n');

