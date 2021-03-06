---
title: "Python"
markup: pandoc
---

# 开发环境

## miniconda

### 安装

从 <https://docs.conda.io/en/latest/miniconda.html> 下载最新版本。

### 初始化

```fish
conda init fish
```

## 常用库

```sh
pip install black isort matplotlib
```

## JupyterLab

### 安装

```sh
pip install jupyterlab
pip install jupyterlab_code_formatter
```

### 使用

```sh
jupyter-lab --no-browser
```

# 内建函数[@pythonBuiltIn]

## 数据类型

| 数据类型 | 含义   |
|----------|--------|
| str      | 字符串 |

: Python 数据类型 {#tbl:types}

## 运算符

| 运算符 | 含义 | 例子        |
|--------|------|-------------|
| `**`   | 幂   | `2**3 == 8` |

: Python 运算符 {#tbl:pythonOperators}

## 字典[@pythonLoop]

### 遍历 list 并获取 index[@pythonEnumerate]

```py
for idx, val in enumerate(ints):
    print(idx, val)
```

### 遍历字典

```py
>>> knights = {'gallahad': 'the pure', 'robin': 'the brave'}
>>> for k, v in knights.items():
...     print(k, v)
...
gallahad the pure
robin the brave
```

### 键是否存在[@pythonKeyExists]

```py
d = {"key1": 10, "key2": 23}

if "key1" in d:
    print("this will execute")

if "nonexistent key" in d:
    print("this will not")
```

### 合并字典[@pythonMergeDict]

```py
z = {**x, **y}
```

## +=

```py
x += y  # x = x + y
```

## open

| mode-string | truncate? | create? | what's allowed                  |
|-------------|-----------|---------|---------------------------------|
| r           | no        | no      | reading (only)                  |
| w           | yes       | yes     | writing (only)                  |
| a           | no        | yes     | writing (only), auto-appends    |
| r+          | no        | no      | read and write                  |
| w+          | yes       | yes     | read and write                  |
| a+          | no        | yes     | read and (auto-appending) write |

: 打开文件模式说明[@pythonOpenMode] {#tbl:openFileMode}

## str

### 字符串复制

```py
'-' * 3
```

### 分割[@python_str_split]

```py
>>> '1,2,3'.split(',')
['1', '2', '3']
>>> '1,2,3'.split(',', maxsplit=1)
['1', '2,3']
>>> '1,2,,3,'.split(',')
['1', '2', '', '3', '']
```

## 函数式编程

### partial

大致等价于：

```py
def partial(func, /, *args, **keywords):
    def newfunc(*fargs, **fkeywords):
        newkeywords = {**keywords, **fkeywords}
        return func(*args, *fargs, **newkeywords)
    newfunc.func = func
    newfunc.args = args
    newfunc.keywords = keywords
    return newfunc
```

## property

定义属性，默认只读。

```py
class Parrot:
    def __init__(self):
        self._voltage = 100000

    @property
    def voltage(self):
        """Get the current voltage."""
        return self._voltage
```

## super

```py
class C(B):
    def method(self, arg):
        super().method(arg)    # This does the same thing as:
                               # super(C, self).method(arg)
```

## classmethod

带 `cls` 的类方法。

```py
class C:
    @classmethod
    def f(cls, arg1, arg2, ...): ...
```

## 三元操作符[@python_ternary]

```py
a if condition else b
```

## 迭代器

### 找到第一个符合条件的元素[@python_iter_find_first]

```py
next(obj for obj in objs if obj.val==5)
```

### 计算文件的行数[@python_iter_row_count]

```py
row_count = sum(1 for row in file_object)
```

## FAQ

### Python3: UnicodeEncodeError: 'ascii' codec can't encode character[@python_faq_unicode]

```sh
PYTHONIOENCODING=utf-8 python3 script.py
```

# class

## 序列化

实现 `__repr__` 方法[@python_repr]。

# numpy

```py
import numpy as np
```

## 数据类型[@numpyTypes]

| NumPy 类型 | C 类型 | 含义         |
|------------|--------|--------------|
| np.float64 | double | 双精度浮点数 |

: NumPy 数据类型 {#tbl:numpyTypes}

## 算术平均

```py
>>> a = np.array([[1, 2], [3, 4]])
>>> np.mean(a)
2.5
>>> np.mean(a, axis=0)
array([2., 3.])
>>> np.mean(a, axis=1)
array([1.5, 3.5])
```

## 右乘列向量

$$\m{A}\v{x}$$ {#eq:rigthMultiplyColumnVector}

```py
np.dot(A, x)
```

## 竖向堆积

```py
>>> a = np.array([1, 2, 3])
>>> b = np.array([2, 3, 4])
>>> np.vstack((a,b))
array([[1, 2, 3],
       [2, 3, 4]])
```

## 范数[@pythonNorm]

$$\lVert\v{x}\rVert_2 = \left(\sum_i \lvert x_i\rvert^2\right)^{\frac{1}{2}}$$ {#eq:L2Norm}

```py
>>> np.linalg.norm([3, 4])
5.0
```

## 奇异值分解

$$\m{A} = \m{U}\m{D}\T{\m{V}}$$ {#eq:SVD}

```py
U, d, Vt = np.linalg.svd(A)  # U @ np.diag(d) @ Vt == A
```

## numpy.any

测试某个轴上是否有一个元素为真。

## numpy.arccos

cos 的逆运算。

```py
>>> np.arccos([1, -1])
array([ 0.        ,  3.14159265])
```

## numpy.arctan2

```py
>>> x = np.array([-1, +1, +1, -1])
>>> y = np.array([-1, -1, +1, +1])
>>> np.arctan2(y, x) * 180 / np.pi
array([-135.,  -45.,   45.,  135.])
```

## numpy.clip

等价于 `np.minimum(a_max, np.maximum(a, a_min))`。

```py
>>> a = np.arange(10)
>>> np.clip(a, 1, 8)
array([1, 1, 2, 3, 4, 5, 6, 7, 8, 8])
```

## numpy.deg2rad

角度 -> 弧度：

```py
>>> np.deg2rad(180)
3.1415926535897931
```

## numpy.degrees

弧度 -> 角度：

```py
>>> rad = np.arange(12.)*np.pi/6
>>> np.degrees(rad)
array([   0.,   30.,   60.,   90.,  120.,  150.,  180.,  210.,  240.,
        270.,  300.,  330.])
```

## numpy.zeros

初始化数组。

```py
>>> np.zeros(5)
array([ 0.,  0.,  0.,  0.,  0.])

>>> np.zeros((2, 1))
array([[ 0.],
       [ 0.]])
```

# pandas

## Boolean indexing[@pd_bool_index]

| 符号 | 含义 |
|------|------|
| `|`  | or   |
| `&`  | and  |
| `~`  | not  |

: pandas boolean indexing {#tbl:pd_bool_index}

## join

| 方法                | 含义            |
|---------------------|-----------------|
| `DataFrame.join()`  | 按 `index` join |
| `DataFrame.merge()` | 按 `on` join    |

# pytorch

## RNN

| 函数                   | 用途                          |
|------------------------|-------------------------------|
| `pad_packed_sequence`  | 为变长序列填充 0              |
| `pack_padded_sequence` | 把填充过 0 的序列变成变长序列 |

# tqdm

## 安装

```sh
pip install tqdm
```

## 基于迭代器

```py
from tqdm import tqdm
from time import sleep

text = ""
for char in tqdm(["a", "b", "c", "d"], desc='demo', total=4):
    sleep(0.25)
    text = text + char
```

# opencv-python

## 中文路径[@python_opencv_unicode]

```py
import numpy as np

# img is in BGR format if the underlying image is a color image
img = cv2.imdecode(np.fromfile("测试目录/test.jpg", dtype=np.uint8), cv2.IMREAD_UNCHANGED)
```

# Pillow

## 图像大小限制[@pillowMaxImagePixels]

```py
PIL.Image.MAX_IMAGE_PIXELS = 933120000
```

# 常用函数

```py
def upper_first_char(str):
    return '{}{}'.format(str[0].upper(), str[1:])
```

# anaconda

## 卸载[@anaconda_uninstall]

```sh
rm -rf ~/anaconda3
```

# 参考文献
