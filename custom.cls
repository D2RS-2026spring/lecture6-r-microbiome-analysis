% ==============================
% custom.cls
% 技术书籍风格中文书籍类（阿拉伯数字编号）
% ==============================

\ProvidesClass{custom}[2026-03-20 自定义科技图书类]

% ------------------------------------------------
% 基类：ctexbook
% 五号字（~10.5pt）作为基础字号
% ------------------------------------------------
\LoadClass[UTF8,zihao=5]{ctexbook}


% =================================================
% 目录与编号深度控制
% =================================================
\setcounter{tocdepth}{3}     % 目录显示到 subsection（三级标题）
\setcounter{secnumdepth}{5}  % 编号深度到 paragraph（五级标题）


% =================================================
% 中文章节与标题样式（阿拉伯数字编号，技术书籍风格）
% =================================================
\ctexset{
  % =================================================
  % 中文固定名称
  % =================================================
  contentsname   = {目录},
  listfigurename = {插图目录},
  listtablename  = {表格目录},
  figurename     = {图},
  tablename      = {表},
  abstractname   = {摘要},
  bibname        = {参考文献},
  indexname      = {索引},
  appendixname   = {附录},
  % ------------------------------
  % 一级标题：第 1 章、第 2 章
  % 三号黑体，左对齐
  % ------------------------------
  chapter = {
    name = {第\space, \space 章},
    number = \arabic{chapter},
    format = \raggedright\heiti\zihao{3},
    aftername = \quad,
    beforeskip = 8bp,
    afterskip  = 4bp
  },
  % ------------------------------
  % 二级标题：1.1、1.2
  % 四号黑体，左对齐
  % ------------------------------
  section = {
    name = {},
    number = \thesection,
    format = \raggedright\heiti\zihao{4},
    aftername = \quad,
    beforeskip = 6bp,
    afterskip  = 2bp
  },
  % ------------------------------
  % 三级标题：1.1.1、1.1.2
  % 小四号黑体
  % ------------------------------
  subsection = {
    name = {},
    number = \thesubsection,
    format = \heiti\zihao{-4},
    aftername = \quad,
    beforeskip = 4bp,
    afterskip  = 1bp
  },
  % ------------------------------
  % 四级标题：1.1.1.1
  % 五号加粗
  % ------------------------------
  subsubsection = {
    name = {},
    number = \thesubsubsection,
    format = \bfseries\zihao{5},
    aftername = \quad,
    beforeskip = 3bp,
    afterskip  = 0bp
  },
  % ------------------------------
  % 五级标题：不换行，粗体
  % ------------------------------
  paragraph = {
    name = {},
    number = \theparagraph,
    format = \bfseries\zihao{5},
    aftername = \quad,
    runin = true,
    beforeskip = 2bp,
    afterskip  = 0bp
  },
  % ------------------------------
  % 六级标题：不换行，粗体
  % ------------------------------
  subparagraph = {
    name = {},
    number = \thesubparagraph,
    format = \bfseries\zihao{5},
    runin = true,
    beforeskip = 1bp,
    afterskip  = 0bp
  },
}
