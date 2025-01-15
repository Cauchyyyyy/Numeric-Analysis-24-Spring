# Numeric Analysis Homework 8

## Introduction

This repository contains the solutions for Homework 8 of the Numeric Analysis course. The homework focuses on [微分方程数值解] and covers the following tasks:

- Task 1: 
利用四阶Runge-Kutta法和$\lambda=5,-5,10,\dots$，数值求解初值问题
$$y'=\lambda y +cos x-\lambda sin x$$
$$y(0)=0$$
在区间$[0,5]$上比较数值解和解析解$y=sin x$，步长$h=0.01$

四阶Runge-Kutta法：
$$x(t+h)=x(t)+\frac{1}{6}(F_1+2F_2+2F_3+F_4)$$
$$F_1=hf(t,x)$$
$$F_2=hf(t+h/2,x+F_1/2)$$
$$F_3=hf(t+h/2,x+F_2/2)$$
$$F_4=hf(t+h,x+F_3)$$



## Contributing

If you find any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request.
