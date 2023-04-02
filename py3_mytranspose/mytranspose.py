import numpy as np
import pandas as pd

def dim(x) -> list:
    if not hasattr(x, "__len__"):
        return []
    elif ((len(x) == 0) | (type(x) == str)):
        return []
    else:
        return [len(x)]+dim(x[0])

def check_rectangular(x) -> bool:
    is_rectangular = False
    # element
    if len(dim(x)) == 0 & hasattr(x, "__len__"):
        is_rectangular = True
    # 1d list case
    elif len(dim(x)) == 1:
        is_rectangular = True
    # 2+ dim case
    elif len(dim(x)) >= 2:
        is_rectangular = True
        n_row = dim(x)[0]
        n_col_first = dim(x)[1]
        for r_idx in range(n_row):
            row = x[r_idx]
            n_col = len(row)
            if n_col != n_col_first:
                is_rectangular = False
                break
    return is_rectangular


def mytranspose_0d(x):
    # consider 0d list/array as scalar
    # return itself
    if check_rectangular(x):
        return x
    else:
        print("Cannot transpose input")
        print("input should be null or 1+ dimension rectangular numeric, list, array, dataframe, tensor")
        print("returning itself")
        return None
def mytranspose_1d(x):
    # consider 1d list/array as vector without axis
    # that is it is neither row_vector and column vector
    # retrun itself
    # len(dim(x)) = 1
    if check_rectangular(x):
        return x
    else:
        print("Cannot transpose input")
        print("input should be null or 1+ dimension rectangular numeric, list, array, dataframe, tensor")
        print("returning itself")
        return None

def mytranspose_2d_or_higher(x):
    # consider 1d list/array as matrix
    if check_rectangular(x):
        xt = []
        n_row, n_col = dim(x)[0], dim(x)[1]
        for c_idx in range(n_col):
            col = []
            for r_idx in range(n_row):
                col.append(x[r_idx][c_idx])
            xt.append(col)
    else:
        print("Cannot transpose input")
        print("input should be null or 1+ dimension rectangular numeric, list, array, dataframe, tensor")
        print("returning itself")
        return None
    return xt

def mytranspose(x):
    can_transpose = check_rectangular(x)
    if can_transpose:
        dim_x = dim(x)
        if len(dim_x) == 0:
            xt = mytranspose_0d(x)
        elif len(dim_x) == 1:
            xt = mytranspose_1d(x)
        else:
            xt = mytranspose_2d_or_higher(x)
    else:
        xt = mytranspose_0d(x)
    return xt

