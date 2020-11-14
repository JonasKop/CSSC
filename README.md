# CSS Color

Alfred extension which converts between CSS RGB and HEX colors.

## Prerequisites

To use this extension at least Java 8 is required.

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

Download the latest [release](https://github.com/JonasKop/CSSC/releases/download/1.0.0/CSSC.alfredworkflow) and double click on it to install.

## Build

Building the extension is the easiest with Docker and bash.

```
./build.sh
```
