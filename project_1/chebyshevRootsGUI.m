function chebyshevRootsGUI()
    % Główne okno GUI
    fig = figure('Name', 'Znajdowanie miejsc zerowych', 'Position', [500, 300, 400, 400]);

    % Pola tekstowe i etykiety
    uicontrol(fig, 'Style', 'text', 'Position', [10, 360, 100, 40], ...
        'String', 'Współczynniki (pamiętaj o 0 na końcu!):', 'HorizontalAlignment', 'left');
    coeffsEdit = uicontrol(fig, 'Style', 'edit', 'Position', [120, 360, 250, 25], ...
        'String', '1 2 3 4 5 0');

    uicontrol(fig, 'Style', 'text', 'Position', [10, 320, 100, 20], ...
        'String', 'Przedział:', 'HorizontalAlignment', 'left');
    intervalEdit = uicontrol(fig, 'Style', 'edit', 'Position', [120, 320, 100, 25], ...
        'String', '-1 1');

    uicontrol(fig, 'Style', 'text', 'Position', [10, 280, 100, 20], ...
        'String', 'Podprzedziały:', 'HorizontalAlignment', 'left');
    subintervalsEdit = uicontrol(fig, 'Style', 'edit', 'Position', [120, 280, 100, 25], ...
        'String', '131');

    uicontrol(fig, 'Style', 'text', 'Position', [10, 240, 100, 20], ...
        'String', 'Błąd:', 'HorizontalAlignment', 'left');
    tolEdit = uicontrol(fig, 'Style', 'edit', 'Position', [120, 240, 100, 25], ...
        'String', '1e-6');

    uicontrol(fig, 'Style', 'text', 'Position', [10, 200, 100, 20], ...
        'String', 'Max iteracje:', 'HorizontalAlignment', 'left');
    maxIterEdit = uicontrol(fig, 'Style', 'edit', 'Position', [120, 200, 100, 25], ...
        'String', '100');

    % Listbox do wyświetlania wyników
    uicontrol(fig, 'Style', 'text', 'Position', [10, 160, 100, 20], ...
        'String', 'Miejsca zerowe:', 'HorizontalAlignment', 'left');
    resultsBox = uicontrol(fig, 'Style', 'listbox', 'Position', [120, 60, 250, 100], ...
        'String', {}, 'Max', 2, 'Min', 0);

    % Przycisk do uruchamiania obliczeń
    uicontrol(fig, 'Style', 'pushbutton', 'Position', [250, 200, 100, 25], ...
        'String', 'Znajdź miejsca zerowe', ...
        'Callback', @findRootsCallback);

    % Callback dla przycisku
    function findRootsCallback(~, ~)
        % Pobranie danych od użytkownika
        a = str2num(coeffsEdit.String);  % Wektor współczynnikow
        interval = str2num(intervalEdit.String); % Przedział [start, end]
        numSubintervals = str2double(subintervalsEdit.String); % Liczba podprzedziałów
        tol = str2double(tolEdit.String); % Błąd
        maxIter = str2double(maxIterEdit.String); % Maksymalna liczba iteracji

        % Znajdowanie miejsc zerowych i wyłapywanie błędów
        try
            roots = findRootsInSubintervals(a, interval(1), interval(2), numSubintervals, tol, maxIter);
        catch ME
            errordlg(['Wystąpił błąd: ', ME.message], 'Błąd');
            return;
        end

        % Wyświetlanie wyników
        if isempty(roots)
            resultsBox.String = {'Brak miejsc zerowych.'};
        else
            formattedRoots = arrayfun(@(r) sprintf('%.6f', r), roots, 'UniformOutput', false);
            resultsBox.String = formattedRoots;
        end

        % Rysowanie miejsc zerowych na osi X
        figure;
        hold on;
        xline(roots, '--r', 'LineWidth', 1);
        title('Miejsca zerowe');
        xlabel('x');
        ylabel('w(x)');
        xlim(interval);
        grid on;
    end
end


