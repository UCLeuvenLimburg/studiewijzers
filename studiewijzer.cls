\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{studiewijzer}[2020/07/01]
\RequirePackage{etoolbox}

\LoadClass{article}

\RequirePackage{amsmath}
\RequirePackage[paper=a4paper,top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{microtype}
\RequirePackage{tikz}
\RequirePackage{pxfonts}
\RequirePackage{hyperref}
\RequirePackage{booktabs}
\RequirePackage{tcolorbox}
\RequirePackage{array}

\usetikzlibrary{calc,math}


\pagestyle{empty}

%
% Exam information
%
\pgfkeys{
    /studiewijzer/.cd,
    academiejaar/.store in=\studiewijzer@academiejaar,
    opo/.store in=\studiewijzer@opo,
    opo-code/.store in=\studiewijzer@opocode,
    ects-url/.store in=\studiewijzer@ectsurl,
    bs1/.style={
        opo={Besturingssystemen 1},
        opo-code=MBI10A,
        ects-url={http://onderwijsaanbod.leuven.ucll.be/syllabi/n/MBI10AN.htm},
    },
    scripting/.style={
        opo={Scripttalen},
        opo-code=MBI59A,
        ects-url={http://onderwijsaanbod.leuven.ucll.be/syllabi/n/MBI59AN.htm},
    },
    vgo/.style={
        opo={Programmeren van \\ visuele gebruikersomgevingen},
        opo-code=MBI50X,
        ects-url={http://onderwijsaanbod.leuven.ucll.be/syllabi/n/MBI50XN.htm},
    },
}

\newcommand{\studiewijzer}[1]{\pgfkeys{/studiewijzer/.cd,#1}}

\AtBeginDocument{
    \ifundef\studiewijzer@academiejaar{
        \PackageError{studiewijzer}{Missing value academiejaar}{Use the studiewijzer command to set all studiewijzer parameters}
    }{}
    \ifundef\studiewijzer@opo{
        \PackageError{studiewijzer}{Missing value opo}{Use the studiewijzer command to set all studiewijzer parameters}
    }{}
    \ifundef\studiewijzer@opocode{
        \PackageError{studiewijzer}{Missing value opo-code}{Use the studiewijzer command to set all studiewijzer parameters}
    }{}
    \ifundef\studiewijzer@ectsurl{
        \PackageError{studiewijzer}{Missing value ects-url}{Use the studiewijzer command to set all studiewijzer parameters}
    }{}
}

\newcommand{\showheader}{
    \noindent
    \begin{center}
        \begin{tabular}{p{12cm}r}
        \parbox[b]{12cm}{
            {\large\textsc{studiewijzer \studiewijzer@academiejaar}} \\[2mm]
            {\huge\textsc{\studiewijzer@opo}}{\hfill\small\textsc{(\studiewijzer@opocode)}} \\
        } & \includegraphics[scale=0.4]{logo.png} \\
        \bottomrule
        \end{tabular}
    \end{center}
    \vskip1mm
    \noindent\small Deze studiewijzer is een toelichting bij de \href{\studiewijzer@ectsurl}{ECTS-fiche}. De ECTS-fiche en deze studiewijzer dienen samen gelezen te worden.
    \vskip2mm
}


\newlength{\leftcolumnwidth}
\setlength{\leftcolumnwidth}{4cm}
\newlength{\rightcolumnwidth}
\setlength{\rightcolumnwidth}{11cm}

\newcommand{\categorylabel}[1]{\rule[-0.4cm]{0pt}{1cm}\parbox{\leftcolumnwidth}{\raggedleft\bfseries #1}}
\newcommand{\categorytext}[1]{\rule[-0.4cm]{0pt}{1cm}\parbox{\rightcolumnwidth}{\raggedright #1}}