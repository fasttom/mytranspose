def dim(x)->list:
    # x_should be type which can be converted to list
    if is_sequence(x):
        return [len(x)]+dim(x[0])
    else:
        return []

def is_sequence(obj)->bool:
    t = type(obj)
    return hasattr(t, "__len__") and hasattr(t, "__getitem__") and (t != str)

def is_rectangular(x)->bool:
    dim_x = dim(x)
    if len(dim_x) <= 1:
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

def mytranspose(x):
    if is_rectangular(x):
        if len(dim(x)) <= 1:
            xt = mytranspose_upto_1d(x)
        else:
            xt = mytranspose_from_2d(x)
    else:
        print(x)
        print("is not rectangualr for first two dimension")
        xt = None
    return xt