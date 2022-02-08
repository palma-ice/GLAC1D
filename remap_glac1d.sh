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

# Define output folder
fldr_out='output'


# Perform interpolation

if [ "$domain" == "Antarctica" ]; then
    ### ANTARCTICA ###

    ## Dataset 1 ========================================

    nc_src_1=data/GLAC1Dnn4041ANT120kto30k.nc
    nc_src_2=data/GLAC1Dnn4041ANT30kto0k.nc

    data_name="GLAC1D-nn4041ANT"
    
    echo ""
    echo "Processing ${data_name}..."
    echo ""
    
    ## File 1 ##

    file_out=${fldr_out}/${grid_name}_${data_name}-120kto30k.nc
    tvar_in=T120K
    
    # Call cdo commands to perform conservative regridding
    cdo remapcon,${grid_desc_file} ${nc_src_1} ${file_out}
    
    # Cleanup time variables
    ncks -A -v ${tvar_in} ${nc_src_1} ${file_out}               # Copy time variable to output file
    ncatted -h -a calendar,${tvar_in},d,, ${file_out}           # Remove calendar attribute
    ncatted -h -a units,${tvar_in},o,c,"kiloyears" ${file_out}  # Change the units to 'kiloyears'
    
    ## File 2 ##

    file_out=${fldr_out}/${grid_name}_${data_name}-30kto0k.nc
    tvar_in=T122KP1
    
    # Call cdo commands to perform conservative regridding
    cdo remapcon,${grid_desc_file} ${nc_src_2} ${file_out}

    # Cleanup time variables
    ncks -A -v ${tvar_in} ${nc_src_2} ${file_out}               # Copy time variable to output file
    ncatted -h -a calendar,${tvar_in},d,, ${file_out}           # Remove calendar attribute
    ncatted -h -a units,${tvar_in},o,c,"kiloyears" ${file_out}  # Change the units to 'kiloyears'
    
    
else
    ### North, Laurentide, Greenland ###

    ## Dataset 1 ========================================

    nc_src_1=data/GLAC1Dnn9894NAGrB120kto30k.nc
    nc_src_2=data/GLAC1Dnn9894NAGrB30kto0k.nc

    data_name="GLAC1D-nn9894NAGrB"

    echo ""
    echo "Processing ${data_name}..."
    echo ""
    
    ## File 1 ##

    file_out=${fldr_out}/${grid_name}_${data_name}-120kto30k.nc
    tvar_in=T120K
    
    # Call cdo commands to perform conservative regridding
    cdo remapcon,${grid_desc_file} ${nc_src_1} ${file_out}
    
    # Cleanup time variables
    ncks -A -v ${tvar_in} ${nc_src_1} ${file_out}               # Copy time variable to output file
    ncatted -h -a calendar,${tvar_in},d,, ${file_out}           # Remove calendar attribute
    ncatted -h -a units,${tvar_in},o,c,"kiloyears" ${file_out}  # Change the units to 'kiloyears'
    
    ## File 2 ##

    file_out=${fldr_out}/${grid_name}_${data_name}-30kto0k.nc
    tvar_in=T122KP1
    
    # Call cdo commands to perform conservative regridding
    cdo remapcon,${grid_desc_file} ${nc_src_2} ${file_out}

    # Cleanup time variables
    ncks -A -v ${tvar_in} ${nc_src_2} ${file_out}               # Copy time variable to output file
    ncatted -h -a calendar,${tvar_in},d,, ${file_out}           # Remove calendar attribute
    ncatted -h -a units,${tvar_in},o,c,"kiloyears" ${file_out}  # Change the units to 'kiloyears'
    

    ## Dataset 2 ========================================
    
    nc_src_1=data/GLAC1Dnn9927NAGrB120kto30k.nc
    nc_src_2=data/GLAC1Dnn9927NAGrB30kto0k.nc

    data_name="GLAC1D-nn9927NAGrB"

    echo ""
    echo "Processing ${data_name}..."
    echo ""

    ## File 1 ##

    file_out=${fldr_out}/${grid_name}_${data_name}-120kto30k.nc
    tvar_in=T120K
    
    # Call cdo commands to perform conservative regridding
    cdo remapcon,${grid_desc_file} ${nc_src_1} ${file_out}
    
    # Cleanup time variables
    ncks -A -v ${tvar_in} ${nc_src_1} ${file_out}               # Copy time variable to output file
    ncatted -h -a calendar,${tvar_in},d,, ${file_out}           # Remove calendar attribute
    ncatted -h -a units,${tvar_in},o,c,"kiloyears" ${file_out}  # Change the units to 'kiloyears'
    
    ## File 2 ##

    file_out=${fldr_out}/${grid_name}_${data_name}-30kto0k.nc
    tvar_in=T122KP1
    
    # Call cdo commands to perform conservative regridding
    cdo remapcon,${grid_desc_file} ${nc_src_2} ${file_out}

    # Cleanup time variables
    ncks -A -v ${tvar_in} ${nc_src_2} ${file_out}               # Copy time variable to output file
    ncatted -h -a calendar,${tvar_in},d,, ${file_out}           # Remove calendar attribute
    ncatted -h -a units,${tvar_in},o,c,"kiloyears" ${file_out}  # Change the units to 'kiloyears'
    
fi 

echo ""
echo "Done."
echo ""


    
