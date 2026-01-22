# Processed Data

This directory contains cleaned and processed tag data ready for analysis.

## Processing Steps

Document the processing pipeline applied to raw data:
1. Quality control and filtering
2. Calibration corrections
3. Coordinate transformations
4. Derived variables calculation
5. Resampling or interpolation

## File Format

Processed data should be in standard formats:
- **CSV**: For tabular data and time series
- **NetCDF**: For multidimensional arrays with metadata
- **Parquet**: For large datasets with efficient compression

## Version Control

- Include processing date/version in filename
- Keep a log of processing parameters
- Maintain reproducible processing scripts in `src/`

## Examples

```
humpback_001_CATS_20150215_processed_v1.csv
humpback_002_DTAG_20160308_prh_v2.nc
```
