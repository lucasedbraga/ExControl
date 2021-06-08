clear all
clc
close all

% Questão 1
fprintf('\n QUESTÃO 1 \n')
fprintf('##################################################### \n')

g1 = tf(1,[1 0 0]);
g2 = tf(50,[1 1]);
g3 = tf([1 0],1);
g4 = tf(2,[1 0]);
g5 = tf(2);
g6 = tf(1);
g_unit = tf(1,1);



system = append(g_unit,g1,g2,g3,g4,g5,g6,g_unit);
Q = [1 0 0 0 0 0 0 0;
       2 1 -7 0 0 0 0 0 ;
       3 2 -5 0 0 0 0 0; 
       4 3 0 0 0 0 0 0;
       5 3 0 0 0 0 0 0;
       6 3 0 0 0 0 0 0;
       7 4 -6 0 0 0 0 0;
       8 7 0 0 0 0 0 0];
   
   input = 1; output=8;
   
   TF = connect(system,Q,input,output);
   TF = tf(TF);
   TF = minreal(TF)
   
fprintf('##################################################### \n')
fprintf('\n \n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   


% Questão 2
fprintf('\n QUESTÃO 5 \n')
fprintf('##################################################### \n')
g1 = tf(1,[1 7]);
g2 = tf(50,[1 2 3]);
g3 = tf(1,[1 4]);
g4 = tf(1,[1 0]);
g5 = tf(5,[1 7]);
g6 = tf(1,[1 5 10]);
g7 = tf(3,[1 2]);
g8 = tf(1,[1 6]);
g_unit = tf(1,1);



system = append(g_unit,g1,g2,g3,g4,g5,g6,g7,g8,g_unit);
Q = [1 0 0 0 0 0 0 0 0 0;
       2 1 -3 -6 0 0 0 0 0 0;
       3 2 9 0 0 0 0 0 0 0; 
       4 2 9 0 0 0 0 0 0 0;
       5 2 9 0 0 0 0 0 0 0;
       6 4 5 -7 0 0 0 0 0 0;
       7 8 0 0 0 0 0 0 0 0;
       8 4 5 -7 0 0 0 0 0 0;
       9 8 0 0 0 0 0 0 0 0;
       10 9 0 0 0 0 0 0 0 0];
   
   input = 1; output=8;
   
   TF = connect(system,Q,input,output);
   TF = tf(TF);
   TF = minreal(TF)
   
fprintf('##################################################### \n')
fprintf('\n \n')
    
