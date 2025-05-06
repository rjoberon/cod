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

| version | file name  | file size    |  file date | file  formats                |
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

# Use

- [D-Sat](https://de.wikipedia.org/wiki/D-Sat), at least version 1
- possibly [Dark Reign](https://en.wikipedia.org/wiki/Dark_Reign:_The_Future_of_War)

# References

# Further reading

# External links

- <http://justsolve.archiveteam.org/wiki/Lightning_Strike>
