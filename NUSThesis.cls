%vim: set ft=latex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NUSThesis}[2019/10/08  NUS Thesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass{book}

\RequirePackage[top=1.2in, bottom=1.2in,outer=1.5in, inner=1.5in, headheight=2cm, footskip=2cm, heightrounded, marginparwidth=3cm]{geometry}
\RequirePackage[labelfont=bf,font=onehalfspacing]{caption}
\RequirePackage{setspace}
\RequirePackage{etoolbox}
\RequirePackage[unicode, psdextra, colorlinks]{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=[rgb]{.93, .60, .28},
	filecolor=[rgb]{.21, .34, .50},
	urlcolor=[rgb]{.21, .34, .50},
	citecolor=[rgb]{.21, .34, .50},
}

% The alwayssingle environment ensures that front matter is always
% single column even in a double-column document.

\newenvironment{alwayssingle}
{\if@twocolumn \@restonecoltrue\onecolumn \else \@restonecolfalse\newpage \fi}
{\if@restonecol \twocolumn \else \newpage \fi}
\newcommand{\intendclearpage}{
	\ifdefined\pagedoublesided\clearemptydoublepage\else\clearpage\fi}
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the front matter.

% The year the degree will be officially conferred
\def\degreeyear#1{\gdef\@degreeyear{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% All previous degrees: one per line in chronological order
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}

% The name of your supervisors
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
\def\anothercosupervisor#1{\gdef\@anothercosupervisor{#1}}

% The names of your thesis examiners, one per line
\def\examiners#1{\gdef\@examiners{#1}}

% The name of your degree's field (e.g. Psychology, Computer Science)
\def\field#1{\gdef\@field{#1}}

% The declaration date
\def\declaredate#1{\gdef\@declaredate{#1}}

% The declaration signature
\def\declaresign#1{\gdef\@declaresign{#1}}

\def\blocklt#1{\textbf{\MakeUppercase{#1}}}
\renewcommand\maketitle{{
			\makeatletter
			\setlength{\@tempdima}{28pt}\advance\@tempdima-\baselineskip
			\parskip=\@tempdima minus 4pt
			\makeatother
			\begin{alwayssingle}
				\hrule height 0pt
				\vfill
				%\let\footnotesize\small
				\let\footnoterule\relax
				\thispagestyle{empty}
				\setcounter{page}{1}

				\begin{center}
					{\huge\textbf\@title}\par
					\vspace{80pt minus 4pt}
					\blocklt{\@author}
					\ifdefined \@prevdegrees
						\par\vspace{-10pt}\textit{(\@prevdegrees)}
					\fi\par
					\vspace{100pt minus 8pt}

					\blocklt{Dissertation zur}\\
					\blocklt{\@degree}\\
					\blocklt{an \@field,}\\
					\blocklt{der Universität Hamburg} \\

					\vspace{28pt minus 8pt}
					\blocklt{\@degreeyear} \par
					\vspace{14pt minus 4pt}

					\ifdefined \@cosupervisor
						Supervisors: \par\vspace{-10pt}
						{\@supervisor}, Main Supervisor \\
						{\@cosupervisor}, Co-Supervisor
						\ifdefined \@anothercosupervisor
							\\{\@anothercosupervisor}, Co-Supervisor
						\fi
					\else
						Supervisor: \par\vspace{-10pt}
						{\@supervisor}
					\fi\par
					\ifdefined \@examiners
						\vspace{5pt}
						Examiners: \par\vspace{-10pt}
						{\@examiners}\par
					\fi
				\end{center}
				\vfill
				\hrule height 0pt
			\end{alwayssingle}
			\setcounter{footnote}{0}
		}}

\newcommand\makedeclaration{
	\intendclearpage
	\thispagestyle{empty}
	\begin{alwayssingle}
		\vspace*{\stretch{1}}% some space at the top 
		\begin{center}
			{\bfseries \Large EIDESSTATTLICHE VERSICHERUNG / DECLARATION}
		\end{center}
		{
		\large
		Hiermit versichere ich an Eides statt, die vorliegende Dissertationsschrift selbst verfasst und keine anderen als die angegebenen Hilfsmittel und Quellen benutzt zu haben.\\
		Die eingereichte schriftliche Fassung entspricht der auf dem elektronischen Speichermedium.\\
		Die Dissertation wurde in der vorgelegten oder einer ähnlichen Form nicht schon einmal in einem früheren Promotionsverfahren angenommen oder als ungenügend beurteilt.
		}

		\begin{center}
			\raisebox{0.6\height}{\includegraphics[width=3cm]{pic/signature.pdf}}\\
			% \includegraphics[width=2cm]{pic/signature.pdf}\\
			\vspace{-0.7cm}
			\rule{3cm}{0.15mm}\\
			\vspace{0.3cm}
			\@author\\
			\@date
		\end{center}
		\vspace*{\stretch{2}}% some space at the top 
	\end{alwayssingle}
	\intendclearpage
}

