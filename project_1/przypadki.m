% !!!
% Funkcia licząca U'_n(x) wykorzystuje T_{n+1}(x), dlatego proszę przy
% tworzeniu wektora na jego końcu zawsze dać współczynnik równy 0
% !!!

% Przypadek 1 (zwykły, prawie)

% Wektor współczynników
a = [1,4,1,0,-2,0,4,0]

% Parametry
intervalStart = -1;  % Początek przedziału
intervalEnd = 1;     % Koniec przedziału
numSubintervals = 120;  % Liczba podprzedziałów
tol = 1e-6;            % Tolerancja błędu
maxIter = 100;         % Maksymalna liczba iteracji

% Znajdowanie miejsc zerowych
roots = findRootsInSubintervals(a, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots

% Przypadek 2 (wynik poza przedziałem)
b = [1,-2,0.5,0]

% Parametry
intervalStart = -1;  % Początek przedziału
intervalEnd = 1;     % Koniec przedziału
numSubintervals = 121;  % Liczba podprzedziałów
tol = 1e-6;            % Tolerancja błędu
maxIter = 100;         % Maksymalna liczba iteracji

roots = findRootsInSubintervals(b, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots

intervalEnd = 4;
roots = findRootsInSubintervals(b, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots

% Przypadek 3 (nie znalezienie miejsca zerowego, granica przedziału w
% miejscu zerowym, przy parzystej liczbie podziałów w tym przypadku)

c = [0,0,0,0,1,0,0,0,0,1,2,3,0]

% Parametry
intervalStart = -1;  % Początek przedziału
intervalEnd = 1;     % Koniec przedziału
numSubintervals = 120;  % Liczba podprzedziałów
tol = 1e-6;            % Tolerancja błędu
maxIter = 100;         % Maksymalna liczba iteracji

roots = findRootsInSubintervals(c, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots

numSubintervals = 121;
roots = findRootsInSubintervals(c, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots

% Przypadek 4 (za mała liczba podziałów)

d = ones(1, 27);
d(27) = 0;

% Parametry
intervalStart = -1;  % Początek przedziału
intervalEnd = 1;     % Koniec przedziału
numSubintervals = 175;  % Liczba podprzedziałów
tol = 1e-6;            % Tolerancja błędu
maxIter = 100;         % Maksymalna liczba iteracji

roots = findRootsInSubintervals(d, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots

numSubintervals = 177;
roots = findRootsInSubintervals(d, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots

% Przypadek 5 (za mały limit iteracji)

e = [0,0,0,0,1,0,0,0,0,1,2,3,0]

intervalStart = -1;  % Początek przedziału
intervalEnd = 1;     % Koniec przedziału
numSubintervals = 121;  % Liczba podprzedziałów
tol = 1e-15;            % Tolerancja błędu
maxIter = 5;         % Maksymalna liczba iteracji

roots = findRootsInSubintervals(e, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots


% Przypadek 6 (Pochodna bliska 0)


f = [1e-15,1e-15,1e-15,1e-15,1e-15,1e-15,1e-15,1e-15,1e-15,1e-15,1e-15,0]

intervalStart = -1;  % Początek przedziału
intervalEnd = 1;     % Koniec przedziału
numSubintervals = 121;  % Liczba podprzedziałów
tol = 1e-8;            % Tolerancja błędu
maxIter = 100;         % Maksymalna liczba iteracji

roots = findRootsInSubintervals(f, intervalStart, intervalEnd, numSubintervals, tol, maxIter);
roots
