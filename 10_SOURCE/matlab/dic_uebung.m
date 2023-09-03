% --------------- VARIABLES ---------------
% training set
X = [2104 1416 1534 852; % (4x4)
    5 3 3 2;
    1 2 2 1;
    45 40 30 36; ];
Theta = [1; 3; 7; 4; -2]; % (5x1)
Y = [460 232 315 178]; % (1x4)

% --------------- MAIN ---------------

%J = costFunction(Theta, featureNormalize(X), Y);    % cost function
%Theta_new = gradientDescent(featureNormalize(X), Y, Theta', 1, 20);

m = length(Y); % number of training examples
X = featureNormalize(X);


% --------------- FUNCTIONS ---------------
function J = costFunction(Theta, X, Y)
    m = length(Y); % number of training examples
    J = (1 / (2 * m)) * sum((Theta' * X - Y).^2); % cost function
end

function X = featureNormalize(X)
    X = (X - mean(X, 2)) ./ std(X, 0, 2); % feature normalization
    X = [ones(1, 4); X]; % add ones to the first row
end

function Theta = gradientDescent(X, Y, Theta, alpha, num_iters)
    m = length(Y); % number of training examples
    X = featureNormalize(X)
    while (J-Jnew) > 0.0001
        J = costFunction(Theta, X, Y);
        Theta = Theta - alpha * (1 / m) * (Theta' * X - Y) * X';
        Jnew = costFunction(Theta, X, Y);
    end
end