\newcommand{\abstractname}{Abstract}
\newenvironment{abstract}{
	\intendclearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\abstractname}
	%%\begin{alwayssingle}
	\begin{center}{
			{\large \bfseries \abstractname}\par
			\vspace{.5in}
			\@title\par
			\vspace{.1in}
			by\par
			\vspace{.1in}
			\@author\par
			\vspace{.1in}
			\@field\\
			Universität Hamburg\par
		}
		\vspace{.1in}
	\end{center}
}
{
	%\end{alwayssingle}
}
\newcommand{\abstraktname}{Abstraktum}
\newenvironment{abstraktum}{
	\intendclearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\abstraktname}
	%%\begin{alwayssingle}
	\begin{center}{
			{\large \bfseries \abstraktname}\par
			\vspace{.5in}
		}
		\vspace{.1in}
	\end{center}
}
{
	%\end{alwayssingle}
}

\newcommand\acknowledgename{Acknowledgements}
\newenvironment{acknowledgments}
{
	\intendclearpage
	\phantomsection\addcontentsline{toc}{chapter}{\acknowledgename}
	\begin{center}
		{\large \bfseries \acknowledgename}
	\end{center}
}
{}

\appto\frontmatter{\doublespacing}

\RequirePackage{xcolor}

% The Grad. Division requires that "Placement of page numbers must be
% at the center of bottom."

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\fancypagestyle{mainmatterstyle}{
	%\fancyhf{---}
	\fancyhead[LE]{\textcolor[HTML]{888888}{\leftmark}}
	\fancyhead[RO]{\textcolor[HTML]{888888}{\rightmark}}
	\fancyfoot{} % clear all footer fields
	\fancyfoot[CE,CO]{\thepage}
	\renewcommand{\headrulewidth}{0.pt}
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\setlength{\parskip}{1em plus2mm minus2mm}}

\fancypagestyle{frontmatterstyle}{
	\fancyhf{}
	\fancyhead{}
	\fancyfoot{} % clear all footer fields
	\fancyfoot[CE,CO]{\thepage}
	\renewcommand{\headrulewidth}{0.pt}
}

\appto\frontmatter{\pagestyle{frontmatterstyle}}

%\pagestyle{simple}
%\makeevenhead{simple}{\leftmark}{}{}
%\makeoddhead{simple}{}{}{\rightmark}
%\makeevenfoot{simple}{}{\thepage}{}
%\makeoddfoot{simple}{}{\thepage}{}
%\aliaspagestyle{book}{simple}
%\aliaspagestyle{part}{simple}
%\aliaspagestyle{chapter}{simple}
%\aliaspagestyle{title}{simple}

% Re-defining \tableofcontents, \listoffigures and \listoftables to 
% avoid self-referencing. 

%\renewcommand{\tableofcontents}{
%\intendclearpage
%\phantomsection\pdfbookmark[chapter]{\contentsname}{toc}
%\chapter*{\contentsname}\vspace{2em}\makeatletter\@starttoc{toc}\makeatother}

\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Contents}
	\oldtableofcontents
	\clearpage
}


\renewcommand{\listoffigures}{
	\intendclearpage
	\phantomsection\addcontentsline{toc}{chapter}{List of Figures}
	\chapter*{List of Figures}\vspace{2em}\makeatletter\@starttoc{lof}\makeatother}

\renewcommand{\listoftables}{
	\intendclearpage
	\phantomsection\addcontentsline{toc}{chapter}{List of Tables}
	\chapter*{List of Tables}\vspace{2em}\makeatletter\@starttoc{lot}\makeatother}


\newenvironment{dedication}
{\clearpage           % we want a new page
	\thispagestyle{empty}% no header and footer
	\vspace*{\stretch{1}}% some space at the top 
	\itshape             % the text is in italics
	\raggedleft          % flush to the right margin
}
{\par % end the paragraph
	\vspace{\stretch{3}} % space at bottom is three times that at the top
	\clearpage           % finish off the page
}
\raggedbottom

\newcommand*{\blankpage}{%
	\vspace*{\fill}
	{\centering \textcolor[HTML]{888888}{This page is intentionally left blank.}\par}
	\vspace{\fill}}
\makeatletter
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
			\blankpage
			\newpage
			\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother
