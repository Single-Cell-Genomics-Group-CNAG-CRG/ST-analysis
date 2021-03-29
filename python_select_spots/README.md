`spot_selection.py` is a python module that contains the necessary functions to create an interactive scatter plot with [bokeh](https://bokeh.org/). In this plot, one can select the spots from Visium 10x spatial transcriptomics data and get the coordinates and ids of those for downstream filtering or subsetting. 

You can add the module `spot_selection.py` to your PYTHONPATH environment variable and use it in different scripts without having it on each working directory every time you want to import it
For example if you have spot_selection.py in your working directory now you can just do

```
export PYTHONPATH="$PWD
```

And everytime you import it in a python script, python will look at this directory to do it. 

In addition, this are the python packages needed to run the example (all of them can be installed with conda):

python v>=3.5 <br>
bokeh <br>
pandas <br>
numpy <br>
scanpy <br>
matplotlib <br>
seaborn <br>
notebook <br>

The `example.ipynb` notebook shows a working example of how to use it. 


