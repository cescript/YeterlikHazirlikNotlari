clear all, close all, clc;

m1 = [0 0];
s1 = [1 0; 0 1];

m2 = [0 0];
s2 = [1 0.0; 0.0 2];

m3 = [0 0];
s3 = [1 0.5; 0.5 1];

m4 = [0 0];
s4 = [2 0; 0 2];

m5 = [0 0];
s5 = [2 0.0; 0.0 1];

m6 = [0 0];
s6 = [1 -0.5; -0.5 1];

M = cat(3, m1,m2,m3,m4, m5, m6);
S = cat(3, s1,s2,s3,s4, s5, s6);

lims = [-4 4];
xsteps = linspace(lims(1),lims(2),1000);
ysteps = linspace(lims(1),lims(2),1000);
[X,Y] = meshgrid(xsteps,ysteps);

figure('Position', [100 100 300*5 200*5]),
tiledlayout(2,3, 'Padding', 'compact', 'TileSpacing', 'compact'); 
for i = 1:size(S,3)
    F = mvnpdf([X(:) Y(:)], M(:,:,i), S(:,:,i));
    F = reshape(F,length(ysteps),length(xsteps));
    nexttile;
    im = imagesc(xsteps,ysteps,F);
    im.AlphaData = .7;
    hold on;
    contour(xsteps,ysteps,F);
    title(sprintf('X = [%2.1f %2.1f], S = [%2.1f %2.1f; %2.1f %2.1f]', M(1,1,i),M(1,2,i), S(1,1,i),S(1,2,i),S(2,1,i),S(2,2,i)));
    axis equal;
    axis xy;
    xlim([lims(1),lims(2)]);
    ylim([lims(1),lims(2)]);
end
copygraphics(gcf);


