function root = newtonChebyshev(a, x0, tol, maxIter)
    % newtonChebyshev - Znajduje miejsce zerowe funkcji przy użyciu metody Newtona.
    %
    % Argumenty:
    % a - wektor współczynników wielomianów Czebyszewa
    % x0 - początkowe przybliżenie miejsca zerowego (punkt startowy)
    % tol - tolerancja błędu (warunek zakończenia)
    % maxIter - maksymalna liczba iteracji
    %
    % Zwraca:
    % root - znalezione miejsce zerowe funkcji lub NaN, jeśli metoda zawiodła

    % Początkowe przybliżenie
    x = x0; 
    for iter = 1:maxIter
        % Obliczenie wartości funkcji i jej pochodnej w punkcie x
        [fValue, dValue] = chebyshevSum(a, x);

        % Sprawdzenie czy pochodna nie jest bliska zeru
        if abs(dValue) < 1e-10
            warning('Pochodna jest zbyt bliska zeru.');
            root = NaN; 
            return;
        end

        % Aktualizacja przybliżenia: x_{k+1} = x_k - f(x_k)/f'(x_k)
        xNew = x - fValue / dValue;

        % Sprawdzenie warunku zakończenia (dokładność przybliżenia jako różnica między dwoma kolejnnymi x)
        if abs(xNew - x) < tol
            root = xNew;
            %fprintf('Metoda Newtona zakończyła się po %d iteracjach.\n', iter);
            return;
        end

        % Aktualizacja punktu
        x = xNew;
    end

    % Jeśli nie znaleziono rozwiązania w określonej liczbie iteracji
    warning('Nie znaleziono miejsca zerowego w %d iteracjach.', maxIter);
    root = NaN; 
end


