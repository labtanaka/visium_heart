#!/bin/bash
#PBS -l nodes=1:ppn=16
#PBS -l walltime=24:00:00
#PBS -l mem=150gb
#PBS -S /bin/bash
#PBS -N visium_mrkr_estimation
#PBS -o /beegfs/work/hd_wh241/MI_revisions/analysis/jobs/estimate_visiumclust_markers.out
#PBS -e /beegfs/work/hd_wh241/MI_revisions/analysis/jobs/estimate_visiumclust_markers.err
#PBS -q smp
#PBS -m bea
#PBS -M roramirezf@uni-heidelberg.de

source ~/.bashrc;
conda activate sc_analysis;
cd /beegfs/work/hd_wh241/MI_revisions;

$CONDA_PREFIX/bin/Rscript ./analysis/3_functional_characterization/estimate_dea.R \
        --data_path "/beegfs/work/hd_wh241/MI_revisions/processed_visium/integration/integrated_slides.rds" \
        --out_df "/beegfs/work/hd_wh241/MI_revisions/processed_visium/integration/integrated_slides_mrkrs.rds" \
        --group_class "opt_clust_integrated" \
        --test_assays "Spatial" \
        --lfc "0.5" \
        --only_pos "yes";