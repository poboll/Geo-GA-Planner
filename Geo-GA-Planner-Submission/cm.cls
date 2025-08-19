\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{cm}

% set default language
\def\tl@mainlanguage{portuguese}\def\tl@mainvariant{brazilian}%
\def\tl@secondlanguage{english}\def\tl@secondvariant{american}
\def\tl@clevereflanguage{brazilian}
\DeclareOption{portuguese}{%
	% do nothing - use default
}
\DeclareOption{english}{%
	\def\tl@mainlanguage{english}\def\tl@mainvariant{american}%
	\def\tl@secondlanguage{portuguese}\def\tl@secondvariant{brazilian}%
	\def\tl@clevereflanguage{english}}
\DeclareOption{spanish}{%
	\def\tl@mainlanguage{spanish}\def\tl@mainvariant{spanish}%
	\def\tl@secondlanguage{portuguese}\def\tl@secondvariant{brazilian}%
	\def\tl@thirdlanguage{english}\def\tl@thirdvariant{american}%
	\def\tl@clevereflanguage{spanish}}
\DeclareOption{french}{%
	\def\tl@mainlanguage{french}\def\tl@mainvariant{french}%
	\def\tl@secondlanguage{portuguese}\def\tl@secondvariant{brazilian}%
	\def\tl@thirdlanguage{english}\def\tl@thirdvariant{american}%
	\def\tl@clevereflanguage{french}}
\DeclareOption{german}{%
	\def\tl@mainlanguage{german}\def\tl@mainvariant{german}%
	\def\tl@secondlanguage{portuguese}\def\tl@secondvariant{brazilian}%
	\def\tl@thirdlanguage{english}\def\tl@thirdvariant{american}%
	\def\tl@clevereflanguage{german}}
\ProcessOptions\relax
\ExecuteOptions{}

\LoadClass[twoside]{article}
\def\journalname#1{\gdef\@journalname{#1}} 
\def\Volume#1{\gdef\@Volume{#1}}
\def\Issue#1{\gdef\@Issue{#1}}
\def\Year#1{\gdef\@Year{#1}}
\def\Authortitle#1{\gdef\@Authortitle{#1}}
\def\Authorfootnote#1{\gdef\@Authorfootnote{#1}}
\def\journalsite#1{\gdef\@journalsite{#1}}
\def\Articletype#1{\gdef\@Articletype{#1}}
\def\Title#1{\gdef\@Title{#1}}
\def\Author#1{\gdef\@Author{#1}}
 %\def\Adress#1{\gdef\@Adress{#1}}
 

 
 \def\Email#1{\gdef\@Email{#1}} 
  \def\Received#1{\gdef\@Received{#1}} 
   \def\Revised#1{\gdef\@Revised{#1}} 
    \def\Accepted#1{\gdef\@Accepted{#1}} 
    \def\Abstract#1{\gdef\@Abstract{#1}}  
    \def\Keywords#1{\gdef\@Keywords{#1}}   
