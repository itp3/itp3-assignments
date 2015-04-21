## assignment.cls

This is a simple LaTeX class for assignments and solutions.
The main file is `assignment.cls` which can be downloaded
[here](https://raw.githubusercontent.com/sharkdp/itp3-exercises-template/master/assignment.cls)
in the newest version.

An example for an assignment is provided as `assignment-example.tex`
with a preview [here](https://github.com/sharkdp/itp3-exercises-template/raw/master/assignment-example.pdf).

## Usage

### Header
Simply start your document with the custom class:
```tex
\documentclass{assignment}
```

### Metadata
Lecture title, semester, lecturer, number of assignment and release date
are entered in the following way in the header of the document. The header
is created automatically.
```tex
\newcommand{\lecture}{Theoretische Physik IX: Superstringtheorie}
\newcommand{\semester}{SS 2015}
\newcommand{\lecturer}{Prof. Dr. Farnsworth}
\newcommand{\sheet}{Exercise 87}
\newcommand{\releaseDate}{22. April 2042}
```

### Exercises
Exercises are structured in an `exercises` environment. Each
separate exercise starts with an `\exercise{...}` command where
the argument is the title of the exercise:
```tex
\begin{exercises}

\exercise{Title of exercise one}
...

\exercise{Title of exercise two}
...

\end{exercises}
```

### Tasks
Sub-tasks (a, b, c, ...) can be specified in the follwing way:
```tex
\begin{exercises}

\exercise{Title of exercise one}
Introduction to this exercise.

  \begin{tasks}
    \task First sub-task
    \task Second sub-task
  \end{tasks}

\end{exercises}
```

### Custom commands
Several helper commands are provided for Dirac-notation, integrals
and many other things. An overview of all commands can be found here:
[cheatsheet.pdf](https://github.com/sharkdp/latex-report/raw/master/tools/cheatsheet.pdf).
