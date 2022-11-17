% 2022/10/1 Written by Kiminouso,Hohai University
\ProvidesClass{hhutemplate}
\LoadClass[12pt]{article}
\RequirePackage[UTF8,heading=true]{ctex}
\RequirePackage[a4paper,top=2.54cm,bottom=2.54cm,left=3.18cm,right=3.18cm]{geometry}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage[T1]{fontenc}
\RequirePackage{xeCJK}
\RequirePackage[colorlinks=true, allcolors=blue]{hyperref}
\RequirePackage{fontspec}
\RequirePackage{float}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{calc}
\RequirePackage{subfigure}
\RequirePackage[subfigure]{tocloft}

\setCJKmainfont{SimSun}     %正文字体宋体
\setmainfont{Times New Roman}  %英文,罗马数字的字体
\newCJKfontfamily{\hei}[AutoFakeBold={1}]{SimHei}
\newCJKfontfamily{\fsgb}[AutoFakeBold={1}]{FangSong_GB2312}     %需安装仿宋GB2312字体
\newCJKfontfamily{\kaiti}{KaiTi}%需安装仿宋GB2312字体

%封面所用变量定义

\newcommand{\@coursename}{}
\newcommand{\@worktype}{}
\renewcommand{\@title}{}
\newcommand{\@semester}{}
\newcommand{\@classid}{}
\newcommand{\@yourname}{}
\newcommand{\@studentid}{}
\newcommand{\@yourteacher}{}
\newcommand{\@filledBasicInfo}{}

%封面所用变量赋值
\newcommand{\setCourseName}[1]
{
    \renewcommand{\@coursename}{#1}
}

\newcommand{\setWorkType}[1]
{
    \renewcommand{\@worktype}{#1}
}

\newcommand{\setTitle}[1]
{
    \renewcommand{\@title}{#1}
}


\newcommand{\fillBasicInfo}[1]
{
    \renewcommand{\@filledBasicInfo}{#1}
}

%河海大学logo
\newcommand{\hhuname}[2]%
{
	\includegraphics[width=#1,height=#2]{hhu.png}
}%

\newcommand{\hhubadge}[2]%
{
	\includegraphics[width=#1,height=#2]{badge.png}
}%

\newcommand{\hhulogo}%   
{
	\begin{figure}[!h]
		\raggedright
		\begin{minipage}[t]{4.25cm}
			\raggedright
			\hhubadge{2.75cm}{2.81cm}
		\end{minipage}%
		\begin{minipage}[t]{8.62cm}
			\centering
			\hhuname{8.62cm}{2.45cm}
		\end{minipage}
	\end{figure}	
}

%基本信息区环境

\newenvironment{basicInfo}
{
    \setlength{\parindent}{2.25cm}
    \begin{minipage}[h]{12.2cm}
    \fontsize{22.0pt}{2.25\baselineskip}\selectfont
}
{
    \end{minipage}
}

%封面课程名环境
\newenvironment{subjectEnv}
{
    \begin{quote}
    \fontsize{36.0pt}{1.7\baselineskip}\selectfont
}
{
    \end{quote}
}

%距离计算
\newlength\len
\newcommand{\lengthminus}[2]
{
    \setlength{\len}{#1-#2}
}

%下划线自适应
\newcommand{\underlineBox}[3]%
{
	\underline{\makebox[#1][#2]{#3}}
}

%填空样式
\newcommand{\entry}[2]%
{
    \lengthminus{12.0cm}{\widthof{#1}}
	\fsgb{{\textbf{#1}\textbf{\underlineBox{\len}{c}{#2}}}}\par
}


\newcommand{\keywordsZH}[1]{\hei 关键词:\kaiti #1}


\newcommand{\makeCover}
{
    \hhulogo
    \vspace{17pt}
    \begin{subjectEnv}
        \centering\fsgb{\textbf{\@coursename}}\par
        \centering\fsgb{\textbf{\@worktype}}\par
    \end{subjectEnv}
    \vspace{76pt}
    \centerline{\fontsize{22.0pt}{\baselineskip}{\selectfont\hei{\textbf{\@title}}}}

    \vspace{44pt}
    \begin{basicInfo}
        \@filledBasicInfo
    \end{basicInfo}
    \clearpage
}

%摘要区所用变量
\newcommand{\@abstractZH}{}
\newcommand{\@keywordsZH}{}

%赋值
\newcommand{\setAbstract}[1]
{
    \renewcommand{\@abstractZH}{#1}
}

\newcommand{\setKeywords}[1]
{
    \renewcommand{\@keywordsZH}{\hei 关键词:\kaiti #1}
}

%摘要环境
\newenvironment{abstractEnv}
{
    \centerline
    {
        \fontsize{12pt}{\baselineskip}\selectfont\hei 摘要\par
    }
    \begin{quotation}
    \fontsize{12pt}{2.25\baselineskip}\selectfont\kaiti
}
{
    \end{quotation}
}

\newcommand{\makeAbstract}
{
    \begin{abstractEnv}
        \@abstractZH
        \par
        \@keywordsZH
    \end{abstractEnv}
    \clearpage
}

% 目录
\renewcommand{\contentsname}{\hfill \zihao{-4} \hei \textmd{目录} \hfill}
\renewcommand{\baselinestretch}{1}                       %调整行距为1倍标准行距
\renewcommand{\cftsecleader}{\cftdotfill{0.6}}
\renewcommand{\cftsubsecleader}{\cftdotfill{0.6}}
\renewcommand{\cftsubsubsecleader}{\cftdotfill{0.6}}    %目录条目后的点的间距
\renewcommand{\cftsecfont}{\zihao{5} \hei}              %设置section条目的字体
\renewcommand{\cftsubsecfont}{\zihao{5} \hei}           %设置subsection条目的字体
\renewcommand{\cftsubsubsecfont}{\zihao{5} \hei}        %设置subsection条目的字体


\fancyhf{}
\pagestyle{fancy}

\cfoot{\thepage}
\lhead{}
\chead{}
\rhead{}
\renewcommand{\headrulewidth}{0pt}




%章节标题格式
\ctexset{
    section = {
    format={\flushleft\sffamily\hei\zihao{3}},
    beforeskip={17pt},
    afterskip={16.5pt},
    name={},
    number={\textbf{\arabic{section}}}
},
subsection = {
    format={\flushleft\sffamily\hei\zihao{4}},
    beforeskip={13pt},
    afterskip={13pt},
    name={\textbf{\arabic{section}.}},
    number={\textbf{\arabic{subsection}}}
},   
subsubsection = {
    format={\flushleft\sffamily\hei\zihao{-4}},
    beforeskip={13pt},
    afterskip={13pt},
    name={\textbf{\arabic{section}.\arabic{subsubsection}.}},
    number={\textbf{\arabic{subsubsection}}}
}
}