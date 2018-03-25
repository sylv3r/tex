\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{alkhemists_doc}[2017/12/19 Alkhemists Documents class]

\LoadClass[10pt,french]{base}

\RequirePackage[table, dvipsnames]{xcolor}

\RequirePackage{alkhemists} % Default Styles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CUSTOM CLASS ATTRIBUTES

\newcommand\customer[1]{\renewcommand\@customer{#1}}
\newcommand\@customer{\@latex@error{No \noexpand\customer given}\@ehc}
\newcommand\order[1]{\renewcommand\@order{#1}}
\newcommand\@order{\@latex@error{No \noexpand\order given}\@ehc}
\newcommand\logo[1]{\renewcommand\@logo{#1}}
\newcommand\@logo{\@latex@error{No \noexpand\logo given}\@ehc}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADER AND FOOTER

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{2pt}

\pagestyle{fancy}
\fancyhf{}
\lhead{\small \color{grey} \condensedfont\bfseries SCYON LABS}
\rhead{\small \color{grey} \# \@order}
\cfoot{
  {\footer@style SCYON LABS | RCS PARIS 531 533 396
  | 101 rue de Sèvres, Lot 1665, 75272 PARIS CEDEX 06
  | +33 624 914 699 | contact@scyonlabs.com} \\
  \vskip 0.5em
  {\pager@style \thepage~/~\pageref*{LastPage}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TOC LINKS

\RequirePackage[]{hyperref}
\hypersetup{
  colorlinks=true,
  linktoc=all,
  linkcolor=black,
  pdfborderstyle={/S/U/W 1}
  % linktocpage, % link only the page number
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TABLES

\RequirePackage{tabu}
\RequirePackage{spreadtab}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CLASS COMMANDS

\newcommand{\maketitlepage}{
  \pagenumbering{gobble}
  \thispagestyle{empty}
  \begin{titlepage}
    \begin{flushright}
      \null
      \vskip 10em
      \includegraphics[height=12em]{\@logo}
      \vskip 10em
      {\title@style \@title \par}
    \end{flushright}
    % \vskip 10em
    \vspace*{\fill}
    \begin{flushleft}
      {\parties@style SCYON LABS} \\
      \vskip 5pt
      {\order@style Bon de Commande \#\@order} \\
      \vskip 3pt
      {\date@style \@date}
    \end{flushleft}
  \end{titlepage}
  \pagenumbering{arabic}
}
