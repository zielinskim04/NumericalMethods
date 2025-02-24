function roots = findRootsInSubintervals(a, intervalStart, intervalEnd, numSubintervals, tol, maxIter)
    % findRootsInSubintervals - Znajduje wszystkie miejsca zerowe funkcji
    % na zadanym przedziale, dzieląc go na równoodległe podprzedziały
    % i stosując metodę Newtona.
    %
    % Argumenty:
    % a - wektor współczynników wielomianów Czebyszewa
    % intervalStart - początek przedziału
    % intervalEnd - koniec przedziału
    % numSubintervals - liczba podprzedziałów
    % tol - tolerancja błędu (warunek zakończenia)
    % maxIter - maksymalna liczba iteracji
    %
    % Zwraca:
    % roots - wektor z miejscami zerowymi funkcji

    % Obliczenie długości jednego podprzedziału
    subintervalLength = (intervalEnd - intervalStart) / numSubintervals;
    
    % Wektora na miejsca zerowe
    roots = [];  
    
    % Przejście przez wszystkie podprzedziały
    for i = 1:numSubintervals
        % Wyznaczenie punktów końcowych aktualnego podprzedziału
        xStart = intervalStart + (i-1) * subintervalLength;
        xEnd = intervalStart + i * subintervalLength;
        
        % Środek podprzedziału jako punkt początkowy dla metody Newtona
        x0 = (xStart + xEnd) / 2;
        
        % Sprawdzenie, czy w tym podprzedziale istnieje miejsce zerowe
        % Jeżeli funkcja zmienia znak, można przyjąć, że w przedziale jest miejsce zerowe
        [fStart, ~] = chebyshevSum(a, xStart);
        [fEnd, ~] = chebyshevSum(a, xEnd);
        
        % Jeśli funkcja zmienia znak, wywołujemy metodę Newtona
        if fStart * fEnd < 0
            try
                % Obliczenie miejsca zerowego metodą Newtona
                root = newtonChebyshev(a, x0, tol, maxIter);
                roots = [roots, root];  % Dodanie miejsca zerowego do wyniku
            catch
                % Jeśli nie udało się znaleźć miejsca zerowego, przechodzimy dalej
                continue;
            end
        end
    end
end
