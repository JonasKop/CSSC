# Color

Tool which converts RGB to HEX or HEX to RGB from its arguments. 

## Getting Started

### Prerequisites

* Python 3
* Unix system (For the installer to work), else you will need to install it manually.

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
