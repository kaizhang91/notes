---
title: "Pandoc"
markup: pandoc
---

# 开发环境

```sh
pip install pandocfilters  # pandoc-minted
pip install Pygments  # gpoore/minted
```

# 引用

- 在方括号里
- 分号分隔

```pandoc
[@smith04; @doe99]
```

# 脚注

```pandoc
Here is a footnote reference,[^1] and another.[^longnote]

[^1]: Here is the footnote.

[^longnote]: Here's one with multiple blocks.

    Subsequent paragraphs are indented to show that they
belong to the previous footnote.

        { some.code }

    The whole paragraph can be indented, or just the first
    line.  In this way, multi-paragraph footnotes work like
    multi-paragraph list items.

This paragraph won't be part of the note, because it
isn't indented.
```

# 数学

| 类别     | 语法             |
|----------|------------------|
| 行内公式 | `$\alpha$`       |
| 行间公式 | `$$\alpha = 1$$` |

: 数学语法 {#tbl:math_syntax}

# Extension

- `+EXTENSION` 启用
- `-EXTENSION` 禁用

## emoji

emoji 列表请参考 <https://github.com/ikatyang/emoji-cheat-sheet>。
