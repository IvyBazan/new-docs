# An Intro: Manipulate Data the MXNet Way with NDArray

## Overview
This guide will introduce you to how data is handled with MXNet. You will learn the basics about MXNet's multi-dimensional array format, `ndarray`.

The content was extracted and simplified from the gluon tutorials in [The Straight Dope](https://gluon.mxnet.io/).

## Prerequisites
* [MXNet installed in a Python environment](https://mxnet.incubator.apache.org/install/index.html?language=Python).
* Python 2.7.x or Python 3.x


## Managing Context

In MXNet, every array has a context.
One context could be the CPU.
Other contexts might be various GPUs.
Things can get even hairier when we deploy jobs across multiple servers.
By assigning arrays to contexts intelligently,
we can minimize the time spent transferring data between devices.
For example, when training neural networks on a server with a GPU,
we typically prefer for the model's parameters to live on the GPU.
If you have a GPU, let's try initializing an array on the first GPU.
Otherwise, use `ctx=mx.cpu()` in place of `ctx=gpu(0)`.


```{.python .input}
from mxnet import gpu
z = nd.ones(shape=(3,3), ctx=gpu(0))
print(z)
```


    [[ 1.  1.  1.]
     [ 1.  1.  1.]
     [ 1.  1.  1.]]
    <NDArray 3x3 @cpu(0)>


Given an NDArray on a given context, we can copy it to another context by using the copyto() method. Skip this if you don't have a GPU at the moment.


```{.python .input}
x_gpu = x.copyto(gpu(0))
print(x_gpu)
```

The result of an operator will have the same context as the inputs.


```{.python .input}
x_gpu + z
```

## Watch out!

Imagine that your variable z already lives on your second GPU (`gpu(0)`). What happens if we call `z.copyto(gpu(0))`? It will make a copy and allocate new memory, even though that variable already lives on the desired device!
<!-- wouldn't the second GPU be gpu(1)? -->

Often, we only want to make a copy if the variable currently lives in the wrong context. In these cases, we can call `as_in_context()`. If the variable is already on `gpu(0)` then this is a no-op.


```{.python .input}
print('id(z):', id(z))
z = z.copyto(gpu(0))
print('id(z):', id(z))
z = z.as_in_context(gpu(0))
print('id(z):', id(z))
print(z)
```

## Next Up

[Autograd](../autograd/)

Or continue exploring more examples of NDArray: [NDArray Overview for Advanced Users](04-ndarray-advanced.md)