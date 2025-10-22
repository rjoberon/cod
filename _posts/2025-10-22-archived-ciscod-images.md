---
title: Archived CIS/COD Images
description: Which images were archived by the Internet Archive?
---

The [Internet Archive](https://archive.org/) is a crucial tool for my
research. Without it, understanding the [companies, locations, dates,
and people related to the CIS/COD image
format](/2025/07/02/companies-locations-dates-and-people.html) would
have been close to impossible. It also archived [much of the software
to handle the images](/documentation.html#software) that was available
online in the 1990s.

Thanks to my former colleague [Helge
Holzmann](https://www.helgeholzmann.de/), who works at the Internet
Archive, we are now able to analyse the CIS/COD images that have been
archived by the Internet Archive. Helge extracted [a list of 1552 URLs
that hosted files with the MIME type
"image/cis-cod"](/data/GWB-20240822201647_image-cis-cod.cdx) from the
Internet Archive's collection.

This list is based on the MIME type which the HTTP servers delivered
in their HTTP response's "Content-Type" field during crawling. So I
was curious as to how many of those files are actually CIS/COD images.
The first step in finding that out is to [download these
files](/src/get_files_from_ia.sh) and this worked for 1230 of the 1552
listed files.

The script actually does a bit more, by already checking the first
three bytes of each file for the magic marker "CIS":

```shell
three=$(head -c3 "${tmpfname}")
if [ "${three}" = "CIS" ]; then
    mimetype="image_cis-cod"
fi
```
It then assigns the MIME type "image/cis-cod" to those files and for
all other files uses `file --brief --mime-type` to determine the MIME
type. The result is as follows:

| MIME type                        | URLs |
| -------------------------------- | ---: |
| application/java-archive         |   37 |
| application/msword               |    7 |
| application/octet-stream         |  180 |
| application/vnd.wordperfect      |    1 |
| application/x-adobe-aco          |    1 |
| application/x-msaccess           |   53 |
| application/x-ms-dat             |    2 |
| application/x-sega-pico-rom      |    1 |
| application/x-wine-extension-ini |    1 |
| image/cis-cod                    |  221 |
| image/svg+xml                    |    1 |
| message/rfc822                   |    4 |
| text/html                        |    8 |
| text/plain                       |  712 |
| text/x-tcl                       |    1 |
| -------------------------------- | ---- |
|                                  | 1230 |

So only 221 of the 1552 candidate files could be downloaded and are
actually (or at least very likely) CIS/COD images.

In which version of the file format have the images been stored?
Looking at their first six bytes reveals that:

```shell
for f in image_cis-cod/*cod; do
    echo $(head --bytes=6 --quiet $f)
done | sort | uniq -c
```

| version | files |
| ------- | ----: |
| CIS2.3  |    13 |
| CIS2.4  |    19 |
| CIS2.5  |   147 |
| CIS3.0  |    42 |
| ------- | ----- |
|         |   221 |

So these are mainly files in CIS/COD version 2.5. With a [magic file
for the `file` command](/resources/magic) we can also extract the
heights and widths of the images and plot them:

![Widths and heights of CIS/COD images](/img/ia_cod_sizes.png)

So most images are smaller than 800x600 pixels and there is one large
image 2000x1400 pixels in size.

Let us have a look at the hosts that hosted the images

| host name (reverse notation) | images |
| ---------------------------- | -----: |
| com.atyour                   |      1 |
| com.british-waterways        |     75 |
| com.compsci                  |     35 |
| com.highpeaknet              |     31 |
| com.infinop                  |     10 |
| com.infinop.euclid           |      3 |
| com.intermodalex.testbox25   |      1 |
| com.tyenet.w3                |      8 |
| com.u-net                    |     31 |
| de.uni-hannover.stud         |      2 |
| il.co.save-net.ingw          |      1 |
| jp.or.cute                   |      4 |
| net.intrepid                 |      1 |
| nl.uva.uba.info              |      1 |
| uk.co.demon.rosebank         |      6 |
| uk.co.demon.sweir.mandle     |      1 |
| uk.co.demon.sweir.simp       |      1 |
| uk.co.demon.sweir.suddy      |      1 |
| uk.co.demon.thecdp           |      8 |

Apart from three hosts [related to companies that developed the
CIS/COD image
format](/2025/07/02/companies-locations-dates-and-people.html)
(compsci.com, infinop.com, euclid.infinop.com) two British web pages
have hosted a larger amount of CIS/COD images: british-waterways.com
and highpeaknet.com.

Unfortunately, there is no tool (yet) for converting the images into a
useable image format. So I converted the 42 images in CIS/COD
version 3.0 manually with [LSIC 2.6](/documentation.html#software) and
created the following collage:

![A collage of 42 CIS/COD images found on the Web](/img/ia_cod30_collage.jpg)

These might be the only CIS/COD 3.0 images that are available on the
Web!
