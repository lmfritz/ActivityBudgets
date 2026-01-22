# Setup and Installation Guide

This guide will help you set up your development environment for the ActivityBudgets project.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Python 3.8+**: Download from [python.org](https://www.python.org/downloads/)
- **Git**: Download from [git-scm.com](https://git-scm.com/downloads)
- **Quarto**: Download from [quarto.org](https://quarto.org/docs/get-started/)

## Step-by-Step Setup

### 1. Clone the Repository

```bash
git clone https://github.com/lmfritz/ActivityBudgets.git
cd ActivityBudgets
```

### 2. Create a Virtual Environment

Using a virtual environment keeps your project dependencies isolated:

**On macOS/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

**On Windows:**
```bash
python -m venv venv
venv\Scripts\activate
```

You should see `(venv)` in your terminal prompt when the virtual environment is activated.

### 3. Install Python Dependencies

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

This will install all required Python packages including:
- NumPy, SciPy, Pandas (scientific computing)
- Matplotlib, Seaborn (visualization)
- NetCDF4, xarray (data formats)
- Jupyter (interactive notebooks)

### 4. Install Quarto

Visit [https://quarto.org/docs/get-started/](https://quarto.org/docs/get-started/) and follow the installation instructions for your operating system.

Verify installation:
```bash
quarto --version
```

### 5. Verify Setup

Test that everything is working:

```bash
# Test Python package import
python -c "import sys; sys.path.insert(0, 'src'); import activitybudgets; print('✓ Package imported successfully')"

# Check Quarto
quarto check
```

## Quick Start

### Working with the Exploratory Notebook

1. Navigate to the notebooks directory:
   ```bash
   cd notebooks
   ```

2. Preview the notebook (opens in browser with live updates):
   ```bash
   quarto preview exploratory_analysis.qmd
   ```

3. Or render to HTML:
   ```bash
   quarto render exploratory_analysis.qmd
   ```

### Using the Analysis Code

Create a new Python script or Jupyter notebook:

```python
import sys
sys.path.insert(0, '../src')  # Adjust path as needed

from activitybudgets import data_loader, analysis, visualization

# Your analysis code here
```

## Adding Your Data

1. Place raw tag data files in `data/raw/`
2. Update `data/raw/README.md` with file inventory
3. Processed data should go in `data/processed/`

**Note**: Data files are excluded from git by default to prevent committing large files.

## Adding External Code

See `docs/CONTRIBUTING_EXTERNAL_CODE.md` for guidelines on adding code from other scientists.

## Development Workflow

1. Activate your virtual environment: `source venv/bin/activate`
2. Work on your analysis in notebooks or scripts
3. Add new functions to `src/activitybudgets/` modules
4. Update documentation as needed
5. Commit changes with git

## Troubleshooting

### Import Errors

If you get import errors, make sure:
1. Your virtual environment is activated
2. You've run `pip install -r requirements.txt`
3. You're adding the correct path to `sys.path`

### Quarto Not Found

If `quarto` command is not found:
1. Verify installation: Check Quarto is in your PATH
2. Restart your terminal after installation
3. Try the full path to quarto executable

### Data Loading Issues

Different tag data formats may require:
- Additional packages (e.g., `scipy` for .mat files)
- Custom parsing code
- Data format conversions

## Getting Help

- Check documentation in `docs/`
- Review example notebook in `notebooks/exploratory_analysis.qmd`
- Consult README files in subdirectories

## Next Steps

1. Read `docs/DATA_GUIDE.md` for information about tag data
2. Explore the example notebook
3. Start implementing data loading functions
4. Begin your analysis!
