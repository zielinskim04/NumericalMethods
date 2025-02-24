% Funkcja generująca przykładową macierz A o zadanej strukturze
function A = generate_matrix(c)

    % Długość wektora c
    p = length(c); 
   
    % Tworzenie wektora s
    s = sqrt(1 - c.^2); 
    
    % Stworzenie macierzy C i S
    C = diag(c); 
    S = diag(s); 
    
    % Konstrukcja 
    A = [C, S; -S, C];
    
end
