\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2015/10/14 ITP3 exercise assignments]

\LoadClass[
     a4paper
    ,fontsize=12pt
    ,oneside
    ,english
]{scrartcl}

\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage{graphicx}
\usepackage{environ}
\usepackage{etoolbox}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{xspace}
\usepackage{microtype}
\usepackage{enumitem}
\usepackage{bm}
\usepackage{fancyhdr}
\usepackage[page]{totalcount}
\usepackage[
     pdfusetitle
    ,colorlinks=false
    ,pdfborder={0 0 0}
    ,unicode=true
]{hyperref}

% Options to control display of solutions
\DeclareOption{solution}{\toggletrue{solflag}}
\DeclareOption{nosolution}{\togglefalse{solflag}}

% Layout, header and footer
\setlength{\parindent}{0pt}
\pagestyle{fancy}
\fancyhf{}
\lhead{\textsf{\textbf{\lecture}}}
\rhead{\textsf{\textbf{\sheet}}}
\cfoot{\small{\textsf{Page \thepage~of \totalpages}}}

\AtBeginDocument{%
    \textsf{\lecturer \hfill \releaseDate}\\%
    \textsf{Institut für Theoretische Physik III, Universität Stuttgart \hfill \semester}\\%
    \vspace{7mm}%
    %
    \title{\sheet}%
    \date{\releaseDate}%
}

