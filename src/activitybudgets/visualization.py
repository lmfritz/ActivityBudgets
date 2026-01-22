"""
Visualization utilities for tag data and analysis results.
"""

def plot_activity_timeline(tag_data, classifications=None):
    """
    Create a timeline plot of whale activities.
    
    Parameters
    ----------
    tag_data : dict
        Tag data to visualize
    classifications : array-like, optional
        Behavioral classifications to overlay on timeline
        
    Returns
    -------
    fig : matplotlib.figure.Figure
        The generated figure
    """
    raise NotImplementedError("This function will be implemented for activity visualization")


def plot_activity_budget(budget_data):
    """
    Create a visualization of activity budget percentages.
    
    Parameters
    ----------
    budget_data : dict
        Dictionary containing activity percentages
        
    Returns
    -------
    fig : matplotlib.figure.Figure
        The generated figure
    """
    raise NotImplementedError("This function will be implemented for budget visualization")
