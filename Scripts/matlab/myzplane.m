function myzplane(b, a)
    % myzplane - Modification to the matlab zplane function.
    %
    % Syntax
    %   myzplane(b, a)
    %
    % Input Arguments
    %   b - Numerator coefficients of Transferfunction
    %   a - Denominator coefficients of Transferfunction
    %
    % Source
    %   https://de.mathworks.com/matlabcentral/answers/2042466-change-intensity-of-zplane-figure

    z = roots(b);
    p = roots(a);
    zplane(z, p);
    getgca = get(gca);
    Kids = getgca.Children;
    hold on
    plot(Kids(1).XData, Kids(1).YData, ':', 'LineWidth', 2)
    plot(Kids(2).XData, Kids(2).YData, 'xr', 'LineWidth', 3, 'MarkerSize', 16)
    plot(Kids(3).XData, Kids(3).YData, 'og', 'LineWidth', 3, 'MarkerSize', 16)

    % Region of Convergence
    roc = max(abs(p));
    phi = linspace(0, 2*pi, 50);
    plot(roc*cos(phi), roc*sin(phi), 'b--', 'LineWidth', 2);

    title('Pol-Nullstellen Diagramm')
    xlabel('Re z')
    ylabel('Im z')
    set(gca, 'FontSize', 20)
    hold off
    axis([[-1 1]*1.5  [-1 1]*1.25])
    grid on
end
