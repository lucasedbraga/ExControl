clear 
close all
clc


% criando as funções de transferência dos blocos individuais (objetos)
G1 = tf(1,[1 1]);
G2 = tf(1,[1 0]);
G3 = tf([1 0],[1 2]);
G4 = tf(1,[1 1]);
H = tf(1,[1 0]);
G_unit = tf(1,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redução do diagrama de blocos usando as funções series, parallel e
% feedback, da Toolbox Control Systems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1ª etapa) passagem do bloco G2 para a saída do somador à sua direita (feita "à mão")

% 2ª etapa) aplicação das regras do paralelo nos blocos G1 e G3/G2, e
% aplicação da regra da realimentação nos blocos G2 e G4
aux1 = parallel(G1,G3/G2);
aux2 = feedback(G2,G4,-1);
aux2 = minreal(aux2);

% 3ª etapa) aplicação da regra da cascata entre G1+G3/G2 e G2/(1+G2G4)
aux3 = series(aux1,aux2);

% 4ª etapa) aplicação da regra da realimentação entre os blocos
% (G1G2+G3)/(1+G2G4) e H
aux4 = feedback(aux3,H,-1);
T1 = minreal(aux4);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redução do diagrama de blocos usando as funções append e connect, da
% Toolbox Control Systems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
System = append(G_unit,G1,G2,G3,G4,H,G_unit);
input = 1; output = 7;

Q = [1 0 0 0 0 0 0;
   2 1 -6 0 0 0 0;
   3 2 -5 0 0 0 0;
   4 1 -6 0 0 0 0;
   5 3 4 0 0 0 0;
   6 3 4 0 0 0 0;
   7 3 4 0 0 0 0];

T2 = connect(System,Q,input,output);
T2 = tf(T2); T2 = minreal(T2)
