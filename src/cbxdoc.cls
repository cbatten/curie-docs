%=========================================================================
% CBX Document Class
%=========================================================================
% This class file is for generic documents such as reports, problem sets,
% and laboratory assignments. It uses the Palatino font which is a nice
% sans serif font, and at least a little more modern than the ironically
% named Computer Modern default. The class file puts the title and
% subtitle at the top of each page and page numbers are centered at the
% bottom.
%
% Author : Christopher Batten
% Date   : September 6, 2010
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxdoc}[2010/09/06 ver 0.1]
\LoadClass[10pt]{article}

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------

\RequirePackage[T1]{fontenc}  % Make sure we use T1 font encoding
\RequirePackage{mathpazo}     % Use palatino for serif font
\linespread{1.05}             % http://www.tug.dk/FontCatalogue/palatino

\RequirePackage{geometry}     % Page layout
\RequirePackage{graphicx}     % To include graphics
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting
\RequirePackage{xcolor}       % Colored text
\RequirePackage{datetime}     % Date/time formatting
\RequirePackage{url}          % Format URLs
\RequirePackage{fancyvrb}     % Pretty code formatting
\RequirePackage{array}        % More table options
\RequirePackage{tikz}
\RequirePackage{titlesec}
\RequirePackage{rotating}
\RequirePackage{afterpage}
\RequirePackage{caption}

\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code

%-------------------------------------------------------------------------
% Document Parameters
%-------------------------------------------------------------------------

