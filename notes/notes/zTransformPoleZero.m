clc; clear all; format compact; close all

% set the poles and zeroes
poles = {[0.8+0j], [0.8+0j],[0.25+0.5j;0.25-0.5j],[0.7368 + 0.3115i;0.7368 - 0.3115i],[-0.8+0j]};
zroes = {[0+0j], [1+0j], [0+0j], [0+0j;-1+0j], [1+0j]};

for t = 1:length(poles)
    z = poly(zroes{t});
    p = poly(poles{t});
    Hs = tf(z,p, 1.0);

    % compute the bode
    w = linspace(0,pi,200);
    [mag,phase,wout] = bode(Hs,w);
    
    % plot the result
    figure('Position', [100 100 700 300]),
    tiledlayout(2,3, 'Padding', 'compact', 'TileSpacing', 'compact');

    subplot(1,2,1); hold on;
    plot(real(poles{t}), imag(poles{t}), 'bx', 'MarkerSize', 15);
    plot(real(zroes{t}), imag(zroes{t}), 'ro', 'MarkerSize', 15);
    th = 0:pi/50:2*pi;
    plot(cos(th), sin(th), 'k-.');
    xlim([-1.2 1.2]);
    ylim([-1.2 1.2]);
    ax = gca;
    grid minor;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    xlabel('Re(z)');
    ylabel('Im(z)');

    mag = mag(:);
    w = [-flipud(wout); wout(2:end)];
    m = [flip(mag); mag(2:end)];
    subplot(1,2,2);
    plot(w, m);
    xlim([-pi pi]);
    xlabel('\Omega (rad)');
    ylabel('|H(e^{j \Omega})|');
    ax = gca;
    grid minor;
    saveas(gcf, sprintf('pole_zero_%d.png', t));
end