---
title: Documentation
layout: default
permalink: documentation.html
description: Documenting the CIS/COD raster image format.
---

This page will be regularly updated by incorporating information from the posts.

# Introduction

# History

# Versions

# File format

# Coding / compression

# Software

## Lightning Strike Image Compressor (LSIC)

| version | file name  | file size    |  file date | supported file formats       |
|---------+------------+--------------+------------+------------------------------|
|     2.5 | lsic25.exe | 126976 bytes | 1996-04-11 | .bmp, .cod, .tga             |
|     2.6 | lsic.exe   | 601088 bytes | 1996-10-17 | .bmp, .cod, .tga, .gif, .jpg |

### LSIC 2.5

- can resize image
- "master setup" allows fine-grained control over compression
  parameters:
  - number of A, B, and C levels
  - quantization vectors
  - total levels
  - threshold vector

### LSIC 2.6

- can sharpen image and apply some filters
- "master setup" allows fine-grained control over compression
  parameters:
  - levels to discard
  - levels to sample
  - quantization vectors
  - total levels
  - threshold vector

## Web Browser Plugin

|  version |          | file name     |   file size | date                  |
| -------: | -------: | :------------ | ----------: | :-------------------- |
|      1.7 | 16 bit   | NPCOD16.DLL   |      125312 | 1996-07-25 (README)   |
|      1.7 | 32 bit   | NPCOD32.DLL   |      179712 | 1996-07-25 (README)   |
|    2.6.0 | 32 bit   | NPLS32.DLL    |      237056 | 1997-02-14 (README)   |
|    3.1.3 | 32 bit   | NpLS32.dll    |      280064 | 1997-09-29 (DLL)      |

## Lightning Strike Video Codec 3.5

| file name   |   file size |   README date |
| :---------- | ----------: | ------------: |
| lsvc30.dll  |       83968 |    1998-04-23 |
| lsvc.dll    |      123392 |    1998-05-12 |
| lsvd30.dll  |       91648 |    1998-04-23 |

## Lightning Strike Video Messenger 2.4

## Other DLLs

| file name     |   file size | file date    | source           |
| :------------ | ----------: | :----------- | :--------------- |
| lsd26dll.dll  |       69632 | 1996-08-07   | D-Sat 1 CD-ROM   |
| lsvxdec.dll   |      204800 |              |                  |

# Use

- [D-Sat](https://de.wikipedia.org/wiki/D-Sat), at least version 1
- possibly [Dark Reign](https://en.wikipedia.org/wiki/Dark_Reign:_The_Future_of_War)

# References

# Further reading

# External links

- <http://justsolve.archiveteam.org/wiki/Lightning_Strike>
