function adsr = adsr_profile(s)

    s = s(:).'; % row vector!

    %% SET PARAMETERS
    t_A = 0.15;
    t_D = 0.25;
    t_S = 0.9;
    E_D = 0.9;
    E_S = 0.7;

    %% determine number of samples for each part
    N = length(s);
    N_A = round(t_A*N);
    N_D = round((t_D-t_A)*N);
    N_S = round((t_S-t_D)*N);
    N_R = round((1-t_S)*N);

    %% Generate envelope vector
    A = (0:N_A-1) / (N_A-1);
    D = (N_D-1:-1:0) / (N_D)*(1-E_D) + E_D;
    S = (N_S-1:-1:0) / (N_S)*(E_D-E_S) + E_S;
    R = (N_R-1:-1:0) / (N_R)*E_S;

    %% Different way I
    %A = (0   : 1/N_A          : 1);   A = A(1:end-1);
    %D = (1   : -(1-E_D)/N_D   : E_D); D = D(1:end-1);
    %S = (E_D : -(E_D-E_S)/N_S : E_S); S = S(1:end-1);
    %R = (E_S : -E_S/N_R       : 0);   R = R(1:end-1);

    %% Different way II
    %A = linspace(0, 1, N_A);
    %D = linspace(1, E_D, N_D);
    %S = linspace(E_D, E_S, N_S);
    %R = linspace(E_S, 0, N_R);

    envelope = [A D S R];
    adsr = s .* envelope;
