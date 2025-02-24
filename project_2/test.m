%% Stałe parametry
tol = 1e-6; 
maxIter = 1000; 

% %% Przypadek 1 (zwykły)
disp("Przypadek 1")
% Parametry do macierzy
c1 = [0.85;0.85;0.85]; % macierz c
A1 = generate_matrix(c1); % pełna macierz
b1 = [1;2;3;4;5;6];

xStart1 = zeros(length(b1), 1);
omega1 = optimal_omega(A1); % optymalny parametr relaksacji

% Rozwązanie metodą SOR i "Matlabowo"
[x1, k1] = sor_method(A1, b1, omega1, tol, maxIter, xStart1);
x1_exact = A1 \ b1;

% Porównanie wyników z metodą SOR
disp('Porównanie wyników:');
disp(table((1:length(b1))', x1_exact, x1, abs(x1 - x1_exact), ...
    'VariableNames', {'Index', 'ExactSolution', 'SOR_Solution', 'Error'}));

% Powyższy przypadek pokazuje, że metoda działa:) 

%% Przypadek 2 (zły promień spektralny)
disp("Przypadek 2")
c2 = [0.98;0.75;0.85]; % macierz c
A2 = generate_matrix(c2); % pełna macierz
b2 = [1;2;3;4;5;6];

% Parametry potrzebne
xStart2 = zeros(length(b2), 1);
omega2 = optimal_omega(A2);

% Rozwązanie metodą SOR i "Matlabowo"
[x2,~] = sor_method(A2, b2, omega2, tol, maxIter, xStart2);
x2_exact = A2 \ b2;

% Porównanie wyników z metodą SOR
disp('Porównanie wyników:');
disp(table((1:length(b2))', x2_exact, x2, abs(x2 - x2_exact), ...
    'VariableNames', {'Index', 'ExactSolution', 'SOR_Solution', 'Error'}));
disp('Promień spektralany: ');
disp(spectral_radius(A2,omega2));


%% Przypadek 3 (zależność między promieniem spektralnym, a wartością omega, istnieje optymalna omega)
disp("Przypadek 3")
c3 = [0.77; 0.77; 0.79]; % nowy wektor c
A3 = generate_matrix(c3); % generowanie macierzy


omega_values = 1:0.01:1.99; 

% Obliczanie promienia spektralnego dla każdej wartości omega
rho_values = arrayfun(@(w) spectral_radius(A3, w), omega_values);


plot_omega_vs_radius(A3);

% Znalezienie optymalnej wartości omega
[~, idx_min] = min(rho_values);
omega_optimal = omega_values(idx_min);
disp(['Optymalna wartość omega: ', num2str(omega_optimal)]);


%% Przypadek 4 (Optymalna omega jednak nie optymalna dla tych macierzy)
disp("Przypadek 4")
c4 = [0.96;0.97;0.97;0.98;0.99;0.97]; 
A4 = generate_matrix(c4); 
b4 = [2;3;5;7;11;13;17;19;23;29;31;37]; 

% Parametry potrzebne
xStart4 = zeros(length(b4), 1);
omega4 = optimal_omega(A4);

% Zakres testowanych wartości omega
omegaValues = [0.5:0.1:1.9, omega4];


% Przygotowanie do tabeli
results4 = zeros(length(omegaValues), 2);

% Testowanie różnych wartości omega
for i = 1:length(omegaValues)
    omega = omegaValues(i);
    [~, k] = sor_method(A4, b4, omega, tol, maxIter, xStart4); 
    results4(i, :) = [omega, k]; 
end


disp('Tabela: Wartości omega a liczba iteracji:');
disp(array2table(results4, 'VariableNames', {'Omega', 'Iterations'}));

fprintf('Optymalna wartość omega: %.4f\n', omega4);


% plot_iterations_vs_omega(A4, b4, tol, maxIter, xStart4);
% plot_omega_vs_radius(A4);

%% Przypadek 5 (zmiana wektora początkowego)
disp("Przypadek 5")
c5 = [0.93;0.96;0.97;0.98;0.95;0.94;0.87]; 
A5 = generate_matrix(c5); 
b5 = [2;3;5;7;11;13;17;19;23;29;31;37;41;43]; 

