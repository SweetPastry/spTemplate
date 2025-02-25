\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spArticle}[2024/01/03 version: 1.01.05, Author: Sweet Pastry]


\RequirePackage{kvoptions, etoolbox, xstring, ifxetex, ifpdf}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareBoolOption[true]{colorlinks}
\DeclareBoolOption[true]{nocite}
\DeclareStringOption[twocolumn]{column}
\DeclareStringOption[en]{lang}
\DeclareStringOption[author]{author}
\DeclareStringOption[affiliation]{affiliation}
\DeclareStringOption[\today]{date}
\DeclareStringOption[Here is title]{title}
\DeclareStringOption[Here is abstract]{abstract}
\DeclareStringOption[ref]{ref}
\DeclareStringOption[undefined]{bibstyle}
\DeclareStringOption[undefined]{mathfont}
\ProcessKeyvalOptions*
\relax


\newcommand{\spAbstract}[1]{\def\@sp@abstract{#1}}
\newcommand{\spTitle}[1]{\def\@sp@title{#1}}
\newcommand{\spAuthor}[1]{\def\@sp@author{#1}}
\newcommand{\spDate}[1]{\def\@sp@date{#1}}
\newcommand{\spAffiliation}[1]{\def\@sp@affiliation{#1}}


\PassOptionsToPackage{a4paper, top=2.5cm, bottom=2.5cm, left=3cm, right=2.5cm}{geometry}
\IfStrEq{\@sp@lang}{en}{%
    \LoadClass[\@sp@column]{article}
}{%
\IfStrEq{\@sp@lang}{cn}{%
    \LoadClass[\@sp@column]{ctexart}
}{%
   \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}
\IfStrEq{\@sp@column}{onecolumn}{\RequirePackage[a4paper, top=2.5cm, bottom=2.5cm, left=3cm, right=2.5cm]{geometry}}



\RequirePackage{indentfirst}
\pagestyle{plain}


\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{mathtools, amsmath, amssymb, amsfonts, mathrsfs, esint, yhmath, cancel, tensor, physics, chemstyle, mhchem, chemfig, xcolor, xkcdcolors, graphicx, pgfplots, tabularx, float, cuted, tikz, tikz-cd, circuitikz, array, pdfpages, lipsum, fancyvrb}
\IfStrEq{\@sp@lang}{cn}{%
\ifxetex\RequirePackage{xeCJK}\fi
\ifpdf\RequirePackage{ctex}\fi
}{\relax}
\newcommand{\song}{\CJKfamily{song}}
\usetikzlibrary{backgrounds}
\usetikzlibrary{arrows,shapes}
\usetikzlibrary{tikzmark}
\usetikzlibrary{calc}
\usetikzlibrary{patterns}
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

\RequirePackage{titlesec}
\AtEndPreamble{%
    \titleformat{\section}[block]
    {\centering\bfseries\Large}
    {\thesection}{1em}{}
}


\IfStrEq{\@sp@bibstyle}{undefined}{%
    \IfStrEq{\@sp@lang}{en}{%
        \def\@sp@bibstyle{ieee}
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \def\@sp@bibstyle{gb7714-2015}
    }{%
    \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
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


\RequirePackage[pdfpagelabels=true, breaklinks=true]{hyperref}
\AtEndPreamble{%
    \if@sp@colorlinks
        \hypersetup{%
            colorlinks = true,
            linkcolor = blue,
            citecolor = green,
            urlcolor = teal,
            filecolor = cyan,
        }
    \else
        \hypersetup{hidelinks}
    \fi
}
\AtEndPreamble{
    \title{\bf{\@sp@title}}
    \author{\@sp@author\quad\textit{\quad\@sp@affiliation}}
    \date{\@sp@date}
}


\makeatletter
\AtBeginDocument{
    \IfStrEq{\@sp@column}{twocolumn}{%
        \IfStrEq{\@sp@lang}{en}{%
            \begin{strip}
                \vspace{-40pt}
                \@maketitle
                \vspace{10pt}
                \textbf{Abstract}. \small{\@sp@abstract}\leavevmode
            \end{strip}
    }{%
        \IfStrEq{\@sp@lang}{cn}{%
            \begin{strip}
                \vspace{-40pt}
                \@maketitle
                \vspace{10pt}
                \textbf{摘要}. \small{\song{\@sp@abstract}}\leavevmode
            \end{strip}
    }{%
       \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
    }}}{%
    \IfStrEq{\@sp@column}{onecolumn}{%
        \maketitle
        \begin{abstract}
            \@sp@abstract
        \end{abstract}\par}{%
            \relax
}}}
\makeatother


\makeatletter
\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat{doi}{%
    \ifhyperref
    {\href{https://doi.org/#1}{DOI: \nolinkurl{#1}}}
    {DOI: \nolinkurl{#1}}}
\makeatother


\makeatletter
\AtEndDocument{%
    \if@sp@nocite\nocite{*}\fi
    \IfStrEq{\@sp@lang}{en}{%
        \printbibliography
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \printbibliography[title=参考文献]
    }{%
    \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}}
\makeatother

\newcommand{\hlmath}[2]{\colorbox{#1!17}{$\displaystyle #2$}}
\newcommand{\hltext}[2]{\colorbox{#1!17}{#2}}