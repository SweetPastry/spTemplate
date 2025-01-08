\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spBook}[2024/01/08 version: 1.00.01, Author: Sweet Pastry]

\RequirePackage{kvoptions, etoolbox, xstring, xparse}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareBoolOption[true]{colorlinks}
\DeclareBoolOption[true]{nocite}
% \DeclareStringOption[twocolumn]{column}
\DeclareStringOption[en]{lang}
\DeclareStringOption[a4]{geometry}
\DeclareStringOption[author]{author}
% \DeclareStringOption[affiliation]{affiliation}
\DeclareStringOption[\today]{date}
\DeclareStringOption[Here is title]{title}
% \DeclareStringOption[Here is abstract]{abstract}
\DeclareStringOption[ref]{ref}
\DeclareStringOption[cover]{cover}
\DeclareStringOption[undefined]{bibstyle}
\DeclareStringOption[]{coverpage}
% \DeclareStringOption[]{preface}
\ProcessKeyvalOptions*
\relax

\typeout{%
> > > > > > > > > >^^J
check point1: key-value
coverpage = \@sp@coverpage^^J
< < < < < < < < < <^^J
}


% \newcommand{\spAbstract}[1]{\def\@sp@abstract{#1}}
\newcommand{\spTitle}[1]{\def\@sp@title{#1}}
\newcommand{\spAuthor}[1]{\def\@sp@author{#1}}
\newcommand{\spDate}[1]{\def\@sp@date{#1}}
% \newcommand{\spAffiliation}[1]{\def\@sp@affiliation{#1}}
\newcommand{\spCover}[1]{\def@sp@coverpage{#1}}
\newcommand{\spCoverpage}[1]{\def@sp@coverpage{#1}}
\NewDocumentCommand{\spChapter}{om}{%
    \IfNoValueTF{#1}{%
        \typeout{spChapter did not received option. #1 and #2}
        \def\@chaptermark{#2}
        \chapter[#2]{#2}
    }{%
        \typeout{spChapter command received option. #1 and #2}
        \def\@chaptermark{#2}
        \chapter[#2]{#1}
    }
    \chaptermark{\@chaptermark}
}



\LoadClass[10pt]{book}
\setlength{\parskip}{5pt}


\PassOptionsToPackage{version=4}{mhchem}
\PassOptionsToPackage{table}{xcolor}
\RequirePackage{amsmath, amssymb, amsfonts, ntheorem, mathrsfs, esint, yhmath, cancel, tensor, physics, chemstyle, mhchem, chemfig, xcolor, xkcdcolors, graphicx, pgfplots, tabularx, float, cuted, tikz, tikz-cd, circuitikz, array, pdfpages, lipsum, xeCJK, fancyvrb}
\newcommand{\song}{\CJKfamily{song}}
\usetikzlibrary{backgrounds}
\usetikzlibrary{arrows,shapes}
\usetikzlibrary{tikzmark}
\usetikzlibrary{calc}
\IfStrEq{\@sp@lang}{en}{%
    \theoremheaderfont{\bfseries\sffamily}
    \theorembodyfont{\normalfont}
    \newtheorem{theorem}{Theorem}[section]
    \newtheorem{corollary}{Corollary}[section]
    \newtheorem{lemma}{Lemma}[section]
    \newtheorem{proposition}{Proposition}[section]
    \newtheorem{definition}{Definition}[section]
    \newtheorem{definition-theorem}{Definition-Theorem}[section]
    \newtheorem{definition-proposition}{Definition-Proposition}[section]
    \newtheorem{hypothesis}{Hypothesis}[section]
    \newtheorem{conjecture}{Conjecture}[section]
    
    \theorembodyfont{\normalfont}
    \newtheorem{example}{Example}[section]
    \newtheorem{remark}{Remark}[section]
    \newtheorem{convention}{Convention}[section]
    \newtheorem{exercise}{Exercise}[section]

    \theorembodyfont{}
    \theoremstyle{nonumberplain}
    \theoremseparator{\enspace}
    \theoremsymbol{\openbox}
    \newtheorem{proof}{Proof}
}{%
\IfStrEq{\@sp@lang}{cn}{%
    \newtheorem{theorem}{定理}[section]
    \newtheorem{corollary}{推论}[section]
    \newtheorem{lemma}{引理}[section]
    \newtheorem{proposition}{命题}[section]
    \newtheorem{definition}{定义}[section]
    \newtheorem{definition-theorem}{定义--定理}[section]
    \newtheorem{definition-proposition}{定义--命题}[section]
    \newtheorem{hypothesis}{假设}[section]
    \newtheorem{conjecture}{猜想}[section]

    \theorembodyfont{\song}
    \newtheorem{example}{例}[section]
    \newtheorem{remark}{注记}[section]
    \newtheorem{convention}{约定}[section]
    \newtheorem{exercise}{练习}[section]

    \theorembodyfont{}
    \theoremstyle{nonumberplain}
    \theoremheaderfont{\sffamily\bfseries\CJKfamily{pffont}}
    \theoremseparator{\enspace}
    \theoremsymbol{\openbox}
    \newtheorem{proof}{证明}
}{%
\PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}



\IfStrEq{\@sp@bibstyle}{undefined}{%
    \IfStrEq{\@sp@lang}{en}{%
        \def\@sp@bibstyle{ieee}
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \def\@sp@bibstyle{gb7714-2015}
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
            citecolor = green,
            urlcolor = teal,
            filecolor = cyan,
            pdfauthor = {\@sp@author},
            pdftitle = {\@sp@title},
            pdfkeywords = {spBook},
            CJKbookmarks = true
        }
    \else
        \hypersetup{hidelinks}
    \fi
}



\AtEndPreamble{
	\RequirePackage{geometry}
	\IfStrEq{\@sp@geometry}{b5}{%
	\geometry{
		paper=b5paper,
		headheight=5ex,
		headsep=5ex,
		textwidth=132mm,
		textheight=198mm,
		twoside,
		% bindingoffset=18pt,
		asymmetric
	}}{}

	\IfStrEq{\@sp@geometry}{a4}{%
	\geometry{
		paper=a4paper,
		top=3cm,
		inner=2.54cm,
		outer=2.54cm,
		bottom=3cm,
		headheight=6ex,
		headsep=6ex,
		twoside,
		asymmetric
	}}

    \RequirePackage[iso, english]{isodate}
    \RequirePackage{indentfirst}

    \RequirePackage{fancyhdr}
    \fancyhead[LO]{\rightmark}
    \fancyhead[RO]{}
    \fancyhead[LE]{}
    \fancyhead[RE]{\leftmark}
    \fancypagestyle{plain}{
        \fancyhead{}
        \renewcommand{\headrulewidth}{0pt}
    }
    \pagestyle{fancy}
    \IfStrEq{\@sp@lang}{en}{%
        \relax
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \renewcommand{\chaptermark}[1]{\markboth{第 \thechapter 章\quad #1}{}}
    }{%
    \PackageError{spBook}{Language option \@sp@lang is not supported!}{Use en or cn.}
    }}

    \RequirePackage[xindy, splitindex]{imakeidx}
}


\g@addto@macro\frontmatter{
    \ifdefempty{\@sp@coverpage}{\relax}{%
        \typeout{Here is spBook compile messenge: the coverpage macro is not empty with defination \@sp@coverpage.}
        \pagestyle{empty}
        \renewcommand{\thepage}{C\arabic{page}}

        \IfEndWith{\@sp@coverpage}{.pdf}{%
			\includepdf{\@sp@coverpage}
		}{%
        \IfEndWith{\@sp@coverpage}{.PDF}{%
            \includepdf{\@sp@coverpage}
        }{%
        \IfEndWith{\@sp@coverpage}{.tex}{%
            \input{\@sp@coverpage}
        }{
        \PackageError{spBook}{Coverpage file format error!}{Use .pdf or .tex.}
        }}}
		\pagestyle{fancy}
		\pagenumbering{roman}
    }

    \setcounter{page}{1}
	\thispagestyle{empty}
	\addtocontents{toc}{\protect\thispagestyle{empty}}
}


\g@addto@macro\appendix{
    \IfStrEq{\@sp@lang}{en}{%
        \relax
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \renewcommand{\appendixname}{附录}
        \renewcommand{\chaptermark}[1]{\markboth{附录 \thechapter \quad #1}{}}
    }{%
    \PackageError{spBook}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
    }}
    \renewcommand{\sectionmark}[1]{\markright{\S\thesection \quad #1}}
}


\makeatletter
\AtBeginDocument{%
    \title{\@sp@title}
    \author{\@sp@author}
    \date{\@sp@date}
}
\makeatother


\makeatletter
\AtEndDocument{
    \appendix
    \backmatter
    \if@sp@nocite\nocite{*}\fi
    \IfStrEq{\@sp@lang}{en}{%
        \printbibliography[heading=bibintoc]
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \printbibliography[heading=bibintoc, title=参考文献]
    }{%
    \typeout{
    > > > > > > > > > >^^J
    check point5: bibliography generate^^J
    generate failed!^^J
    < < < < < < < < < <^^J
    }
}}}
\makeatother
\endinput