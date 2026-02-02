# PhD Thesis Code 

This repository contains the code used in the analyses and figures for my PhD thesis. 

---

## Repository Overview

| **Folder / File** | **Description** | **Notes / Usage** | 
|------------------|-----------------|-------------------|
| `Chapter 4/` | Code and scripts related to Chapter 4 of the thesis. |Tools used: FastQC (v0.11.8), CutAdapt (v3.5), BWA (mem) (v0.7.17), MultiQC (v1.12), , SAMtools (faidx, view, sort, index) (v1.9), Picard (MarkDuplicate) (v2.25.6), DeepVariant (model_type=WES) (v1.3.0), Ensembl VEP (v107 for WES datasets, v109 for 100kGP), BCFtools (+split-vep) (v1.16 for WES datasets, v1.21 for 100kGP)|
| `Chapter 5/` | Code and scripts related to Chapter 5 of the thesis.|BEDtools (multicov) (v2.29.2), nfs-bits (v2023_06), pheatmap (R: v1.0.13).
| `Chapter 6/` | Code and scripts related to Chapter 6 of the thesis. | Requires download from https://gnomad.broadinstitute.org/data.|
| `Chapter 7/` | Code and scripts related to Chapter 7 of the thesis. | Small variant workflow: https://re-docs.genomicsengland.co.uk/small_variant/, ggplot2 (v3.5.2)|

---

##
To clone this repository:

```bash
git clone https://github.com/amy-houseman/PhD_thesis_code.git
cd PhD_thesis_code

