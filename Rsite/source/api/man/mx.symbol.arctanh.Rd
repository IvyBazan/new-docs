% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mxnet_generated.R
\name{mx.symbol.arctanh}
\alias{mx.symbol.arctanh}
\title{arctanh:Returns the element-wise inverse hyperbolic tangent of the input array, \
computed element-wise.}
\usage{
mx.symbol.arctanh(...)
}
\arguments{
\item{data}{NDArray-or-Symbol
The input array.}

\item{name}{string, optional
Name of the resulting symbol.}
}
\value{
out The result mx.symbol
}
\description{
The storage type of ``arctanh`` output depends upon the input storage type:
}
\details{
- arctanh(default) = default
   - arctanh(row_sparse) = row_sparse
   - arctanh(csr) = csr



Defined in src/operator/tensor/elemwise_unary_op_trig.cc:L281
}

