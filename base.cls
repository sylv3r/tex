\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{base}[2017/12/19 Richard Kemp Base class]

\def\base@extendclass{extarticle}
\newcommand{\base@language}{english}

\newcommand\setLanguage[1]{
  % \typeout{before \base@language}
  % \typeout{SET #1}
  \renewcommand{\base@language}{#1}
  % \typeout{after \base@language}
  % \PassOptionsToClass{#1}{extarticle}
}

% \DeclareOption{english}{\setLanguage{\CurrentOption}}
% \DeclareOption{french}{\base@test{\CurrentOption}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\base@extendclass}}
\ProcessOptions\relax
% \typeout{LANGUAGE \base@language}

\LoadClass{\base@extendclass}
\setLanguage{french}

% Language and encoding
% \RequirePackage[English]{babel}
% \RequirePackage[utf8]{inputenc}
% \PolyglossiaSetup{french}{indentfirst=true}
\RequirePackage{polyglossia}
\RequirePackage[T1]{fontenc}

\setdefaultlanguage{\base@language}
\RequirePackage[\base@language]{translator}

\RequirePackage[calc]{datetime2}
\newcommand\DTMtextdate[1]{\DTMsetregional#1\DTMsetregional[false]}


\RequirePackage{intcalc}
\RequirePackage[nomessages]{fp}

% Set page format and geometry
\RequirePackage[a4paper, top=25mm, left=30mm, right=30mm, bottom=30mm,
  headheight=20mm,
  footskip=10mm
]{geometry}


\RequirePackage{setspace}
\setlength{\baselineskip}{3em}
\setlength{\parindent}{2em}
\setlength{\parskip}{0,5em}
\linespread{1,2}

% Avoid hyphenation while justifying the text
\hyphenchar\font=-1
\sloppy
\RequirePackage[none]{hyphenat}
\hbadness=99999 % Suppress underfull hbox warning since we are messing up with.

\DeclareTextFontCommand{\textbfit}{%
  \fontseries\bfdefault % change series without selecting the font yet
  \itshape
}

%% Patching spreadtab for cross-referenced numeric value between tables
\RequirePackage{spreadtab}
\newcommand\ST@func@value[2]{%
  \ifcsname ST@celltag@\detokenize\expandafter{#1}\endcsname
    \expandafter\let\expandafter#2\csname ST@celltag@\detokenize\expandafter{#1}\endcsname
  \else
    \PackageWarning\ST@package@name{The tag "\detokenize\expandafter{#1}" does not exists, have you defined it?}%
    \def#2{0}% use 0 if tag undefined
  \fi
}
\edef\ST@functions@with@text@arg{\ST@functions@with@text@arg,value}
\edef\ST@functions@no@calc@arg{\ST@functions@no@calc@arg,value}
\edef\ST@functions@list{\ST@functions@with@range@arg,\ST@functions@with@num@arg,\ST@functions@with@text@arg}
\edef\ST@functions@with@assign@argument{\ST@functions@with@assign@argument,value}

