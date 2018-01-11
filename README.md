# dpy

General object display with type and structure

Displays an arbitrary q object, revealing its type, rank, and shape in a nested format.
		
# Usage

| Name and Syntax | Description |
| --------------- | ----------- |
| `dpy x` | Displays the specified object. `dpy` is defined in the global namespace |

`dpy` uses standard Q type characters to represent type, with uppercase indicating a nonscalar value (e.g. a vector or higher-dimensional
array).  This set is augmented with the following additional type characters:

* `l`, `L`: Scalar or array enumerated value
* `A`: Keyed or unkeyed table
* `Y`: Dictionary
* `#`: Heterogeneous array
* `:`: Function or operator

## Examples

```
q)dpy 3 4
.---.
|3 4|
'J--'

q)dpy enlist 3 4
.-----.
|.---.|
||3 4||
|'J--'|
'#----'

q)dpy("yellow";1011000011b)
.------------.
|.------.    |
||yellow|    |
|'C-----'    |
|.----------.|
||1011000011||
|'B---------'|
'#-----------'

q)dpy enlist enlist "abc"
.-------.
|.-----.|
||.---.||
|||abc|||
||'C--'||
|'#----'|
'#------'

q)dpy dpy
.-------------------------.
|{-1 .dpy.trt .dpy.fmt x;}|
':------------------------'

q)dpy(((2 3 4;1011000011b);"howdy");2 3#3)
.----------------.
|.--------------.|
||.------------.||
|||.-----.     |||
||||2 3 4|     |||
|||'J----'     |||
|||.----------.|||
||||1011000011||||
|||'B---------'|||
||'#-----------'||
||.-----.       ||
|||howdy|       ||
||'C----'       ||
|'#-------------'|
|.-----.         |
||3 3 3|         |
||3 3 3|         |
|'J----'         |
'#---------------'
```

Under Windows, the display would look different. (This won't be accurate unless you're viewing this page on a Windows machine.)

```
q)dpy 3 4
┌───┐
│3 4│
└J──┘

q)dpy enlist 3 4
┌─────┐
│┌───┐│
││3 4││
│└J──┘│
└#────┘

q)dpy("yellow";1011000011b)
┌────────────┐
│┌──────┐    │
││yellow│    │
│└C─────┘    │
│┌──────────┐│
││1011000011││
│└B─────────┘│
└#───────────┘

q)dpy enlist enlist "abc"
┌───────┐
│┌─────┐│
││┌───┐││
│││abc│││
││└C──┘││
│└#────┘│
└#──────┘

q)dpy dpy
┌─────────────────────────┐
│{-1 .dpy.trt .dpy.fmt x;}│
└:────────────────────────┘

q)dpy(((2 3 4;1011000011b);"howdy");2 3#3)
┌────────────────┐
│┌──────────────┐│
││┌────────────┐││
│││┌─────┐     │││
││││2 3 4│     │││
│││└J────┘     │││
│││┌──────────┐│││
││││1011000011││││
│││└B─────────┘│││
││└#───────────┘││
││┌─────┐       ││
│││howdy│       ││
││└C────┘       ││
│└#─────────────┘│
│┌─────┐         │
││3 3 3│         │
││3 3 3│         │
│└J────┘         │
└#───────────────┘
```

Higher-dimensional arrays are represented through leading axis indicators, with additional blank lines separating hyperplanes.

```
q)dpy 2 3 4#til 24
..-----------.
||0  1  2  3 |
||4  5  6  7 |
||8  9  10 11|
||           |
||12 13 14 15|
||16 17 18 19|
||20 21 22 23|
''J----------'

q)dpy 2 3 4 5#til 120
...-------------------.
|||0   1   2   3   4  |
|||5   6   7   8   9  |
|||10  11  12  13  14 |
|||15  16  17  18  19 |
|||                   |
|||20  21  22  23  24 |
|||25  26  27  28  29 |
|||30  31  32  33  34 |
|||35  36  37  38  39 |
|||                   |
|||40  41  42  43  44 |
|||45  46  47  48  49 |
|||50  51  52  53  54 |
|||55  56  57  58  59 |
|||                   |
|||                   |
|||60  61  62  63  64 |
|||65  66  67  68  69 |
|||70  71  72  73  74 |
|||75  76  77  78  79 |
|||                   |
|||80  81  82  83  84 |
|||85  86  87  88  89 |
|||90  91  92  93  94 |
|||95  96  97  98  99 |
|||                   |
|||100 101 102 103 104|
|||105 106 107 108 109|
|||110 111 112 113 114|
|||115 116 117 118 119|
'''J------------------'
```

An at-sign (`@`) on the top of an array indicates that the associated axis is empty.

```
q)dpy 0#0i
.@.
| |
'I'

q)dpy 2 1 0#0
..@.
|| |
|| |
|| |
''J'
```

On Windows, these would look as follows:

```
q)dpy 0#0i
┌@┐
│ │
└I┘

q)dpy 2 1 0#0
┌┌@┐
││ │
││ │
││ │
└└J┘
```

## Configuration

The following functions can be used to control the displayed output:

| Name and Syntax | Description |
| --------------- | ----------- |
| `.dpy.setc n` | Sets the corner and side box drawing characters. Use `0` for ASCII characters, `1` for Windows graphic characters, and `2` for post-processing via `.dpy.trt`. The default is `1` under Windows and `0` otherwise |
| `.dpy.trt x` | Defines arbitrary character translations to be applied to the output prior to display. This can, for example, be used to illustrate object nesting through colo[u]r |

dpy can be wired into the `d` namespace by adding the following lines to your `q.q` file:

```
\l dpy.q
.d.e:('[dpy;value])

```
Then, invoke from the Q command prompt via:

```
q)d)2 3#til 6
.-----.
|0 1 2|
|3 4 5|
'J----'
```

# Author

Leslie Goldsmith, First Derivatives