\renewcommand{\title}[1]      {\gdef\cbx@title{#1}}
\newcommand{\subtitle}[1]     {\gdef\cbx@subtitle{#1}}
\renewcommand{\author}[1]     {\gdef\cbx@author{#1}}
\newcommand{\institution}[1]  {\gdef\cbx@institution{#1}}

%-------------------------------------------------------------------------
% Misc Setup
%-------------------------------------------------------------------------

% Setup date/time formats suitable for revision numbers

\newdateformat{revdate}{\THEYEAR-\twodigit{\THEMONTH}-\twodigit{\THEDAY}}
\newtimeformat{revtime}{\twodigit{\THEHOUR}-\twodigit{\THEMINUTE}}

% Paragraph setup

\setlength{\parskip}{0.5em}
\setlength{\parindent}{0pt}

% Float spacing

\setlength{\floatsep}{0.3in}
\renewcommand{\floatpagefraction}{0.9}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.9}
\renewcommand{\textfraction}{0.1}
\setcounter{totalnumber}{50}
\setcounter{topnumber}{50}
\setcounter{bottomnumber}{50}

\clubpenalty=10000
\widowpenalty=10000

%-------------------------------------------------------------------------
% Page Layout
%-------------------------------------------------------------------------
% A margin of 1.2in seems to be a good compromise between number of
% characters per line vs. compactness.

\geometry
{%
  margin=1.2in,
  headheight=15pt,
}

%-------------------------------------------------------------------------
% Header/Footers
%-------------------------------------------------------------------------
% We put the title and subtitle in the header and the page numbers are
% centered in the footer.

\fancypagestyle{mainpagestyle}%
{%
  %
  % Header Left
  %
  \fancyhead[L]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
    \ifthenelse{ \NOT\isundefined{\cbx@title} }%
    {%
      \textit{ENGRG 1060 Explorations in Engineering}%
    }%
    }{}%
  }%
  %
  % Header Center
  %
  \fancyhead[C]
  {%
    \ifthenelse{ \isundefined{\cbx@subtitle} }%
    {%
    \ifthenelse{ \NOT\isundefined{\cbx@title} }%
    {%
      \textit{\cbx@title}%
    }%
    }{}%
  }%
  %
  % Header Right
  %
  \fancyhead[R]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@subtitle}%
    }{}%
  }%
  %
  % Footer
  %
  \fancyfoot[C]{\thepage}%
}%

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\pagestyle{mainpagestyle}

%-------------------------------------------------------------------------
% Title Block
%-------------------------------------------------------------------------

\renewcommand{\@maketitle}
{%
  \centering%
  %
  % Title
  %
  {\Large\textbf{\cbx@title\\\cbx@subtitle}\par}%
  %
  % Subtitle
  %
  %\ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
  %{%
  %  {\Large\textbf{}\par}%
  %}{}%
  %
  % Author
  %
  \ifthenelse{ \NOT\isundefined{\cbx@author} }%
  {%
    \vspace{0.15in}%
    {\large\cbx@author\par}%
  }{}%
  %
  % Institution
  %
  \ifthenelse{ \NOT\isundefined{\cbx@institution} }%
  {%
    \vspace{0.1in}%
    {\cbx@institution\par}%
  }{}%
  %
  % Revision
  %
  \vspace{0.1in}%
  %revision: \revdate\today{}-\revtime\par%
  %
  \thispagestyle{plain}%
}

%-------------------------------------------------------------------------
% Section Formatting
%-------------------------------------------------------------------------

\titleformat{\section}
  {\normalfont\bfseries\large}
  {\thesection.}
  {1ex}{}{}

\titlespacing{\section}{0pt}{*2}{*1}

\titleformat{\subsection}
  {\normalfont\bfseries}
  {\thesection.\Alph{subsection}}
  {1ex}{}{}

\titlespacing{\subsection}{0pt}{*2}{*1}
\renewcommand{\thesubsection}{\thesection.\Alph{subsection}}

%-------------------------------------------------------------------------
% \nsfproposal@setfontsize{pts} Macro
%-------------------------------------------------------------------------
% We explicitly set the font sizes in points so that we know exactly how
% big each font. Subsection headers are supposed to be 11pt, but there
% is no equivalent built-in LaTeX font size which corresponds to 11pt% (normalsize is 10pt and large is 12pt). Notice we always calculate the
% the line spacing to be 1.2 times the font size.

\newlength{\nsfproposal@Templen}
\newcommand{\nsfproposal@setfontsize}[1]
{%
  \setlength{\nsfproposal@Templen}{#1 * \real{1.2}}%
  \fontsize{#1}{\the\nsfproposal@Templen}\selectfont%
}

\newlength{\cbx@Templen}
\newcommand{\cbxsetfontsize}[1]
{%
  \setlength{\cbx@Templen}{#1 * \real{1.2}}%
  \fontsize{#1}{\the\cbx@Templen}\selectfont%
}

%-------------------------------------------------------------------------
% Caption Fontsizes
%-------------------------------------------------------------------------
% We make the caption font slightly smaller than 11pt to make it
% separate from the text a bit more (smaller caption sizes are allowed
% in the GPG). We also bold the caption label, anticipating that each
% caption will include a short bold title.

\DeclareCaptionFont{slightlysmaller}{\nsfproposal@setfontsize{9pt}}
\captionsetup{font={slightlysmaller},labelfont={bf},skip=8pt}
\captionsetup[sub]{justification=centering,font={slightlysmaller},labelfont={},skip=6pt}
\newcommand{\cbxcaptionsize}{\nsfproposal@setfontsize{9pt}}

% Sometimes we want to manually create subfigure labels. For example we
% might have three subfigures but they are really subplots in a single
% pdf. We can use the following macro to create the subfigure captions.
% It takes two arguments: the first is the width of the subfigure
% caption and the second is the subfigure text. Put your label in the
% subfigure text.

\newcommand{\cbxsubfigcaption}[2]{\subfloat[#2]{\rule{#1}{0pt}}}

%-------------------------------------------------------------------------
% Compact formatting
%-------------------------------------------------------------------------

\newcommand{\TT}[1]{\texttt{#1}}
\newcommand{\BF}[1]{\textbf{#1}}
\newcommand{\IT}[1]{\textit{#1}}
\newcommand{\RM}[1]{\textrm{#1}}

%-------------------------------------------------------------------------
% Table row formatting
%-------------------------------------------------------------------------

\newcolumntype{+}
{%
  >{\global\let\currentrowstyle\relax}%
}

\newcolumntype{^}
{%
  >{\currentrowstyle}%
}

\newcommand{\rs}
{%
  \gdef\currentrowstyle{\lastrowstyle}%
  \lastrowstyle\ignorespaces%
}

\newcommand{\rowstyle}[1]
{%
  \gdef\lastrowstyle{#1}%
  \gdef\currentrowstyle{#1}%
  #1\ignorespaces%
}

%-------------------------------------------------------------------------
% Code block formatting
%-------------------------------------------------------------------------

\renewcommand{\FancyVerbFormatLine}[1]
{%
  \parbox{2.5ex}{\raggedleft\theFancyVerbLine} #1%
}

%-------------------------------------------------------------------------
% Lists
%-------------------------------------------------------------------------

\newenvironment{cbxlist}[4][\textbullet]
{%
  \begin{list}{#1}
  {%
    \setlength{\leftmargin}{#2}
    \setlength{\rightmargin}{#3}
    \setlength{\topsep}{0pt}
    \setlength{\parsep}{0pt}
    \setlength{\listparindent}{0pt}
    \setlength{\itemsep}{#4}
  }
}{%
  \end{list}
}

%-------------------------------------------------------------------------
% Simple Macros
%-------------------------------------------------------------------------

\newcommand{\fixme}[1]{{\color{red}\bfseries [ FIXME: #1 ]}}
\newcommand{\wu}[2]{\mbox{#1\,#2}}
\newcommand{\um}{\mbox{\textmu m}}
\newcommand{\X}{$\times$}
\newcommand{\x}{\thinspace$\times$\thinspace}
\newcommand{\by}{$\times$}
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}

\renewcommand{\FancyVerbFormatLine}[1]
{%
  \parbox{1.5ex}{\raggedleft\theFancyVerbLine} #1%
}

