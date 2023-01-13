clc; clear all; format compact; close all

% set the poles and zeroes
poles = {[-5+0j], [-2+0j],[-3+4j;-3-4j],[-4+0j],[0+4j;0-4j]};
zroes = {[], [0+0j], [], [0+2j;0-2j], [0+0j]};

for t = 1:length(poles)
    z = poly(zroes{t});
    p = poly(poles{t});
    Hs = tf(z,p);

    % compute the bode
    w = linspace(0,2*pi,200);
    [mag,phase,wout] = bode(Hs,w);
    
    % plot the result
    figure('Position', [100 100 700 300]),
    tiledlayout(2,3, 'Padding', 'compact', 'TileSpacing', 'compact');

    subplot(1,2,1); hold on;
    plot(real(poles{t}), imag(poles{t}), 'bx', 'MarkerSize', 15);
    plot(real(zroes{t}), imag(zroes{t}), 'ro', 'MarkerSize', 15);
    xlim([-6 6]);
    ylim([-12 12]);
    ax = gca;
    grid minor;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    xlabel('\sigma');
    ylabel('\omega');

    mag = mag(:);
    w = [-flipud(wout); wout(2:end)];
    m = [flip(mag); mag(2:end)];
    subplot(1,2,2);
    plot(w, m);
    xlabel('\omega (rad)');
    ylabel('|H(j \omega)|');
    ax = gca;
    grid minor;
    saveas(gcf, sprintf('pole_zero_%d.png', t));
end