% Parametry potrzebne
xStart51 = zeros(length(b5), 1);
xStart52 = -50 * ones(length(b5), 1);
xStart53 = 50 * ones(length(b5), 1);
omega5 = optimal_omega(A5);
spectral_radius(A5,omega5);

[x5, k1] = sor_method(A5, b5, omega5, tol, maxIter, xStart51);
[~, k2] = sor_method(A5, b5, omega5, tol, maxIter, xStart52);
[~, k3] = sor_method(A5, b5, omega5, tol, maxIter, xStart53);

% Dane wejściowe
xStart_labels = ["zeros", "-50 * ones", "50 * ones"];
iterations = [k1, k2, k3]; 

% Tworzenie tabeli
disp("Tabela porównawcza liczby iteracji:");
disp(table(xStart_labels', iterations', 'VariableNames', {'Start_Vector', 'Iterations'}));
disp(transpose(x5))

%% Przypadek 6 (macierz silnie dominująca na przekątnej i przypadki ujemne)
disp("Przypadek 6")
c61 = [0.99;0.98;0.98;0.98;0.99;0.99;0.98];
c62 = [0.86;0.87;0.87;0.88;0.89;0.87;0.88];
c63 = [0.76;0.79;0.77;0.795;0.79;0.79;0.79];

c64 = [0.99;0.98;0.98;0.98;0.99;0.99;0.98] * (-1);
c65 = [0.86;0.87;0.87;0.88;0.89;0.87;0.88] * (-1);
c66 = [0.76;0.79;0.77;0.795;0.79;0.79;0.79] * (-1);

A61 = generate_matrix(c61);
A62 = generate_matrix(c62);
A63 = generate_matrix(c63);

A64 = generate_matrix(c64);
A65 = generate_matrix(c65);
A66 = generate_matrix(c66);

b6 = [2;3;5;7;11;13;17;19;23;29;31;37;41;43]; 
xStart6 = zeros(length(b6), 1);

omega6 = 1.05;

[~, k4] = sor_method(A61, b6, omega6, tol, maxIter, xStart6);
[~, k5] = sor_method(A62, b6, omega6, tol, maxIter, xStart6);
[~, k6] = sor_method(A63, b6, omega6, tol, maxIter, xStart6);

[~, k7] = sor_method(A63, b6, omega6, tol, maxIter, xStart6);
[~, k8] = sor_method(A65, b6, omega6, tol, maxIter, xStart6);
[~, k9] = sor_method(A66, b6, omega6, tol, maxIter, xStart6);

spectral_radius61 = spectral_radius(A61,omega6);
spectral_radius62 = spectral_radius(A62,omega6);
spectral_radius63 = spectral_radius(A63,omega6);

spectral_radius64 = spectral_radius(A64,omega6);
spectral_radius65 = spectral_radius(A65,omega6);
spectral_radius66 = spectral_radius(A66,omega6);
% Dane do tabeli dla dodatnich
cases = ["c1", "c2", "c3"];
spectral_radii = [spectral_radius61, spectral_radius62, spectral_radius63];
iterations = [k4, k5, k6];
conds = [cond(A61),cond(A62), cond(A63)];

% Tworzenie tabeli
disp("Tabela wyników dla Przypadku 6 (dodatnie):");
disp(table(cases',  spectral_radii', conds', iterations', ...
    'VariableNames', {'Case',  'Spectral_Radius', 'Condition','Iterations'}));

% Dane do tabeli dla ujemnych
cases = ["c4", "c5", "c6"];
spectral_radii = [spectral_radius64, spectral_radius65, spectral_radius66];
iterations = [k7, k8, k9];
conds = [cond(A64),cond(A65), cond(A66)];

% Tworzenie tabeli
disp("Tabela wyników dla Przypadku 6 (ujemne):");
disp(table(cases',  spectral_radii', conds', iterations', ...
    'VariableNames', {'Case',  'Spectral_Radius', 'Condition','Iterations'}));
