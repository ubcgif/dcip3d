\ProvidesClass{GIFmanual}
\NeedsTeXFormat{LaTeX2e}

% GIFManual is a specific article class that is 2 sides with 11pt font

%Set boolean for options
% Two-sided option is the default
\newif\ifoneside
\DeclareOption{oneside}{\onesidetrue}
\ProcessOptions\relax
\ifoneside
\LoadClass[11pt,oneside]{article}
\else
\LoadClass[11pt,twoside]{article}
\fi

% Packages the user will need
\RequirePackage{fullpage}
\RequirePackage{bm}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{natbib}
\RequirePackage{color}
\RequirePackage{subfig}
\RequirePackage{etoolbox}
\RequirePackage[colorlinks=true,linkcolor=black,citecolor=black,urlcolor=GIFblue]{hyperref}
\RequirePackage{ifthen}
\RequirePackage{datetime}
\RequirePackage{chngpage}
\RequirePackage{enumitem}


% Blue is the fileName colour
\definecolor{GIFblue}{rgb}{0,0,0.6}

% Table of Contents is called "Table of Contents"
\renewcommand{\contentsname}{Table of Contents}

% VARIABLE NAMES
% Files called by the \fileName{myFile} command
\newcommand{\fileName}[1]{\textcolor{GIFblue}{#1}}
\newcommand{\releaseDate}[1]{\def\@releaseDate{#1}}
\newcommand{\programDescription}[1]{\def\@programDescription{#1}}
\newcommand{\setversion}[1]{\def\@setversion{#1}}
\newcommand{\setpreV}[1]{\def\@setpreV{{#1}}}
\newcommand{\setprogramName}[1]{\def\@setprogramName{\uppercase{#1}}}
\newcommand{\prog}{\@setprogramName \ v\@setversion}
\newcommand{\preV}{\@setpreV}
\newcommand{\version}{\@setversion}
\newcommand{\programName}{\@setprogramName}
\newcommand{\codeName}[1]{\textcolor{GIFblue}{\texttt{#1}}}
\newcommand{\consortium}[1]{\def\@consortium{\uppercase{#1}}}
\newcommand{\NSERC}{Canada's \textbf{N}ational \textbf{S}cience and \textbf{E}ngineering \textbf{R}esearch \textbf{C}ouncil}

% Math commands
\newcommand{\curl}[2][]{
\ifstrempty{#1}{
\ensuremath{\nabla \times \mathbf{#2}}
}{
\ensuremath{\nabla_{#1} \times \mathbf{#2}}
}}

\newcommand{\grad}[2][]{
\ifstrempty{#1}{
\ensuremath{\nabla \mathbf{#2}}
}{
\ensuremath{\nabla_{#1} \mathbf{#2}}
}}
\newcommand{\divergence}[2][]{
\ifstrempty{#1}{
\ensuremath{\nabla \cdot \mathbf{#2}}
}{
\ensuremath{\nabla_{#1} \cdot \mathbf{#2}}
}}

\newcommand{\abs}[1]{\ensuremath{\left|#1\right|}}
\newcommand{\norm}[1]{\ensuremath{\left\|#1\right\|}}

\newtheorem{lemma}{Lemma}
\newtheorem{theorem}{Theorem}
\newtheorem{proof}{Proof}

\setlength{\parskip}{0.25cm}

% Create title page
\renewcommand{\maketitle}{
\begin{titlepage}
\setcounter{page}{0}
\pagenumbering{roman}
% Add the title a bit down the page
\vspace*{1cm}
\begin{center}
% Title of program
{ \huge \textbf{\@setprogramName }}
\vfill

% Description of program
\begin{minipage}{14cm}
\begin{center}
{ \LARGE \textbf{\@programDescription}} \\[0.5cm]
{ \huge \textbf{Version \@setversion }}
\end{center}
\end{minipage}

% Any consortium information:
\vfill
\begin{minipage}{14cm}
\begin{center}
\ifx\@consortium\isempty
% Don't write anything about the consortium
\else
\Large{{Developed under the consortium research project:} \\ 
\vspace{0.5cm}
\LARGE \@consortium}
\fi
\end{center}
\end{minipage}

\vfill
\begin{minipage}{14cm}
\begin{center}
\ifx\@releaseDate\isempty
\else
\Large Release date: \@releaseDate
\fi
\end{center}
\end{minipage}

\vfill
\includegraphics[height=1.5in]{logo} \\
UBC - Geophysical Inversion Facility 1988 -- 2012
\end{center}

\end{titlepage}
}

%\tableofcontents definition
\let\stdtableofcontents\tableofcontents
\renewcommand\tableofcontents{
\clearpage{\pagestyle{empty}\cleardoublepage}
\thispagestyle{empty}
\setcounter{tocdepth}{2}
\stdtableofcontents
\cleardoublepage
\setcounter{page}{0}
\pagenumbering{arabic}
}

% Sections will always start on new page
\let\stdsection\section
\renewcommand\section{\clearpage{\pagestyle{empty}\cleardoublepage}\stdsection}

% Define the bibilography as a section called References
\renewcommand{\bibsection}{\section{References}}

% Define file example formatting
\newenvironment{fileExample}{
\begin{center}
\color{GIFblue}
\ttfamily
}{\end{center} \color{black} \vspace{.1cm} }

% Bibliography style is the same throughout
\bibliographystyle{seg}