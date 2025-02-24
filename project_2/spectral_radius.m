function rho = spectral_radius(A, omega)
    % Oblicza promień spektralny macierzy iteracji SOR dla danego omega
    % Input:
    %   A - macierz współczynników
    %   omega - parametr relaksacji
    % Output:
    %   rho - promień spektralny macierzy iteracji SOR

    % Rozkład macierzy A na D, L, U
    D = diag(diag(A)); % Macierz diagonalna
    L = tril(A, -1);   % Dolny trójkąt bez przekątnej
    U = triu(A, 1);    % Górny trójkąt bez przekątnej

    % Obliczenie macierzy iteracji SOR
    T_SOR = (D - omega * L) \ ((1 - omega) * D + omega * U);
    
    % Promień spektralny
    eigenvalues = eig(T_SOR);
    rho = max(abs(eigenvalues)); % Maksymalna wartość bezwzględna
   
    
end
