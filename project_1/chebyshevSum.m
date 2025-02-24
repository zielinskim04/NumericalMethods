function [sumValueDiff, sumDerivDiff] = chebyshevSum(a, x)
    % chebyshevSum - Funkcja oblicza sumę różnic T_n(x)-U_n(x)
    % i T'_n(x)-U'_n(x), przemnożonych przez współczynniki a_i.
    %
    % Argumenty:
    % a - wektor współczynników o długości n+1
    % x - wartość skalarna, dla której obliczamy różnice
    %
    % Zwraca:
    % sumValueDiff - suma wartości różnic T_n(x)-U_n(x) przemnożonych przez a_i
    % sumDerivDiff - suma pochodnych różnic T'_n(x)-U'_n(x) przemnożonych przez a_i

    % Ustalenie długości wielomianów
    n = length(a) - 1;

    % Wywołanie funkcji, która liczy różnice T_n(x)-U_n(x) oraz T'_n(x)-U'_n(x)
    [valueDiff, derivDiff] = chebyshevDiffAndDerivative(n, x);

    % Przemnożenie każdej różnicy przez współczynnik a_i
    weightedValueDiff = a(:) .* valueDiff; % wartości różnic przemnożone przez współczynniki
    weightedDerivDiff = a(:) .* derivDiff; % pochodne różnic przemnożone przez współczynniki

    % Sumowanie wyników
    sumValueDiff = sum(weightedValueDiff);
    sumDerivDiff = sum(weightedDerivDiff);
end
