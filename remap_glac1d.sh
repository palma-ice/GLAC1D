#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Two arguments must be given: domain grid_name" >&2
    exit 2
fi

# Define user options

domain=$1               # Laurentide, North, Greenland, Antarctica
grid_name=$2            # LIS-32KM, etc. - see grid files in maps/

# Determine cdo grid description file for our choices
grid_desc_file=maps/grid_${grid_name}.txt

# Perform interpolation

if [ "$domain" == "Antarctica" ]; then
    ### ANTARCTICA ###

    grid_name_src=grid_GLAC1D_south.txt
    nc_src_1=data/GLAC1Dnn4041ANT120kto30k.nc
    nc_src_2=data/GLAC1Dnn4041ANT30kto0k.nc

    data_name="GLAC1D-nn4041ANT"
    # -setgrid,grid_name_src

    # Call cdo commands to perform conservative regridding
    cdo remapcon,${grid_desc_file} ${nc_src_1} ${grid_name}_${data_name}-120kto30k.nc
    cdo remapcon,${grid_desc_file} ${nc_src_2} ${grid_name}_${data_name}-30kto0k.nc

    
else
    ### North, Laurentide, Greenland ###

    # Dataset variation 1
    nc_src_1=data/GLAC1Dnn9894NAGrB120kto30k.nc
    nc_src_2=data/GLAC1Dnn9894NAGrB30kto0k.nc

    data_name="GLAC1D-nn9894NAGrB"

    # Call cdo commands to perform conservative regridding
    cdo remapcon,${grid_desc_file} ${nc_src_1} ${grid_name}_${data_name}-120kto30k.nc
    cdo remapcon,${grid_desc_file} ${nc_src_2} ${grid_name}_${data_name}-30kto0k.nc

    # Cleanup time variables
    ncks -A -v y,x,T120K ${nc_src_1} ${grid_name}_${data_name}-120kto30k.nc
    ncks -A -v y,x,T120K ${nc_src_2} ${grid_name}_${data_name}-30kto0k.nc
    
    # # Dataset variation 2
    # nc_src_1=data/GLAC1Dnn9927NAGrB120kto30k.nc
    # nc_src_2=data/GLAC1Dnn9927NAGrB30kto0k.nc

    # data_name="GLAC1D-nn9927NAGrB"

    # # Call cdo commands to perform conservative regridding
    # cdo remapcon,${grid_desc_file} ${nc_src_1} ${grid_name}_${data_name}-120kto30k.nc
    # cdo remapcon,${grid_desc_file} ${nc_src_2} ${grid_name}_${data_name}-30kto0k.nc

fi 




    
