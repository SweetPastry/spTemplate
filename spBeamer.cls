%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spBeamer
%
% Github:
% https://github.com/SweetPastry/spTemplate
%
% Authors:
% Sweet Pastry (SweetPastryLHX@gmail.com)
%
% License:
% CC BY 4.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spBeamer}[2025/07/22 version: 1.03.07, Author: Sweet Pastry]


\RequirePackage{kvoptions, etoolbox, xstring}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareBoolOption[true]{colorlinks}
\DeclareBoolOption[true]{nocite}
\DeclareStringOption[0]{style}
\DeclareStringOption[en]{lang}
\DeclareStringOption[ref]{ref}
\DeclareStringOption[undefined]{bibstyle}
\DeclareStringOption[Here is title]{title}
\DeclareStringOption{subtitle}
\DeclareStringOption[author]{author}
\DeclareStringOption[\@sp@author]{authorinshort}
\DeclareStringOption[affiliation]{affiliation}
\DeclareStringOption[\@sp@affiliation]{affiliationinshort}
\DeclareStringOption[\today]{date}
\DeclareStringOption[undefined]{mathfont}
\DeclareStringOption[0]{sectionpagestyle}
\ProcessKeyvalOptions*
\relax


\LoadClass[aspectratio=43]{beamer}
\setbeamertemplate{frametitle continuation}{}
\setlength{\parskip}{15pt}


