% All in one file implementation of mandelbrot program
function Assignment_mandelbrot_1 %ok<FNDEF>
% Initialize width and height.
   width = 80;
   height = 43;
   leftUp = -2 + 1.5i; rightButtom = 0.7 - 1.5i;
   deltaReel = real(rightButtom - leftUp)/width;
   deltaImag = 1i*imag(leftUp - rightButtom)/height
% Compute initial position: left upper corner.
   z0 = leftUp + deltaReel/2-deltaImag/2;
      for k1 = 1:height
          for k2 = 1:width
              if Mandelbrot(z0)
                  fprintf('*');
              else
                  fprintf(' ');
              end
% Update real part of z
              z0 = z0+deltaReel;
          end
% Print newline and update z imag
   fprintf('\n');
    z0 = real(leftUp)+deltaReel/2+1i*imag(z0)-deltaImag;
       end
end

    function b = Mandelbrot(c)
             maxIter = 100;
    z = 0;
    b = true;

    for k = 1:maxIter
        z = z^2 + c;
        if abs(z) > 2
            b = false;
            break;
        end
    end
    end
    %my code