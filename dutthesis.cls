% !TEX program=xelatex
%% This is file `dutthesis.cls',
%% This file are modified based on dutthesis
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% dutthesis.dtx  (with options: `cls')
%% 
%% Copyright (C) 2018-2019 by xun li <lixun@mail.dlut.edu.cn> and lixun.dlut@gmail.com
%% Copyright (C) 2007-2012 by Xu Yuan <xuyuan.cn@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{dutthesis}[2018/02/01 v0.0.1 The LaTeX template for thesis of Southeast University]
\typeout{Document Class `dutthesis' v0.0.1 by lixun (2018/02/01)}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  For different degree demand  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifbachelordegree\bachelordegreefalse
\newif\ifmasterdegree\masterdegreefalse
\newif\ifdoctordegree\doctordegreetrue
\newif\ifengineering\engineeringfalse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  nocolorlinks or hidelinks(no frame)  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifnocolorlinks\nocolorlinksfalse
\newif\ifhidelinks\hidelinksfalse
\DeclareOption{bachelor}{\bachelordegreetrue\doctordegreefalse\masterdegreefalse}
\DeclareOption{master}{\bachelordegreefalse\masterdegreetrue\doctordegreefalse}
\DeclareOption{engineering}{\bachelordegreefalse\engineeringtrue\masterdegreetrue}
\DeclareOption{doctor}{\bachelordegreefalse\masterdegreefalse\doctordegreetrue}
\DeclareOption{nocolorlinks}{\nocolorlinkstrue}
\DeclareOption{hidelinks}{\hidelinkstrue}
\newif\ifdoublecover\doublecoverfalse
\DeclareOption{doublecover}{\doublecovertrue}
\DeclareOption{printedition}{\doublecovertrue\nocolorlinkstrue}
\newif\ifstoneside\stonesidetrue
\DeclareOption{printoneside}{%
  \PassOptionsToClass{openany}{scrbook}
  \stonesidetrue
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions
\LoadClass[a4paper,captions=tableheading]{scrbook}
\let\todayeng\today
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  add scrhack for oviad float@addtolists warning  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{scrhack}
\RequirePackage[no-math]{fontspec-xetex}
% my change
%\RequirePackage{lmodern}
\RequirePackage{doc}
\RequirePackage{keyval}
\RequirePackage{ifthen} % conditions package
\RequirePackage{xifthen} % conditions package provide \isin command
\RequirePackage{xltxtra} %It implements some odds-andends features when using the XƎLaTEX format.
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{makeidx} % 索引
\RequirePackage[numbers,sort&compress]{natbib} % 修改引用参考文献格式
\RequirePackage[2015,numbers]{gbt7714} % 生成中文参考文献,使用numbers用来压制默认上角标文献
\RequirePackage{array} % 扩展了 array 和 tabular 环境功能
\RequirePackage[subfigure]{ccaption}
\RequirePackage{caption} % 定义图的标题格式：居中. 使用caption3.0
\captionsetup{%
  format=plain,%
  labelformat=simple,%
  singlelinecheck=on}
\RequirePackage{paralist}% 修改列表格式
\setdefaultenum{1)}{a)}{i.}{A.}% 设置列表模式
%\setdefaultleftmargin{4ex}{}{}{}{}{}
%%%%%%%%%%%%%%%%%
%  CJK support  %
%%%%%%%%%%%%%%%%%

\RequirePackage[slantfont,boldfont]{xeCJK}
\RequirePackage{CJKnumb}
\RequirePackage{CJKulem}
\RequirePackage{ulem}
\RequirePackage{xstring} % 提供字符比较命令 \IfSubStr
\newcommand{\AppendixListAlph}{ABCDEFGHIGK} %指定附录使用指标，目录中附录标题通过字母章节计数器识别
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Uppercase the english title (chapter,section,...)  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlecaps}
\Addlcwords{a an the and or nor for but so yet to of by at for but in with has
de von on} % 加入标题中不需要大写的英文单词

%%%%%%%%%%%%%%%%%%%%%%
%  font setup begin  %
%%%%%%%%%%%%%%%%%%%%%%

% 加粗改黑体
\renewcommand{\textbf}[1]{{\normalfont\bfseries #1}}
% my change
% \def\CJK@spaceChar{\hskip \f@size \p@}
% \def\CJKindent{%
%   % \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}
%   % \parindent\CJK@twochars
%   \setlength{\parindent}{0.74cm} % 修改于2022-5-26，首行缩进无法对齐
% }

\def\elegant@CJKChar@size{\hskip 12.1 \p@} % 这里直接写死为小四号字的字号了
\newdimen\elegant@CJKChar@size@dimen
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}
\def\CJKindent{%
  \setlength{\parindent}{2\elegant@CJKChar@size@dimen}
}


% my change, 英文字体使用 Times New Roman
\setmainfont[
Path = ./font/,
BoldFont=timesbd.ttf,
ItalicFont=timesi.ttf,
BoldItalicFont=timesbi.ttf
]{times.ttf}

% 新建calibri字体族
\newfontfamily\calibri[Path = ./font/]{calibri-regular.ttf}
\newfontfamily\cambria[Path = ./font/]{cambria.ttf}
\newfontfamily\yingsong[Path = ./font/]{simsun.ttc}

% 新建华文细黑字体
\newfontfamily\huawenxihei[Path = ./font/]{HuaWenXiHei.ttf}

% 新建仿宋——gb2312
\newfontfamily\xinfangsong[Path = ./font/]{fangsong_GB2312.ttf}

% 修改中文字体族，增加黑体
\setCJKmainfont[
Path = ./font/,
BoldFont=simhei.ttf,
ItalicFont=simkai.ttf,
BoldItalicFont=simfang.ttf
]{simsun.ttc}
\setCJKfamilyfont{zhsong}[Path = ./font/]{simsun.ttc}
\newcommand{\song}{\CJKfamily{zhsong}}
\setCJKfamilyfont{zhhei}[Path = ./font/]{simhei.ttf}
\newcommand{\hei}{\CJKfamily{zhhei}}
\setCJKfamilyfont{FZXiHei}[Path = ./font/]{FZXH1K.TTF}
\newcommand{\xhei}{\CJKfamily{FZXiHei}}
\setCJKfamilyfont{zhkai}[Path = ./font/]{simkai.ttf}
\newcommand{\kai}{\CJKfamily{zhkai}}
\setCJKfamilyfont{zhfs}[Path = ./font/]{simfang.ttf}
\newcommand{\fs}{\CJKfamily{zhfs}}
\setCJKfamilyfont{FZXingKai}[Path = ./font/]{FZXKK.TTF}
\newcommand{\xkai}{\CJKfamily{FZXingKai}}
\setCJKfamilyfont{YaHei}[Path = ./font/]{YaHei.ttf}
\newcommand{\yahei}{\CJKfamily{YaHei}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  xelatex导致伪粗字体使得pdf中字体不能选中
%此段代码定义\CJKfakebold命令加粗以解决问题
% https://tex.stackexchange.com/questions/180168/fontspec-xecjk-autofakebold-and-copyable-chinese-characters-in-pdf/180448#180448
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\xeCJKembold{0.6}

% hack into xeCJK, you don't need to understand it
\def\saveCJKnode{\dimen255\lastkern}
\def\restoreCJKnode{\kern-\dimen255\kern\dimen255}

% save old definition of \CJKsymbol and \CJKpunctsymbol for CJK output
\let\CJKoldsymbol\CJKsymbol
\let\CJKoldpunctsymbol\CJKpunctsymbol

% apply pdf literal fake bold
\def\CJKfakeboldsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\def\CJKfakeboldpunctsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldpunctsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\newcommand\CJKfakebold[1]{%
  \let\CJKsymbol\CJKfakeboldsymbol
  \let\CJKpunctsymbol\CJKfakeboldpunctsymbol
  #1%
  \let\CJKsymbol\CJKoldsymbol
  \let\CJKpunctsymbol\CJKoldpunctsymbol}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  %%%%%%%%%%%%
  %  设定字号大小  %
  %%%%%%%%%%%%
\newcommand{\chuhao}{\fontsize{42.16pt}{46pt}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36.14pt}{40pt}\selectfont}
\newcommand{\yichu}{\fontsize{32pt}{36pt}\selectfont}
\newcommand{\yihao}{\fontsize{26.10pt}{39pt}\selectfont}
\newcommand{\xiaoyihao}{\fontsize{24.09pt}{27.53pt}\selectfont}
\newcommand{\erhao}{\fontsize{22.08pt}{27.5pt}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18.07pt}{22.5pt}\selectfont}
\newcommand{\sanhao}{\fontsize{16.06pt}{20pt}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15.06pt}{18.75pt}\selectfont}
\newcommand{\sihao}{\fontsize{14.05pt}{17pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12.05pt}{15.35pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{11.5pt}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9.03pt}{9pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.53pt}{9pt}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.52pt}{7.5pt}\selectfont}
\newcommand{\qihao}{\fontsize{5.52pt}{6.5pt}\selectfont}
\newcommand{\linespacing}[1]{\linespread{#1}\selectfont}% 行距命令

%%%%%%%%%%%%%%%%%%%%
%  font setup end  %
%%%%%%%%%%%%%%%%%%%%


% 设置图表注释样式
\DeclareCaptionFont{capFont}{\song\wuhao} % 表格名及图名用五号宋体
\DeclareCaptionLabelSeparator{twospace}{~~}
\captionsetup{
  labelsep=twospace,% 去掉图标签后的冒号
  font={capFont},%
  figurename=图,%
  tablename=表,%
  listfigurename={\hfill\hei \xiaosanhao 图目录\hfill},%图表目录名
  listtablename={\hfill\hei \xiaosanhao 表目录\hfill}}

\RequirePackage[pdfencoding=auto,CJKbookmarks=true]{hyperref}

\AtBeginDocument{\CJKindent{}%
    \InputIfFileExists{dutthesis-utf8.cfg}% 引入配置文件
    {\typeout{[dutthesis]: Load dutthesis-utf8.cfg successfully!}}%
    {\typeout{[dutthesis]: Load dutthesis-utf8.cfg failed!}}%
    \makeindex%
    \wuhao%
    \linespacing{\mainlineskip}
  }

\RequirePackage[pagestyles,rm,compact]{titlesec}
\RequirePackage{titletoc} % 设置目录
%%%%%%%%%%%%%%%%%%%%%%
%  定义新的章节subchapter  %
%%%%%%%%%%%%%%%%%%%%%%

\titleclass{\subchapter}{straight}[\chapter]
\newcounter{subchapter}
\renewcommand{\thesubchapter}{\arabic{subchapter}}

\hypersetup{bookmarksnumbered=true}%书签中章节编号
\defaultfontfeatures{Mapping=tex-text} % --- as em-dash
%%%%%%%%%%
%  页面结构  %
%%%%%%%%%%
%\RequirePackage[body={16.0cm, 22.0cm},headsep=1.3cm,top=4cm,footskip=1.25cm,bottom=4.0cm,left=2.5cm,right=2.5cm]{geometry}
%\RequirePackage[top=3.5cm,bottom=2.5cm,includefoot,footskip=1cm,headsep=0.25cm,left=2.5cm,right=2.5cm]{geometry}
\RequirePackage[total={21cm,29.7cm},vmargin={0.76cm,3.0cm},includehead,headheight=2.05cm,headsep=1.15cm,includefoot,left=2.5cm,right=2.5cm]{geometry}

\renewcommand\frontmatter{%
  \ifstoneside\clearpage\else\cleardoublepage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{empty}}
\renewcommand\mainmatter{%
  \ifstoneside\clearpage\else\cleardoublepage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{plain}}
\renewcommand\backmatter{%
  \ifstoneside\clearpage\else\cleardoublepage\fi
  \@mainmattertrue}
%%%%%%%%%%%%
%  设置页面格式  %
%%%%%%%%%%%%
\newpagestyle{dutstyle}{
  \sethead[][{\song\wuhao\titlename}][]
          {}{{\song\wuhao\SchoolThesis}}{}
  \setfoot[][-\xiaowuhao\thepage-][]{}{-\xiaowuhao\thepage-}{}
  \headrule
}%dutsyle为正文页面样式
\newpagestyle{dutfrontstyle}{
  \pagestyle{dutnolabelstyle}
}%封面样式
\newpagestyle{dutnolabelstyle}{
  \sethead[][\song\wuhao\titlename][]{}{\song\wuhao\SchoolThesis}{}
  \setfoot[][\song\xiaowuhao--~~\thepage~~--][]{}{\song\xiaowuhao--~~\thepage~~--}{}
  \headrule
}%设置其他样式，非正文样式，罗马数字脚标
\newpagestyle{declare}{
  \sethead[][\song\wuhao\SchoolThesis][]{}{\song\wuhao\SchoolThesis}{}
  % \setfoot[][\xiaowuhao-\thepage-][]{}{\xiaowuhao-\thepage-}{}
  \headrule
}%设置其他样式，非正文样式，罗马数字脚标
\newpagestyle{declareWithoutHead}{
%   \sethead[][\song\wuhao\titlename][]{}{\song\wuhao\SchoolThesis}{}
  % \setfoot[][\xiaowuhao-\thepage-][]{}{\xiaowuhao-\thepage-}{}
  \headrule
}%设置其他样式，不含页眉，非正文样式，罗马数字脚标
\renewpagestyle{plain}{
  \pagestyle{dutnolabelstyle}
}%
%--lixun--
%%%%%%%%%%%%%%%%%%%
%  手动构建一种类似章节的格式 
% 将要废弃
%%%%%%%%%%%%%%%%%%%

\newcommand{\ConChapter}[1]{\centerline{\xiaosanhao\hei\linespacing{1.0} #1}
\addvspace{0.95\baselineskip}}
%\newcommand{\ConChapter}[1]{\hfill\xiaosanhao\hei #1\hfill}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  The vspace should be change, compromised   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%
%  标题间距  %
%%%%%%%%%%

\setlength{\parskip}{0pt}% 段距
\newcommand{\mainlineskip}{1.25}            % 主行距1.25
\titlespacing{\chapter}{0pt}{0\baselineskip}{1\baselineskip} % 标题间距
\titlespacing{\subchapter}{0pt}{0\baselineskip}{1\baselineskip} % 标题间距
\titlespacing{\section}{0pt}{0.2\baselineskip}{0.3\baselineskip} % 标题间距
%\titlespacing{\subsection}{0pt}{3ex plus .05ex minus .01ex}{2ex plus .04ex}
\titlespacing{\subsection}{0pt}{0.2\baselineskip}{0.3\baselineskip} % 标题间距
%\titlespacing{\subsubsection}{0pt}{1.5ex plus .05ex minus .01ex}{1ex plus .01ex}
\titlespacing{\subsubsection}{0pt}{0.2\baselineskip}{0.3\baselineskip} % 标题间距
\titlespacing{\paragraph}{0pt}{0pt}{0pt} % 标题间距
\titlespacing{\subparagraph}{0pt}{0pt}{0pt} % 标题间距

\renewcommand{\linespacing}[1]{\linespread{#1}\selectfont}% 行距命令
\newcommand{\stcleardp}{%
  \ifstoneside
  \clearpage
  \else
  \cleardoublepage
  \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  hidelins option setup  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \ifhidelinks
% \hypersetup{hidelinks}
%     \else 
%     \ifnocolorlinks
%     \hypersetup{colorlinks=false}
%     \else
%     \hypersetup{colorlinks=true}
%     \fi
%     \hypersetup{
%       linkcolor=blue,
%       anchorcolor=black,
%       citecolor=olive,
%       filecolor=magenta,
%       menucolor=red,
%       urlcolor=magenta
%     }
% \fi
\hypersetup{hidelinks}

%%%%%%%%%%%%
%  论文作者信息命令  %
%%%%%%%%%%%%

\renewcommand{\author}[2]{
  \def\@author{#1}
  \newcommand{\@authoreng}{#2}
}
\newcommand{\@titleeng}{}
\newcommand{\@subtitleeng}{}
\renewcommand{\title}[4]{
  \def\@title{#1} 
  \newcommand{\titlename}{#1} %lixun
  \renewcommand{\@subtitle}{#2}
  \renewcommand{\@titleeng}{#3}
  \renewcommand{\@subtitleeng}{#4}
}
\newcommand{\newtitleline}{\hfill\\%
  \hspace*{\fill}\hspace{0em}}
\newcommand{\@advisorname}{}
\newcommand{\@advisortitle}{}
\newcommand{\@advisornameeng}{}
\newcommand{\@advisortitleeng}{}
\newcommand{\advisor}[4]{
  \renewcommand{\@advisorname}{#1}
  \renewcommand{\@advisortitle}{#2}
  \renewcommand{\@advisornameeng}{#3}
  \renewcommand{\@advisortitleeng}{#4}
}
\newif\ifbcoadvisor\bcoadvisorfalse
\newcommand{\@coadvisorname}{}
\newcommand{\@coadvisortitle}{}
\newcommand{\@coadvisornameeng}{}
\newcommand{\@coadvisortitleeng}{}
\newcommand{\coadvisor}[4]{
  \bcoadvisortrue
  \renewcommand{\@coadvisorname}{#1}
  \renewcommand{\@coadvisortitle}{#2}
  \renewcommand{\@coadvisornameeng}{#3}
  \renewcommand{\@coadvisortitleeng}{#4}
}
\newcommand{\@categorynumber}{}
\newcommand{\categorynumber}[1]{\renewcommand{\@categorynumber}{#1}}
\newcommand{\@secretlevel}{}
\newcommand{\secretlevel}[1]{\renewcommand{\@secretlevel}{#1}}
\newcommand{\@UDC}{}
\newcommand{\UDC}[1]{\renewcommand{\@UDC}{#1}}
\newcommand{\@studentid}{}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\degree}[1]{
  \renewcommand{\@appdegree}{#1}
}
\newcommand{\@majorlen}{8em}
\newcommand{\@major}{}
\newcommand{\major}[2][8em]{
  \renewcommand{\@majorlen}{#1}
  \renewcommand{\@major}{#2}
}
\newcommand{\@department}{}
\newcommand{\@departmenteng}{~}
\newcommand{\department}[2]{
  \renewcommand{\@department}{#1}
  \renewcommand{\@departmenteng}{#2}
}
\newcommand{\@submajor}{}
\newcommand{\submajor}[1]{
  \renewcommand{\@submajor}{#1}
}
\newcommand{\@defenddate}{}
\newcommand{\defenddate}[1]{\renewcommand{\@defenddate}{#1}}
\newcommand{\authorizeorganization}[1]{
  \renewcommand{\@authorizeorganization}{#1}
}
\newcommand{\@authorizedate}{}
\newcommand{\authorizedate}[1]{\renewcommand{\@authorizedate}{#1}}
\newcommand{\@committeechair}{}
\newcommand{\committeechair}[1]{\renewcommand{\@committeechair}{#1}}
\newcommand{\@readerA}{}
\newcommand{\@readerB}{}
\newcommand{\reader}[2]{
  \renewcommand{\@readerA}{#1}
  \renewcommand{\@readerB}{#2}
}
\newcommand{\@duration}{}
\newcommand{\duration}[1]{\renewcommand{\@duration}{#1}}
\newcommand{\@address}{}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
\newif\ifdutthesisthanks\dutthesisthanksfalse
\newcommand{\dutthesis@thanks}{}
\renewcommand{\thanks}[1]{\dutthesisthankstrue\renewcommand{\dutthesis@thanks}{#1}}
\renewcommand{\maketitle}{
  %
  % 设置书签
  % Note: The `CJKbookmarks' option should only be used for bookmarks
  % *not* in Unicode.
  \GetFileInfo{dutthesis.cls} % get the correct fileversion
  \hypersetup{
    pdfauthor={\@author},
    pdftitle={\universityname{}\@academicdegree}, %文件标题
    pdfsubject={\@title \@subtitle}, %文件主题
    pdfcreator={Zgxh出品 (v \fileversion)} % 应用程序
  }

  \pagestyle{empty}
  \ifdoublecover
  \stcleardp
  \else\fi
  \chinesecover

  \renewcommand*\frontmatter{%
    \if@twoside\cleardoubleoddpage\else\clearpage\fi
    \@mainmatterfalse\pagenumbering{Roman}% 大写罗马字母
  }

  \ifbachelordegree
  \ifstoneside\clearpage\else\cleardoublepage\fi
  \dutdeclare
  \frontmatter
  \else
  \ifdoublecover
  \stcleardp
  \else
  \fi
  %\englishcover % 英文封面 lixun delete english cover
  \thispagestyle{declareWithoutHead}
  \dutdeclare % 独创性和使用授权声明
  \frontmatter % 开始正文之前的部分
  \pagestyle{dutfrontstyle}\clearpage
  \fi
}
\newcommand{\dutthesis}{%
  S\hspace{-0.3ex}\raisebox{-0.5ex}{E}\hspace{-0.3ex}U\hspace{0.1em}%
  \textsc{Thesis}
}
\let\orig@emph=\emph
\renewcommand{\emph}[1]{{\normalfont\slshape #1}}

\newcommand{\CoverTopOption}[3][s]{
  \makebox[1.5cm][#1]{\xiaowuhao #2}:{
    \underline{\makebox[1.5cm][c]{\xiaowuhao #3}}}
}

\newcommand{\CoverBottomOption}[3][4.5cm]{
  \makebox[7cm][s]{
    {\song\xiaosihao#2} %宋体小四号
    \underline{\makebox[#1][c]{\hei\xiaosihao#3}} %黑体小四号粗体
  }
}

\newcommand{\chinesecover}{
  \ifengineering
  \def\@degreepic{engineering}
  \else
  \ifmasterdegree
  \def\@degreepic{master}
  \else
  \def\@degreepic{doctor}
  \fi
  \fi
  \stcleardp
  % 封面
  \thispagestyle{empty}%
  \vspace{2cm plus 0.5cm minus 1.5cm}
  \ifdoctordegree
  \begin{center}
    {\xiaoyihao\song\CJKfakebold{博~士~学~位~论~文}}
    \vspace{38.5pt plus 10pt minus 5pt}

    \linespread{1.25}

    {
    \erhao\xhei\bfseries{\@title}\\%题名 
    \vspace{15pt}
    \sanhao\hei\bfseries{\titlecap{\@titleeng}}\\%english题名，首字母大写
    \vspace{120pt}
    \xiaosanhao\xhei\@subtitle%副题名 
    }
\vfill
    %\addvspace{122pt plus 50pt minus 50pt}
    \extrarowheight=20pt
    \begin{tabular}{cr}
      \makebox[3.5cm][s]{\song\xiaosanhao\authorpre} &
      \underline{\makebox[6cm][s]{
	  \hspace*{1cm}
	  \makebox[2.5cm][c]{\song\xiaosanhao{\@author}}
	  \makebox[2cm][r]{}}} \\
      \makebox[3.5cm][s]{\xiaosanhao\song\studentidpre} &
      \underline{\makebox[6cm][s]{
	  \hspace*{1cm}
	  \makebox[2.5cm][c]{\xiaosanhao\song{\@studentid}}
	  \makebox[2cm][r]{}}} \\
        \makebox[3.5cm][s]{\xiaosanhao\song\advisorpre} &
        \underline{\makebox[6cm][s]{
            \hspace*{1cm}
            \makebox[2.5cm][c]{\xiaosanhao\song{\@advisorname}}
    \makebox[2cm][r]{\hspace*{-2cm}\xiaosanhao\song\@advisortitle}}}
        \\
        \ifbcoadvisor
        &
        \underline{\makebox[6cm][s]{
            \hspace*{1cm}
            \makebox[2.5cm][c]{\xiaosanhao\song\@coadvisorname}
            \makebox[2cm][r]{\xiaosanhao\song\@coadvisortitle}}}
	    \\
        \else
        \fi 
      \makebox[3.5cm][s]{\xiaosanhao\song{}\majorpre} &
      \underline{\makebox[6cm][s]{
          \hspace*{1cm}
          \makebox[2.5cm][c]{\xiaosanhao\song{\@major}}
          \makebox[2cm][r]{}}} \\
      \makebox[3.5cm][s]{\xiaosanhao\song{}\defenddatepre} &
      \underline{\makebox[6cm][s]{
          \hspace*{1cm}
          \makebox[2.5cm][c]{\xiaosanhao\song{\@defenddate}}
          \makebox[2cm][r]{}}} \\
      \end{tabular}
    \extrarowheight=0pt
      \\
      \addvspace{40pt plus 25pt minus 25pt}
     {\xiaoerhao \xkai \universityname} \\
     {\xiaosihao \universitynameeng}
  \end{center}
  \fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %  The master degree thesis has a different demand  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  \ifmasterdegree
    \begin{center}
	{\xiaoyihao\song\CJKfakebold{硕~~士~~学~~位~~论~~文}}
	\vspace{49.5pt plus 10pt minus 5pt}

	\linespread{1.25}

	{
	{\erhao\xhei\bfseries{\@title}}\\%题名 
	\vspace{5pt}
	\sanhao\hei\bfseries{\titlecap{\@titleeng}}\\%english题名，首字母大写
	\vspace{120pt}
	\xiaosanhao\xhei\@subtitle%副题名 
	}
    \vfill
	%\addvspace{122pt plus 50pt minus 50pt}
	\extrarowheight=20pt
	\begin{tabular}{cr}
	  \makebox[3.5cm][s]{\song\xiaosanhao\authorpre} &
	  \underline{\makebox[6cm][s]{
	      \hspace*{1cm}
	      \makebox[2.5cm][c]{\song\xiaosanhao{\@author}}
	      \makebox[2cm][r]{}}} \\
	  \makebox[3.5cm][s]{\xiaosanhao\song{}\majorpre} &
	  \underline{\makebox[6cm][s]{
	      \hspace*{1cm}
	      \makebox[2.5cm][c]{\xiaosanhao\song{\@major}}
	      \makebox[2cm][r]{}}} \\
	  \makebox[3.5cm][s]{\xiaosanhao\song\studentidpre} &
	  \underline{\makebox[6cm][s]{
	      \hspace*{1cm}
	      \makebox[2.5cm][c]{\xiaosanhao\song{\@studentid}}
	      \makebox[2cm][r]{}}} \\
	    \makebox[3.5cm][s]{\xiaosanhao\song\advisorpre} &
	    \underline{\makebox[6cm][s]{
		\hspace*{1cm}
		\makebox[2.5cm][c]{\xiaosanhao\song{\@advisorname}}
	\makebox[2cm][r]{\hspace*{-2cm}\xiaosanhao\song\@advisortitle}}}
	    \\
        \ifbcoadvisor
        &
        \underline{\makebox[6cm][s]{
            \hspace*{1cm}
            \makebox[2.5cm][c]{\xiaosanhao\song\@coadvisorname}
            \makebox[2cm][r]{\xiaosanhao\song\@coadvisortitle}}}
	    \\
        \else
        \fi 
	  \makebox[3.5cm][s]{\xiaosanhao\song{}\defenddatepre} &
	  \underline{\makebox[6cm][s]{
	      \hspace*{1cm}
	      \makebox[2.5cm][c]{\xiaosanhao\song{\@defenddate}}
	      \makebox[2cm][r]{}}} \\
	  \end{tabular}
	\extrarowheight=0pt
	  \\
	  \addvspace{55pt plus 25pt minus 25pt}
	 {\xiaoerhao \xkai \universityname} \\
   \vspace{10pt}
	 {\xiaosihao \universitynameeng}
     \end{center}
 \fi

  \def\blfootnote{\xdef\@thefnmark{}\@footnotetext}
  \ifdutthesisthanks
  \blfootnote{\wuhao\dutthesis@thanks}
  \fi

  \stcleardp
}

\ifbachelordegree % 本科论文封面
\renewcommand{\chinesecover}{
  \begin{titlepage}
    \linespacing{1.0}
    \begin{center}
      \vspace*{20pt}
      \vspace*{60pt}
      \yihao\hei \bachelortitle \\
      \vspace*{60pt}
      %{\xiaoerhao\song \titlepre}
      % {\erhao\song \parbox[t]{18em}{\fs\uline{\hfill\@title\hfill}}} \\
      
      % my change
      {\xiaoerhao\song\titlepre}
      {\erhao\song \parbox[t]{16em}{\fs\uline{\hfill \@title \hfill}}}\\
    

      \vspace*{40pt}
      \renewcommand{\arraystretch}{1.5}
      \setlength{\tabcolsep}{0pt}
      \begin{tabular}{clcl}
        \sanhao\fs
        \underline{\makebox[9.5em][s]{\makebox[9.5em][c]{\@department}}} &
        \sanhao
        \departmentpre &
        \sanhao\fs
        \underline{\makebox[9.5em][s]{\makebox[9.5em][c]{\@major}}} &
        \sanhao \majorpre \\
      \end{tabular}

      \vspace*{70pt}

      \renewcommand{\arraystretch}{1.1}
      \setlength{\tabcolsep}{0pt}
      \begin{tabular}{c}
        \sanhao\studentidpre\quad\underline{%
          \makebox[20em][s]{\makebox[20em][c]{%
              \textsf{\@studentid}}}} \\
        \sanhao\studentnamepre\quad\underline{\makebox[20em][s]{%
            \makebox[20em][c]{\fs{\@author}}}} \\
        \sanhao\advisorpre\quad\underline{\makebox[20em][s]{%
            \makebox[20em][c]{\fs{\@advisorname}}}}%
        \\
        \ifbcoadvisor
        \sanhao\coadvisorpre\quad\underline{\makebox[20em][s]{%
            \makebox[20em][c]{\fs{\@coadvisorname}}}}\\%
        \fi
        \sanhao\durationpre\quad\underline{\makebox[20em][s]{
            \makebox[20em][c]{\fs{\@duration}}}}\\%
        \sanhao\addresspre\quad\underline{\makebox[20em][s]{
            \makebox[20em][c]{\fs{\@address}}}} \\
      \end{tabular}
      %\vfill
      %{\sanhao\today \par}
    \end{center}
  \end{titlepage}
}
\fi
\newcommand{\englishcover}{
  \thispagestyle{empty}%
  \begin{center}
    ~\\
      {\fontsize{24pt}{28pt}\selectfont
        \MakeUppercase{\@titleeng}\\
        \MakeUppercase{\@subtitleeng}
        \par
      }

      \vspace{1.0in}%
      {\fontsize{16pt}{24pt}\selectfont
        {A
          \ifmasterdegree
          Thesis
          \else
          Dissertation
          \fi
        submitted to}\\
        {\universitynameeng}\\
        {For the Academic Degree of \academicdegreeeng}\\
        {\vspace{0.5in}}%
        {BY}\\
        {\@authoreng}\\
        {\vspace{0.5in}}%
        {Supervised by:}\\
        {\@advisortitleeng\  \@advisornameeng}\\
        \ifbcoadvisor
        {and}\\
        {\@coadvisortitleeng\  \@coadvisornameeng}\\
        \else
        \fi
        {\vspace{0.5in}}%
        {\vfill}
        {\@departmenteng}\\
        {\universitynameeng}\\
        {\todayeng}
        \par
      }%
    \end{center}%
  \stcleardp%
}

%%%%%%%%%%%%
%  摘要环境生成  %
%%%%%%%%%%%%

\newenvironment{abstract}[1]
{ \newcommand{\@keywords}{#1}
  \hypersetup{pdfkeywords={\@keywords}}
  \stcleardp
  \phantomsection
  \ifmasterdegree
  \addcontentsline{toc}{chapter}{\@abstracttitletoc} %李逊修改，目录不需要摘要
  \fi

%  \addcontentsline{toc}{chapter}{\@abstracttitletoc} %李逊修改，目录不需要摘要
  \ifbachelordegree %本科生摘要样式部分
  \renewcommand{\newtitleline}{\\}
  \chapter*{\@title}

  \vspace*{10pt}
  \begin{center}
    \xiaosanhao \hei\@title
  \end{center}

  \begin{flushright}
    \begin{tabular}[h]{ll}
      \@studentid & \kai\@author \\
      \advisorpre & \kai\@advisorname \\
    \end{tabular}
  \end{flushright}
  %\vspace*{30pt}

  \begin{center}
    \xiaosanhao \hei\@abstracttitle
  \end{center}
  %\vspace*{30pt}

  \par
  \else%硕博摘要样式
  %\chapter*{\@abstracttitle}
  \subchapter*{\@abstracttitle}
  \fi
  \xiaosihao \song \linespacing{1.3}
}{
\par \vspace*{1.25\baselineskip}
  {\hei \xiaosihao 关键词：} \xinfangsong \xiaosihao \@keywords
}

%%%%%%%%%%
%  英文摘要  %
%%%%%%%%%%

\newenvironment{englishabstract}[1]
{
  \newcommand{\@keywords}{#1}
  \stcleardp
  \phantomsection
  \ifmasterdegree
  \addcontentsline{toc}{chapter}{Abstract}
  
  \begin{center}
    \xiaosanhao \hei\@titleeng
  \end{center}

  \fi
  \ifbachelordegree %本科生英文摘要 english abstract for bachelor

    \chapter*{\@titleeng}

  \begin{flushright}
    \begin{tabular}[h]{ll}
      \@studentid & \@authoreng \\
      Advisor & \@advisornameeng \\
    \end{tabular}
  \end{flushright}

    \chapter*{Abstract}
  \par
  \else %硕博英文摘要样式，大连理工大学章节左对齐，因此不使用charpt
  %\chapter*{Abstract}
  \subchapter*{\cambria Abstract}
  \fi
  \ifbachelordegree
  \wuhao
  \else
  \xiaosihao
  \fi
}{
  \par
\par \vspace*{1.25\baselineskip}
  {\textbf{Key Words:}} \calibri \@keywords
}

%%%%%%%%%%
%  构建目录  %
%%%%%%%%%%

\let\tableofcontents@orig=\tableofcontents

\renewcommand{\tableofcontents}
{
    %%%%%%%%%%%%
    %  中文目录格式  %
    %%%%%%%%%%%%
\titlecontents{chapter}[0pt]{\song \xiaosihao}
{\IfSubStr{\AppendixListAlph}{\thecontentslabel}{\contentslabel[\AppendixTOCName~\thecontentslabel]{0mm}\phantom{\AppendixTOCName~\thecontentslabel}\quad}{\thecontentslabel\quad}}{}
{\titlerule*[5pt]{.}\thecontentspage}  %判断chapter计数器是否为字母，字母则为附录
\titlecontents{subchapter}[0pt]{\song \xiaosihao}
{}{}
{\quad\titlerule*[5pt]{.}\thecontentspage}
% section 目录定义
\titlecontents{section}[2em]{\song \xiaosihao}
{\thecontentslabel\quad}{}
{\titlerule*[5pt]{.}\thecontentspage}
% subsection 目录定义
\titlecontents{subsection}[3.5em]{\song \xiaosihao}
{\thecontentslabel\quad}{}
{\titlerule*[5pt]{.}\thecontentspage}
% subsubsection 目录定义
\titlecontents{subsubsection}[5.5em]{\song \xiaosihao}
{\thecontentslabel\quad}{}
{\titlerule*[5pt]{.}\thecontentspage}
  {
      \linespacing{1.15}%
  \song\xiaosihao%
  %\phantomsection
  %\pagestyle{plain}
  %\pagestyle{dutnolabelstyle}
  %\setlength{\headsep}{-10pt}
  %\addtocontents{toc}{\protect\addvspace{-12.6ex}}
  \vspace*{-12.6ex}
  \tableofcontents@orig \par
  \vfill
  \clearpage} %目录部分字体可采用小四号宋体。
  %\renewpagestyle{plain}{\pagestyle{dutstyle}}
}

%% english content
%% 为了生成英语目录，先构建toe.

%%%%%%%%%%%%
%  英文目录格式  %
%%%%%%%%%%%%

\titlecontents{chapter}[0pt]{\song \xiaosihao}
{\IfSubStr{\AppendixListAlph}{\thecontentslabel}{\contentslabel[\EAppendixTOCName~\thecontentslabel]{0mm}\phantom{\EAppendixTOCName~\thecontentslabel}\quad}{\thecontentslabel\quad}}{}
{\titlerule*[5pt]{.}\thecontentspage}  %计数器为字母则是附录

\titlecontents{subchapter}[0pt]{\song \xiaosihao}
{}{}
{\quad\titlerule*[5pt]{.}\thecontentspage}
\titlecontents{section}[2em]{\song \xiaosihao}
{\thecontentslabel\quad}{}
{\titlerule*[5pt]{.}\thecontentspage}
\titlecontents{subsection}[3.5em]{\song \xiaosihao}
{\thecontentslabel\quad}{}
{\titlerule*[5pt]{.}\thecontentspage}

%%%%%%%%%%%%%%%%%%%
%  在这里构建英文目录生成命令  %
%%%%%%%%%%%%%%%%%%%

\newcommand\engcontentsname{\centerline{TABLE OF CONTENTS}}
  \addtocontents{toe}{\protect \vspace{-6.6ex}} %自己可以调整，有助于改变目录标题间距
\newcommand\tableofengcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\engcontentsname
        \@mkboth{%
           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
    \@starttoc{toe}% !!!!Define a new contents!!!!
    \if@restonecol\twocolumn\fi
    }

%%%%%%%%%%%%%%%%%%%%
%  通过添加到toe 设置英文目录， %
%%%%%%%%%%%%%%%%%%%%
    
\newcommand\addengcontents[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}}

% listoftable 
%%%%%%%%%%%%%%%%%%%%
%  设置表格目录，添加lot %
%%%%%%%%%%%%%%%%%%%%
\newcommand{\tableoftablecontents}{%
    \nopagebreak[4] 
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
  \phantomsection
  \pagestyle{plain}
    \addvspace{2\baselineskip plus 0.4\baselineskip minus 0.4\baselineskip}
    \ConChapter{\listtablename
        \@mkboth{%
           \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}% !!!!Define a new contents!!!!
    \if@restonecol\twocolumn\fi
    \stcleardp
    }

%%%%%%%%%%%
%  设置图目录,添加lof  %
%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  有bug，当不存在英文目录时，\tableoffigurecontents 以及 \tableoftablecontents都报错
%可以用\listoffigures \listoftables替代
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\tableoffigurecontents}{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \addvspace{2\baselineskip plus 0.4\baselineskip minus 0.4\baselineskip}
    \ConChapter{\listfigurename
        \@mkboth{%
           \MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}%
    \@starttoc{lof}% !!!!Define a new contents!!!!
    \if@restonecol\twocolumn\fi
    }

\newcommand\echapter[1]{\addengcontents{chapter}{\titlecap{#1}}}
\newcommand\esection[1]{\addengcontents{section}{\titlecap{#1}}}
\newcommand\esubsection[1]{\addengcontents{subsection}{\titlecap{#1}}}
% end english contents
\newenvironment{terminology}[1][\@terminologytitle]
{
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}
  \chapter*{#1}
  \song\xiaosihao
}{
  \par
}

\newenvironment{Main}{
  \mainmatter % 开始正文部分
  \song\xiaosihao % 小四号宋体
}{
  \par
  \backmatter % 开始正文之后的部分
}

\newenvironment{Sketch}{
\kai\xiaosihao}{\par}


\renewcommand{\textfraction}{0.07}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}

\setcounter{totalnumber}{6}
\setcounter{tocdepth}{3}        % 目录深度


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  GBT7714中的上标参考文献被禁用，手动修改上标，同时保留inline  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\originalcite=\cite
\renewcommand{\cite}[1]{\textsuperscript{\originalcite{#1}}}
\renewcommand{\citet}[1]{\originalcite{#1}}

%%%%%%%%%%%%%%%%%%%%
%  参考文献，其中参考文献题目右\bibname
%  决定
%%%%%%%%%%%%%%%%%%%%

\newenvironment{Reference}
{%
  %\stcleardp
  %\phantomsection
  \addcontentsline{toc}{chapter}{\@referecetitletoc}
  %\vspace*{4pt plus 2pt minus 3pt} 
%\ConChapter{#1}
\addcontentsline{toe}{chapter}{\@referecetitletoe}
}{\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Dut master thesis's introcution environment  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{Introduction}[1][\introcutionName]
{%
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{\introcutionName}
  %\vspace*{4pt plus 2pt minus 3pt} 
\chapter*{\hfill #1 \hfill}
\addcontentsline{toe}{chapter}{Introduction}
  %\chapter*{ #1}
  \song\xiaosihao %my change
}{\par}

\newenvironment{Acknowledgement}[1][\@acknowledgementtitle]
{%
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{\@acknowledgementtitletoc}
  %\vspace*{4pt plus 2pt minus 3pt} 
\chapter*{\hfill #1 \hfill}
\addcontentsline{toe}{chapter}{Acknowledgement}
  %\chapter*{ #1}
  \song\xiaosihao %my change
}{\par}

%%%%%%%%%%%%%%%%%%%%%%%%
%  附录，特别注意附录标题居中，目录特殊  %
%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{Appendix}
{
  \pagestyle{dutstyle}
  \@mainmattertrue
  \appendix
  %\titlecontentsappendix
}{\@mainmatterfalse\par
  \thispagestyle{dutstyle}\clearpage
}

%%%%%%%%%%%%
%  发表论文情况  %
%%%%%%%%%%%%

\newenvironment{Publics}[1][\@publicstitle]
{%
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{\@publicstitletoc}
  \subchapter*{#1}
  \addcontentsline{toe}{chapter}{Achievements}
  \song\xiaosihao
}{\par}

%%%%%%%%%%
%  简历环境，只有博士需要  %
%%%%%%%%%%

\newenvironment{Resume}[1][\@resumetitle]
{%
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{\@resumetitletoc}
  \subchapter*{#1}
  \addcontentsline{toe}{chapter}{Resume}
  \song \xiaosihao
 \noindent
 \renewcommand\arraystretch{1.3}
}{\par}

%%%%%%%%%%%%%%%
%  结论环境，硕士需要  %
%%%%%%%%%%%%%%%
\ifmasterdegree
\newenvironment{Conclusion}
{%
  \stcleardp
  \phantomsection
  \addcontentsline{toc}{chapter}{结论}
  \chapter*{\hfill 结\quad\quad 论 \hfill}
  \addcontentsline{toe}{chapter}{conclusion}
  \song \xiaosihao
}{\par}
\fi

\newcommand{\backcover}{
  \pagestyle{empty}
  \clearpage
  \begin{picture}(0,0)(20,650)
    {\includegraphics[width=\textwidth,bb=0 0 2424 3508]{figures/back-cover.png}}
  \end{picture}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  定义授权页命令，硕士需要，博士在独创性声明页  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\authorizationpage}{
\pagestyle{declare}
\addcontentsline{toc}{chapter}{\universityname 学位论文版权使用授权声明}
\clearpage \dutauthorization}

\ifbachelordegree
\renewcommand{\backcover}{}
\fi


%%%%%%%%%%%%%%%%%%%%%
%  个人修改，这里是参考文献的格式  %
%%%%%%%%%%%%%%%%%%%%%

\setlength{\bibsep}{1pt}
\renewcommand{\bibfont}{\wuhao}


\endinput
%%
%% End of file `dutthesis.cls'.
