\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iserc}[2011/09/26 v0.1 Extension for the article class to produce an iserc article]

\newif\if@review

\DeclareOption{review}{%
  \@reviewtrue
}

\ProcessOptions
\LoadClass[10pt]{article}


\RequirePackage[T1]{fontenc}
\RequirePackage{pslatex}
\RequirePackage[includehead,lmargin=1in,rmargin=1in,tmargin=0.6in,bmargin=1in,bindingoffset=0in,headheight=23pt,headsep=6pt]{geometry}
\RequirePackage[english]{babel}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{abstract}
\RequirePackage{enumitem}
\RequirePackage[square,comma,sort&compress,numbers]{natbib}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{caption}


\titleformat{\section}{\large\bfseries}{\thesection.~}{0cm}{}
\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection~}{0cm}{}
\titlespacing{\section}{0pt}{12pt}{-4pt}
\titlespacing{\subsection}{0pt}{12pt}{-4pt}


\date{}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}

\fancyhf{}
\if@review
  \fancyhead[C]{}
\else
  \fancyhead[C]{\vspace*{\stretch{1}}\itshape \@authorlist}
\fi
\fancypagestyle{plain}{
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyhead[L]{\itshape\@conference}
}

\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}
\renewcommand{\labelitemiii}{\tiny $\blacksquare$}

\newcommand{\titlefont}{\bfseries \LARGE}
\newcommand{\authorfont}{\bfseries \large}

\newcommand\abstractID[1]{\gdef\@abstractID{#1}}
\def\@abstractID{\@latex@warning@no@line{No \noexpand\abstractID given}}

\newcommand\conference[1]{\gdef\@conference{#1}}
\def\@conference{\@latex@warning@no@line{No \noexpand\conference given}}

\newcommand\authorlist[1]{\gdef\@authorlist{#1}}
\def\@authorlist{\@latex@warning@no@line{No \noexpand\authorlist given}}

\setlength{\parskip}{4pt plus 1pt minus 1pt}
\setlength{\parindent}{0pt}


\setlist{topsep=0pt,itemsep=0pt,partopsep=0pt}
\setlist[description]{leftmargin=0pt}

\renewcommand\maketitle{
\setlength\abovedisplayskip{0pt}
\setlength\belowdisplayskip{0pt}
\thispagestyle{plain}
\quad
\begin{center}
\titlefont\@title
\end{center}
\if@review
  \begin{center}
    \authorfont Abstract ID: \@abstractID
  \end{center}
Note: ISERC 2012 manuscripts are reviewed using a double-blind process. Please use only the web conference management system-assigned abstract ID as the manuscript identifier, and place it in this section, as shown in the template. Do not include any author data on the manuscript submitted for review, but do allocate sufficient space for author data in the submitted manuscript to meet the 10-page limit. The abstract ID does not appear in a final, accepted manuscript.
\else
  \begin{center}
    \authorfont\@author
  \end{center}
\fi
}

\renewcommand{\abstractnamefont}{\bfseries\large}
\renewcommand{\abstracttextfont}{\normalsize}
\renewcommand{\absleftindent}{0cm}
\renewcommand{\absrightindent}{0cm}

\bibliographystyle{plainnat}
