# Examples

This directory contains example scripts demonstrating how to use the ActivityBudgets package.

## Available Examples

### basic_workflow.py

A simple script that demonstrates the basic workflow for analyzing CATS/DTAG data:

```bash
python examples/basic_workflow.py
```

This script shows:
1. How to import the activitybudgets package
2. The typical analysis workflow
3. Which functions need to be implemented

## Running Examples

Make sure you've installed the required dependencies:

```bash
pip install -r requirements.txt
```

Then run any example script:

```bash
python examples/basic_workflow.py
```

## Creating Your Own Scripts

Use these examples as templates for your own analysis scripts. The typical workflow is:

1. **Import the package**:
   ```python
   import sys
   sys.path.insert(0, '../src')
   from activitybudgets import data_loader, analysis, visualization
   ```

2. **Load your data**:
   ```python
   data = data_loader.load_cats_data('data/raw/your_file.csv')
   ```

3. **Perform analysis**:
   ```python
   budget = analysis.calculate_activity_budget(data)
   ```

4. **Visualize results**:
   ```python
   visualization.plot_activity_budget(budget)
   ```

## Note

The example scripts use placeholder functions that need to be implemented based on your specific data format and analysis requirements.
