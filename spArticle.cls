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
\ProcessKeyvalOptions*
\relax


\newcommand{\spAbstract}[1]{\def\@sp@abstract{#1}}
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
\RequirePackage{amsmath, amssymb, amsfonts, mathrsfs, esint, yhmath, cancel, tensor, physics, mhchem, chemfig, xcolor, graphicx, tabularx, float, cuted, tikz, array, pdfpages, lipsum}


\RequirePackage{titlesec}
\AtEndPreamble{%
    \titleformat{\section}[block]
    {\centering\bfseries\Large}
    {\thesection}{1em}{}
}
\AtEndPreamble{%
    \ifx\@sp@bibstyle\undefined
        \IfStrEq{\@sp@lang}{en}{%
            \PassOptionsToPackage{style=ieee}{biblatex}
        }{%
        \IfStrEq{\@sp@lang}{cn}{%
            \PassOptionsToPackage{style=b7714-2015}{biblatex}
        }{%
        \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
        }}  
    \else
        \PassOptionsToPackage{style=\@sp@bibstyle}{biblatex}
    \fi
        \IfEndWith{\@sp@ref}{.bib}{%
            \addbibresource{\@sp@ref}
        }{%
            \addbibresource{\@sp@ref.bib}
}}
\RequirePackage{xurl}
\RequirePackage[backend=biber]{biblatex}
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


\AtBeginDocument{\maketitle}

\AtBeginDocument{
    \IfStrEq{\@sp@column}{twocolumn}{%
        \begin{strip}
            \textbf{Abstract}. \small{\@sp@abstract}\leavevmode
        \end{strip}
    }{%
    \IfStrEq{\@sp@column}{onecolumn}{%
        \maketitle
        \begin{abstract}
            \@sp@abstract
        \end{abstract}\par
}}}


\makeatletter
\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat{doi}{%
  \ifhyperref
    {\href{https://doi.org/#1}{DOI: \nolinkurl{#1}}}
    {DOI: \nolinkurl{#1}}}
\makeatother



% \AtEndDocument{%
%     \nocite{*}
%     \if@sp@lang{en}
%         \printbibliography
%     \else
%         \if@sp@lang{cn}
%             \printbibliography[title=参考文献]
%         \else
%             \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
%         \fi
%     \fi
% }


