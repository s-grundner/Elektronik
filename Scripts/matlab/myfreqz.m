function myfreqz(b, a)
    freqz(b, a, 2001, 'whole')

    % Increase Fontsize
    ax = findall(gcf, 'Type', 'axes');
    for i = 1:length(ax)
        set(ax(i), 'FontSize', 20);
    end
end
