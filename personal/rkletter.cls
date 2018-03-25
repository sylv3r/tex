\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rkletter}[2018/01/02 Richard Kemp's letter class]

\LoadClass[10pt,french]{base}

\setlength{\parindent}{0em}

\RequirePackage{fontspec}

\setmainfont{GillSans.ttc}[
  Path = ${HOME}/.fonts/,
  UprightFeatures = {FontIndex=7},
  BoldFeatures = {FontIndex=0},
  ItalicFeatures = {FontIndex=8},
  BoldItalicFeatures = {FontIndex=2},
]

%% CLASS ATTRIBUTES

%% SENDER
\newcommand\sname[1]{\renewcommand\@sname{#1}}
\newcommand\@sname{\@latex@error{No \noexpand\sname given}\@ehc}
\newcommand\saddress[1]{\renewcommand\@saddress{#1}}
\newcommand\@saddress{\@latex@error{No \noexpand\saddress given}\@ehc}

%% RECEIVER
\newcommand\rname[1]{\renewcommand\@rname{#1}}
\newcommand\@rname{\@latex@error{No \noexpand\rname given}\@ehc}
\newcommand\raddress[1]{\renewcommand\@raddress{#1}}
\newcommand\@raddress{\@latex@error{No \noexpand\raddress given}\@ehc}

% \newcommand\date[1]{\renewcommand\@date{#1}}
% \newcommand\@date{\@latex@error{No \noexpand\date given}\@ehc}

\newcommand\location[1]{\renewcommand\@location{#1}}
\newcommand\@location{\@latex@error{No \noexpand\location given}\@ehc}

\newcommand\reference[1]{\renewcommand\@reference{#1}}
\newcommand\@reference{\@latex@error{No \noexpand\reference given}\@ehc}

\newcommand\subject[1]{\renewcommand\@subject{#1}}
\newcommand\@subject{\@latex@error{No \noexpand\subject given}\@ehc}

\newcommand\opening[1]{\renewcommand\@opening{#1}}
\newcommand\@opening{Madame, Monsieur}

\newcommand\closing[1]{\renewcommand\@closing{#1}}
\newcommand\@closing{Je vous prie d'agréer, Madame, Monsieur, mes sincères salutations}

\newcommand\lrar{\renewcommand\@lrar{\vskip1em\underline{\MakeUppercase{\bfseries
  lettre recommandée avec accusé de réception}}\vskip1,5em}}
\newcommand\@lrar{}

\newcommand\encl[1]{\renewcommand\@encl{\itshape Pièce(s)-jointe(s)~:~#1}}
\newcommand\@encl{}


\newenvironment{letter}
  {
    \document
    \pagenumbering{gobble}
    \thispagestyle{empty}
    \null
    \vskip 1em
    \@sname \\
    \@saddress
    \vskip 1em
    \hskip0.65\textwidth\relax
    \begin{tabular}{l@{}}
      \@rname \\ \@raddress \\ \\ \\
    \end{tabular} \\
    \DTMsavedate{date}{\@date}
    \hspace*{\fill}{\itshape\@location, le\DTMtextdate{\DTMusedate{date}}}
    \vskip 3em
    \@lrar
    {\bfseries Objet~:~\@subject} \\ 
    {\bfseries Référence~:~\@reference} \par
    \vskip 2em
    \setlength{\parindent}{2em}
    \@opening, \par
    \vskip 1em
  }
  {
    \vskip 2em
    \@closing, \par
    \vskip 1,5em
    \hskip0.6\textwidth\relax
    \begin{tabular}{l@{}}
      {\rule{1,5em}{1pt}} \\
      \@sname
    \end{tabular} \\
    \vfill
    \@encl
    \enddocument
  }
