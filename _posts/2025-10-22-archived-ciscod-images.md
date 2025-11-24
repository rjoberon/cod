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
for the `file` command](/resources/cis-cod.magic) we can also extract the
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

<img usemap="#out" src="/img/ia_cod30_collage.jpg" style="border: 0;" alt="A collage of 42 CIS/COD images found on the Web" />
<map id="out" name="out">
  <area href="http://web.archive.org/web/19970406052226/http://atyour.com:80/cc/light/latcxr.cod" shape="rect" coords="0,0,103,103" alt="" />
  <area href="http://web.archive.org/web/19971108045615/http://www.infinop.com:80/fhtml/boy.cod" shape="rect" coords="104,0,207,103" alt="" />
  <area href="http://web.archive.org/web/19980612221709/http://www.infinop.com:80/fhtml/ct.cod" shape="rect" coords="208,0,311,103" alt="" />
  <area href="http://web.archive.org/web/19980612221813/http://www.infinop.com:80/fhtml/d2.cod" shape="rect" coords="312,0,415,103" alt="" />
  <area href="http://web.archive.org/web/19971108045657/http://www.infinop.com:80/fhtml/eagle.cod" shape="rect" coords="416,0,519,103" alt="" />
  <area href="http://web.archive.org/web/19980612221834/http://www.infinop.com:80/fhtml/etot.cod" shape="rect" coords="520,0,623,103" alt="" />
  <area href="http://web.archive.org/web/19971108045739/http://www.infinop.com:80/fhtml/fox.cod" shape="rect" coords="624,0,727,103" alt="" />
  <area href="http://web.archive.org/web/19971108045636/http://www.infinop.com:80/fhtml/hands.cod" shape="rect" coords="0,104,103,207" alt="" />
  <area href="http://web.archive.org/web/19980612221731/http://www.infinop.com:80/fhtml/plane.cod" shape="rect" coords="104,104,207,207" alt="" />
  <area href="http://web.archive.org/web/19980612221752/http://www.infinop.com:80/fhtml/segy.cod" shape="rect" coords="208,104,311,207" alt="" />
  <area href="http://web.archive.org/web/19971108045718/http://www.infinop.com:80/fhtml/wolf.cod" shape="rect" coords="312,104,415,207" alt="" />
  <area href="http://web.archive.org/web/19980623112944/http://www.intermodalex.com:80/testbox25.cod" shape="rect" coords="416,104,519,207" alt="" />
  <area href="http://web.archive.org/web/20030226011635/http://w3.tyenet.com:80/mbabcock/images/canyon.cod" shape="rect" coords="520,104,623,207" alt="" />
  <area href="http://web.archive.org/web/20021226002933/http://w3.tyenet.com:80/mbabcock/images/gradpic.cod" shape="rect" coords="624,104,727,207" alt="" />
  <area href="http://web.archive.org/web/20021226005016/http://w3.tyenet.com:80/mbabcock/images/mebig.cod" shape="rect" coords="0,208,103,311" alt="" />
  <area href="http://web.archive.org/web/20021226003635/http://w3.tyenet.com:80/mbabcock/images/me.cod" shape="rect" coords="104,208,207,311" alt="" />
  <area href="http://web.archive.org/web/20021221074015/http://w3.tyenet.com:80/mbabcock/images/mikebanner.cod" shape="rect" coords="208,208,311,311" alt="" />
  <area href="http://web.archive.org/web/20021225233701/http://w3.tyenet.com:80/mbabcock/images/myHEATchar.cod" shape="rect" coords="312,208,415,311" alt="" />
  <area href="http://web.archive.org/web/20030226013524/http://w3.tyenet.com:80/mbabcock/images/soulbait.cod" shape="rect" coords="416,208,519,311" alt="" />
  <area href="http://web.archive.org/web/20021221074434/http://w3.tyenet.com:80/mbabcock/images/world.cod" shape="rect" coords="520,208,623,311" alt="" />
  <area href="http://web.archive.org/web/19970817134557/http://www.stud.uni-hannover.de:80/~hemmerli/aegi3.cod" shape="rect" coords="624,208,727,311" alt="" />
  <area href="http://web.archive.org/web/19970818002356/http://www.stud.uni-hannover.de:80/user/77440/aegi3.cod" shape="rect" coords="0,312,103,415" alt="" />
  <area href="http://web.archive.org/web/19970612165625/http://www.cute.or.jp:80/~makuchan/images/rura/congrat.cod" shape="rect" coords="104,312,207,415" alt="" />
  <area href="http://web.archive.org/web/19971110193242/http://www.cute.or.jp:80/~makuchan/images/rura/lkl.cod" shape="rect" coords="208,312,311,415" alt="" />
  <area href="http://web.archive.org/web/19971110193432/http://www.cute.or.jp:80/~makuchan/images/rura/seago.cod" shape="rect" coords="312,312,415,415" alt="" />
  <area href="http://web.archive.org/web/19980527024752/http://www.cute.or.jp:80/~makuchan/maku/svmulc_lf.cod" shape="rect" coords="416,312,519,415" alt="" />
  <area href="http://web.archive.org/web/20000819134056/http://www.intrepid.net:80/~hollyoak/winter.cod" shape="rect" coords="520,312,623,415" alt="" />
  <area href="http://web.archive.org/web/19971111235412/http://info.uba.uva.nl:80/nl/collecties/rosenthaliana/menasseh/gif/exodus2000.cod" shape="rect" coords="624,312,727,415" alt="" />
  <area href="http://web.archive.org/web/19971120014803/http://www.rosebank.demon.co.uk:80/stone/fugazi/cod/fgzi_dor1.cod" shape="rect" coords="0,416,103,519" alt="" />
  <area href="http://web.archive.org/web/19971120014824/http://www.rosebank.demon.co.uk:80/stone/fugazi/cod/fgzi_ham2.cod" shape="rect" coords="104,416,207,519" alt="" />
  <area href="http://web.archive.org/web/19971120014845/http://www.rosebank.demon.co.uk:80/stone/fugazi/cod/fgzi_ham3.cod" shape="rect" coords="208,416,311,519" alt="" />
  <area href="http://web.archive.org/web/19971120014856/http://www.rosebank.demon.co.uk:80/stone/fugazi/cod/fgzi_ham4.cod" shape="rect" coords="312,416,415,519" alt="" />
  <area href="http://web.archive.org/web/19971120014910/http://www.rosebank.demon.co.uk:80/stone/fugazi/cod/fgzi_ham5.cod" shape="rect" coords="416,416,519,519" alt="" />
  <area href="http://web.archive.org/web/19971120014931/http://www.rosebank.demon.co.uk:80/stone/fugazi/cod/fgzi_ham7.cod" shape="rect" coords="520,416,623,519" alt="" />
  <area href="http://web.archive.org/web/19970410052732/http://www.thecdp.demon.co.uk:80/images/flamer.cod" shape="rect" coords="624,416,727,519" alt="" />
  <area href="http://web.archive.org/web/19970410052043/http://www.thecdp.demon.co.uk:80/images/frontfin.cod" shape="rect" coords="0,520,103,623" alt="" />
  <area href="http://web.archive.org/web/19970410052755/http://www.thecdp.demon.co.uk:80/images/log.cod" shape="rect" coords="104,520,207,623" alt="" />
  <area href="http://web.archive.org/web/19970410052206/http://www.thecdp.demon.co.uk:80/images/markgen.cod" shape="rect" coords="208,520,311,623" alt="" />
  <area href="http://web.archive.org/web/19970410052839/http://www.thecdp.demon.co.uk:80/images/pag3.cod" shape="rect" coords="312,520,415,623" alt="" />
  <area href="http://web.archive.org/web/19970410052927/http://www.thecdp.demon.co.uk:80/images/page4.cod" shape="rect" coords="416,520,519,623" alt="" />
  <area href="http://web.archive.org/web/19970410053050/http://www.thecdp.demon.co.uk:80/images/sweet.cod" shape="rect" coords="520,520,623,623" alt="" />
  <area href="http://web.archive.org/web/19970410052644/http://www.thecdp.demon.co.uk:80/images/trev.cod" shape="rect" coords="624,520,727,623" alt="" />
</map>

These might be the only CIS/COD 3.0 images that are available on the
Web!
