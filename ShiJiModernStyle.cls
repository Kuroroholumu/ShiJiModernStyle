\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ShiJiModernStyle}[2022/03/24 modern style typesetting for SHIJI]
%
\RequirePackage{xcolor}
\RequirePackage{catchfilebetweentags}
%
% ===== Modern Style: jlreq ================================================== % 
%
\LoadClass[
  uplatex,tate,book,twoside,
  paper={153.25mm,220mm}, % 1/32 of A0U
  baselineskip=2.0zh,
  hanging_punctuation,
]{jlreq}
%
\jlreqsetup{
  % endnote 設定
  reference_mark=interlinear,
  endnote_position=paragraph,
  endnote_second_indent=3.75\jlreq@zw,
}
%
\NewBlockHeading{prechapter}{1}{%
  % 標題風格: preShiji
  indent=0\jlreq@zw,
  lines=3,
  font={\Large\mainfont},
  subtitle_break=false,
  subtitle_format={#1},
  subtitle_indent=10\jlreq@zw,
  subtitle_font={\jlreq@keepbaselineskip{\notefont\normalsize}},
  number=false,
  pagebreak=begin_with_odd_page,
}
\RenewBlockHeading{chapter}{1}{%
  % 標題風格: chapter 
  indent=0\jlreq@zw,
  lines=3,
  label_format={史記第\thechapter},
  font={\Large\mainfont},
  subtitle_break=false,
  subtitle_format={#1},
  subtitle_indent=10\jlreq@zw,
  subtitle_font={\jlreq@keepbaselineskip{\notefont\normalsize}},
  pagebreak=begin_with_odd_page,
}
%
\renewcommand{\jlreqparindent}{2\zw}
%
\NewPageStyle{preShiji}{%
  % 頁眉與頁碼 preShiji 
  tate,
  running_head_font={\footnotesize\notefont},
  nombre_font={\footnotesize\notefont},
  running_head_position=6\zw,
  nombre_position=6\zw,
  nombre={\kansuji\thepage},
  mark_format={_prechapter={#1}},
  odd_running_head={_prechapter},
  even_running_head={史記會注考證},
}
%
\NewPageStyle{Shiji}{%
  % 頁眉與頁碼 Shiji 
  tate,
  running_head_font={\footnotesize\notefont},
  nombre_font={\footnotesize\notefont},
  running_head_position=6\zw,
  nombre_position=6\zw,
  nombre={\kansuji\thepage},
  mark_format={_chapter={#1}},
  odd_running_head={_chapter},
  even_running_head={史記會注考證},
}
%
% ===== Modern Style: DIY Commands =========================================== %
%
\newif\ifmodernstyle\modernstyletrue
%
\newcommand{\parswitch}{%
  \ifmodernstyle \par \else \nolinebreak \fi % 分段開關
}
%
\newcommand{\loadnotes}[2]{% 注插入
  \endnote{\notefont\ExecuteMetaData[#1]{#2}}
}
%
\definecolor{shuiro}{cmyk}{0.00,0.85,1.00,0.00} % 朱色
%
\newcommand{\KAOZ}{\textcolor{shuiro}{【考證】}\hspace{.5zw}} % 考證
\newcommand{\SYIN}{\textcolor{shuiro}{【索隱】}\hspace{.5zw}} % 索隱
\newcommand{\JJIE}{\textcolor{shuiro}{【集解】}\hspace{.5zw}} % 集解
\newcommand{\ZHYI}{\textcolor{shuiro}{【正義】}\hspace{.5zw}} % 正義
%
% ===== Modern Style: DIY Fonts ============================================== %
%
% CJK fontの設定
% Ref: https://texwiki.texjp.org/?upTeX%2CupLaTeX
%
% For Modren Style
%
% ShiJiFontsModren-v: 1. 標點符號壓縮
%                     2. 對一些標點符號進行適當位移
%
\DeclareFontFamily{JT2}{mainfont}{}
\DeclareFontFamily{JY2}{mainfont}{}
\DeclareFontShape{JT2}{mainfont}{m}{n}{<->s*[1.0]ShiJiFontsModren-v}{}
\DeclareFontShape{JY2}{mainfont}{m}{n}{<->s*[1.0]ShiJiFontsModren-v}{}
%
\DeclareFontFamily{JT2}{notefont}{}
\DeclareFontFamily{JY2}{notefont}{}
\DeclareFontShape{JT2}{notefont}{m}{n}{<->s*[1.0]ShiJiFontsModren-v-lt}{}
\DeclareFontShape{JY2}{notefont}{m}{n}{<->s*[1.0]ShiJiFontsModren-v-lt}{}
%
\DeclareRobustCommand\mainfont{\kanjifamily{mainfont}\selectfont}
\DeclareRobustCommand\notefont{\kanjifamily{notefont}\selectfont}
%
\AtBeginDvi{
%
% 預設 : ubjlreq-v -> uprml-v : GenRyuMin-SB
%
% 自訂 : Modern Style
% 
%        ubjlreq-v -> ShiJiFontsModren-v     -> uprml-v    : GenRyuMin-SB
%        ubjlreq-v -> ShiJiFontsModren-v-lt  -> uprml-v-lt : GenRyuMin-M
%
%        uprml-v-lt is a copy of uprml-v
%
  \special{pdf:mapline uprml-v     UniJIS2004-UTF16-V GenRyuMin-SB}
  \special{pdf:mapline uprml-v-lt  UniJIS2004-UTF16-V GenRyuMin-M }
}
