# How to process the GLAC1D datasets onto a regional projected grid using `cdo`

### Prerequisites

The script below depends on `cdo` and `nco`. Make sure these are installed on your system before proceeding.


1. Download the datasets from Lev Tarasov's website:

[https://www.physics.mun.ca/~lev/dataAccess.html](https://www.physics.mun.ca/~lev/dataAccess.html)

These datasets have been downloaded and are available in this repository in the folder `data/`. 

Note that eventually we could also download and process the surface elevation datasets, which are stored separately as part of the PMIP4 input data, available from here:

[https://pmip4.lsce.ipsl.fr/doku.php/data:ice_glac_1d](https://pmip4.lsce.ipsl.fr/doku.php/data:ice_glac_1d)

2. Use the script `remap_glac1d.sh` to map the input data files to an output grid. You need to specify the arguments: domain of interest (e.g., `Laurentide`) and grid name of interest (e.g., `LIS-32KM`). 

```
./remap_glac1d.sh Laurentide LIS-32KM
```

The script will process two files (120kyr to 30kyr and 30kyr to 0kyr) for a given dataset and add the prefix to the filenames `domain_`, e.g. `LIS-32KM_`. In the case of Northern Hemisphere domains (North,Laurentide, Greenland), two datasets will be processed (nn9927 and nn9894). In the case of the Southern Hemisphere, only one dataset is processed (nn4041).
