function [x, iter_count] = sor_method(A, b, omega, tol, max_iter, xStart)
    % sor_method - Metoda SOR do rozwiązywania układu równań Ax = b
    %
    % INPUT:
    % A: macierz współczynników (n x n)
    % b: wektor wyników (n x 1)
    % omega: parametr relaksacji
    % tol: tolerancja dla dokładności rozwiązania
    % max_iter: maksymalna liczba iteracji
    % xStart: początkowy wektor przybliżeń (n x 1)
    %
    % OUTPUT:
    % x: wektor rozwiązania (n x 1) lub NaN, jeśli nie osiągnięto zbieżności
    % iter_count: liczba wykonanych iteracji lub -1, jeśli nie osiągnięto zbieżności

    n = length(b);         
    x = xStart;            
    iter_count = 0;        

    while iter_count < max_iter
        x_old = x;         

        
        for i = 1:n
            sum1 = A(i, 1:i-1) * x(1:i-1);      
            sum2 = A(i, i+1:n) * x_old(i+1:n);  
            
            
            x(i) = (1 - omega) * x_old(i) + (omega / A(i, i)) * (b(i) - sum1 - sum2);
        end

        iter_count = iter_count + 1; 

        % Sprawdzenie kryterium zbieżności (norma maksimum)
        if norm(x - x_old, inf) < tol
            return; 
        end
    end

    % Jeśli nie osiągnięto zbieżności w zadanej liczbie iteracji
    x = NaN * ones(n, 1);  
    iter_count = -1;       
end




