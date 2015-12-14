\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{novanarrative}[2016/12/13 NOVA 40k Narrative Template]


%%----------------------------------------------------------------------
%%-- Core Packages

\LoadClass[12pt,twoside,letterpaper]{book}

\RequirePackage[cm,myheadings]{fullpage}

\pdfminorversion=4

\usepackage{etoolbox}

\newcommand{\backgroundpicodd}{art/background/background-odd.pdf}
\newcommand{\backgroundpiceven}{art/background/background-even.pdf}
\RequirePackage{changepage}

\newcommand{\setbackground}{%
\AddToShipoutPicture{
\checkoddpage
\ifoddpage
\BackgroundPic{\backgroundpicodd}
\else
\BackgroundPic{\backgroundpiceven}
\fi
}
}
\DeclareOption{nobackground}{\renewcommand{\setbackground}{}}
\ProcessOptions


%\RequirePackage{emptypage}
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\squelchbackground\origdoublepage}%
  \restorebackground
}
\let\cleardoublepage\clearemptydoublepage

%%----------------------------------------------------------------------
%%-- Other Packages

\RequirePackage[usenames,dvipsnames,table]{xcolor}
\definecolor{LightGray}{RGB}{245,245,245}
\definecolor{LineColor}{HTML}{a77337}%{065a78}

\RequirePackage{calc}
\RequirePackage{suffix}


%% Change the base font to Helvetica Sans
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{helvet}
\renewcommand*{\familydefault}{\sfdefault}

\RequirePackage{graphicx}

\RequirePackage{tikz}
\usetikzlibrary{shapes}
\usetikzlibrary{decorations}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}

\RequirePackage[obeyspaces]{url}

\RequirePackage{latexsym}

\RequirePackage{pdfpages}
\includepdfset{offset=1in -0.5in}

\RequirePackage{pifont}

\RequirePackage{textcomp}

\RequirePackage{stfloats}

\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{amsmath}
\RequirePackage{tabularx}
\RequirePackage{array}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{F}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

%%----------------------------------------------------------------------
%%-- Header and Footer


\RequirePackage[explicit,compact,pagestyles]{titlesec}

\usepackage[pagestyles]{titlesec}

%\pretocmd{\chapter}{
%}{}{}

\newpagestyle{main}{%
  \setfoot
    [\color{LineColor}\coalitionfont\thepage]% Even-left
    []% Even-center
    [\color{LineColor}\coalitionfont\MakeUppercase{\chaptertitle}]% Even-right
    {\color{LineColor}\coalitionfont 2016 NOVA OPEN 40K NARRATIVE}% Odd-left
    {}% Odd-center
    {\color{LineColor}\coalitionfont\thepage}% Odd-right
}

\newpagestyle{chap}{%
  \setfoot
    [\color{LineColor}\coalitionfont\thepage]% Even-left
    []% Even-center
    [\color{LineColor}\coalitionfont\MakeUppercase{\chaptertitle}]% Even-right
    {\color{LineColor}\coalitionfont 2016 NOVA OPEN 40K NARRATIVE}% Odd-left
    {}% Odd-center
    {\color{LineColor}\coalitionfont\thepage}% Odd-right
}

\pagestyle{main}
\assignpagestyle{\chapter}{chap}

% \RequirePackage{fancyhdr}
% \newcommand{\setupheaderfooter}{
% \fancyhf{}                         % Clear all header and footers
% \renewcommand{\headrulewidth}{0pt} % Remove the header rule
% \fancyfoot[LO,RE]{\thepage}        % Left side on Even pages;
%                                    % Right side on Odd pages
% \fancyfoot[RO]{2016 NOVA 40k Narrative}
% \fancyfoot[LE]{\chaptertitle}
% }
% \pagestyle{fancy}
% \setupheaderfooter                         % For the regular pages
% \fancypagestyle{plain}{\setupheaderfooter} % For the chapter title pages,
%                                            % which are in plain style

%%----------------------------------------------------------------------
%%-- Fonts

\newcommand{\coalitionfont}{\usefont{T1}{coalition}{m}{n}}

%%----------------------------------------------------------------------
%%-- Section Headings



\RequirePackage{onimage}


\titleformat{\chapter}
[display] % Shape
{\color{LineColor}\fontsize{36}{36}\coalitionfont} % Format
{} % Label
{0pt} % Separation
{\MakeUppercase{#1}} % Command (explicit)

\titlespacing*{\chapter}
{0pt}% Left
{0pt}% Before
{0pt}% After

\makeatletter
\patchcmd{\ttlh@display}{\strut}{}{}{}
\makeatother

\titleformat{\section}
[display] % Shape
{\bfseries\sffamily\Large} % Format
{} % Label
{0pt} % Separation
{#1} % Command (explicit)

\titlespacing*{\section}
{0pt}
{0pt}
{0pt}

% \makeatletter
% \def\@makechapterhead#1{%
% \parindent \z@ \raggedright \reset@font
% \hbox to \hsize{%
%   \vbox{%
%     \reset@font\sffamily\bfseries\Huge
%     #1
%       \par
%     }%
%   }%
% }
% \makeatother




%%----------------------------------------------------------------------
%%-- Compress Lists

\newcommand{\shortlist}{
\setlength{\labelwidth}{0pt}
\setlength{\leftmargin}{0pt}
% \setlength{\labelsep}{0pt}
% \renewcommand{\labelitemi}{*}
\setlength{\parskip}{0pt}
\setlength{\parsep}{0pt}
\setlength{\headsep}{0pt}
\setlength{\topskip}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\topsep}{0pt}
\setlength{\partopsep}{0pt}
}



%%----------------------------------------------------------------------
%%----------------------------------------------------------------------
%%-- Formatting

\newenvironment{columns}
{\begin{multicols}{2}
\@afterindentfalse\@afterheading
}
{\end{multicols}
\ignorespacesafterend
}

\newcommand{\divider}{%
\hrule
\vspace*{3pt}
\hrule
}

%%----------------------------------------------------------------------
%%----------------------------------------------------------------------
%%-- Background picture

\RequirePackage{eso-pic}

\newcommand\BackgroundPic[1]{%
\put(0,0){%
\parbox[b][\paperheight]{\paperwidth}{%
\vfill%
\centering%
\includegraphics[width=\paperwidth,height=\paperheight,%
keepaspectratio]{#1}%
\vfill%
}}}

\setbackground

\newcommand{\squelchbackground}{%
\ClearShipoutPicture
}

\newcommand{\restorebackground}{%
\setbackground
}

%%----------------------------------------------------------------------
%%-- Misc Commands

\RequirePackage{datetime}
\yyyymmdddate

\endinput
