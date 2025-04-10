\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spBeamer}[2024/01/05 version: 1.00.03, Author: Sweet Pastry]


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
\PassOptionsToPackage{pdfpagelabels=true, breaklinks=true, unicode=true}{hyperref}
\RequirePackage{amsmath, amssymb, amsthm, amsfonts, esint, yhmath, cancel, tensor, physics, chemstyle, mhchem, chemfig, xcolor, xkcdcolors, graphicx, pgfplots, tabularx, float, cuted, tikz, tikz-cd, circuitikz, array, pdfpages, lipsum, fancyvrb, refcount, multicol, hyperref}
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



\DeclareSourcemap{
	\maps[datatype=bibtex]{
		\map{%
			\step[
			fieldsource=url,
			match=\regexp{http://dx.doi.org/(.+)},
			fieldtarget=doi,
			]
			\step[
			fieldsource=doi,
			match=\regexp{http://dx.doi.org/(.+)},
			replace=\regexp{$1}
        ]}
		\map{%
			\step[fieldsource=doi, final]
			\step[fieldset=url, null]
			\step[fieldset=urldate, null]
}}}


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

% BrowBlack and OrangeRed
\definecolor{orange}{HTML}{f28165}
\definecolor{deepgray}{HTML}{303030}
\definecolor{yellow}{HTML}{f0be52}
\definecolor{lightorange}{HTML}{f19e58}

% White and Black
\definecolor{Black}{HTML}{000000}
\definecolor{White}{HTML}{FFFFFF}
\definecolor{Gray}{HTML}{BEBEBE}
\definecolor{DarkGray}{HTML}{4D4D4D}

% LightGrayWhite and TealBlue
\definecolor{SlateGray}{HTML}{3E4E56}
\definecolor{ReflectiveWhite}{HTML}{F7F7F7}
\definecolor{TealBlue}{HTML}{2B6777}
\definecolor{SeafoamGreen}{HTML}{588A8A}

% White and Deep Green
\definecolor{OliveGreen}{HTML}{556B2F}
\definecolor{ReflectiveWhite}{HTML}{F7F7F7}
\definecolor{FruitOrange}{HTML}{E85D04}
\definecolor{LightGreen}{HTML}{82C91E}

% SoleGray and Gold
\definecolor{SoleGray}{HTML}{494949}
\definecolor{EmphaGold}{HTML}{E6B878}
\definecolor{LightGold}{HTML}{FEFCCD}
\definecolor{Bronze}{HTML}{B87333}


\makeatletter
\ifcase\@sp@style
  \colorlet{primary}{orange}
  \colorlet{secondary}{deepgray}
  \colorlet{highlight}{yellow}
  \colorlet{accent}{lightorange}
  \setbeamercolor{normal text}{bg=secondary,fg=white}
\or
  \colorlet{primary}{Black}
  \colorlet{secondary}{White}
  \colorlet{highlight}{Gray}
  \colorlet{accent}{DarkGray}
  \setbeamercolor{normal text}{bg=secondary,fg=black}
\or
  \colorlet{primary}{SlateGray}
  \colorlet{secondary}{ReflectiveWhite}
  \colorlet{highlight}{TealBlue}
  \colorlet{accent}{SeafoamGreen}
  \setbeamercolor{normal text}{bg=secondary,fg=black}
\or
  \colorlet{primary}{OliveGreen}
  \colorlet{secondary}{ReflectiveWhite}
  \colorlet{highlight}{FruitOrange}
  \colorlet{accent}{LightGreen}
  \setbeamercolor{normal text}{bg=secondary,fg=black}
\or
  \colorlet{primary}{EmphaGold}
  \colorlet{secondary}{SoleGray}
  \colorlet{highlight}{LightGold}
  \colorlet{accent}{Bronze}
  \setbeamercolor{normal text}{bg=secondary,fg=white}
  % \setbeamercolor{math text}{bg=secondary,fg=LightGold}
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

\setbeamercolor{alerted text}{fg=highlight}
\setbeamercolor{block title alerted}{bg=alerted text.fg!90!black}
\setbeamercolor{block title example}{bg=accent!60!black}
\setbeamercolor{background canvas}{bg=secondary}


\setbeamertemplate{footline}{
  \leavevmode
  \hbox{%
    \begin{beamercolorbox}[wd=0.5\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}
      \usebeamerfont{author in head/foot}\insertshortauthor~~(\insertshortinstitute)
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=0.5\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}
      \usebeamerfont{date in head/foot}\insertframenumber{} / \inserttotalframenumber\hspace{2ex}
    \end{beamercolorbox}
  }
  \vskip0pt%
}

\setbeamertemplate{blocks}[rectangle]
\setbeamercovered{dynamic}

\setbeamertemplate{section page}
{
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
      pdfauthor = {\@sp@author},
      pdftitle = {\@sp@title},
      pdfkeywords = {spArticle},
  }
  \title{\bfseries\@sp@title}
  \subtitle{\@sp@subtitle}
  \author[\@sp@authorinshort]{\bfseries\@sp@author}
  \institute[\textit{\@sp@affiliationinshort}]{\textit{\@sp@affiliation}}
  \date{\@sp@date}
}
\makeatother


\makeatletter
\AtBeginDocument{%
  \frame{\titlepage}

  \begin{frame}{\IfStrEq{en}{\@sp@lang}{Summary}{\IfStrEq{\@sp@lang}{cn}{目录}{\PackageError{spBeamer}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}\typeout{AtBeginDocumentErrorSP}}}}
      % \tableofcontents
      \begin{multicols}{2}
        \tableofcontents
      \end{multicols}
  \end{frame}
}
\makeatother


\makeatletter
\patchcmd{\beamer@continueautobreak}{\frametitle}{\beamer@gobbleoptional}{}{\errmessage{failed to patch}}
\patchcmd{\beamer@continueautobreak}{\framesubtitle}{\beamer@gobbleoptional}{}{\errmessage{failed to patch}}
\AtEndDocument{
    \begin{frame}[allowframebreaks, plain]
      \frametitle{\ifnum\insertcontinuationcount=1 References\else\relax\fi}
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
\AtBeginSection[]{
  \ifbibsection
    \relax
  \else
      \frame{\sectionpage}
  \fi
}
\AtBeginSubsection[]{
  \ifbibsection
    \relax
  \else
      \frame{\subsectionpage}
  \fi
}
\AtBeginEnvironment{bibliography}{
  \bibsectiontrue
}
\AtEndEnvironment{bibliography}{
  \bibsectionfalse
}


\newcommand{\hlmath}[2]{\colorbox{#1!17}{$\displaystyle #2$}}
\newcommand{\hltext}[2]{\colorbox{#1!17}{#2}}