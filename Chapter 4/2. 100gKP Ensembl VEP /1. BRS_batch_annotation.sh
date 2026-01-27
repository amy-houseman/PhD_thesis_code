#BSUB -q long  # depending on the number of files that you will need to edit this may need to change
#BSUB -P re_gecip_cancer_colorectal # edit this line
#BSUB -o logs/%J.stdout
#BSUB -e logs/%J.stderr
#BSUB -cwd .
#BSUB -n 4 # this will need to be the same as the number of VEP forks
#BSUB -R "rusage[mem=64GB] span[hosts=1]"
 
# Create logging directory
mkdir -p ./logs
 
# Load modules
module purge
module load tools/singularity/3.8.3
 
# Load environment variables
source ./BRS_vep.conf
export PERL5LIB=$PERL5LIB:/plugins/loftee-GRCh38:/plugins/loftee-GRCh37:/plugins
 
# Run VEP
while IFS= read -r line
do
  output=$(basename "${line}" | cut -f 1,2 -d '.')
  singularity exec --bind "${MOUNT_WD}","${MOUNT_GENOMES}","${MOUNT_GEL_DATA_RESOURCES}","${MOUNT_PUBLIC_DATA_RESOURCES}","${MOUNT_SCRATCH}" "${IMG}" vep \
     --cache \
     --dir_plugins /plugins/ \
     --species homo_sapiens \
     --assembly GRCh38 \
     --format vcf \
     --offline --vcf \
     --fork 4 \
     --cache \
     --force_overwrite \
     --dir_cache "${CACHE}" \
     --fasta "${REFFASTA}" \
     --input_file "${line}" \
     --output_file /re_scratch/re_gecip/cancer_colorectal/AH/"${output}"_annotated.txt \
     --plugin CADD,"${CADD16}" \
     --plugin dbNSFP,"${DB_NSFP_DB}","${DB_NSFP_REPLACEMENT_LOGIC}",ALL \
     --plugin LoF,loftee_path:/plugins/loftee-GRCh38,human_ancestor_fa:"${LOFTEE38HA}",gerp_bigwig:"${LOFTEE38GERP}",conservation_file:"${LOFTEE38SQL}" \
     --plugin SpliceAI,snv="${SPLICEAIRAW38}",indel="${SPLICEAIINDEL38}"
done < "${INPUT_FILE}"