\newcommand{\spTitle}[1]{\def\@sp@title{#1}}
\newcommand{\spSubtitle}[1]{\def\@sp@subtitle{#1}}
\newcommand{\spAuthor}[2][\@sp@author]{\def\@sp@author{#2}\def\@sp@authorinshort{#1}}
\newcommand{\spAffiliation}[2][\@sp@affiliation]{\def\@sp@affiliation{#2}\def\@sp@affiliationinshort{#1}}
\newcommand{\spDate}[1]{\def\@sp@date{#1}}


\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{amsmath, amssymb, amsthm, amsfonts, mathtools, esint, yhmath, cancel, tensor, physics, mhchem, chemfig, xcolor, xkcdcolors, graphicx, pgfplots, tabularx, float, cuted, tikz, tikz-cd, circuitikz, array, pdfpages, lipsum, fancyvrb, refcount, multicol, hyperref}
\pgfplotsset{compat=1.18}
\IfStrEq{\@sp@lang}{cn}{%
\ifxetex\RequirePackage{xeCJK}\fi
\ifpdf\RequirePackage{ctex}\fi
}{\relax}
\newcommand{\song}{\CJKfamily{song}}
\usetikzlibrary{backgrounds, tikzmark, decorations.markings, arrows, arrows.meta, shapes, calc, patterns, bending}
\IfStrEqCase{\@sp@mathfont}{%
    {undefined}       {\relax}
    {palatino}        {\let\mathscr\relax\let\widering\relax\RequirePackage{newpxmath}}
    {fourier}         {\let\widering\relax\RequirePackage{fourier}}
    {fouriernc}       {\let\widering\relax\RequirePackage{fouriernc}}
    {times}           {\let\widering\relax\RequirePackage{newtxmath}}
    {arev}            {\RequirePackage{arev}}
    {design}          {\RequirePackage{mathdesign}}
    {cmbridge}        {\RequirePackage{cmbright}}
    {k}               {\RequirePackage{kmath}}
    {ptmx}            {\RequirePackage{mathptmx}}
    {euler}           {\let\widering\relax\RequirePackage{eulerpx}}
    {newtx}           {\let\widering\relax\RequirePackage{newtxmath, newtxtext}}
}[\PackageError{spArticle}{Math font \@sp@mathfont not found!}{Use other.}]


\IfStrEq{\@sp@bibstyle}{undefined}{%
    \IfStrEq{\@sp@lang}{en}{%
        \def\@sp@bibstyle{ieee}
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \def\@sp@bibstyle{gb7714-2015}
    }{%
    \PackageError{spBeamer}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}}


\RequirePackage{xurl}
\RequirePackage[backend=biber, style=\@sp@bibstyle]{biblatex}
\AtEndPreamble{%
  \IfEndWith{\@sp@ref}{.bib}{%
    \addbibresource{\@sp@ref}
  }{%
    \addbibresource{\@sp@ref.bib}
}}
\RequirePackage{bookmark}


\makeatletter
\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat{doi}{%
  \ifhyperref
    {\href{https://doi.org/#1}{DOI: \nolinkurl{#1}}}
    {DOI: \nolinkurl{#1}}}
\makeatother


\useoutertheme{infolines}
\useinnertheme{rectangles}
\usefonttheme{professionalfonts}


% BrowBlack and OrangeRed, style 0
% orange #f28165
% deepgray #303030
% yellow #f0be52
% lightorange #f19e58
\definecolor{orange}{HTML}{f28165}
\definecolor{deepgray}{HTML}{303030}
\definecolor{yellow}{HTML}{f0be52}
\definecolor{lightorange}{HTML}{f19e58}

% White and Black, style 1
% Balck #000000
% White #FFFFFF
% Gray #BEBEBE
% DarkGray #4D4D4D
\definecolor{Black}{HTML}{000000}
\definecolor{White}{HTML}{FFFFFF}
\definecolor{Gray}{HTML}{BEBEBE}
\definecolor{DarkGray}{HTML}{4D4D4D}

% LightGrayWhite and TealBlue, style 2
% SlateGray #3E4E56
% ReflectiveWhite #F7F7F7
% TealBlue #2B6777
% SeafoamGreen #588A8A
\definecolor{SlateGray}{HTML}{3E4E56}
\definecolor{ReflectiveWhite}{HTML}{F7F7F7}
\definecolor{TealBlue}{HTML}{2B6777}
\definecolor{SeafoamGreen}{HTML}{588A8A}

% White and Deep Green, style 3
% OliveGreen #556B2F
% ReflectiveWhite #F7F7F7
% FruitOrange #E85D04
% LightGreen #82C91E
\definecolor{OliveGreen}{HTML}{556B2F}
\definecolor{ReflectiveWhite}{HTML}{F7F7F7}
\definecolor{FruitOrange}{HTML}{E85D04}
\definecolor{LightGreen}{HTML}{82C91E}

% SoleGray and Gold, style 4
% SoleGray #494949
% EmphaGold #E6B878
% LightGold #FEFCCD
% Bronze #B87333
\definecolor{SoleGray}{HTML}{494949}
\definecolor{EmphaGold}{HTML}{E6B878}
\definecolor{LightGold}{HTML}{FEFCCD}
\definecolor{Bronze}{HTML}{B87333}

% Catppuccin Lavender
% Lavender #CBA6F7
% DarkPurple #1E1E2E
% Iris #B4BEFE
% SoftPurple #F2CDFF
\definecolor{Lavender}{HTML}{CBA6F7}
\definecolor{DarkPurple}{HTML}{1E1E2E}
\definecolor{Iris}{HTML}{B4BEFE}
\definecolor{SoftPurple}{HTML}{F2CDFF}


\makeatletter
\ifcase\@sp@style
  \colorlet{primary}{orange}
  \colorlet{secondary}{deepgray}
  \colorlet{blue}{yellow}
  \colorlet{accent}{lightorange}
  \setbeamercolor{normal text}{bg=secondary,fg=white}
\or
  \colorlet{primary}{Black}
  \colorlet{secondary}{White}
  \colorlet{blue}{Gray}
  \colorlet{accent}{DarkGray}
  \setbeamercolor{normal text}{bg=secondary,fg=black}
\or
  \colorlet{primary}{SlateGray}
  \colorlet{secondary}{ReflectiveWhite}
  \colorlet{blue}{TealBlue}
  \colorlet{accent}{SeafoamGreen}
  \setbeamercolor{normal text}{bg=secondary,fg=black}
\or
  \colorlet{primary}{OliveGreen}
  \colorlet{secondary}{ReflectiveWhite}
  \colorlet{blue}{FruitOrange}
  \colorlet{accent}{LightGreen}
  \setbeamercolor{normal text}{bg=secondary,fg=black}
\or
  \colorlet{primary}{EmphaGold}
  \colorlet{secondary}{SoleGray}
  \colorlet{blue}{LightGold}
  \colorlet{accent}{Bronze}
  \setbeamercolor{normal text}{bg=secondary,fg=white}
  % \setbeamercolor{math text}{bg=secondary,fg=LightGold}
\or
  \colorlet{primary}{Lavender}
  \colorlet{secondary}{DarkPurple}
  \colorlet{highlight}{Iris}
  \colorlet{accent}{SoftPurple}
  \setbeamercolor{normal text}{bg=secondary,fg=white}
\else
  \PackageError{spBeamer}{Style index number exceed!}{Choose a smaller int number, 0 default.}
\fi
\makeatother


\makeatletter
\newcommand{\mybox}[1]{%
  \setbox0=\hbox{#1}%
  \setlength{\@tempdima}{\dimexpr\wd0+13pt}%
  \begin{tcolorbox}[colback=primary,colframe=primary,boxrule=0.5pt,arc=4pt,
      left=6pt,right=6pt,top=6pt,bottom=6pt,boxsep=0pt,width=\@tempdima]
    \textcolor{white}{#1}
  \end{tcolorbox}
}
\makeatother


\usecolortheme[named=primary]{structure}
\usecolortheme{sidebartab}
\usecolortheme{orchid}
\usecolortheme{whale}

\setbeamercolor{alerted text}{fg=blue}
\setbeamercolor{block title alerted}{bg=alerted text.fg!90!black}
\setbeamercolor{block title example}{bg=accent!60!black}
\setbeamercolor{background canvas}{bg=secondary}


\setbeamertemplate{footline}{%
  \leavevmode
  \hbox{%
    \begin{beamercolorbox}[wd=0.5\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}
      \usebeamerfont{author in head/foot}\insertshortauthor~~(\insertshortinstitute)
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=0.5\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}
      \usebeamerfont{date in head/foot}\insertframenumber{} / \inserttotalframenumber\hspace{2ex}
    \end{beamercolorbox}
  }
  \vskip0pt
}


\setbeamertemplate{blocks}[rectangle]
\setbeamercovered{dynamic}


\setbeamertemplate{section page}{%
  \begin{centering}
    \begin{beamercolorbox}[sep=27pt,center]{part title}
      \usebeamerfont{section title}\insertsection\par
      \usebeamerfont{subsection title}\insertsubsection\par
    \end{beamercolorbox}
  \end{centering}
}


\makeatletter
\AtEndPreamble{%
  \IfStrEq{\@sp@lang}{cn}{\hypersetup{CJKbookmarks=true}}{\hypersetup{CJKbookmarks=false}}
  \hypersetup{%
      pdfpagelabels = true,
      breaklinks = true,
      unicode = true,
      pdfauthor = {\@sp@author},
      pdftitle = {\@sp@title},
      pdfkeywords = {spArticle},
      bookmarks = true,
      bookmarksopen = true,
      colorlinks = true,
      linkcolor = .,
      citecolor = accent,
      urlcolor = accent,
      filecolor = accent,
  }
  \title{\bfseries\@sp@title}
  \subtitle{\@sp@subtitle}
  \author[\@sp@authorinshort]{\bfseries\@sp@author}
  \institute[\textit{\@sp@affiliationinshort}]{\textit{\@sp@affiliation}}
  \date{\@sp@date}
  \hbadness=10000
  \hfuzz=5pt
  \vbadness=10000
  \vfuzz=5pt
  \IfStrEq{\@sp@lang}{cn}{%
    \def\sp@tocname{目录}
  }{%
    \def\sp@tocname{Content}
}}
\makeatother


\makeatletter
\AddToHook{begindocument/end}{%
  \frame{\titlepage}
  \begin{frame}[label=content]{\IfStrEq{\@sp@lang}{en}{Summary}{\IfStrEq{\@sp@lang}{cn}{目录}{Summary}}}
    \hypertarget{toc}{}
    \begin{multicols}{2}
      \tableofcontents
    \end{multicols}
  \end{frame}
  }
  \AtBeginDocument{%
    \bookmark[dest=toc,level=2]{\sp@tocname}
}
\makeatother


\setbeamertemplate{navigation symbols}{%
  \insertslidenavigationsymbol
  \insertframenavigationsymbol
  \insertsubsectionnavigationsymbol
  \insertsectionnavigationsymbol
  % \insertbackfindforwardnavigationsymbol
  \hyperlink{content}{\insertdocnavigationsymbol}
}


\makeatletter
\patchcmd{\beamer@continueautobreak}{\frametitle}{\beamer@gobbleoptional}{}{\errmessage{failed to patch}}
\patchcmd{\beamer@continueautobreak}{\framesubtitle}{\beamer@gobbleoptional}{}{\errmessage{failed to patch}}
\AtEndDocument{%
    \begin{frame}[allowframebreaks, plain]
      \frametitle{\ifnum\insertcontinuationcount=1 \IfStrEq{\@sp@lang}{en}{References}{\IfStrEq{\@sp@lang}{cn}{参考文献}{References}}\else\relax\fi}
      \if@sp@nocite\nocite{*}\fi
      \IfStrEq{\@sp@lang}{en}{%
        \printbibliography
      }{%
        \IfStrEq{\@sp@lang}{cn}{%
        \printbibliography[title=参考文献]
      }{%
        \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
      }}
    \end{frame}

  \begin{frame}[plain]{}
    \centering
        \Huge\bfseries
    \textcolor{primary}{The End}
  \end{frame}
}
\makeatother


\newif\ifbibsection
\bibsectionfalse
\makeatletter
\ifcase\@sp@sectionpagestyle
  \AtBeginSection[]{%
    \ifbibsection
      \relax
    \else
        \frame{\sectionpage}
    \fi
  }
  \AtBeginSubsection[]{%
    \ifbibsection
      \relax
    \else
        \frame{\subsectionpage}
    \fi
  }
\or
  \setbeamertemplate{section in toc shaded}[default][50]
  \setbeamertemplate{subsection in toc shaded}[default][30]
  \setbeamertemplate{subsubsection in toc shaded}[default][15]
  \AtBeginSection[]{%
    \ifbibsection
      \relax
    \else
        \frame{\sectionpage}
    \fi
  }
  \AtBeginSubsection[]{%
    \begin{frame}{\IfStrEq{\@sp@lang}{en}{Summary}{\IfStrEq{\@sp@lang}{cn}{目录}{Summary}}}
      \begin{multicols}{2}
        \tableofcontents[
          sectionstyle=show/shaded,
          subsectionstyle=show/shaded/shaded,
          subsubsectionstyle=show/show/shaded/shaded
        ]
      \end{multicols}
    \end{frame}
  }
\else
    \PackageError{spBeamer}{Section Page Style Index Error!}{Use sectionpagestyle=0 as default.}
\fi
\makeatother
\AtBeginEnvironment{bibliography}{%
  \bibsectiontrue
}
\AtEndEnvironment{bibliography}{%
  \bibsectionfalse
}


\newcommand{\hlmath}[2]{\colorbox{#1!17}{$\displaystyle #2$}}
\newcommand{\hltext}[2]{\colorbox{#1!17}{#2}}
\newcommand{\mathcalbf}[1]{\boldsymbol{\mathcal{#1}}}