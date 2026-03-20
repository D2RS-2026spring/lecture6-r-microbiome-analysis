# Lecture 6: Microbiome Analysis with R

本书是「数据驱动的可重复性研究」系列课程的第六讲，以 **R 语言微生物组数据分析** 为核心主题，系统介绍从原始测序数据到生物学解释的完整分析流程。

## 为什么要学习微生物组数据分析？

微生物组（Microbiome）研究已成为生命科学领域的前沿热点。无论是人体肠道菌群与健康的关系、土壤微生物与植物生长的互作，还是环境微生物对生态系统功能的影响，都离不开高通量测序数据的深入挖掘。然而，微生物组数据具有高维度、高稀疏性、组成性等特点，传统的统计分析方法往往难以应对。

本书正是为此而设计：帮助读者建立系统的微生物组数据分析思维，从原始测序数据的质量控制出发，逐步掌握 ASV 推断、多样性分析、差异检验和网络构建等核心方法，并通过真实土壤微生物数据实战，学会用 R 语言完成从数据预处理到发表级图表的全流程。

## 学习目标

通过本书的学习，你将能够：

1. 理解 16S rRNA 基因扩增子测序的基本原理和数据特征
2. 使用 `DADA2` 对原始测序数据进行质量控制、去噪和 ASV 推断
3. 掌握 `microeco` 包进行微生物组数据标准化分析和可视化
4. 进行 Alpha 多样性分析，评估样本内的物种丰富度和多样性
5. 进行 Beta 多样性分析，比较不同样本间的群落差异
6. 使用 LEfSe、ANCOM-BC2 等方法鉴定差异丰富的微生物类群
7. 构建微生物共现网络，解析物种间的相互作用关系
8. 从原始测序数据出发，通过 R 代码实现数据处理、统计分析和可视化的全流程自动化

## 适用读者

- 具有基本 R 语言基础和统计学概念的研究生和科研人员
- 希望系统学习微生物组数据分析流程的初学者
- 需要进行菌群多样性分析、差异检验和网络构建的生物学、生态学、医学等领域研究者

## 章节结构

本书共分为七个主要章节，按照「预处理→构建对象→多样性分析→差异分析→网络分析」的逻辑递进组织：

| 章节 | 文件 | 内容简介 |
|------|------|----------|
| 前言 | `index.qmd` | 微生物组研究概述、分析流程概览和环境准备 |
| 测序数据预处理 | `preprocess.qmd` | 使用 DADA2 进行质量控制、去噪、ASV 推断和分类注释 |
| 构建 microtable 对象 | `microtable.qmd` | 将数据整理为 microeco 包所需的格式，建立标准化分析基础 |
| 群落结构分析 | `taxonomy.qmd` | 可视化物种组成，了解群落的基本特征 |
| Alpha 多样性分析 | `alpha.qmd` | 评估样本内的物种丰富度和多样性 |
| Beta 多样性分析 | `beta.qmd` | 比较不同样本间的群落差异 |
| 差异分析 | `differ.qmd` | 鉴定在不同处理组间显著差异的微生物类群 |
| 网络分析 | `network.qmd` | 构建微生物共现网络，解析物种间的相互作用 |
| 总结 | `summary.qmd` | 方法总结和学习建议 |

## 快速开始

### 1. 克隆仓库

```bash
git clone git@github.com:D2RS-2026spring/lecture6-r-microbiome-analysis.git
cd lecture6-r-microbiome-analysis
```

### 2. 下载示例数据

原始测序数据需要从以下地址下载：

- 地址：<https://cloud.bio-spring.top/index.php/s/CZqYgzJWLczo2Rp>【仅支持华中农业大学校内访问】
- 备用：QQ 群文件 `lecture6-amplicon-rawdata.zip`

下载后解压到项目根目录，确保目录结构如下：

```
data/
├── amplicon/
│   └── raw/          # 原始测序 fastq 文件
├── processed/        # 预处理后的数据（随仓库提供）
└── silva/            # 参考数据库
```

### 3. 环境要求

- R 版本 ≥ 4.1.0
- [Quarto](https://quarto.org/)（用于编译书籍）
- [Positron](https://positron.posit.co/)（推荐的 IDE）

> **关于 Positron**：Positron 是 Posit 公司（原 RStudio）推出的新一代数据科学 IDE，基于 VS Code 架构构建，原生支持 R 和 Python。相比传统的 RStudio，Positron 提供了更现代的编辑体验、更好的多语言支持和更强大的扩展生态。本项目推荐使用 Positron 作为开发环境——用 Positron 打开本项目后，`renv` 会自动识别并恢复依赖环境，Quarto 文档也可以直接预览和渲染。当然，你也可以使用 RStudio 或其他已配置好 Quarto 引擎的 IDE。

### 4. 安装依赖

**方式一：使用 `renv`（推荐）**

```r
renv::restore()
```

> 使用 Positron 第一次打开本项目时，`renv` 会自动尝试创建可重复的本地分析环境。

**方式二：手动安装**

缺少哪个包就装哪个。

```r
install.packages("pak")  # 推荐使用 pak 包安装
pak::pak(c("tidyverse", "microeco", "dada2", "ggplot2",
           "cowplot", "pheatmap", "vegan", "randomForest"))
```

### 5. 编译书籍

```bash
quarto render --to html
```

> 运行 `quarto render`（不指定格式）将同时生成 HTML 和 PDF。因 PDF 渲染配置容易出问题，推荐先生成 HTML 文档。

编译完成后，在 `_book/` 目录下查看生成的 HTML 文件。

## 项目结构

```
.
├── index.qmd                 # 前言
├── preprocess.qmd            # 测序数据预处理
├── microtable.qmd            # 构建 microtable 对象
├── taxonomy.qmd              # 群落结构分析
├── alpha.qmd                 # Alpha 多样性分析
├── beta.qmd                  # Beta 多样性分析
├── differ.qmd                # 差异分析
├── network.qmd               # 网络分析
├── summary.qmd               # 总结
├── references.qmd            # 参考文献
├── _quarto.yml               # Quarto 配置文件
├── preamble.tex              # PDF 格式配置
├── data/                     # 数据文件
│   ├── amplicon/             # 测序数据
│   ├── processed/            # 预处理后的数据
│   └── silva/                # 参考数据库
├── microeco_tutorial/        # microeco 教程资源（官方教程源代码仓库的克隆）
├── renv/                     # renv 环境
├── renv.lock                 # renv 锁文件
└── _book/                    # 编译输出目录
```

## 主要使用的 R 包

- **[dada2](https://benjjneb.github.io/dada2/)**：用于原始测序数据的预处理和质量控制，进行 ASV 推断
- **[microeco](https://chiliubio.github.io/microeco/)**：微生物组数据的全面分析和可视化
- **[tidyverse](https://www.tidyverse.org/)**：通用数据整理和可视化
- **[vegan](https://vegandevs.github.io/vegan/)**：提供生态学统计分析

## 示例数据说明

本讲使用一组土壤微生物组数据作为示例。该数据来自李河（LiHe）地区的土壤样本，包含三种不同处理组（ZY0、ZY0.5、ZY1），每组 4 个生物学重复，共计 12 个样本。测序 targeting 16S rRNA 基因的 V4 区，使用 Illumina MiSeq 平台进行双端测序（2×250 bp）。
