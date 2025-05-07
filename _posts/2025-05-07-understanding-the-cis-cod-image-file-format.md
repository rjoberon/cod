---
title: Understanding the CIS/COD image file format
image: /img/dsat1_dekodiert_1.png
description: An overview on the goals of this page and existing resources.
---

In an attempt to [reverse-engineer the file format of D-Sat
1](https://dsat.igada.de/) I discovered that [the satellite images are
stored using the Lightning Strike image
format](https://dsat.igada.de/2024/04/03/learning-about-the-image-format.html),
also called CIS/COD. There exists little information about that format
and no current software to open and view the files. The goal of this
web site is to collect as much information as possible about the file
format and associated resources to ultimately enable an implementation
of an open source image viewer for CIS/COD files.

## About the Name

The [ArchiveTeam
wiki](http://justsolve.archiveteam.org/wiki/Lightning_Strike) calls
the image format "Lightning Strike" and states the MIME type to be
"image/cis-cod". The three letters "CIS" are the first three bytes of
each image file (a [magic
number](https://en.wikipedia.org/wiki/File_format#Magic_number)) and
at the moment it is not clear, what they stand for.  The files
typically have the file extension "cod" which very likely stands for
"coded" (image). For the purpose of this web site I have decided to
use the more technical term "CIS/COD" derived from the MIME type and
referring to two main indicators of the image files.

## Further Reading

At the moment the best overview is given by the [ArchiveTeam
wiki](http://justsolve.archiveteam.org/wiki/Lightning_Strike) and a
good starting point for further reading are the following blog posts:
- [Finding the
  tiles](https://dsat.igada.de/2024/04/02/finding-the-tiles.html)
  where we first discover that CIS/COD is used to
- [Learning about the image
  format](https://dsat.igada.de/2024/04/03/learning-about-the-image-format.html)
  which provides first results of some (mainly Internet Archive)
  research on finding resources describing the image format.
- [Viewing tiles with
  Firefox](https://dsat.igada.de/2024/04/19/viewing-tiles-with-firefox.html)
  is a practical guide on how to view (and convert) images with an old
  Windows version of Firefox.
- [Fragmenting the tile
  data](https://dsat.igada.de/2024/07/21/fragmenting-the-tile-data.html)
  where I tried to understand the arrangement of the data for the
  wavelet sub-bands.

On this site, the [documentation
page](https://cod.igada.de/documentation.html) currently mainly lists
information about the known software and DLLs and the [resources
page](https://cod.igada.de/resources.html) provides access to a [magic
file](https://www.darwinsys.com/file/) for the file command and a
[file format description](resources/cis.ksy) for [Kaitai
Struct](https://kaitai.io/).
