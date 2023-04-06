import numpy as np
import pandas as pd

def dim(x)->list:
    # x_should be type which can be converted to list
    if issubclass(type(x), pd.DataFrame):
        return [x.shape[0], x.shape[1]]
    elif is_sequence(x):
        return [len(x)]+dim(x[0])
    else:
        return []

def is_sequence(obj)->bool:
    t = type(obj)
    if issubclass(t,(list, tuple, np.ndarray,pd.DataFrame)):
        return True
    else:
        return False

def is_rectangular(x)->bool:
    dim_x = dim(x)
    if issubclass(type(x),pd.DataFrame):
        rectangular = True
    elif len(dim_x) <= 1:
        # it is null, scalar, or vector
        # which is rectangular
        rectangular = True
    else:
        try:
            n_row = dim_x[0]
            n_col_expected = dim_x[1]
            rectangular = True
            for row_idx in range(n_row):
                col = x[row_idx]
                if len(col) != n_col_expected: # un homogeneous row occuered
                    rectangular = False
                    break
        except TypeError:
            rectangular = False
    return rectangular

def mytranspose_upto_1d(x):
    return x

def mytranspose_from_2d(x):
    xt = []
    n_row, n_col = dim(x)[0], dim(x)[1]
    for col_idx in range(n_col):
        col = []
        for row_idx in range(n_row):
            col.append(x[row_idx][col_idx])
        xt.append(col)
    return xt

def mytranspose_dataframe(x:pd.DataFrame):
    xt_array = []
    for col_name in x.columns:
        xt_array.append(x[col_name])
    xt = pd.DataFrame(xt_array, index=x.columns,columns=x.index)
    return xt

def mytranspose(x):
    if is_rectangular(x):
        if issubclass(type(x), pd.DataFrame):
            xt = mytranspose_dataframe(x)
        elif len(dim(x)) <= 1:
            xt = mytranspose_upto_1d(x)
        else:
            xt = mytranspose_from_2d(x)
    else:
        print(x)
        print("is not rectangualr for first two dimension")
        xt = None
    if issubclass(type(x), np.ndarray):
        xt = np.array(xt)
    return xt
#%%
