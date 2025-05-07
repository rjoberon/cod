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

| version                | 2.5                              | 2.6                              |
|------------------------+----------------------------------+----------------------------------|
| file name              | lsic25.exe                       | lsic.exe                         |
| file size              | 126976 bytes                     | 601088 bytes                     |
| file date              | 1996-04-11                       | 1996-10-17                       |
| file MD5 hash          | 3f6d7e0c8260e51f61b3fdf85efd8931 | 1a4ed8edeb6bbd66ff3bad6c0a3e0276 |
| supported file formats | .bmp, .cod, .tga                 | .bmp, .cod, .tga, .gif, .jpg     |

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

### LSIC 3.0

According to the [patent WO1998040842A1 "System and method for image
compression and
decompression"](https://patents.google.com/patent/WO1998040842A1),
there existed a "Lightning Strike™ Image Compressor (LSIC) version
3.0".

## Web Browser Plugin

|  version |          | file name     |   file size | date                  | file MD5 hash                    |
| -------: | -------: | :------------ | ----------: | :-------------------- | :------------------------------- |
|      1.7 | 16 bit   | NPCOD16.DLL   |      125312 | 1996-04-23 (DLL)      | 7c7c5df1f7ea6c95acb7118d1e995093 |
|      1.7 | 32 bit   | NPCOD32.DLL   |      179712 | 1996-04-23 (DLL)      | 2d4f3656979c2cc27145f25b379c7bec |
|    2.6.0 | 32 bit   | NPLS32.DLL    |      237056 | 1997-02-14 (README)   | bd3c81d8185588b9ca76af8b196897df |
|    3.1.3 | 32 bit   | NpLS32.dll    |      280064 | 1997-09-29 (DLL)      | d9c1b69f2a5081350c66bc23b696b582 |

## Lightning Strike Video Codec 3.5

| file name   |   file size |   README date | file MD5 hash                    |
| :---------- | ----------: | ------------: | :------------------------------- |
| lsvc30.dll  |       83968 |    1998-04-23 | 7162a06af5c258caccb2ee1e9bde6441 |
| lsvc.dll    |      123392 |    1998-05-12 | ebe72859ffd2da2d280d9f08b73a302f |
| lsvd30.dll  |       91648 |    1998-04-23 | 3746ceafe7ec518a96421ca4515ddbbb |

## Lightning Strike Video Messenger 2.4

## Other DLLs

| file name     |   file size | file date    | file MD5 hash                    | source           |
| :------------ | ----------: | :----------- | :------------------------------- | :--------------- |
| lsd26dll.dll  |       69632 | 1996-08-07   | fb3fc544f1a0b94fc286f1eb43bd1bbd | D-Sat 1 CD-ROM   |
| lsvxdec.dll   |      204800 |              | e93ad6b252aaa2631dbc1bd7abca00f9 |                  |

# Use

- [D-Sat](https://de.wikipedia.org/wiki/D-Sat), at least version 1
- possibly [Dark Reign](https://en.wikipedia.org/wiki/Dark_Reign:_The_Future_of_War)

# References

# Further reading

# External links

- <http://justsolve.archiveteam.org/wiki/Lightning_Strike>
