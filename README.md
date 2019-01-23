# Color

Tool which converts RGB color codes to HEX or HEX color codesto RGB from its arguments. 

## Getting Started

### Prerequisites

For the installer to work you will need the following, else you will need to install it manually.

* Python 3
* Unix system 

### Installation

To install you just run:

```
$ cd build && ./installer.py --install
```

The default installation location is /usr/local/bin

### Uninstallation

To remove you just run:

```
$ cd build && ./installer.py --uninstall
```

## Usage

### HEX to RGB

To convert HEX code to RGB you run the following

```
$ color 123FAB
```

which will provide the output

```
18 63 171
```

### RGB to HEX

To convert RGB to HEX code you run the following

```
$ color 18 63 171
```

which will provide the output

```
#123FAB
```

## Building

To build this project by yourself you can do this. 

### Prerequisites

To build this project by your own you need the following:

* Cabal build system
* Haskell compiler

### Build

First build the program

```
$ cabal install
```

Then replace the executable in build/color with the one in dist/build/color/color

```
$ cp dist/build/color/color build/color
```

Then install it with 

```
$ cd build && ./installer.py --install
```
