function plot_omega_vs_radius(A)
    % plot_omega_vs_radius - Tworzy wykres zależności omegi od promienia spektralnego
    % dla metody SOR.
    %
    % A: macierz współczynników (n x n)
    
    omega_values = 0:0.05:2;  % Zakres wartości omega od 0 do 2
    spectral_radii = zeros(size(omega_values));  % Inicjalizacja wektora promieni spektralnych
    
    % Obliczanie promienia spektralnego dla każdej wartości omega
    for i = 1:length(omega_values)
        omega = omega_values(i);
        spectral_radii(i) = spectral_radius(A, omega);
    end
    
    % Tworzenie wykresu
    figure;
    plot(omega_values, spectral_radii, '-o', 'LineWidth', 2);
    xlabel('\omega');
    ylabel('Promień spektralny');
    title('Zależność promienia spektralnego od omegi');
    grid on;
    xticks(0:0.2:2);  
    ylim([0, 1]);  
end
