# ActivityBudgets

A collection of code and information used for the first chapter of L Fritz's dissertation, an analysis of DTAG and CATS tag data from over a decade of deployments on humpback whales along the Western Antarctic Peninsula.

## Project Overview

This repository contains:
- **External code**: Pre-existing analysis tools from other scientists who have analyzed CATS/DTAG data
- **Custom analysis code**: "Glue" code connecting external tools and implementing custom analyses
- **Quarto notebooks**: Computational notebooks documenting the exploratory analysis phase
- **Documentation**: Guides for data, contributing code, and analysis methods

## Project Structure

```
ActivityBudgets/
├── data/                      # Data files (not committed to git)
│   ├── raw/                   # Original tag data files
│   └── processed/             # Cleaned, processed data
├── external_code/             # Code from other scientists
│   └── README.md              # Guidelines for adding external code
├── src/                       # Custom analysis code
│   └── activitybudgets/       # Python package for analysis
│       ├── __init__.py
│       ├── data_loader.py     # Functions to load CATS/DTAG data
│       ├── analysis.py        # Activity budget calculations
│       └── visualization.py   # Plotting functions
├── notebooks/                 # Quarto computational notebooks
│   └── exploratory_analysis.qmd
├── docs/                      # Documentation
│   ├── CONTRIBUTING_EXTERNAL_CODE.md
│   └── DATA_GUIDE.md
├── _quarto.yml                # Quarto configuration
├── requirements.txt           # Python dependencies
└── README.md                  # This file
```

## Getting Started

### Prerequisites

- Python 3.8 or higher
- [Quarto](https://quarto.org/docs/get-started/) for rendering computational notebooks
- Git for version control

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/lmfritz/ActivityBudgets.git
   cd ActivityBudgets
   ```

2. Create a virtual environment (recommended):
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Install Quarto (if not already installed):
   - Visit [https://quarto.org/docs/get-started/](https://quarto.org/docs/get-started/)
   - Follow installation instructions for your platform

### Usage

#### Running the Exploratory Analysis Notebook

```bash
cd notebooks
quarto preview exploratory_analysis.qmd
```

This will render the Quarto notebook and open it in your browser with live updates.

To render to HTML without preview:
```bash
quarto render exploratory_analysis.qmd
```

#### Using the Analysis Code

```python
from activitybudgets import data_loader, analysis, visualization

# Load tag data
cats_data = data_loader.load_cats_data('data/raw/your_file.csv')

# Perform analysis
budget = analysis.calculate_activity_budget(cats_data)

# Visualize results
visualization.plot_activity_budget(budget)
```

## Data

Tag data files are **not included** in this repository due to size and privacy considerations. 

- Place your raw data files in `data/raw/`
- Processed data should go in `data/processed/`
- See `docs/DATA_GUIDE.md` for detailed information about data formats and organization

## Contributing External Code

If you want to add code from other scientists:
1. Read `docs/CONTRIBUTING_EXTERNAL_CODE.md` for guidelines
2. Create a subdirectory in `external_code/` with proper attribution
3. Include a README.md with citation information and license

## Analysis Workflow

1. **Data Collection**: Place raw tag data in `data/raw/`
2. **Exploration**: Use `notebooks/exploratory_analysis.qmd` to explore data
3. **Processing**: Develop processing pipelines in `src/activitybudgets/`
4. **Analysis**: Calculate activity budgets and other metrics
5. **Visualization**: Create publication-quality figures
6. **Documentation**: Update notebooks with findings

## Development

### Adding New Functionality

1. Add functions to appropriate modules in `src/activitybudgets/`
2. Document functions with docstrings
3. Update notebooks to demonstrate usage
4. Test with sample data

### Project Goals

- Compile existing CATS/DTAG analysis methods
- Develop custom "glue" code for specific research questions
- Maintain reproducible analysis through Quarto notebooks
- Document methods and findings for dissertation chapter

## License

[Add appropriate license]

## Citation

If you use this code, please cite:
```
Fritz, L. (2026). Activity Budgets of Humpback Whales along the Western Antarctic Peninsula. 
[Dissertation details to be added]
```

## Contact

- **Author**: L Fritz
- **Institution**: [Add institution]
- **Email**: [Add email if desired]

## Acknowledgments

- Field teams who collected tag data
- Scientists whose code is included in `external_code/`
- Funding sources [to be added]