% Exercise environment and command
\newenvironment{exercises}{\begin{enumerate}[label=\textbf{Exercise \arabic*:},leftmargin=0pt,itemindent=5.48em,font=\sffamily,itemsep=8mm]}{\end{enumerate}}
\newcommand{\exercise}[1]{\item \textsf{\textbf{#1}}\par}

% Task environment and command
\newenvironment{tasks}{\begin{enumerate}[label=\alph*),leftmargin=*]}{\end{enumerate}}
\newcommand{\task}{\item}

% Solution toggles
\newtoggle{solflag}   % Toggle 'solflag' to control display of solutions
\togglefalse{solflag} % Default: No solutions
\ProcessOptions\relax % Execute options after toggle 'solflag' was declared

\iftoggle{solflag}{
    % Solution boxes
    \usepackage[framemethod=tikz]{mdframed}
    \usepackage{color}

    \mdfdefinestyle{mystylegray}{%
        skipbelow=1.5ex plus0pt minus0pt,
        skipabove=1.5ex plus0pt minus0pt,
        outerlinewidth=1pt,
        linecolor=black,
        innertopmargin=7pt plus 0.0pt minus 0.0pt,
        innerbottommargin=7pt plus 0.0pt minus 0.0pt,
        frametitle={Solution},
        frametitlebelowskip=2pt,
        frametitlerule=false,
        frametitlefont=\sffamily\color{white}\footnotesize,
        frametitlerulewidth=0pt,
        frametitlerulecolor=black,
        frametitlebackgroundcolor=black,
        font=\sffamily\small,
        nobreak=false,
        backgroundcolor=white,
        innerlinewidth=0pt,
        topline=false,
        bottomline=true,
        leftline=true,
        rightline=true
    }

    \mdtheorem[style=mystylegray,nobreak=false]{sol}{Solution}

    % Seperate equations numbers in solution boxes
    % see: http://tex.stackexchange.com/a/184659/42128
    \newcounter{solcounter}

    \makeatletter
    \NewEnviron{solution}{%
      \global\chardef\dc@currentequation=\value{equation}%
      \let\c@equation\c@solcounter%
      \renewcommand{\theequation}{S\arabic{equation}}%
      \renewcommand{\theHequation}{S\arabic{equation}}%
      \begin{sol*}\BODY\end{sol*}%
    }
    \makeatother
}{
    \NewEnviron{solution}{ }
}

% These commands can be used to selectively add things to the nosolution/solution versions:

\newcommand{\ifsolution}[1]{\iftoggle{solflag}{#1}}
\newcommand{\ifnosolution}[1]{\nottoggle{solflag}{#1}}

% Bold vectors
\renewcommand{\vec}[1]{\mathbf{#1}}

% This redefines a linebreak '\\' inside the 'align'-environment.
% It adds \notag to all aligns except the last (only one label
% for multi-line aligns).
\makeatletter
\def\Let@{\def\\{\notag\math@cr}}
\makeatother

%%% Size-adaptive math: {\textbackslash}leftX \ldots {\textbackslash}rightX
\newcommand{\bb}[1]{\left(#1\right)}                                        %% parantheses
\newcommand{\bc}[1]{\left[#1\right]}                                        %% brackets
\newcommand{\absv}[1]{\left|#1\right|}                                      %% absolute value
\newcommand{\absvsq}[1]{\absv{#1}^2}                                        %% absolute value squared
\newcommand{\comm}[2]{\left[#1, #2\right]}                                  %% commutator
\newcommand{\meanv}[1]{\left\langle #1\right\rangle}                        %% mean value

%%% Fixed-size math (for quickly changing from adaptive style)
\newcommand{\Bb}[1]{\big(#1\big)}                                           %% big parantheses
\newcommand{\BB}[1]{\Big(#1\Big)}                                           %% Big parantheses
\newcommand{\Bc}[1]{\big[#1\big]}                                           %% big brackets
\newcommand{\BC}[1]{\Big[#1\Big]}                                           %% Big brackets
\newcommand{\Absv}[1]{\big|#1\big|}                                         %% big absolute value
\newcommand{\ABSV}[1]{\Big|#1\Big|}                                         %% Big absolute value
\newcommand{\Absvsq}[1]{\Absv{#1}^2}                                        %% big absolute value squared
\newcommand{\ABSVSQ}[1]{\ABSV{#1}^2}                                        %% Big absolute value squared
\newcommand{\Comm}[2]{\big[#1, #2\big]}                                     %% big commutator
\newcommand{\COMM}[2]{\Big[#1, #2\Big]}                                     %% Big commutator
\newcommand{\Meanv}[1]{\big\langle #1\big\rangle}                           %% big mean value
\newcommand{\MEANV}[1]{\Big\langle #1\Big\rangle}                           %% Big mean value

%%% Braket notation
\newcommand{\bra}[1]{\ensuremath{\left\langle #1\right|}\xspace}             %% bra
\newcommand{\ket}[1]{\ensuremath{\left|#1\right\rangle}\xspace}              %% ket
\newcommand{\braket}[2]{\left\langle #1\middle|#2\right\rangle}              %% scalar product
\newcommand{\ketbra}[2]{\left|#1\middle\rangle\middle\langle #2\right|}      %% ket-bra operator
\newcommand{\braketop}[3]{\left\langle #1\middle|#2\middle|#3\right\rangle}  %% matrix element
\newcommand{\smallbraketop}[3]{\langle #1|#2|#3\rangle}                      %% small matrix element

%%% Special functions
\newcommand{\deltaf}[1]{\ensuremath{\delta\!\bb{#1}}\xspace}                    %% delta function
\newcommand{\thetaf}[1]{\ensuremath{\theta\!\bb{#1}}\xspace}                    %% theta function
\newcommand{\expf}[1]{\ensuremath{\operatorname{\text{exp}}\!\bb{#1}}\xspace}   %% exponential function
\newcommand{\ef}[1]{\ensuremath{\operatorname{e}^{#1}}\xspace}                  %% exponential function
\newcommand{\Ref}[1]{\ensuremath{\operatorname{Re}\!\bb{#1}}\xspace}            %% real part, function form
\newcommand{\Imf}[1]{\ensuremath{\operatorname{Im}\!\bb{#1}}\xspace}            %% imaginary part, function form
\renewcommand{\Re}{\operatorname{Re}}                                           %% real part
\renewcommand{\Im}{\operatorname{Im}}                                           %% imaginary part

%%% Named states
\newcommand{\ketPsi}{\ket{\Psi}}
\newcommand{\ketpsi}{\ket{\psi}}
\newcommand{\ketphi}{\ket{\varphi}}
\newcommand{\ketup}{\ket{\uparrow}}      %% spin up
\newcommand{\ketdn}{\ket{\downarrow}}    %% spin down
\newcommand{\ketzero}{\ket{0}}
\newcommand{\ketone}{\ket{1}}
\newcommand{\ketg}{\ket{g}}              %% ground state
\newcommand{\kete}{\ket{e}}              %% excited state
\newcommand{\vac}{\ket{\text{vac}}}      %% vacuum

%%% Pauli matrices
\newcommand{\sx}{\sigma^x}
\newcommand{\sy}{\sigma^y}
\newcommand{\sz}{\sigma^z}
\newcommand{\splus}{\sigma^{{+}}}
\newcommand{\sminus}{\sigma^{{-}}}

%%% Vectors
\newcommand{\vecr}{\vec{r}}
\newcommand{\vecrone}{\vec{r_1}}
\newcommand{\vecrtwo}{\vec{r_2}}
\newcommand{\vecrn}{\vec{r_N}}
\newcommand{\vecri}{\vec{r_i}}
\newcommand{\vecrj}{\vec{r_j}}
\newcommand{\vecR}{\vec{R}}
\newcommand{\vecx}{\vec{x}}
\newcommand{\vecy}{\vec{y}}
\newcommand{\vecz}{\vec{z}}
\newcommand{\vecxi}{\vec{x_i}}
\newcommand{\vecxj}{\vec{x_j}}
\newcommand{\veck}{\vec{k}}
\newcommand{\vecq}{\vec{q}}
\newcommand{\vecp}{\vec{p}}
\newcommand{\vecd}{\vec{d}}
\newcommand{\vecmu}{\boldsymbol{\mu}}
\newcommand{\vecsigma}{\boldsymbol{\sigma}}

%%% Differentiation
\newcommand{\partiald}[1]{\frac{\partial}{\partial #1}}               %% partial differentiation
\newcommand{\laplace}{\operatorname{\nabla^2}}                        %% laplace operator

%%% Integration
\newcommand{\integral}[1]{\int \! \mathrm{d} #1\,}                    %% integral
\newcommand{\integralb}[3]{\int\limits_{#1}^{#2} \! \mathrm{d} #3\,}  %% integral with boundaries
\newcommand{\integralf}[2]{\int \! \frac{\mathrm{d} #1}{#2}\,}        %% integral with fraction
\newcommand{\intvol}{\integral{^3r}}                                  %% integral over r space
\newcommand{\intvolp}{\integral{^3r'}}                                %% integral over r' space
\newcommand{\intvold}{\intvol\!\intvolp}                              %% double integral over space
\newcommand{\intk}{\integral{^3k}}                                    %% integral over k space
\newcommand{\intkp}{\integral{^3k'}}                                  %% integral over k' space
\newcommand{\intkn}{\integralf{^3k}{(2\pi)^3}}                        %% normalized integral over k space
\newcommand{\intkpn}{\integralf{^3k'}{(2\pi)^3}}                      %% normalized integral over k' space

%%% Special symbols
\newcommand{\hc}{\mathop{\text{h.c.}}}                               %% hermitian conjugate
\newcommand{\hamil}{\ensuremath{\operatorname{{\hat{H}}}}\xspace}    %% Hamilton operator
\newcommand{\hastobe}{\stackrel{!}{=}}                               %% has to be
\newcommand{\eqhat}{\mathrel{\widehat{=}}}                           %% corresponds to, is equivalent
\newcommand{\id}{\mathds{1}}                                         %% identity matrix
\newcommand{\const}{\mathop{\text{const.}}}                          %% hermitian conjugate
\newcommand{\goesto}{\longrightarrow}                                %% maps to, asymptotically goes to

%%% Second quantization
\newcommand{\aop}{\ensuremath{a^{\vphantom\dagger}}\xspace}          %% annihilation operator a
\newcommand{\aopd}{\ensuremath{a^\dagger}\xspace}                    %% creation operator a

\newcommand{\bop}{\ensuremath{b^{\vphantom\dagger}}\xspace}          %% annihilation operator b
\newcommand{\bopd}{\ensuremath{b^\dagger}\xspace}                    %% creation operator b

\newcommand{\cop}{\ensuremath{c^{\vphantom\dagger}}\xspace}          %% annihilation operator c
\newcommand{\copd}{\ensuremath{c^\dagger}\xspace}                    %% creation operator c

\newcommand{\nop}{\ensuremath{n}\xspace}                             %% number operator

\newcommand{\psiop}{\ensuremath{\psi^{\vphantom\dagger}}\xspace}     %% field operator psi
\newcommand{\psiopd}{\ensuremath{\psi^\dagger}\xspace}               %% creation operator psi

\newcommand{\PsiOp}{\ensuremath{\Psi^{\vphantom\dagger}}\xspace}     %% field operator Psi
\newcommand{\PsiOpd}{\ensuremath{\Psi^\dagger}\xspace}               %% creation operator Psi

%%% Differences
\newcommand{\Dx}{\Delta x}
\newcommand{\Dy}{\Delta y}
\newcommand{\Dt}{\Delta t}

%%% Trigonometry
\newcommand{\asin}{\operatorname{asin}}
\newcommand{\acos}{\operatorname{acos}}
\newcommand{\atan}{\operatorname{atan}}

%%% Figures
\newcommand{\igopt}[2]{\includegraphics[#1]{#2}} %%! options, filename

\newcommand{\ig}[2]{\igopt{width=#1\columnwidth}{#2}} %%! width in units of textwidth, filename

\newcommand{\figopt}[4]{ %%! width, filename, caption, placement (h, t, ht)
    \begin{figure}[#4]
        \centering
        \ig{#1}{#2}
        \caption{#3}
        \label{fig:#2}
    \end{figure}
}

\newcommand{\fig}[3]{ %%! width, filename, caption
    \figopt{#1}{#2}{#3}{ht}
}

\newcommand{\doublefigopt}[8]{ %%! w1, f1, c1, w2, f2, c2, main caption, placement
    \begin{figure}[#8]
        \centering
        \subfloat[#3]{
            \ig{#1}{#2}
            \label{fig:#2}
        }
        \subfloat[#6]{
            \ig{#4}{#5}
            \label{fig:#5}
        }
        \caption{#7}
        \label{fig:#2_#5}
    \end{figure}
}

\newcommand{\doublefig}[7]{\doublefigopt{#1}{#2}{#3}{#4}{#5}{#6}{#7}{ht}} %%! w1, f1, c1, w2, f2, c2, main caption
