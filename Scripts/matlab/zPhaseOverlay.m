function zPhaseOverlay(b, a)
    % zPhaseOverlay Plots an overlay of the phase spectrum above the unit circle in the complex z-Plane. Poles and zeros are displayed aswell.
    %
    % Syntax
    %   zPhaseOverlay(b, a)      
    %
    % Input Arguments
    %   b - Numerator coefficients of Transferfunction
    %   a - Denominator coefficients of Transferfunction
    %
    % Source
    %   https://de.mathworks.com/help/signal/ref/zplane.html

    z = roots(b);
    p = roots(a);
    [hw, fw, phi] = zerophase(b, a, 1024, "whole");

    plot3(cos(fw), sin(fw), phi, 'LineWidth', 2)
    hold on
    plot3(cos(fw), sin(fw), zeros(size(fw)) ,'--', 'LineWidth', 2)
    plot3(real(z), imag(z), zeros(size(z)) ,'o', 'LineWidth', 2, 'MarkerSize', 16)
    plot3(real(p), imag(p), zeros(size(p)) ,'x', 'LineWidth', 2, 'MarkerSize', 16)
    hold off

    xlabel('Re z')
    ylabel('Im z')
    zlabel('\angle H(e^{j\Omega})')
    title('Phasengang über der z-Ebene')
    set(gca, 'FontSize', 20)
    view(45,45)
    grid on
end
