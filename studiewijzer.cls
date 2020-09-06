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
\RequirePackage{enumitem}
\RequirePackage{environ}
\RequirePackage{accanthis}
\RequirePackage[T1]{fontenc}


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
        opo={Programmeren van \\ Visuele Gebruikersomgevingen},
        opo-code=MBI50X,
        ects-url={http://onderwijsaanbod.leuven.ucll.be/syllabi/n/MBI50XN.htm},
    },
    3dcg/.style={
        opo={3D Computer Graphics},
        opo-code=MBI62A,
        ects-url={http://onderwijsaanbod.leuven.ucll.be/syllabi/n/MBI62AN.htm},
    },
    algo/.style={
        opo={Algoritmisch Denken},
        opo-code=MBI04A,
        ects-url={http://onderwijsaanbod.leuven.ucll.be/syllabi/n/MBI04AN.htm},
    },
    mobile/.style={
        opo={Mobiele toepassingen},
        opo-code=MBI20X,
        ects-url={http://onderwijsaanbod.leuven.ucll.be/syllabi/n/MBI20XN.htm},
    },
    pvm/.style={
        opo={Programmeren voor Multimedia},
        opo-code=MBI66A,
        ects-url={http://onderwijsaanbod.leuven.ucll.be/syllabi/n/MBI66AN.htm},
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
    \parbox[b]{14cm}{
        {\huge{\studiewijzer@opo}}{\hfill\small\textsc{(\studiewijzer@opocode)}} \\
        {\large\textsc{studiewijzer \studiewijzer@academiejaar}}
    } \hfill \includegraphics[scale=0.3]{logo.png} \\
    \hrule height 1pt \relax
    \vskip2mm
    \noindent\small Deze studiewijzer is een toelichting bij de \href{\studiewijzer@ectsurl}{ECTS-fiche}. De ECTS-fiche en deze studiewijzer dienen samen gelezen te worden.
    \vskip2mm
}


\newlength{\leftcolumnwidth}
\setlength{\leftcolumnwidth}{4cm}
\newlength{\rightcolumnwidth}
\setlength{\rightcolumnwidth}{11cm}

\newcommand{\categorylabel}[1]{\parbox{\leftcolumnwidth}{\raggedleft\bfseries #1}}
\newcommand{\categorytext}[1]{\parbox{\rightcolumnwidth}{\raggedright #1}}

\newenvironment{items}{\begin{itemize}[leftmargin=4mm]}{\end{itemize}}

\newcounter{categoryboxcounter}
\newcounter{categorycounter}[categoryboxcounter]

\newenvironment{categorybox}[1]{
    \stepcounter{categoryboxcounter}
    \begin{tcolorbox}[title={\Large #1}]
        \begin{center}
}{
        \end{center}
    \end{tcolorbox}
}

\NewEnviron{category}[1]{
    \stepcounter{categorycounter}
    \ifnum\value{categorycounter}>1\categoryseparator\fi
    \begin{tabular}{>{\raggedleft}m{\leftcolumnwidth}>{\raggedright}p{\rightcolumnwidth}}
        \textsc{\textbf{#1}} & \parbox{\rightcolumnwidth}{\BODY}
    \end{tabular}
}{}

\newcommand{\categoryseparator}{
    \vspace{5pt}
    \hrule height 1pt \relax
    \vspace{6pt}
}