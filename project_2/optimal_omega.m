function omega_opt = optimal_omega(A)
    % Oblicza optymalną wartość parametru omega dla metody SOR
    %
    % Input:
    %   A - rozpatrywana macierz
    % Output:
    %   omega_opt - Optymalna wartość omega


    % Decompozycja A na D, L, U
    D = diag(diag(A));          % Przekątna macierzy A
    L = tril(A, -1);            % Dolny trójkąt z macierzy A
    U = triu(A, 1);             % Górny trójkąt z macierzy A


    % Policzenie macierzy iteracji Jacobiego
    T_JAC = -D^(-1) * (L + U);

    % Policzenie wartości własnych i promienia spektralnego
    eigVals = eig(T_JAC);
    spectral_radius_jac = max(abs(eigVals));

    %Sprawdzenie poprawności promienia spektralnego
    if spectral_radius_jac < 0 || spectral_radius_jac > 1
        error('Promień spektralny musi być w zakresie (0, 1).');
    end

    % Obliczenie optymalnej wartości omega
    omega_opt = 2 / (1 + sqrt(1 - spectral_radius_jac^2));

end

