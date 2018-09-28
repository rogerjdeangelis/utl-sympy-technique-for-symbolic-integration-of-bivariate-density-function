Python sympy technique for symbolic integration of bivariate density function

 Integrate the Bivariate function

    5      5
   /      /
   |      |  exp(-x**2 - y**2) dx dy
   /      /
   -5     -5

Not an exact solution to SAS forum but related.

github
https://tinyurl.com/y87qhzjc
https://github.com/rogerjdeangelis/utl-sympy-technique-for-symbolic-integration-of-bivariate-density-function

see SAS  Forum
https://tinyurl.com/yba2xeeo
https://communities.sas.com/t5/SAS-IML-Software-and-Matrix/can-we-extend-the-trapezoidal-rule-to-cover-bivariate-pdf/m-p/499851

macros
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

Sympy can also do numerical integration
https://docs.sympy.org/0.7.6/modules/mpmath/calculus/integration.html



Problem integrate the bivariate function below.


INPUT
=====

 Integrate the Bivariate function

    5      5
   /      /
   |      |  exp(-x**2 - y**2) dx dy
   /      /
   -5     -5


 CONTOUR PLOT

   5 -......*......
   4 -...../--\....
   3 -..../----\...
   2 -.../--X---\..
   1 -../--XXX---\.
   0 -.*--XXXXX---*
  -1 -..\--XXX---/.
  -2 -...\--X---/..
  -3 -....\----/...
  -4 -.....\--/....
  -5 -......*/.....
     --------------
     -5    -0    +5

EXAMPLE OUTPUT
--------------

  %put &=fromPy;

  FROMPY = PI * ERF(5) **2

  data;
    volume = constant('PI') * ERF(5) **2;
    put volume=;
  run;quit;

  VOLUME=3.1415926536



PROCESS
=======

%utl_submit_py64("
 from sympy import *;
 import pyperclip;
 x, y = symbols('x y');
 volume=str(integrate(exp(-x**2 - y**2), (x, -5, 5), (y, -5, 5)));
 print volume;
 pyperclip.copy(volume);
",return=frompy);

 %put &=fromPy;

 FROMPY = PI * ERF(5) **2

 data;
   volume = constant('PI') * ERF(5) **2;
   put volume=;
 run;quit;

 VOLUME=3.1415926536

OUTPUT
======

 VOLUME=3.1415926536

*                _
  ___ ___  _ __ | |_ ___  _   _ _ __
 / __/ _ \| '_ \| __/ _ \| | | | '__|
| (_| (_) | | | | || (_) | |_| | |
 \___\___/|_| |_|\__\___/ \__,_|_|

;

* without the powerfull classic graphics editor;
data have;
 do x=-5 to 5 by .25;
   do y=-5 to 5 by .25;
      z=10*exp(-x**2 - y**2);
      output;
   end;
 end;
run;quit;

options ls=100 ps=100;
proc plot data=have;
plot y*x=z / contour=7;
run;quit;
options ls=171 ps=32;
run;quit;




   1.50 +.........................................
        |
   1.25 +..................'''''..................
        |
   1.00 +.................''+++''.................
        |
   0.75 +................'++OOO++'................
        |
   0.50 +...............''+WW*WW+''...............
        |
   0.25 +...............'+OW*#*WO+'...............
        |
   0.00 +...............'+O*###*O+'...............
        |
  -0.25 +...............'+OW*#*WO+'...............
        |
  -0.50 +...............''+WW*WW+''...............
        |
  -0.75 +................'++OOO++'................
        |
  -1.00 +.................''+++''.................
        |
  -1.25 +..................'''''..................
        |
  -1.50 +.........................................
        |
        |
        ---+-----------------+--------------------+
         -5.00              0.00                  +5







