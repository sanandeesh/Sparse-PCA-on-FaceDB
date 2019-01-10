%% ================= Data Mining =========================
% Descr:    Plot the PC Score (samples projected to PC-space)
% Students: Sanandeesh Kamat
% Adivisor: Dr. Min Xu
% School:   Rutgers University -  Statistics and Biostatistics Graduate Program 
% Source:   https://en.wikipedia.org/wiki/Eigenface
%           http://vision.ucsd.edu/~leekc/ExtYaleDatabase/ExtYaleB.html
% =========================================================================

function [] = PlotSPCALoadings()
%     close all;
    clc;
    % Key Parameters
    numSubjects = 39;        % Number of Subjects Imaged
    numImgRows = 192;
    numImgCols = 168;
    numPixels   = numImgRows*numImgCols/4; % Number of Pixels per Image
    %% Load Input & Results
    % Load Data Set
    load('YaleDB.mat');
    X = YaleDB.X;
    Y = YaleDB.Y;
    % Load SPCA Results
    load('YaleDB_SPCA.mat');
    %% Visualize SPCA Eigen Faces (i.e. SPC-Loadings)
    % PC-Loadings
    OrdLd      = YaleDB_SPCA.OrdLd;      % Ordinary PCA Loadings
    SprsLd5k   = YaleDB_SPCA.SprsLd5k;   % 5000 non-zero loadings
    SprsLd2p5k = YaleDB_SPCA.SprsLd2p5k; % 2500 non-zero loadings
    SprsLd1k   = YaleDB_SPCA.SprsLd1k;   % 1000 non-zero loadings
    %% Set up Single Image Matrix
    % Regular EigenFaces
    OrdL1  = reshape(OrdLd(:,1),  numImgRows/2, numImgCols/2);
    OrdL2  = reshape(OrdLd(:,2),  numImgRows/2, numImgCols/2);
    OrdL3  = reshape(OrdLd(:,3),  numImgRows/2, numImgCols/2);
    % Sparse Loadings (5000 non-zero pixels)
    S5kL1 = reshape(SprsLd5k(:,1), numImgRows/2, numImgCols/2);
    S5kL2 = reshape(SprsLd5k(:,2), numImgRows/2, numImgCols/2);
    S5kL3 = reshape(SprsLd5k(:,3), numImgRows/2, numImgCols/2);
    % Sparse Loadings (2500 non-zero pixels)
    S2p5kL1 = reshape(SprsLd2p5k(:,1), numImgRows/2, numImgCols/2);
    S2p5kL2 = reshape(SprsLd2p5k(:,2), numImgRows/2, numImgCols/2);
    S2p5kL3 = reshape(SprsLd2p5k(:,3), numImgRows/2, numImgCols/2);
    % Sparse Loadings (1000 non-zero pixels)
    S1kL1 = reshape(SprsLd1k(:,1), numImgRows/2, numImgCols/2);
    S1kL2 = reshape(SprsLd1k(:,2), numImgRows/2, numImgCols/2);
    S1kL3 = reshape(SprsLd1k(:,3), numImgRows/2, numImgCols/2);
    AllLoadings = [OrdL1, S5kL1, S2p5kL1, S1kL1;
                   OrdL2, S5kL2, S2p5kL2, S1kL2;
                   OrdL3, S5kL3, S2p5kL3, S1kL3];

    %% Visualize the Results
    figure;
    imagesc(AllLoadings);
    title('Principal Component Loadings with Varying Sparsity', 'fontsize', 15);
    insertText(numImgRows, numImgCols);
    axis tight equal off;
    colormap hsv;
    colorbar;
    return;
end

function [] = insertText(numImgRows, numImgCols)
%     rowOffset = 170/2;
    rowOffset = 10;
    % Row 1
    text(0,              0+rowOffset,            'Reg PC-1', 'fontweight', 'bold');
    text(numImgCols/2,   0+rowOffset,            {'Sparse PC-1', '5000 Lds'}, 'fontweight', 'bold');
    text(numImgCols,     0+rowOffset,            {'Sparse PC-1', '2500 Lds'}, 'fontweight', 'bold');
    text(1.5*numImgCols, 0+rowOffset,            {'Sparse PC-1', '1000 Lds'}, 'fontweight', 'bold');
    % Row 2
    text(0,              numImgRows/2+rowOffset, 'Reg PC-2', 'fontweight', 'bold');
    text(numImgCols/2,   numImgRows/2+rowOffset, {'Sparse PC-2', '5000 Lds'}, 'fontweight', 'bold');
    text(numImgCols,     numImgRows/2+rowOffset, {'Sparse PC-2', '2500 Lds'}, 'fontweight', 'bold');
    text(1.5*numImgCols, numImgRows/2+rowOffset, {'Sparse PC-2', '1000 Lds'}, 'fontweight', 'bold');
    % Row 3
    text(0,              numImgRows+rowOffset, 'Reg PC-3', 'fontweight', 'bold');
    text(numImgCols/2,   numImgRows+rowOffset, {'Sparse PC-3', '5000 Lds'}, 'fontweight', 'bold');
    text(numImgCols,     numImgRows+rowOffset, {'Sparse PC-3', '2500 Lds'}, 'fontweight', 'bold');
    text(1.5*numImgCols, numImgRows+rowOffset, {'Sparse PC-3', '1000 Lds'}, 'fontweight', 'bold');
    return;
end