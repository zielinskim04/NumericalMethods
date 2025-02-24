function [valueDiff, derivDiff] = chebyshevDiffAndDerivative(n, x)
    % chebyshevDiffAndDerivative - Funkcja oblicza zarówno różnice T_n(x)-U_n(x),
    % jak i różnice pochodnych T'_n(x)-U'_n(x) dla wszystkich stopni od 0 do n.
    %
    % Argumenty:
    % n - maksymalny stopień wielomianów Czebyszewa
    % x - wartość skalarna, dla której obliczamy różnice
    %
    % Zwraca:
    % valueDiff - wektor różnic T_0(x)-U_0(x), ..., T_n(x)-U_n(x)
    % derivDiff - wektor różnic T'_0(x)-U'_0(x), ..., T'_n(x)-U'_n(x)

    % Wstępne tworzenie wektorów
    T = zeros(n + 2, 1);      % Wielomiany T_n(x) do n+1 (potrzebne dla U'_n)
    U = zeros(n + 1, 1);      % Wielomiany U_n(x)
    T_deriv = zeros(n + 1, 1);% Pochodne T'_n(x)
    U_deriv = zeros(n + 1, 1);% Pochodne U'_n(x)

    % Warunki początkowe dla wielomianów
    T(1) = 1;        
    U(1) = 1;        

    if n >= 1
        T(2) = x;    
        U(2) = 2 * x;
    end

    % Rekurencyjne obliczanie wielomianów
    for k = 2:n
        T(k + 1) = 2 * x * T(k) - T(k - 1); 
        U(k + 1) = 2 * x * U(k) - U(k - 1); 
    end

    % Obliczanie pochodnych T'_n(x) i U'_n(x)
    for k = 1:n+1
        if k == 1
            T_deriv(k) = 0; 
            U_deriv(k) = 0; 
        elseif k == 2
            T_deriv(k) = 1; 
            U_deriv(k) = 2; 
        else
            %Rekurencyjne wyznaczanie T_deriv(k)
            T_deriv(k) = (k - 1) * U(k - 1);

            % U'_n(x) = ((n+1)T_{n+1}(x) - xU_n(x)) / (x^2 - 1)
            % Trzeba prawdzić, czy nie ma dzielenia przez 0
            denom = x^2 - 1;
            if abs(denom) < 1e-10
                U_deriv(k) = NaN; 
            else
                U_deriv(k) = (k * T(k + 1) - x * U(k)) / denom;
            end
        end
    end

    % Obliczenie różnic T_n(x) - U_n(x) oraz T'_n(x) - U'_n(x)
    valueDiff = T(1:n+1) - U;
    valueDiff(1) = 1; % Ponieważ pierwszy wyraz nie zależy od tej różnicy 
    derivDiff = T_deriv - U_deriv;
    derivDiff(1) = 0;
end
