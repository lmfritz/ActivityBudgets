# Contributing External Code

This document provides guidelines for adding code from other scientists to the `external_code/` directory.

## Purpose

The `external_code/` directory is designed to store pre-existing code and analysis tools from other researchers who have analyzed CATS and DTAG data. This allows us to:
- Preserve attribution to original authors
- Keep external code separate from our custom implementations
- Facilitate code reuse and comparison of methods

## Adding External Code

When adding code from another scientist or publication:

1. **Create a subdirectory** with a descriptive name:
   ```
   external_code/
   ├── author_year_description/
   ```

2. **Include a README.md** in the subdirectory with:
   - Original author(s) and affiliation
   - Publication reference (if applicable)
   - Original source/repository URL
   - License information
   - Brief description of what the code does
   - Any modifications made for compatibility

3. **Preserve original structure** when possible, but document any changes

4. **Add license information** - Ensure you have permission to use the code and that it's properly attributed

## Example Structure

```
external_code/
├── johnson_2009_prh_analysis/
│   ├── README.md
│   ├── LICENSE
│   ├── prh_calculation.m
│   └── utils/
├── simon_2012_behavior_classification/
│   ├── README.md
│   ├── classify_behaviors.py
│   └── models/
```

## Using External Code

In your analysis scripts or notebooks, you can import and use external code:

```python
# Add external code to path
import sys
sys.path.insert(0, '../external_code/author_year_description')

# Import and use
from external_module import function_name
```

## Citing Code

When using external code in publications:
1. Cite the original publication if available
2. Acknowledge the code authors in your methods section
3. Reference any modifications you made

## Questions?

If you're unsure about adding specific code, please reach out to discuss:
- Copyright and licensing concerns
- Compatibility issues
- Integration approaches
