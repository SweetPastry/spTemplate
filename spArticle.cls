\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spArticle}[2024/01/03 version: 1.00.01, Author: Sweet Pastry]


\RequirePackage{kvoptions, etoolbox, xstring}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareBoolOption[true]{colorlinks}
\DeclareStringOption[twocolumn]{column}
\DeclareStringOption[en]{lang}
\DeclareStringOption[author]{author}
\DeclareStringOption[affiliation]{affiliation}
\DeclareStringOption[\today]{date}
\DeclareStringOption[Here is title]{title}
\DeclareStringOption[Here is abstract]{abstract}
\DeclareStringOption[ref]{ref}
\DeclareStringOption[undefined]{bibstyle}
\ProcessKeyvalOptions*
\relax


\newcommand{\spAbstract}[1]{\def\@sp@abstract{#1}}
\newcommand{\spAuthor}[1]{\def\@sp@author{#1}}
\newcommand{\spDate}[1]{\def\@sp@date{#1}}
\newcommand{\spAffiliation}[1]{\def\@sp@affiliation{#1}}


\typeout{
> > > > > > > > > >^^J
check point1: inner val^^J
colorlinks=[sp: bool type]^^J
column=\@sp@column^^J
lang=\@sp@lang^^J
author=\@sp@author^^J
affiliation=\@sp@affiliation^^J
date=[sp: some internal date type]^^J
title=\@sp@title^^J
abstract=\@sp@abstract^^J
ref=\@sp@ref^^J
bibstyle=\@sp@bibstyle^^J
< < < < < < < < < <^^J
}


\PassOptionsToPackage{a4paper, top=2.5cm, bottom=2.5cm, left=3cm, right=2.5cm}{geometry}
\IfStrEq{\@sp@lang}{en}{%
    \LoadClass[\@sp@column]{article}
}{%
\IfStrEq{\@sp@lang}{cn}{%
    \LoadClass[\@sp@column]{ctexart}
}{%
    \typeout{
        > > > > > > > > > >^^J
        check point2: lang determined document type^^J
        lang judge error!^^J
        < < < < < < < < < <^^J
    }
    \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}
\IfStrEq{\@sp@column}{onecolumn}{\RequirePackage[a4paper, top=2.5cm, bottom=2.5cm, left=3cm, right=2.5cm]{geometry}}



\RequirePackage{indentfirst}
\pagestyle{plain}


\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{amsmath, amssymb, amsfonts, mathrsfs, esint, yhmath, cancel, tensor, physics, mhchem, chemfig, xcolor, graphicx, tabularx, float, cuted, tikz, array, pdfpages, lipsum, xeCJK}


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
        \def\@sp@bibstyle{b7714-2015}
    }{%
    \typeout{
        > > > > > > > > > >^^J
        check point3: bibstyle determin^^J
        determin failed!^^J
        lang=\@sp@lang^^J
        < < < < < < < < < <^^J
    }
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
            citecolor = red,
            urlcolor = teal
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
        \typeout{
            > > > > > > > > > >^^J
            check point4: bibstyle abstract generate^^J
            generate failed!!^^J
            lang=\@sp@lang^^J
            < < < < < < < < < <^^J
        }
        \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
    }}}{%
    \IfStrEq{\@sp@column}{onecolumn}{%
        \maketitle
        \begin{abstract}
            \@sp@abstract
        \end{abstract}\par
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
    \nocite{*}
    \IfStrEq{\@sp@lang}{en}{%
        \printbibliography
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \printbibliography[title=参考文献]
    }{%
    \typeout{
    > > > > > > > > > >^^J
    check point5: bibliography generate^^J
    generate failed!^^J
    < < < < < < < < < <^^J
    }
    \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}}
\makeatother

