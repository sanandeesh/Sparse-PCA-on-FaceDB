# Sparse-PCA-on-FaceDB
Principal component analysis(PCA) is a classical tool in multivariate data analysis for dimensionality reduction. It
uses vector space transformation to reduce high-dimensional data to lower dimensions. Specifically, it transforms
the input variables into principal components that corresponds to directions of maximal variance in the dataset.
Despite being widely used, ordinary PCA suffers from difficulty in interpretation of principal components, which
are linear combinations of all the original variables. Sparse principal component analysis (SPCA) solved this
problem by using LASSO(Elastic Net) to produce principal components with sparsity. In this project, we have
applied both Ordinary PCA and SPCA with the extended Yale face dataset B, and the differences in PC-loading
and PC-score separabilities were investigated. It was found that sparse PC-sores could separate images
according to lighting conditions with greater distance than ordinary PC scores.

## Directory Contents
1. Input Data **YaleDB.mat**
This file contains the [*Yale Extended Face Database B*](https://computervisiononline.com/dataset/1105138686) which was produced by Georghiades et al. 2001.
The images were parsed from their original format and stored as rows of matrix X.
The strobe lighting angle (azimuth, elevation) and subject ID are stored as rows of matrix Y.

2. Run Sparse PCA on Input Data with **RunSPCA.m* and *spca_zouhastie.m**
This function loads *YaleDB.mat* and runs SPCA using the [*SpaSM*](https://www.jstatsoft.org/article/view/v084i10) toolbox from Sjostrand et al. 2010. From SpaSM, the *spca_zouhastie.m* function is used.

3. Visualize Results with **PlotSPCALoadings.m** and **PlotSPCAScores.m**
These visualize the SPCA loadings (i.e. the sparse eigen-faces) and the input samples projected onto these sparse directions.

4. Document: **FinalReport_SPCAFaces.pdf**

### Prerequisites

This software was developed on Matlab 2016.

### Installing
No additonal installation procedures are required.

## Running the tests

Open Matlab. 
Navigate the *Current Folder* pane to the root directory of this repository. 
Run **RunSPCA.m**.
This entry point function will load the input data and run Sparse PCA.
Next, run **PlotSPCALoadings.m** and **PlotSPCAScores.m** see how increasing sparsification affects PCA.

### Example Output
Shown below are the expected outputs.


## References

Georghiades, A.S. and Belhumeur, P.N. and Kriegman,D.J. 
[*From Few to Many: Illumination Cone Models for Face Recognition under Variable Lighting and Pose*](https://ieeexplore.ieee.org/document/927464).
IEEE Trans. Pattern Anal. Mach. Intelligence. vol. 23,
no. 6, pp. 643-660, 2001

K. Sjostrand, L.H. Clemmensen, M. Mørup. [*SpaSM,a Matlab Toolbox for Sparse Analysis and Modeling*](https://www.jstatsoft.org/article/view/v084i10).
Journal of Statistical Software, x(x):xxx-xxx, 2010.

H. Zou, T. Hastie, and R. Tibshirani. 
[*Sparse Principal Component Analysis*](https://web.stanford.edu/~hastie/Papers/spc_jcgs.pdf).
Stat. 15(2):265-286, 2006.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


