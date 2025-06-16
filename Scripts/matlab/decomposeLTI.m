function [b_min, a_min, b_all, a_all] = decomposeLTI(b_h, a_h)
% decomposeLTI - Takes in a stable system and splits it into Allpass and a Minimalphase parts, such that H = H_min*H_all.
% If the input system is unstable, an error is returned to the console window and all coefficients return 0.
%
%   Syntax
%     [b_min, a_min, b_all, a_all] = decomposeLTI(b_h, a_h)
%  
%   Input Arguments
%     b_h - Transferfunction numerator coefficients vector
%     a_h - Transferfunction denominator coefficients vector
%  
%   Output Arguments
%     b_min - Numerator coefficients of Minimalphase Transferfunction
%     a_min - Denominator coefficients of Minimalphase Transferfunction
%     b_all - Numerator coefficients of Allpass Transferfunction
%     a_all - Denominator oefficients of Allpass Transferfunction

    [z, p] = tf2zp(b_h, a_h);

    % Test for instability 
    if any(abs(p) >= 1) 
        disp("System is unstable")
        b_min = 0;
        a_min = 0;
        b_all = 0;
        a_all = 0;
        return
    end

    z_min = z;
    p_all = zeros(length(z), 1);
    z_all = zeros(length(z), 1);

    for i = 1:length(z)
        if abs(z(i)) >= 1
            z_min(i) = 1 / conj(z(i)); % conjugate reciprocal
            p_all(i) = z_min(i); % compensate mirroring
            z_all(i) = z(i); % save zero outside UC as allpass zero
        end
    end

    b_all = poly(z_all);
    a_all = poly(p_all);

    % Degree of allpass numerator polynomial is last nonzero index of b_all
    poly_deg = find(b_all, 1, 'last');
    gain = b_all(poly_deg);

    % Normalize gain
    b_all = b_all / gain;
    b_min = poly(z_min) * gain;
    a_min = poly(p);

end
