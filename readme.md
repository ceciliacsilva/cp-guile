What is Constraint Programming?
--------------------

"In computer science, constraint programming is a programming paradigm wherein relations between variables are stated in the form of constraints. Constraints differ from the common primitives of imperative programming languages in that they do not specify a step or sequence of steps to execute, but rather the properties of a solution to be found." - Wikipedia

This system is based on the chapter "3.3.5 Propagation of Constraints" of the SICP (Structure and Interpletation of Computer Programs) book. "We combine constraints by constructing constraint networks, in which constraints are joined
by connectors. A connector is an object that ‘‘holds’’ a value that may participate in one or more
constraints."

Programs
------

Language: Racket Language <https://racket-lang.org/>

Functions implemented: +,*,-,/,sin,cos,tan,sqrt,sqr.

It has a flag to indicate if the system is in degrees or radians, file: system.scm.

Syntax
-----

For exemple:

	> (*v (cv 20) (cv 30))
	> (+v (sinv 90) (cv 3))

Exemples:
-------

At the directory 'exemples' has two very simple programs:

       temperature.scm: relationship 9C = 5(F - 32) expressed in three different way.
       mix.scm: angle-coordinates.

To use:

       $ cd exemples/
       $ drracket mix.scm
       > (cord-ang 'x 'set 2)
       Probe: x = 2
       $1 = done
       > (cord-ang 'y 'set-value! 2)
       Probe: ang = 44.99999999412422
       Probe: y = 2
       $2 = done

More info on files.

Robot
-----

Inverse kinematics using constraint programming, modified anthropomorphic robot.
	File: robot.scm
