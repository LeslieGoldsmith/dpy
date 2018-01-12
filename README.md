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

q)dpy parse"select event from tbl where t>0"
.--------------.
|.-.           |
||?|           |
|':'           |
|              |
|`tbl          |
|s             |
|.-------.     |
||.-----.|     |
|||.---.||     |
||||.-.|||     |
|||||>||||     |
||||':'|||     |
||||   |||     |
||||`t |||     |
||||s  |||     |
||||   |||     |
||||0  |||     |
||||j  |||     |
|||'#--'||     |
||'#----'|     |
|'#------'     |
|              |
|0             |
|b             |
|.------------.|
||event| event||
|'Y-----------'|
'#-------------'
```

Under Windows, the display would look different. (This won't be accurate unless you're viewing this page on a Windows machine, or have chosen an output encoding such as "Western (DOS Latin 1)". This encoding may not be in your default list.)

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

q)dpy parse"select event from tbl where t>0"
┌──────────────┐
│┌─┐           │
││?│           │
│└:┘           │
│              │
│`tbl          │
│s             │
│┌───────┐     │
││┌─────┐│     │
│││┌───┐││     │
││││┌─┐│││     │
│││││>││││     │
││││└:┘│││     │
││││   │││     │
││││`t │││     │
││││s  │││     │
││││   │││     │
││││0  │││     │
││││j  │││     │
│││└#──┘││     │
││└#────┘│     │
│└#──────┘     │
│              │
│0             │
│b             │
│┌────────────┐│
││event| event││
│└Y───────────┘│
└#─────────────┘
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
| `.dpy.trt x` | Defines arbitrary character translations to be applied to the output prior to display. This can, for example, be used to illustrate object nesting through colo[u]r; see below for details |

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

### Custom Output Translation

You can use `.dpy.trt` to customize the output that is rendered to your display device. The following example shows how the box drawing
characters can be displayed in a specific colour.

```
//
// Bash support for dpy to draw boxes in a configured colour.
//

\d .dpy

setc 2 / Enable character post-processing mode


//
// @desc Modifies  `.dpy.trt`'s default behaviour by replacing box drawing
// characters with semi-graphic character escape sequences.
//
// @param bc {string}	Specifies bash colour (see <bces> above).
// @param l {string}	Specifies a list of strings that will be remapped.
//
// @example:
// 	q)\l dpy.q
//	q).dpy.setc 2
//	q).dpy.trt:clrtrt["1;35";] / Light purple boxes
// 
clrtrt:{[bc;l]
    bbd:{bces[x] "\033(0",y,"\033(B"}[bc;] each "\154\153\155\152\170\170\161\161";
    rbdc[;bbd] each l
    }


//
// @desc Wraps a string with a Bash colour escape sequence.
//
// The following colours are supported:
//
//  0;30 - Black  0;31 - Red		1;30 - Dark Gray   1;31 - Light Red			     
//  0;34 - Blue	  0;35 - Purple		1;34 - Light Blue  1;35 - Light Purple 			    
//  0;32 - Green  0;33 - Brown		1;32 - Light Green 1;33 - Yellow	     
//  0;36 - Cyan	  0;37 - Light Gray	1;36 - Light Cyan  1;37 - White 	 
//
// @param bc {string}	Specifies bash colour.
// @param s {string}	Specifies string to wrap in colour esacpe sequence.
//
// @return {string}	The wrapped string.
//
bces:{[bc;s] "\033[",bc,"m",s,"\033[0m"} / Bash colour escape sequence


//
// @desc Replaces single-character box drawing characters with Unix semi-grpahic
// characters.
//
// @param s {string}	Specifies string to modify.
// @param bdc {string}	Specifies the table of escape sequences to draw semi-
//			graphic characters.
//
rbdc:{[s;bdc]
    j:where b|-1_1b,b:s in m:"\332\277\300\331\263\272\304\315";
    t:j _ s;t[where b@j]:bdc[m?s where b];(,/)t
    }


//
// Sample <clrtrt> projections.
//
redtrt:clrtrt["0;31";] / Make boxes red
cyantrt:clrtrt["1;36";] / Make boxes cyan

trt:cyantrt

\d .
```

As a variant, the next example shows how the box drawing characters can be augmented through the use of colour to reinforce nesting level visually.

```
//
// Bash support for dpy to reinforce nesting level through colour.
//

\d .dpy

setc 2 / Enable character post-processing mode

NC:("0;34";"0;36";"0;37";"0;31";"1;33";"1;32") / Change to suit preferences
PC:.dpy`tl`tr`bl`br`vl`vr`ht`hb / Placeholder characters configured in <.dpy.setc>
EB:"\154\153\155\152\170\170\161\161" / Escaped box drawing characters


//
// @desc Modifies `.dpy.trt`'s default behaviour by replacing box drawing
// characters with semi-graphic escape sequences and colourizing each nesting
// level in a different colour.
//
// @param s {string}	String to modify.
//
// @example:
//	q)\l dpy.q
//	q).dpy.trt:.dpy.nsttrt each
// 
nsttrt:{[s]
    d:(sums s in "\332\263\300")-
        -1_0i,sums s in "\277\272\331"; / Determine nesting depth by looking for left and right characters

    j:where b|-1_1b,b:s in PC; 
    t:j _ s;
    t[where b@j]:{"\033[",(x`col),"m\033(0",(x`bdc),"\033(B\033[0m"} each 
        flip `col`bdc!(NC[mod[-1+d where b;count NC]];EB[PC?s where b]);

    (,/)t 	
    }

trt:nsttrt each

\d .
```

# Credits

Thanks to Hugh Hyndman and Fadel Al-Jaifi of First Derivatives for the Bash output customization ideas and logic.

# Author

Leslie Goldsmith, First Derivatives
