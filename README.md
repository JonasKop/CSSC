# CSS Color

Alfred extension which converts between CSS RGB and HEX colors.

## Usage

RGB to Hex

```
# Output: #ffffff
cssc rgb(255,255,255)
cssc 255 255 255

# Output: #ffffffff
cssc rgba(255,255,255,255)
cssc 255 255 255 255
```

Hex to RGB

```
# Output: rgb(255,255,255)
cssc ffffff
cssc #ffffff

# Output: rgba(255,255,255,255)
cssc ffffffff
cssc #ffffffff
```

## Installation

Download the latest [release](https://github.com/JonasKop/CSSC/releases/download/1.0.1/CSSC.alfredworkflow) and double click on it to install.

## Build

Building the extension requires that rustc and cargo is installed. Then it can be build with the `build.sh` script.  

```
./build.sh
```
