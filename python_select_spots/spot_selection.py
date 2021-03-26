import pandas as pd
import numpy as np
import scanpy as sc
from bokeh.plotting import figure, show
from bokeh.io import output_notebook
from bokeh.models import HoverTool, ColumnDataSource
from bokeh import events


def print_event(attributes=[]):
    def python_callback(event):
        id_spot = source.to_df()[source.to_df().index.isin(source.selected.indices)][['index', 'x_coord', 'y_coord']]
        print(id_spot['index'].tolist())
        print(id_spot)
    return python_callback


def modify_doc(doc):
    
    hover = HoverTool(
            tooltips=[
                ("index", "$index"),
                ("spot coordinates (x,y)", "(@x_coord, @y_coord)"),
                ])

    TOOLS=[hover,"box_select,reset,save,lasso_select"]

    p = figure(tools=TOOLS, active_drag = "box_select", 
               plot_height=500, plot_width=1000)

    p.scatter(x="x_coord", y="y_coord", source=source,
              marker="hex", fill_color="#c994c7",
              fill_alpha=0.6,line_color=None,size=12)

    p.y_range.flipped = True
    
    # register Python event callbacks
    p.on_event(events.SelectionGeometry, print_event(attributes=['geometry']))

    doc.add_root(p)


def get_selection_plot(anndata):

    """
    Provide and Anndata object with Visium 10x data and it will plot the spots and provide tools to select them for later filtering
    This code has been adapted from this solution https://gist.github.com/ocefpaf/c7706893a525c6d40c5ca07e16f6e746
    
    anndata: Anndata object with Visium 10x data
    returns: Dataframe with ids and coordinates of selected spots
    """

    x,y = list(zip(*anndata.obsm['spatial']))
    anndata.obs['x_coord'] = x
    anndata.obs['y_coord'] = y

    global source
    source = ColumnDataSource(anndata.obs)
    
    output_notebook()
    show(modify_doc)