# Call variants with a position­based caller: UnifiedGenotyper 
java -jar $GATK -T UnifiedGenotyper \
  -R ref/human_g1k_b37_20.fasta \
  -I bams/exp_design/NA12878_wgs_20.bam \
  -o sandbox/NA12878_wgs_20_UG_calls.vcf \
  -glm BOTH \
  -L 20:10,000,000-10,200,000 

# Call variants with HaplotypeCaller 
java -jar $GATK -T HaplotypeCaller \
  -R ref/human_g1k_b37_20.fasta \
  -I bams/exp_design/NA12878_wgs_20.bam \
  -o sandbox/NA12878_wgs_20_HC_calls.vcf \
  -L 20:10,000,000-10,200,000

# View realigned reads and assembled haplotypes 
java -jar $GATK -T HaplotypeCaller \
  -R ref/human_g1k_b37_20.fasta \
  -I bams/exp_design/NA12878_wgs_20.bam \
  -o sandbox/NA12878_wgs_20_HC_calls_debug.vcf \
  -bamout sandbox/NA12878_wgs_20.HC_out.bam \
  -forceActive \
  -disableOptimizations \
  -L 20:10,002,371-10,002,546 \
  -ip 100
  
# Run more samples 
java -jar $GATK -T HaplotypeCaller \
  -R ref/human_g1k_b37_20.fasta \
  -I bams/exp_design/NA12878_wgs_20.bam \
  -I bams/trio-calling/NA12877_wgs_20.bam \
  -I bams/trio-calling/NA12882_wgs_20.bam \
  -o sandbox/NA12878_wgs_20_HC_jointcalls.vcf \
  -L 20:10,000,000-10,200,000
