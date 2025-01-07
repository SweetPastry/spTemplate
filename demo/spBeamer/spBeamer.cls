\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spBeamer}[2024/01/05 version: 1.00.01, Author: Sweet Pastry]


\RequirePackage{kvoptions, etoolbox, xstring}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareBoolOption[true]{colorlinks}
\DeclareBoolOption[true]{nocite}
\DeclareStringOption[ref]{ref}
\DeclareStringOption[undefined]{bibstyle}
\ProcessKeyvalOptions*
\relax


\LoadClass[aspectratio=43]{beamer}
\setbeamertemplate{frametitle continuation}{}


\newcommand{\spTitle}[1]{\def\@sp@title{#1}}
\newcommand{\spAuthor}[1]{\def\@sp@author{#1}}
\newcommand{\spDate}[1]{\def\@sp@date{#1}}
\newcommand{\spAffiliation}[1]{\def\@sp@affiliation{#1}}


\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{amsmath, amssymb, amsfonts, mathrsfs, esint, yhmath, cancel, tensor, physics, mhchem, chemfig, xcolor, graphicx, tabularx, float, cuted, tikz, array, pdfpages, lipsum, xeCJK, fancyvrb}


\useoutertheme{infolines}
\useinnertheme{rectangles}
\usefonttheme{professionalfonts}

\definecolor{orange}{HTML}{f28165}
\definecolor{gray}{HTML}{303030}
\definecolor{yellow}{HTML}{f0be52}
\definecolor{lightorange}{HTML}{f19e58}


\makeatletter
\newcommand{\mybox}[1]{%
  \setbox0=\hbox{#1}%
  \setlength{\@tempdima}{\dimexpr\wd0+13pt}%
  \begin{tcolorbox}[colback=orange,colframe=orange,boxrule=0.5pt,arc=4pt,
      left=6pt,right=6pt,top=6pt,bottom=6pt,boxsep=0pt,width=\@tempdima]
    \textcolor{white}{#1}
  \end{tcolorbox}
}
\makeatother


\usecolortheme[named=orange]{structure}
\usecolortheme{sidebartab}
\usecolortheme{orchid}
\usecolortheme{whale}
\setbeamercolor{alerted text}{fg=yellow}
\setbeamercolor{block title alerted}{bg=alerted text.fg!90!black}
\setbeamercolor{block title example}{bg=lightorange!60!black}
\setbeamercolor{background canvas}{bg=gray}
\setbeamercolor{normal text}{bg=gray,fg=white}

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

\newcommand{\hlmath}[2]{\colorbox{#1!67}{$\displaystyle #2$}}
\newcommand{\hltext}[2]{\colorbox{#1!67}{#2}}