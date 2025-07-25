%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spBook
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
\ProvidesClass{spBook}[2025/05/27 version: 1.03.06, Author: Sweet Pastry]


\RequirePackage{kvoptions, etoolbox, xstring, xparse, ifthen}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareBoolOption[true]{colorlinks}
\DeclareBoolOption[false]{colorbox}
\DeclareBoolOption[true]{nocite}
\DeclareBoolOption[false]{margin}
\DeclareStringOption[en]{lang}
\DeclareStringOption[a4]{geometry}
\DeclareStringOption[author]{author}
\DeclareStringOption[\today]{date}
\DeclareStringOption[Here is title]{title}
\DeclareStringOption[ref]{ref}
\DeclareStringOption[cover]{cover}
\DeclareStringOption[undefined]{bibstyle}
\DeclareStringOption[]{coverpage}
\DeclareStringOption[undefined]{mathfont}
\ProcessKeyvalOptions*
\relax


\newcommand{\@baseclass}{book}
\newcommand{\spTitle}[1]{\def\@sp@title{#1}}
\newcommand{\spAuthor}[1]{\def\@sp@author{#1}}
\newcommand{\spDate}[1]{\def\@sp@date{#1}}
\newcommand{\spCover}[1]{\def@sp@coverpage{#1}}
\newcommand{\spCoverpage}[1]{\def@sp@coverpage{#1}}
\NewDocumentCommand{\spChapter}{om}{%
    \IfStrEq{\@sp@lang}{cn}{\renewcommand{\chaptername}{章节}}{}
    \IfNoValueTF{#1}{%
    \def\@chaptermark{#2}
    \chapter[#2]{#2}
    }{%
    \def\@chaptermark{#2}
    \chapter[#2]{#1}
    }
}


\PassOptionsToClass{a4paper}{\@baseclass}
\PassOptionsToClass{fontsize=10pt}{\@baseclass}
\PassOptionsToClass{parskip=half}{\@baseclass}
\PassOptionsToClass{headings=oldstyle}{\@baseclass}
\PassOptionsToClass{chapterprefix=true}{\@baseclass}
\LoadClass{\@baseclass}
\IfStrEq{\@sp@lang}{cn}{%
    \RequirePackage{setspace}
    \onehalfspacing
}


\PassOptionsToPackage{version=4}{mhchem}
\PassOptionsToPackage{table}{xcolor}
\PassOptionsToPackage{most}{tcolorbox}
\RequirePackage{amsmath, amssymb, amsfonts, ntheorem, mathrsfs, esint, yhmath, cancel, tensor, physics, mhchem, chemfig, xcolor, xkcdcolors, graphicx, pgfplots, tabularx, float, cuted, tikz, tikz-cd, circuitikz, array, pdfpages, lipsum, fancyvrb, tcolorbox}
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
}[\PackageError{spBook}{Math font \@sp@mathfont not found!}{Use other.}]


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

    \theorembodyfont{\normalfont}
    \theoremstyle{nonumberplain}
    \theoremseparator{\enspace}
    \theoremsymbol{\openbox}
    \newtheorem{proof}{Proof}
}{%
\IfStrEq{\@sp@lang}{cn}{%
    \theorembodyfont{\song}
    \newtheorem{theorem}{定理}[section]
    \newtheorem{corollary}{推论}[section]
    \newtheorem{lemma}{引理}[section]
    \newtheorem{proposition}{命题}[section]
    \newtheorem{definition}{定义}[section]
    \newtheorem{definition-theorem}{定义--定理}[section]
    \newtheorem{definition-proposition}{定义--命题}[section]
    \newtheorem{hypothesis}{假设}[section]
    \newtheorem{conjecture}{猜想}[section]

    \theorembodyfont{\normalfont}
    \newtheorem{example}{例}[section]
    \newtheorem{remark}{注记}[section]
    \newtheorem{convention}{约定}[section]
    \newtheorem{exercise}{练习}[section]

    \theorembodyfont{\normalfont}
    \theoremstyle{nonumberplain}
    \theoremheaderfont{\sffamily\bfseries\CJKfamily{pffont}}
    \theoremseparator{\enspace}
    \theoremsymbol{\openbox}
    \newtheorem{proof}{证明}
}{%
\PackageError{spBook}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}
\newcommand{\addOneOptionToEnvironment}[1]{%
    \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
    \RenewDocumentEnvironment{#1}{O{} O{}}{%
        \IfStrEq{##1}{}{%
            \begin{old#1}
        }{%
            \begin{old#1}[##1]
            \IfStrEq{##2}{}{%
                \expandafter\def\csname #1index\endcsname{##1}
            }{%
                \expandafter\def\csname #1index\endcsname{##2}
    }}}{%
        \end{old#1}
}}
\forcsvlist{\addOneOptionToEnvironment}{definition, theorem, corollary, lemma, proposition, definition-theorem, definition-proposition, hypothesis, conjecture, example, remark, convention, exercise, proof}
\newcommand{\defineIndexedEnvironment}[1]{%
    \AtEndEnvironment{#1}{%
        \ifcsname #1name\endcsname
            \expandafter\ifx\csname #1name\endcsname\@empty
            \else
                \index[statement]{\csname #1index\endcsname}
            \fi
        \else
            \relax
        \fi
}}
\forcsvlist{\defineIndexedEnvironment}{definition, theorem, corollary, lemma, proposition, definition-theorem, definition-proposition, hypothesis, conjecture, example, remark, convention, exercise, proof}


\if@sp@colorbox
    \definecolor{tudelft-groen}{RGB}{108,194,74}
    \definecolor{tudelft-paars}{RGB}{111,29,119}
    \definecolor{tudelft-roze}{RGB}{239,96,163}
    \definecolor{tudelft-rood}{RGB}{224,60,49}
    \definecolor{tudelft-donkerblauw}{RGB}{12,35,64}
    \definecolor{tudelft-bosgroen}{RGB}{0,155,119}
    \definecolor{tudelft-cyaan}{RGB}{0,166,214}
    \definecolor{tudelft-wit}{RGB}{255,255,255}
    \definecolor{tudelft-zwart}{RGB}{0,0,0}
    \definecolor{tudelft-turkoois}{RGB}{0,184,200}
    \definecolor{tudelft-koningsblauw}{RGB}{0,118,194}
    \definecolor{tudelft-bordeaux}{RGB}{165,0,52}
    \definecolor{tudelft-oranje}{RGB}{237,104,66}
    \definecolor{tudelft-geel}{RGB}{255,184,28}
    \definecolor{tudelft-donkergrijs}{RGB}{92,92,92}

    \newcommand{\tcbsetColor}[2]{%
        \tcolorboxenvironment{#2}{%
                enhanced,
                breakable,
                colback = #1!3!white,
                frame hidden,
                borderline west = {2pt}{0pt}{#1},
                coltitle = #1,
                fonttitle = \bfseries\sffamily,
                boxrule = 0sp,
                sharp corners,
                detach title,
                before upper = \tcbtitle\par\smallskip,
                description font = \mdseries,
                separator sign none,
                segmentation style={solid, #1},
    }}
    % \makeatletter
    \tcbsetColor{tudelft-groen}{definition}
    \tcbsetColor{tudelft-groen}{definition-theorem}
    \tcbsetColor{tudelft-groen}{definition-proposition}
    \tcbsetColor{tudelft-paars}{theorem}
    \tcbsetColor{tudelft-roze}{corollary}
    \tcbsetColor{tudelft-rood}{lemma}
    \tcbsetColor{tudelft-donkerblauw}{proposition}
\fi


\IfStrEq{\@sp@bibstyle}{undefined}{%
    \IfStrEq{\@sp@lang}{en}{%
        \def\@sp@bibstyle{ieee}
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \def\@sp@bibstyle{gb7714-2015}
    }{%
    \PackageError{spBook}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}}


\RequirePackage[xindy, splitindex]{imakeidx}
\theoremlisttype{all}
\makeindex
\IfStrEq{\@sp@lang}{en}{\def\StateIndexName{Statement Index}}{\def\StateIndexName{陈述索引}}
\makeindex[
    columns = 2,
    program = truexindy,
    intoc = true,
    options = -M texindy -I xelatex -C utf8,
    name = statement,
    title = {\StateIndexName}
]

\RequirePackage[
    unicode=true,
    bookmarksnumbered,
    pdfpagelabels = true,
    breaklinks = true,
    hyperindex = true
]{hyperref}
\IfStrEq{\@sp@lang}{cn}{\hypersetup{CJKbookmarks=true}}{\hypersetup{CJKbookmarks=false}}
\hypersetup{%
    pdfauthor = {\@sp@author},
    pdftitle = {\@sp@title},
    pdfkeywords = {spBook},
}
\if@sp@colorlinks
    \hypersetup{%
        colorlinks = true,
        linkcolor = blue,
        citecolor = blue,
        urlcolor = teal,
        filecolor = magenta,
    }
\else
    \hypersetup{hidelinks}
\fi


\RequirePackage{xurl}
\RequirePackage[backend=biber, style=\@sp@bibstyle, hyperref=auto, backref=true]{biblatex}


\if@sp@margin
    \RequirePackage{marginnote, sidenotes}
\fi


\AtEndPreamble{%
	\RequirePackage{geometry}
	\IfStrEq{\@sp@geometry}{b5}{%
        \if@sp@margin
            \geometry{%
                paper=b5paper,
                twoside,
                inner=22mm,
                outer=50mm,
                marginparwidth=38mm,
                marginparsep=7mm,
                top=25mm,
                bottom=27mm,
                headheight=5ex,
                headsep=4ex
            }
        \else
            \geometry{%
                paper=b5paper,
                headheight=5ex,
                headsep=5ex,
                textwidth=132mm,
                textheight=198mm,
                twoside,
            }
        \fi
    }{}

	\IfStrEq{\@sp@geometry}{a4}{%
        \if@sp@margin
            \geometry{%
                paper=a4paper,
                twoside,
                inner=28mm,
                outer=60mm,
                marginparwidth=40mm,
                marginparsep=8mm,
                top=25mm,
                bottom=30mm,
                headheight=5ex,
                headsep=5ex,
            }
        \else
            \geometry{%
                paper=a4paper,
                top=3cm,
                inner=2.54cm,
                outer=2.54cm,
                bottom=3cm,
                headheight=6ex,
                headsep=6ex,
                twoside,
            }
        \fi
    }

    \RequirePackage[iso, english]{isodate}
    \RequirePackage{indentfirst}

    \RequirePackage{fancyhdr}
    \fancyhead[LO]{\rightmark}
    \fancyhead[RO]{}
    \fancyhead[LE]{}
    \fancyhead[RE]{\leftmark}
    \fancypagestyle{plain}{%
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

    \IfEndWith{\@sp@ref}{.bib}{%
        \addbibresource{\@sp@ref}
    }{%
        \addbibresource{\@sp@ref.bib}
}}


\g@addto@macro\frontmatter{%
    \ifdefempty{\@sp@coverpage}{\relax}{%
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
        }{%
        \IfFileExists{\@sp@coverpage.tex}{%
            \input{\@sp@coverpage.tex}
        }{%
        \PackageError{spBook}{Coverpage file format error!}{Use .pdf or .tex.}
        }}}}

        \pagestyle{empty}
        \newgeometry{left=0pt, right=0pt, top=0pt, bottom=0pt, noheadfoot}
        \pagenumbering{roman}
        \maketitle
        \restoregeometry

        \pagestyle{fancy}
        \IfStrEq{\@sp@lang}{cn}{\renewcommand{\contentsname}{目录}}{\relax}
        \tableofcontents
    }

    \setcounter{page}{1}
	\thispagestyle{empty}
	\addtocontents{toc}{\protect\thispagestyle{empty}}
    \cleardoublepage
    \setcounter{page}{1}
}


\g@addto@macro\appendix{%
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
\newcommand*{\sp@ifhasfigures}{\ifnum\value{figure}>0 }
\newcommand*{\sp@ifhastables} {\ifnum\value{table}>0  }
\AtEndDocument{%
    \appendix
    \backmatter

    \IfStrEq{\@sp@lang}{cn}{%
        \renewcommand{\listfigurename}{插图索引}
        \renewcommand{\listtablename}{表格索引}
    }{\relax}

    \sp@ifhasfigures
        \addcontentsline{toc}{chapter}{\listfigurename}
        \listoffigures
    \fi

    \sp@ifhastables
        \addcontentsline{toc}{chapter}{\listtablename}
        \listoftables
    \fi

    \printindex[statement]

    \if@sp@nocite\nocite{*}\fi
    \IfStrEq{\@sp@lang}{en}{%
        \printbibliography[heading=bibintoc]
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \printbibliography[heading=bibintoc, title=参考文献]
    }{%
    \relax
}}}
\makeatother
\endinput