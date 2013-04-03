#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
###################################
# 8.4.2 Accessing matrix elements #
###################################
export matrix_get, matrix_set, matrix_ptr, matrix_const_ptr




# This function returns the (i,j)-th element of a matrix m.  If i or j lie
# outside the allowed range of 0 to n1-1 and 0 to n2-1 then the error handler
# is invoked and 0 is returned.  An inline version of this function is used
# when HAVE_INLINE is defined.
# 
#   Returns: Cdouble
function matrix_get(m::Ptr{gsl_matrix}, i::Integer, j::Integer)
    ccall( (:gsl_matrix_get, :libgsl), Cdouble, (Ptr{gsl_matrix}, Csize_t,
        Csize_t), m, i, j )
end


# This function sets the value of the (i,j)-th element of a matrix m to x.  If
# i or j lies outside the allowed range of 0 to n1-1 and 0 to n2-1 then the
# error handler is invoked.  An inline version of this function is used when
# HAVE_INLINE is defined.
# 
#   Returns: Void
function matrix_set(m::Ptr{gsl_matrix}, i::Integer, j::Integer, x::Real)
    ccall( (:gsl_matrix_set, :libgsl), Void, (Ptr{gsl_matrix}, Csize_t,
        Csize_t, Cdouble), m, i, j, x )
end


# These functions return a pointer to the (i,j)-th element of a matrix m.  If i
# or j lie outside the allowed range of 0 to n1-1 and 0 to n2-1 then the error
# handler is invoked and a null pointer is returned.  Inline versions of these
# functions are used when HAVE_INLINE is defined.
# 
#   Returns: Ptr{Cdouble}
function matrix_ptr(m::Ptr{gsl_matrix}, i::Integer, j::Integer)
    ccall( (:gsl_matrix_ptr, :libgsl), Ptr{Cdouble}, (Ptr{gsl_matrix},
        Csize_t, Csize_t), m, i, j )
end


# These functions return a pointer to the (i,j)-th element of a matrix m.  If i
# or j lie outside the allowed range of 0 to n1-1 and 0 to n2-1 then the error
# handler is invoked and a null pointer is returned.  Inline versions of these
# functions are used when HAVE_INLINE is defined.
# 
#   Returns: Ptr{Cdouble}
function matrix_const_ptr(m::Ptr{gsl_matrix}, i::Integer, j::Integer)
    ccall( (:gsl_matrix_const_ptr, :libgsl), Ptr{Cdouble},
        (Ptr{gsl_matrix}, Csize_t, Csize_t), m, i, j )
end