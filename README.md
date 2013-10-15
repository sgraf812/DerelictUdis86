DerelictUdis86
============

*Warning: this an unofficial Derelict binding.*

A dynamic binding to [udis86](http://udis86.sourceforge.net/) for the D Programming Language.

For information on how to build DerelictUdis86 and link it with your programs, please see the post [Building and Using Packages in DerelictOrg](http://dblog.aldacron.net/forum/index.php?topic=841.0) at the Derelict forums.

For information on how to load the udis86 library via DerelictUdis86, see the page [DerelictUtil for Users](https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users) at the DerelictUtil Wiki. In the meantime, here's some sample code.

```D
import derelict.udis86.udis86

void main() {
    // Load the udis86 library.
    DerelictUdis86.load();
    
    // Now udis86 functions can be called.
    ...
}
```