# Numerical Methods
This course was a part of the third term. We had to individually prepare two projects, one related to searching for zero of a function and second related to matrices. Reports (in Polish) and codes you can find in proper folders.

## 1. Finding the roots of a polynomial using Newton's method

Problem Description:

The project aims to develop a program that finds the roots of a polynomial described as follows:

\[
w_n(x) = a_0 + a_1 (T_1(x) - U_1(x)) + \cdots + a_n (T_n(x) - U_n(x))
\]
![Equation](https://latex.codecogs.com/png.latex?\color{gray}w_n(x)%20=%20a_0%20+%20a_1%20(T_1(x)%20-%20U_1(x))%20+%20\cdots%20+%20a_n%20(T_n(x)%20-%20U_n(x)))



, where T_n are Chbyshev polynomials of the first kind and U_n are Chebyshev polynomials of the second kind.


## 2. Solving a System of Linear Equations Using the SOR Method

Task Description

We consider a system of linear equations  Ax = b , where  A  is a matrix of the form:

\[
A =
\begin{pmatrix}
C & S \\
-S & C
\end{pmatrix}
\]

where \( C, S \in \mathbb{R}^{p \times p} \) and \( n = 2p \). We assume that:

\[
C = \text{diag}(c_1, c_2, ..., c_p)
\]

and \( \det(C) \neq 0 \), as well as:

\[
S = \text{diag}(s_1, s_2, ..., s_p),
\]

where \( c_i^2 + s_i^2 = 1 \) for \( i = 1, ..., p \).

Implementation

The goal is to implement the classical **SOR** method for solving the system \( Ax = b \) 

