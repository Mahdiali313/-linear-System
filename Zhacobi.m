% IN THE NAME OF ALLAH (GOD)
% Written by Mahdi  2021 (https://gitlab.com/Mahdiali313)
% Zhacobi method
% this code run correctly on MATLAB R2020b
clear
clc
format long

disp("enter A (matrix ghotri vared konid!)")
disp('like [20 1 -1; 1 -10 1; -1 1 10]')
Amatrix = input ('');

%if matrix ghaleb ghotri nabashad error mide !
for ii=1:size(Amatrix,1)
   if abs(Amatrix(ii,ii)) <= abs( sum(Amatrix(ii,:))- Amatrix(ii,ii))
       error('matrix ghaleb ghotri nist!')
   end
end


disp("enter b")
disp('for example [17;13;18]')
bmatrix = input ('');

disp("enter epselon (shart tavaghof)")
disp('like 0.5*10^(-3)')
epselon = input ('');

disp("enter X0 matrix")
disp('same as [0;0;0]')
%new X(k) store in new column
Xmatrix = input ('');

k=1;
stopCondition=1;

while stopCondition == 1
    
    i=1;

%calcuate x_i(k+1)
%AX-a_ii --> b_i - (AX-a_ii) --> 1/a_ii * [b_i - (AX-a_ii)] = x_i(k+1)
for j=1:size(Xmatrix,1) %from1 until end of rows
    Xmatrix(j,k+1)=(1/Amatrix(i,i)) * (bmatrix(i,1)-( Amatrix(i,:) * Xmatrix(:,k) - Amatrix(i,i)*Xmatrix(i,k) ));
    i=i+1;
end

    %calculate Error and check stopcondition to puse loop
    ee=0;%this value for detect how many of rows of xmatrix less than epselon
    %and if ee = number of xmatrix rows then loop myst be stop!
    for nn=1:size(Xmatrix,1)
        Ematrix(nn,1)=abs(Xmatrix(nn,k+1)-Xmatrix(nn,k)) < epselon;
        if Ematrix(nn,1) == 1
            ee=ee+1;
        end
    end
    %and if ee = number of xmatrix rows then loop myst be stop!
    if ee == size(Xmatrix,1)
        stopCondition=0;
    end
    
    k=k+1;
end


countOfTekrar=size(Xmatrix,2)-1;
disp(['tekrar :',num2str(countOfTekrar)]);
disp('see Xmatrix from matlab workspace by click on Xmatrix value');
