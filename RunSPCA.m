%% ================= Data Mining =========================
% Descr:    Visualize Extended YaleDatabase B
% Students: Sanandeesh Kamat
% Adivisor: Dr. Min Xu
% School:   Rutgers University -  Statistics and Biostatistics Graduate Program 
% Source:   https://en.wikipedia.org/wiki/Eigenface
%           http://vision.ucsd.edu/~leekc/ExtYaleDatabase/ExtYaleB.html
% =========================================================================

function [] = RunSPCA()
    clc;
    close all;
    % Key Parameters
    numSubjects = 39;        % Number of Subjects Imaged
    numImgRows = 192;
    numImgCols = 168;
    numPixels   = numImgRows*numImgCols/4; % Number of Pixels per Image
    % Load Data Set
    load('YaleDB.mat');
    X = YaleDB.X;
    Y = YaleDB.Y;
    %% 1. Display the Input Data X
    meanFace = mean(X, 1);
    meanFaceImg = reshape(meanFace, numImgRows/2, numImgCols/2);
    figure; 
    subplot(1, 2, 1);
    imagesc(X);
    title('Raw Input Data Matrix X');
    ylabel('Sample');
    xlabel('Pixel Features');
    axis tight;
    subplot(1, 2, 2);
    imagesc(meanFaceImg);
    title('Mean Face \mu_{X}');
    axis tight equal;
    colormap bone;
    %% 2. Perform (Sparse) Principal Component Analysis
    % X should be centered and normalized such that the column means are 0 and the
    % column Euclidean lengths are 1.
    numSampls = size(X,1);
    X = X - repmat(meanFace, numSampls, 1); 
    magX = sqrt(sum(X.^2, 1));
    X = X./repmat(magX, numSampls, 1);
    % Inputs:
    % 1. Input Data Set [nxp]
    % 2. Input Data Set Grammian [pxp]
    % 3. Number of PCs to Produce
    % 4. Positive Ridge L2 Coeff (if L2=inf, soft-thresholding is used b/c p>>n)
    % 5. Stop Crit: if neg, desired number of non-zero loadings
    %               if pos, Upper bound on L1-norm Beta coeffs.
    %               if 0,   Regular PCA.
    % Outputs:
    % 1. SL Sparse Loadings
    % 2. SV Variances of each sparse component 
    % 3. L Loadings regular PCA
    % 4. V Variances of each PC of regular PCA
    % 5. Paths struct containing the loading paths for each component as functions of iteration number
    disp('Running Sparse 5000...');
    [SprsLd5k   SprsV5k   OrdLd OrdV PATHS] = spca_zouhastie(X, [], 3, inf, -5000);
    disp('Running Sparse 2500...');
    [SprsLd2p5k SprsV2p5k OrdLd OrdV PATHS] = spca_zouhastie(X, [], 3, inf, -2500);
    disp('Running Sparse 1000...');
    [SprsLd1k   SprsV1k   OrdLd OrdV PATHS] = spca_zouhastie(X, [], 3, inf, -1000);
    % Save Results
    % Ordinary PCA
    YaleDB_SPCA.OrdLd      = OrdLd;
    YaleDB_SPCA.OrdV       = OrdV;
    % Sparse 5k
    YaleDB_SPCA.SprsLd5k   = SprsLd5k;
    YaleDB_SPCA.SprsV5k    = SprsV5k;
    % Sparse 2.5K
    YaleDB_SPCA.SprsLd2p5k = SprsLd2p5k;
    YaleDB_SPCA.SprsV2p5k  = SprsV2p5k;
    % Sparse 1K
    YaleDB_SPCA.SprsLd1k   = SprsLd1k;
    YaleDB_SPCA.SprsV1k    = SprsV1k;
    save('YaleDB_SPCA.mat', 'YaleDB_SPCA');
    return;
end


%   @Article{GeBeKr01,
%   author =  "Georghiades, A.S. and Belhumeur, P.N. and Kriegman, D.J.",
%   title =   "From Few to Many: Illumination Cone Models for Face Recognition under
%                Variable Lighting and Pose",
%   journal = "IEEE Trans. Pattern Anal. Mach. Intelligence",
%   year =  2001,
%   volume = 23,
%   number = 6,
%   pages= "643-660"} 
