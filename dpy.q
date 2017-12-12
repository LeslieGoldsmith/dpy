/
	General object display with type and structure
	Copyright (c) 2015-2017 First Derivatives

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License as
	published by the Free Software Foundation; either version 2 of
	the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	----------------

	Displays an arbitrary q object, revealing its type, rank, and shape.
		
	Use <setc> to control box drawing characters (defaults to Windows
	chars under Windows and ASCII chars otherwise).
	
	Use <trt> to define arbitrary character translations (e.g. to
	illustrate nesting using colo[u]r).
	
	Can be wired into <d> namespace via the following in your <q.q>
	file:
	
		\l dpy.q
		.d.e:('[dpy;value])
	
	Then, invoke via:
	
		d)2 3 4#til 24

	Author:		Leslie Goldsmith, First Derivatives
\


\d .dpy

enl:enlist
ty:@[(58#"l"),reverse[ty],"-",upper[ty:1_-1_.Q.t],(58#"L"),(20#"-"),"AY",13#":"]77+
trm:{[t;x] x:((1<count x)&","=first x)_x;$[10h=t;1_-1_x;t in 1 5 6 8 9h;((-)last[x]in "bhief")_x;x]}
pad:{(1|/count each x)$x}
ts:{$[t:type x;t,count x;any 0~'i:ts each x;0;1=count distinct -1_'i;first[j],count[i],(1_-1_j:first i),(|/)last each i;0]}
sp:{@["j"$(+/)0=(1+til i)mod/:-1_x;-1+i:last x:(*\)(|) -1_x;:;0]}
mat:{[s;x] r:sp s;a:.Q.s2(-2+count s),//x;(a,enl count[first a]#" ")?[p=-1_-1,p;count a;p:where r+1]}
trt:(::)

setc:{@[`.dpy;;:;].(`tl`tr`bl`br`vl`vr`ht`hb;("..''||--";"\332\277\300\331\263\263\304\304";"\332\277\300\331\263\272\304\315")x);}

box:{[c;x;y]
	t:("@",ht)[-1#x],(h:count[first y]-1)#ht;
	l:("@",vl)[-1_x],\:(-1+v:count y)#vl;
	(flip tl,/:l,\:bl),'(enl[t],y,enl c,h#hb),'tr,(v#vr),br
	}

fmt:{
	$[0h>t:type x;(1#" ";trm[(-)t].Q.s1 x;1#ty t); / Simple scalar
		((0h<t)&78h>t)|99h<t;box[ty t;-1 0<l;enl$[l:count x;trm[t].Q.s1 x;" "]]; / Simple vector or function
		0~u:ts x;box["#";1 1;pad raze fmt each x]; / Not simple
		t in 98 99h;box[ty t;1 1;pad .Q.s2 x]; / Table or dictionary
		(2<count u)&1=u 1;box["#";1 1;fmt first x]; / Simple enclosure
		3=count u;box[ty first u;0<1_u;pad trm[first u]each .Q.s2 x]; / Simple matrix
		box[ty first u;0<1_u;pad trm[first u]each mat[1_u;x]]] / Simple multi-dimensional array
	}

setc "w"=first string .z.o / Use 0 for ASCII box corners and sides, 1 for graphic, 2 for post-processing via <trt>

\d .
	
dpy:{-1 .dpy.trt .dpy.fmt x;}
