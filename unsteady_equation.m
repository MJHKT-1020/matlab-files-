%% defining the mesh
n=50;
domain=1;
h=domain/(n-1);
dt=0.0001;
alpha=dt/(h.^2);

%% initialing the problem
y(n,n)=0;
y(1,:)=1;

ynew(n,n)=0;
ynew(1,:)=1;

error=1;
error_req=1e-6;
iterations=0;
error_track=0;

%% calculation
while error>error_req
    for i=2:n-1
        for j=2:n-1
            ynew(i,j)= y(i,j)+alpha.*(y(i-1,j)+y(i+1,j)+y(i,j-1)+y(i,j+1)-4*y(i,j));
        end
    end
    iterations=iterations+1;

    error=0;
    for i=2:n-1
        for j=n-1
            error=error+abs(y(i,j)-ynew(i,j));
            error_track(iterations)=error;
        end
    end
    if rem(iterations,1000)==0
        iterations
        error
    end

    y=ynew;
end


%% plotting
x=((1:n)-1 ).*h;
y_vals=1-((1:n)-1).*h;
[X,Y]= meshgrid(x,y_vals);

contourf(X,Y,y,12);
colorbar



