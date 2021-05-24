% IN THE NAME OF ALLAH (GOD)
% Written by Mahdi  2021 (https://gitlab.com/Mahdiali313)
% Ghos Syedel Method
% this code run correctly on MATLAB R2020b
% see more detail on (https://gitlab.com/numericalmethods1/linear-system)
clear
clc
format long

disp("enter A")
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
X = input ('');

% X is always has 3 row,1 column .and all X in each tekrar write on Xmatrix
Xmatrix = X;


k=1;
stopCondition=1;

while stopCondition == 1

i=1;

for j=1:size(Xmatrix,1) %from1 until end of rows
    X(j,1) = (1/Amatrix(i,i)) * (bmatrix(i,1)-( Amatrix(i,:) * X(:,1) - Amatrix(i,i)*X(i,1) ));
    %tagherat X dar har tekrar,dar Xmatrix zakhire mishe ta be karbar neshon dade beshe
    Xmatrix(j,k+1) = X(j,1);
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


clc
countOfTekrar=size(Xmatrix,2)-1;
disp(['tekrar :',num2str(countOfTekrar)]);
disp('see Xmatrix from matlab workspace by click on Xmatrix value');
