# ActivityBudgets Project - Setup Complete

## Overview

This repository has been set up for analyzing CATS and DTAG data from humpback whales along the Western Antarctic Peninsula. The structure is designed to support:

1. **Collection of external code** from other scientists
2. **Custom "glue" code** for specific analyses
3. **Quarto computational notebooks** for exploratory analysis

## What Has Been Created

### Directory Structure

```
ActivityBudgets/
├── data/                      # Data files (gitignored)
│   ├── raw/                   # Original tag data
│   └── processed/             # Cleaned data
├── external_code/             # Code from other scientists
├── src/activitybudgets/       # Custom Python package
│   ├── __init__.py           # Package initialization
│   ├── data_loader.py        # Data loading functions
│   ├── analysis.py           # Activity budget calculations
│   └── visualization.py      # Plotting functions
├── notebooks/                 # Quarto notebooks
│   └── exploratory_analysis.qmd
├── examples/                  # Example scripts
│   └── basic_workflow.py
└── docs/                      # Documentation
    ├── SETUP_GUIDE.md
    ├── DATA_GUIDE.md
    └── CONTRIBUTING_EXTERNAL_CODE.md
```

### Key Files

1. **Python Package** (`src/activitybudgets/`)
   - Modular structure for analysis code
   - Placeholder functions for:
     - Loading CATS/DTAG data
     - Classifying behaviors
     - Calculating activity budgets
     - Creating visualizations

2. **Quarto Notebook** (`notebooks/exploratory_analysis.qmd`)
   - Template for exploratory analysis
   - Sections for:
     - Data loading
     - Exploratory data analysis
     - Behavior classification
     - Activity budget calculation
     - Results visualization

3. **Documentation**
   - `SETUP_GUIDE.md`: Installation and setup instructions
   - `DATA_GUIDE.md`: Information about CATS/DTAG data
   - `CONTRIBUTING_EXTERNAL_CODE.md`: Guidelines for adding external code
   - `README.md`: Project overview and usage

4. **Configuration Files**
   - `_quarto.yml`: Quarto configuration
   - `requirements.txt`: Python dependencies
   - `.gitignore`: Excludes data files and Python artifacts

## Next Steps

### 1. Install Dependencies

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install packages
pip install -r requirements.txt
```

### 2. Install Quarto

Download from: https://quarto.org/docs/get-started/

### 3. Add Your Data

Place tag data files in `data/raw/` directory.

### 4. Implement Analysis Functions

The placeholder functions in `src/activitybudgets/` need to be implemented:

- `data_loader.py`: Functions to read your specific data formats
- `analysis.py`: Activity budget and behavior classification algorithms
- `visualization.py`: Plotting functions for your results

### 5. Add External Code

If you have code from other scientists:
1. Create a subdirectory in `external_code/`
2. Include a README.md with attribution
3. See `docs/CONTRIBUTING_EXTERNAL_CODE.md` for guidelines

### 6. Start Analyzing

Use the Quarto notebook for interactive exploration:

```bash
cd notebooks
quarto preview exploratory_analysis.qmd
```

## Usage Examples

### Import the Package

```python
import sys
sys.path.insert(0, '../src')
from activitybudgets import data_loader, analysis, visualization
```

### Load Data

```python
# Load CATS data
cats_data = data_loader.load_cats_data('data/raw/whale_001.csv')

# Load DTAG data
dtag_data = data_loader.load_dtag_data('data/raw/whale_002.mat')
```

### Run Analysis

```python
# Classify behaviors
classifications = analysis.classify_behavior(tag_data)

# Calculate activity budgets
budget = analysis.calculate_activity_budget(tag_data)

# Visualize
visualization.plot_activity_budget(budget)
```

## Testing the Setup

Run the example script:

```bash
python examples/basic_workflow.py
```

This should run without errors and show the workflow steps.

## Repository Status

✓ Directory structure created
✓ Python package scaffolded
✓ Quarto notebook template created
✓ Documentation written
✓ Example script added
✓ .gitignore configured
✓ Dependencies specified

## Ready to Use!

The repository is now ready for you to:
1. Add your tag data
2. Implement the analysis functions
3. Collect external code from collaborators
4. Begin your exploratory analysis in Quarto

For detailed instructions, see:
- `README.md` for overview
- `docs/SETUP_GUIDE.md` for installation
- `docs/DATA_GUIDE.md` for data information
- `notebooks/exploratory_analysis.qmd` for analysis template
