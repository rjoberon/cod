# -*- mode: yaml -*-
# Lightning Strike image format → https://dsat.igada.de/2024/04/20/understanding-the-image-header.html
#
# This specification currently only applies to CIS/COD images in
# version 3.0 with lossy arithmetic encoding, bi-wavelet compression,
# table quantization, scb:sisd and YIQ RGB color space. Whether it
# applies to other configurations or whether other configurations ever
# existed is unknown, yet.
meta:
  id: cis
  title: Lightning Strike image format
  file-extension: cod
  endian: le
  xref:
    mime: image/cis-cod
    justsolve: Lightning_Strike
    wikidata: Q28206493
seq:
  - id: header
    type: ls_header
    # size: header.header_size # → gives error in Python code
  - id: data
    type: ls_data
    size: header.data_size
types:
  ls_header:
    seq:
      - id: magic
        contents: "CIS"
      - id: version
        size: 3
        type: str
        encoding: ASCII
        doc: |
          so far seen: "2.3", "2.4", "2.5" and "3.0" but the remainder
          of this spec only works for "3.0"
      - id: unknown1
        size: 2
      - id: header_size
        type: u2
      - id: data_size
        type: u4
        doc: equal to the sum of all values in level_code_size
      - id: comment_size
        size: 2
      - id: width
        type: u2
        doc: image width
      - id: height
        type: u2
        doc: image height
      - id: bpp
        type: u1
        doc: "bits per pixel (typically: 8 for gray and 24 for color)"
      - id: color_type
        type: u1
        enum: color_type
      - id: unknown2
        size: 2
      - id: encoder_type
        type: u1
        enum: encoder_type
      - id: compression_type
        type: u1
        enum: compression_type
      - id: quantizer_type
        type: u1
        enum: quantizer_type
      - id: scb
        type: u1
        enum: scb
      - id: color_space
        type: u1
        enum: color_space
      - id: wavelet_levels
        type: u1
      - id: level_code_size
        type: u4
        repeat: expr
        repeat-expr: wavelet_levels + 1
      - id: yiq_meta_y
        type: yiq_meta
        doc: metadata for luma (Y) information
      - id: yiq_meta_i
        type: yiq_meta
        doc: metadata for orange-blue contrast (I) information
        if: color_type == color_type::color
      - id: yiq_meta_q
        type: yiq_meta
        doc: metadata for purple-green contrast (Q) information
        if: color_type == color_type::color
  yiq_meta:
    seq:
      - id: zero_levels
        type: u1
      - id: sub_samples
        type: u1
  ls_data:
    seq:
      - id: planes
#        type: ls_plane
#        repeat: eos
        size-eos: true
        doc: first Y component, then I, then Q
#  ls_plane:
#    seq:
#      - id: plane
#        terminator: 0x63_6f_64
enums:
  color_type:
    0: gray
    1: color
  encoder_type:
    1: lossy_arithmetic
    2: lossless_arithmetic
  compression_type:
    1: bi_wavelet
  quantizer_type:
    1: table
  scb:
    1: sisd
  color_space:
    1:
      id: yiq_rgb
      doc: YIQ RGB
      doc-ref: https://en.wikipedia.org/wiki/YIQ
    2:
      id: yuv_rgb
      doc: YUV RGB
      doc-ref: https://en.wikipedia.org/wiki/Y%E2%80%B2UV
    3:
      id: ycbcr
      doc: YCbCr
      doc-ref: https://en.wikipedia.org/wiki/YCbCr
