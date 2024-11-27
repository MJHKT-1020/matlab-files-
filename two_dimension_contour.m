%% defining mesh
n=500;
domain= 1;
h=domain/(n-1);

%% initialing the problem
y = zeros(n, n); 
y(1, :) = 1;  
y(end, :) = 0;
y(:, 1) = 0;  
y(:, end) = 0; 

ynew = zeros(n, n);  
ynew(1, :) = 1;  
ynew(end, :) = 0;  
ynew(:, 1) = 0;  
ynew(:, end) = 0;

error=inf;
error_req=1e-5;
iterations=0;

%% calculations
while error>error_req
    error=0;
    for i=2:(n-1)
        for j=2:(n-1)
              ynew(i,j)=0.25.*(y(i-1,j)+y(i+1,j)+y(i,j-1)+y(i,j+1));
              iterations=iterations+1;
        end
    end
    % calculating error
    for i=2:(n-1)
        for j=2:(n-1)
            error = max(error, abs(y(i,j) - ynew(i,j)));
        end
    end

    y=ynew;
end

%% plotting
x = (0:n-1) * h;  
y_vals = 1 - (0:n-1) * h; 

[X, Y] = meshgrid(x, y_vals); 
contourf(X,Y,y,12)
colorbar