\def\MSC#1{\gdef\@MSC{#1}} 
\def\DOI#1{\gdef\@DOI{#1}} 
\newcommand{\firstpage}[1]{\gdef\@firstpage{#1}}
\usepackage{subfigure}

\RequirePackage{enumitem}
 
\newenvironment{exampleEnumeration}
{\begin{enumerate}[leftmargin=*, itemsep=0pt, labelsep=0.5pt, parsep=0pt,partopsep=0pt,label=$^{\arabic*}$]}
	{\end{enumerate}} 
	
 	

 \def\Adress#1{\gdef\@Adress{#1}}


\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\usepackage{changepage}
\usepackage{setspace}
\usepackage{mathptmx} 
\usepackage{mathtools}
\usepackage{upgreek} 
\usepackage[numbers]{natbib}
\usepackage{bm} 
\RequirePackage{xcolor,color,caption}
\definecolor{cmcolor}{RGB}{31,73,125}    
\captionsetup[figure]{labelfont={bf,{color=cmcolor}},labelsep=period,font=footnotesize}
\captionsetup[table]{labelfont={bf,{color=cmcolor}},labelsep=period,font=footnotesize}

\usepackage[colorlinks,urlcolor=black,linkcolor=black,citecolor=cmcolor]{hyperref}
\usepackage{booktabs}
\usepackage{array}
\usepackage{amsmath,amssymb,amsfonts}
\usepackage{indentfirst} 
\usepackage{graphicx}
\usepackage{float}
\RequirePackage{fontspec} % Set fonts
\usepackage[a4paper,top=30mm,bottom=39mm,left=20mm,right=20mm,footskip=12.5mm]{geometry}
\setmainfont{Times New Roman}
\usepackage[greek,english]{babel}

 
 
 
\usepackage{tikz}
\usepackage[absolute ,overlay]{textpos}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{} 
\fancyfoot{} % 初始化页脚
\fancyfoot[LE]{\fontsize{8bp}{10bp}\bfseries\itshape\selectfont\@journalname}
\fancyfoot[LO]{\fontsize{8bp}{10bp}\bfseries Volume\ \@Volume\ Issue\ \@Issue|\@Year|\ \thepage}
 \fancyfoot[RO]{\fontsize{8bp}{10bp}\bfseries\itshape\@journalname}
 \fancyfoot[RE]{\fontsize{8bp}{10bp}\bfseries\thepage\ |\ \@Authortitle.}
\renewcommand{\headrulewidth}{0bp} 
\RequirePackage[nopatch=footnote]{microtype}  % Disable footnote patch to avoid warnings





\newcommand{\makecm}[1]{\begin{spacing}{1}
	\vspace*{-1.5cm}\color{cmcolor}\noindent 	
	\fontsize{10bp}{\baselineskip}\selectfont
			\href{\@journalsite}{\color{cmcolor}\@journalname}\\[-.1cm]
				\href{\@journalsite}{\color{cmcolor}\@journalsite}\\[-.1cm]	
	\rule{\textwidth}{1bp}\color{black}\\[-2.68cm]
\rule{1cm}{0bp}\hfill \href{https://www.wiserpub.com/}{\includegraphics[width=2.7cm]{Fig/LOGO}}\\[6bp]
\setlength{\baselineskip}{16bp}\fontsize{14bp}{\baselineskip}\selectfont
\@Articletype\\ 
\end{spacing}
\begin{spacing}{1.03} 
~\\
	\selectfont\setlength{\baselineskip}{18bp} \fontsize{16bp}{\baselineskip}\selectfont\color{cmcolor}\textbf{\@Title}
	 \end{spacing}
	\begin{spacing}{1}
\setlength{\baselineskip}{13bp}\fontsize{10bp}{\baselineskip}\selectfont~\\[9bp]
\setlength{\baselineskip}{14bp}\fontsize{11bp}{\baselineskip}\selectfont \color{black}  \textbf{\@Author}  
\setlength{\baselineskip}{13bp}\fontsize{10bp}{\baselineskip}\selectfont ~\\
 \setlength{\baselineskip}{10bp}\fontsize{9bp}{\baselineskip}\selectfont
	\@Adress~	
	\\[-0.715cm]
  	\@Email\\
\setlength{\baselineskip}{13bp}\fontsize{10bp}{\baselineskip}\selectfont ~\\[-1pt] 
\setlength{\baselineskip}{10bp}\fontsize{9bp}{\baselineskip}\selectfont
\textbf{Received:} \@Received;\ \ \textbf{Revised:} \@Revised;\ \ \textbf{Accepted:} \@Accepted \\
\setlength{\baselineskip}{13bp}\fontsize{10bp}{\baselineskip}\selectfont ~\\	
\color{cmcolor}	\textbf{Abstract:} \color{black} \@Abstract\\
\setlength{\baselineskip}{7bp}\fontsize{10bp}{\baselineskip}\selectfont ~\\	
\setlength{\baselineskip}{13bp}\fontsize{10bp}{\baselineskip}\selectfont  
\color{cmcolor}	\textbf{\itshape Keywords}\textbf{:} \color{black} \@Keywords\\
\setlength{\baselineskip}{7bp}\fontsize{10bp}{\baselineskip}\selectfont ~\\	
\setlength{\baselineskip}{13bp}\fontsize{10bp}{\baselineskip}\selectfont 
\color{cmcolor}	\textbf{MSC:} \color{black} \@MSC \corred
\color{black} \normalsize  \end{spacing}\vspace*{-2bp}}



\renewcommand{\footnoterule}{%
	\kern 12pt
	\color{cmcolor}	\hrule width \textwidth height 1bp
	\kern 3pt %位置高度
}
\usepackage[stable,bottom]{footmisc}
\setlength{\footnotesep}{-4pt}
\setlength{\skip\footins}{0pt}

\renewcommand{\thefootnote}{} 

\newcommand{\corred}{\footnote{\hspace{-0.75cm}
		\fontsize{8bp}{8bp}\selectfont \color{black} Copyright \textcopyright \@Year\ \@Authorfootnote.\\
DOI: \href{https://doi.org/\@DOI}{\color{black}https://doi.org/\@DOI}\\
This is an open-access article distributed under a CC BY license \\
(Creative Commons Attribution 4.0 International License)\\
\href{https://creativecommons.org/licenses/by/4.0/}{\color{black}https://creativecommons.org/licenses/by/4.0/}
}}






\newcommand{\orcidicon}{\includegraphics[width=0.3cm,height=3mm]{Fig/ORCID}}
\foreach \x in {A, ..., Z}{%
	\expandafter\xdef\csname orcid\x\endcsname{\noexpand\href{https://orcid.org/\csname orcidauthor\x\endcsname}{\noexpand\orcidicon}}
}



\RequirePackage{titling,ragged2e}


\makeatletter
\renewcommand\section{\@startsection
	{section}{1}{\z@}%
	{-5ex \@plus -1ex \@minus -.2ex}%
	{2ex \@plus.2ex}%
	{\fontsize{14bp}{18bp}\selectfont\justifying\upshape\bfseries \color{cmcolor}}}
\makeatother

\makeatletter
\renewcommand\subsection{\@startsection
	{subsection}{1}{\z@}%
	{-2.5ex \@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus.2ex}%
	{\fontsize{12bp}{16bp}\selectfont\justifying\itshape\bfseries \color{cmcolor}}}
\makeatother

\makeatletter
\renewcommand\subsubsection{\@startsection
	{subsubsection}{1}{\z@}%
	{-2.5ex \@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus.2ex}%
	{\fontsize{10bp}{14bp}\selectfont\justifying\itshape\bfseries \color{cmcolor}}}
\makeatother


\renewcommand{\thesection}{\arabic{section}.\hspace{-0.3cm}}
\renewcommand{\thesubsection}{\upshape\arabic{section}.\arabic{subsection}\hspace{-0.3cm}}
\renewcommand{\thesubsubsection}{\upshape\arabic{section}.\arabic{subsection}.\arabic{subsubsection}\hspace{-0.3cm}}



 









\renewcommand{\footnotesize}{\setlength{\baselineskip}{8bp}\fontsize{8bp}{\baselineskip}\selectfont}
\renewcommand{\normalsize}{\setlength{\baselineskip}{13bp}\fontsize{10bp}{\baselineskip}\selectfont}

\abovedisplayshortskip=11bp
\belowdisplayskip=20bp
\setlength{\jot}{20pt}


 \setlength{\intextsep}{20bp}
\setlength{\parindent}{7.056mm}  



\newlength{\bibitemsep}\setlength{\bibitemsep}{.1\baselineskip plus .05\baselineskip minus .05\baselineskip}
\newlength{\bibparskip}\setlength{\bibparskip}{-1pt}
\let\oldthebibliography\thebibliography
\renewcommand\thebibliography[1]{%
	\oldthebibliography{#1}%
	\setlength{\parskip}{\bibitemsep}%
	\setlength{\itemsep}{\bibparskip}%
}
 

\def\bibfont{\fontsize{10bp}{12bp}\selectfont}

\makeatletter
  %\renewcommand \@biblabel[1]{\quad\quad[#1]}%参考文献标号右对齐 
\renewcommand \@biblabel[1]{[#1]\hfill}%参考文献标号左对齐 
   \makeatother 

\usepackage{lipsum}
 \linespread{1.03}
\raggedbottom
\urlstyle{same} 













 
 
\RequirePackage{xstring}
\RequirePackage{etoolbox,xpatch}
 \RequirePackage{amsthm}
\RequirePackage{scrextend}
\RequirePackage{url}
\RequirePackage[absolute]{textpos}
\RequirePackage{adjustbox}
\RequirePackage{longtable,booktabs,tabularx,colortbl,threeparttable,multirow}



 	
 

 

\hyphenpenalty=10000
\tolerance=1000
 
 	%%%% Widows & orphans
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000


%%%% To avoid "Output-loop.." compile bug
\maxdeadcycles=10000
\cmidrulewidth=1pt



 

 


