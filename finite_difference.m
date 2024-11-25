poly_p= [3 5 7];
%% derivative
p_der= polyder(poly_p);
p_der_ival=polyval(p_der, 0);

%% fdm
x0 = 0;
h = 0.2;
der_for_diff_first = (polyval(poly_p,x0+h)-polyval(poly_p,x0))/h ;

%% bdm

der_back_diff_first = (polyval(poly_p,x0)-polyval(poly_p,x0-h))/h; 

%% cdm 
der_central_diff_first= (polyval(poly_p,x0+h)-polyval(poly_p,x0-h))/(2.*h);

