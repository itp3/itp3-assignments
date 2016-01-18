## assignment.cls

This is a simple LaTeX class for assignments and solutions.
The main file is `assignment.cls` which can be downloaded
[here](https://raw.githubusercontent.com/itp3/itp3-assignments/master/assignment.cls)
in the newest version.

An example for an assignment is provided as `example-assignment.tex`
with a preview here: [example-assignment.pdf](https://github.com/itp3/itp3-assignments/raw/master/example-assignment.pdf), [example-solution.pdf](https://github.com/itp3/itp3-assignments/raw/master/example-solution.pdf).

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

### Solutions
Use the `solution` environment to add solutions to your exercises:
```tex
\begin{exercises}

\exercise{Title of exercise one}
Introduction to this exercise.

  \begin{tasks}
    \task First sub-task
    \task Second sub-task
  \end{tasks}

  \begin{solution}
    \begin{tasks}
      \task Solution to first sub-task
      \task Solution to second sub-task
    \end{tasks}
  \end{solution}

\end{exercises}
```
The visibility of the solution boxes can be toggled by the `solution`/`nosolution` class options:
```tex
\documentclass[solution]{assignment}
```
Alternatively, you can generate both versions from the command line (see `Makefile`).

### Selective commands
Sometimes you want to add a detail (like a page break) to just one of the two versions (`solution` or `nosolution`). In this case, you can use the commands
```tex
\ifsolution{This will only appear in the solution version}
\ifnosolution{This will only appear in the version without the solutions}
```

### Custom commands
Several helper commands are provided for Dirac-notation, integrals
and many other things. An overview of all commands can be found here:
[cheatsheet.pdf](https://github.com/sharkdp/latex-report/raw/master/tools/cheatsheet.pdf).
