# 第七周程序作业

## Problem
### code-ga
利用复化梯形积分公式和复化3点Gauss积分公式计算积分的
通用程序计算下列积分
$$\int_{0}^{1} e^{-x^2} \,dx $$
$$\int_{0}^{4} \frac{1}{1+x^2} \,dx $$
$$\int_{0}^{2 \pi} \frac{1}{2+cos(x)} \,dx $$
取节点$x_i, i = 0, · · · , N,$ $N$为$2^k, k = 1, · · · , 7$,并分析误差及收敛阶
### 计算机习题7.4
编写Romberg积分的通用程序，计算如下积分
$$\int_{0}^{1} \frac{sin(x)}{x} \,dx$$
$$\int_{-1}^{1} \frac{cos(x)-e^x}{sin(x)} \,dx  $$
$$\int_{1}^{\infty} (x e^x)^{-1}  \,dx $$

并输出M列Romberg表，M=7.

## Method
### code-ga
利用$[-1,1]$区间上的3点Gauss积分公式$$\int_{-1}^{1} f(x) \,dx = \frac{5}{9}f(\sqrt{\frac{3}{5}}) + \frac{8}{9}f(0) + \frac{5}{9}f(-\sqrt{\frac{3}{5}})$$
由区间变换得到一般区间上的Gauss积分公式，从而得到复化的积分公式。
### 计算机习题7.4
利用Romberg积分递推公式$$R(n,m)=\frac{4^m R(n,m-1)-R(n-1,m-1)}{4^m-1}$$

计算函数值时，将奇点的函数值认为是取极限的函数值

计算$\int_{1}^{\infty} (x e^x)^{-1}  \,dx $时，将其转换成$\int_{0}^{1} \frac{1}{x} e^{-\frac{1}{x}}  \,dx $
，由于在0点的函数值及其极限为$\infty$，积分计算时采用的是$\int_{10^{-7}}^{1} \frac{1}{x} e^{-\frac{1}{x}}  \,dx $

## Result

### $\int_{0}^{1} e^{-x^2} \,dx $

| | 梯形公式 | | Gauss积分 |  |
|---|---|---|---|---|
|  n | error | order |error | order|
|  2|  1.545388e-02| | 3.611056e-08||
|  4  |3.840035e-03      |2.008778  |4.021525e-10      |6.488534|
|  8  |9.585180e-04      |2.002242  |5.742296e-12      |6.129971|
|  16  |2.395360e-04      |2.000563  |8.781864e-14      |6.030957|
|  32  |5.987816e-05      |2.000141  |1.554312e-15      |5.820179|
|  64  |1.496917e-05      |2.000035  |1.110223e-16      |3.807355|
|  128  |3.742271e-06      |2.000009  |3.330669e-16      |-1.584963|

### $\int_{0}^{4} \frac{1}{1+x^2} \,dx $

| | 梯形公式 | | Gauss积分 |  |
 |---|---|---|---|---|
 |     n | error | order |error | order|
  |    2|1.330059e-01||1.267599e-04||
  |4|3.594101e-03	 |5.209715|1.259308e-04	 |9.467906e-03|
|8|5.642612e-04	 |2.671196|2.457990e-07	 |9.000937|
|16|1.440819e-04	 |1.969474|2.070566e-12	 |1.685709e+01|
|32|3.603799e-05	 |1.999299|4.529710e-14	 |5.514463|
|64|9.010592e-06	 |1.999825|6.661338e-16	 |6.087463|
|128|2.252716e-06	 |1.999956|2.220446e-16	 |1.584963|

### $\int_{0}^{2 \pi}\frac{1}{2+cos(x)} \,dx $

