# CATS and DTAG Data Guide

This document provides information about the tag data used in this analysis.

## Tag Types

### CATS Tags
**Customized Animal Tracking Solutions (CATS)**
- Multi-sensor biologging tags
- Typical sensors: accelerometer, magnetometer, gyroscope, depth, temperature
- Video recording capabilities in some models
- Used extensively on marine mammals

### DTAG
**Digital Acoustic Recording Tag**
- High-resolution multi-sensor tag
- Acoustic recording + motion sensors
- Developed at Woods Hole Oceanographic Institution
- Gold standard for marine mammal behavior studies

## Data Format

### Common Data Files
- **CATS**: Typically `.csv` or custom binary formats
- **DTAG**: Usually `.mat` (MATLAB) or `.nc` (NetCDF) files
- **Metadata**: Deployment information, calibration data, animal ID

### Key Variables
Typical data streams from tags include:
- **Acceleration**: Body acceleration in 3 axes (X, Y, Z)
- **Magnetometer**: Magnetic field measurements for heading
- **Gyroscope**: Rotation rates
- **Depth**: Dive depth profile
- **Temperature**: Water temperature
- **Audio**: Acoustic recordings (DTAG)
- **Video**: Video recordings (CATS)

## Data Organization

```
data/
├── raw/               # Original, unmodified data files
│   ├── .gitkeep
│   └── README.md     # Describe data sources
└── processed/         # Cleaned, processed data
    ├── .gitkeep
    └── README.md     # Describe processing steps
```

## Data Sources

### Humpback Whale Tagging - Western Antarctic Peninsula
- **Location**: Western Antarctic Peninsula
- **Species**: Humpback whales (*Megaptera novaeangliae*)
- **Period**: Over a decade of deployments
- **Tags**: Mix of CATS and DTAG deployments

## Important Notes

### Data Privacy and Sharing
- Raw tag data files are **not** committed to this repository (see `.gitignore`)
- Data files should be stored locally or on appropriate data storage systems
- Processed/summarized data suitable for publication may be included

### Data Location
Place your data files in:
- `data/raw/` - Original tag data files
- `data/processed/` - Processed data ready for analysis

### Loading Data
Use the functions in `src/activitybudgets/data_loader.py`:
```python
from activitybudgets import data_loader

# Load CATS data
cats_data = data_loader.load_cats_data('data/raw/whale_001_cats.csv')

# Load DTAG data
dtag_data = data_loader.load_dtag_data('data/raw/whale_002_dtag.mat')
```

## References

Key papers about these tag types:
- CATS: [Add relevant citations]
- DTAG: Johnson, M. P., & Tyack, P. L. (2003). A digital acoustic recording tag for measuring the response of wild marine mammals to sound. *IEEE Journal of Oceanic Engineering*, 28(1), 3-12.

## Additional Resources

- [DTAG Toolbox](http://www.soundtags.org/)
- [Movebank](https://www.movebank.org/) - Animal tracking data repository
- [Biologging Science](https://www.biologging.science/) - Community resources
