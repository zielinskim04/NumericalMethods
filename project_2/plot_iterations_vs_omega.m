function plot_iterations_vs_omega(A, b, tol, max_iter, xStart)
    % plot_iterations_vs_omega - Tworzy wykres liczby iteracji w zależności od omega
    % dla metody SOR.
    %
    % A: macierz współczynników (n x n)
    % b: wektor wyników (n x 1)
    % tol: tolerancja dla dokładności rozwiązania
    % max_iter: maksymalna liczba iteracji
    % xStart: początkowy wektor przybliżeń (n x 1)
    
    omega_values = 0:0.05:2;  
    iter_counts = zeros(size(omega_values));  
    
    % Obliczanie liczby iteracji dla każdej wartości omega
    for i = 1:length(omega_values)
        omega = omega_values(i);
        [~, iter_counts(i)] = sor_method(A, b, omega, tol, max_iter, xStart);
    end
    
    
    figure;
    plot(omega_values, iter_counts, '-o', 'LineWidth', 2);
    xlabel('\omega');
    ylabel('Liczba iteracji');
    title('Liczba iteracji metody SOR w zależności od \omega');
    grid on;
    xticks(0:0.2:2);  
    ylim([0, max(iter_counts) + 5]);  
end