| | 梯形公式 | | Gauss积分 |  |
|---|---|---|---|---|
|n | error | order |error | order|
|  2|5.611915e-01||6.116555e-03||
|4|3.759270e-02	 |3.899969|7.383276e-04	 |3.050386|
|8|1.927882e-04	 |7.607292|4.326075e-06	 |7.415059|
|16|5.122577e-09	 |1.519979e+01|1.150231e-10	 |1.519885e+01|
|32|1.332268e-15	 |2.187455e+01|1.332268e-15	 |1.639768e+01|
|64|8.881784e-16	 |5.849625e-01|8.881784e-16	 |5.849625e-01|
|128|4.440892e-16	 |1|1.332268e-15	 |-5.849625e-01|

### $R(i,j)$三角阵列，$\int_{0}^{1} \frac{sin(x)}{x} \,dx$

|$R(i,j)$| $R(i,0)$|$R(i,1)$|$R(i,2)$|$R(i,3)$ |$R(i,4)$|$R(i,5)$|$R(i,6)$|$R(i,7)$|
|---|---|---|---|---|---|---|---|---|
|$R(0,j)$ | 0.9207||||||||
|$R(1,j)$ | 0.9398|0.9461|||||||
|$R(2,j)$ | 0.9445|0.9461|0.9461||||||
|$R(3,j)$ |0.9457|0.9461|0.9461|0.9461|||||
|$R(4,j)$ |0.9460|0.9461|0.9461|0.9461|0.9461||||
|$R(5,j)$ |0.9461|0.9461|0.9461|0.9461|0.9461|0.9461|||
|$R(6,j)$ |0.9461|0.9461|0.9461|0.9461|0.9461|0.9461|0.9461||
|$R(7,j)$ |0.9461|0.9461|0.9461|0.9461|0.9461|0.9461|0.9461|0.9461|

### $R(i,j)$三角阵列，$\int_{-1}^{1} \frac{cos(x)-e^x}{sin(x)}\,dx$

|$R(i,j)$| $R(i,0)$|$R(i,1)$|$R(i,2)$|$R(i,3)$ |$R(i,4)$|$R(i,5)$|$R(i,6)$|$R(i,7)$|
|---|---|---|---|---|---|---|---|---|
|                      $R(0,j)$ | -2.7932||||||||
|                      $R(1,j)$ | -2.3966|-2.2644|||||||
|                      $R(2,j)$ | -2.2852|-2.2481|-2.2470||||||
|                      $R(3,j)$ |-2.2563|-2.2467|-2.2466|-2.2466|||||
|                      $R(4,j)$ |-2.2490|-2.2466|-2.2466|-2.2466|-2.2466||||
|                      $R(5,j)$ |-2.2472|-2.2466|-2.2466|-2.2466|-2.2466|-2.2466|||
|                      $R(6,j)$ |-2.2467|-2.2466|-2.2466|-2.2466|-2.2466|-2.2466|-2.2466||
|                      $R(7,j)$ |-2.2466|-2.2466|-2.2466|-2.2466|-2.2466|-2.2466|-2.2466|-2.2466|

### $R(i,j)$三角阵列，$\int_{1}^{\infty} (xe^x)^{-1}\,dx$

|$R(i,j)$| $R(i,0)$|$R(i,1)$|$R(i,2)$|$R(i,3)$ |$R(i,4)$|$R(i,5)$|$R(i,6)$|$R(i,7)$|
|---|---|---|---|---|---|---|---|---|
|              $R(0,j)$ | 0.1839||||||||
|              $R(1,j)$ | 0.2273|0.2418|||||||
|              $R(2,j)$ | 0.2198|0.2173|0.2157||||||
|              $R(3,j)$ |0.2194|0.2192|0.2193|0.2194|||||
|              $R(4,j)$ |0.2194|0.2194|0.2194|0.2194|0.2194||||
|              $R(5,j)$ |0.2194|0.2194|0.2194|0.2194|0.2194|0.2194|||
|              $R(6,j)$ |0.2194|0.2194|0.2194|0.2194|0.2194|0.2194|0.2194||
|              $R(7,j)$ |0.2194|0.2194|0.2194|0.2194|0.2194|0.2194|0.2194|0.2194|