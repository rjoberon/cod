#!/bin/sh
# -*- coding: utf-8 -*-

#
# Download files
#
# Usage: get_files_from_ia.sh CDX OUTDIR
#
# Author: rja
#
# Changes:
# 2025-05-02 (rja)
# - initial version

if [ $# -lt 2 ]; then
    echo "usage: $0 CDX OUTDIR"
    exit
fi

cdxfile=$1
outdir=$2
tmpfname=get_files.tmp

logg() {
    url=$1
    msg=$2
    echo $(date --rfc-3339=seconds)"\t$url\t$msg"
}

# 100,200,23,163)/%a7%de%c3%c0%a4%a4%a4%df/88%a4%a4%a5%b4/frame.cod 20030118232729 http://163.23.200.100:80/%a7%de%c3%c0%a4%a4%a4%df/88%a4%a4%a5%b4/frame.cod image/cis-cod 200 RDOAPQQXR4GUCIMNXQ4VAX4L7W7GKSML - - 1068
# surt time url mimetype httpstatus hash - - size
while IFS=' ' read -r surt time url mimetype httpstatus hash u1 u2 size; do
    # build download url
    durl="http://web.archive.org/web/$time/$url"
    # final file name
    fname=$(echo $surt | sed -e "s/)\//,/" -e "s/\//_/g")
    if find "${outdir}" -name "${fname}" | grep -q '.' ; then
        logg "${url}" "already exists"
    else
      # download file
      wget --quiet --output-document="${tmpfname}" "${durl}"
      # check result
      if [ $? -ne 0 ]; then
          logg "${url}" "download failed"
      else
          if [ ! -s "${tmpfname}" ]; then
              logg "${url}" "file empty"
          else
              # download successful, file not empty
              mimetype=$(file --brief --mime-type ${tmpfname} | sed -e "s/\//_/g")
              # check for CIS
              if [ "${mimetype}" = "application_octet-stream" ]; then
                  three=$(head -c3 "${tmpfname}")
                  if [ "${three}" = "CIS" ]; then
                      mimetype="image_cis-cod"
                  fi
              fi
              # create directory for mime type
              if [ ! -d "${mimetype}" ]; then
                  mkdir -p "${outdir}/${mimetype}"
              fi
              # final file path
              fpath="${outdir}/${mimetype}/${fname}"
              # move file
              mv "${tmpfname}" "${fpath}"
              logg "${url}" "${fpath}"
          fi
      fi
      sleep 10s
    fi
done < $cdxfile
