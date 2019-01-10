%% ================= Data Mining =========================
% Descr:    Plot the PC Score (samples projected to PC-space)
% Students: Sanandeesh Kamat
% Adivisor: Dr. Min Xu
% School:   Rutgers University -  Statistics and Biostatistics Graduate Program 
% Source:   https://en.wikipedia.org/wiki/Eigenface
%           http://vision.ucsd.edu/~leekc/ExtYaleDatabase/ExtYaleB.html
% =========================================================================

function [] = PlotSPCAScores()
    close all;
    clc;
    %% Load Input & Results
    % Load Data Set
    load('YaleDB.mat');
    X = YaleDB.X;
    Y = YaleDB.Y;
    % Load SPCA Results
%     load('YaleDB_SPCA_PreNorm.mat');
    load('YaleDB_SPCA.mat');
    % PC-Loadings
    OrdLd      = YaleDB_SPCA.OrdLd;      % Ordinary PCA Loadings
    SprsLd5k   = YaleDB_SPCA.SprsLd5k;   % 5000 non-zero loadings
    SprsLd2p5k = YaleDB_SPCA.SprsLd2p5k; % 2500 non-zero loadings
    SprsLd1k   = YaleDB_SPCA.SprsLd1k;   % 1000 non-zero loadings
    %% Compute SPC-Scores
    pointsize = 18;
    OrdScores      = X*OrdLd;
    SprsScores5k   = X*SprsLd5k;
    SprsScores2p5k = X*SprsLd2p5k;
    SprsScores1k   = X*SprsLd1k;
    %% PC1 v PC2 Azimuth
    figure;
    % Ordinary PCA
    subplot(1, 4, 1);
    scatter(OrdScores(:,1), OrdScores(:,2), pointsize, Y(:,2), 'filled');
    title({'Ordinary PC Scores', '8064 Loadings'}, 'fontsize', 15);
    xlabel('1st PC', 'fontweight', 'bold');
    ylabel('2nd PC', 'fontweight', 'bold');
    grid on;
    axis tight equal;
    % Sparse PCA 5000 Lds
    subplot(1, 4, 2);
    scatter(SprsScores5k(:,1), SprsScores5k(:,2), pointsize, Y(:,2), 'filled');
    title({'Sparse PC Scores', '5000 Loadings'}, 'fontsize', 15);
    xlabel('1st PC', 'fontweight', 'bold');
    ylabel('2nd PC', 'fontweight', 'bold');
    grid on;
    axis tight equal;
    % Sparse PCA 5000 Lds
    subplot(1, 4, 3);
    scatter(SprsScores2p5k(:,1), SprsScores2p5k(:,2), pointsize, Y(:,2), 'filled');
    title({'Sparse PC Scores', '2500 Loadings'}, 'fontsize', 15);
    xlabel('1st PC', 'fontweight', 'bold');
    ylabel('2nd PC', 'fontweight', 'bold');
    grid on;
    axis tight equal;
    % Sparse PCA 5000 Lds
    subplot(1, 4, 4);
    scatter(SprsScores1k(:,1), SprsScores1k(:,2), pointsize, Y(:,2), 'filled');
    title({'Sparse PC Scores', '1000 Loadings'}, 'fontsize', 15);
    xlabel('1st PC', 'fontweight', 'bold');
    ylabel('2nd PC', 'fontweight', 'bold');
    grid on;
    axis tight equal;
    colormap jet;    
   
    
    %% PC1 v PC3 Elevation
    figure;
    % Ordinary PCA
    subplot(1, 4, 1);
    scatter(OrdScores(:,1), OrdScores(:,3), pointsize, Y(:,3), 'filled');
    title({'Ordinary PC Scores', '8064 Loadings'}, 'fontsize', 15);
    xlabel('1st PC', 'fontweight', 'bold');
    ylabel('3rd PC', 'fontweight', 'bold');
    grid on;
    axis tight equal;
    % Sparse PCA 5000 Lds
    subplot(1, 4, 2);
    scatter(SprsScores5k(:,1), SprsScores5k(:,3), pointsize, Y(:,3), 'filled');
    title({'Sparse PC Scores', '5000 Loadings'}, 'fontsize', 15);
    xlabel('1st PC', 'fontweight', 'bold');
    ylabel('3rd PC', 'fontweight', 'bold');
    grid on;
    axis tight equal;
    % Sparse PCA 5000 Lds
    subplot(1, 4, 3);
    scatter(SprsScores2p5k(:,1), SprsScores2p5k(:,3), pointsize, Y(:,3), 'filled');
    title({'Sparse PC Scores', '2500 Loadings'}, 'fontsize', 15);
    xlabel('1st PC', 'fontweight', 'bold');
    ylabel('3rd PC', 'fontweight', 'bold');
    grid on;
    axis tight equal;
    % Sparse PCA 5000 Lds
    subplot(1, 4, 4);
    scatter(SprsScores1k(:,1), SprsScores1k(:,3), pointsize, Y(:,3), 'filled');
    title({'Sparse PC Scores', '1000 Loadings'}, 'fontsize', 15);
    xlabel('1st PC', 'fontweight', 'bold');
    ylabel('3rd PC', 'fontweight', 'bold');
    grid on;
    axis tight equal;
    colormap jet;
    return;
end