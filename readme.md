# How to process the GLAC1D datasets onto a regional projected grid using `cdo`

1. Download the datasets from Lev Tarasov's website:

[https://www.physics.mun.ca/~lev/dataAccess.html](https://www.physics.mun.ca/~lev/dataAccess.html)

These datasets have been downloaded and are available in this repository in the folder `data/`. 

Note that eventually we could also download and process the surface elevation datasets, which are stored separately as part of the PMIP4 input data, available from here:

[https://pmip4.lsce.ipsl.fr/doku.php/data:ice_glac_1d](https://pmip4.lsce.ipsl.fr/doku.php/data:ice_glac_1d)

2. Use the script `remap_glac1d.sh` to map the input data files to an output grid. You need to specify the arguments: domain of interest (e.g., `Laurentide`) and grid name of interest (e.g., `LIS-32KM`). 

```
./remap_glac1d.sh Laurentide LIS-32KM
```
