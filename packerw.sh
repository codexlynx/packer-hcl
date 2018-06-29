#!/usr/bin/env bash

#
# Packer wrapper with HCL support.
# @codexlynx - 06/2018
#

# alias packer='packerw.sh'
PACKER_PATH="/usr/local/bin/packer"

set -e

function call_packer {
    ARGVS=$@
    ${PACKER_PATH} $(echo ${ARGVS} | sed -e "s|\.hcl|\.json|g")
}

for argv in ${@}; do
    if [[ ${argv} == *.hcl ]]; then
        FILE=${argv}
        JSON=$(echo ${FILE} | sed -e "s|\.hcl|\.json|g")
        hcltool ${FILE} ${JSON}
        call_packer ${@}
        rm ${JSON}
        exit $?
    fi
done

call_packer ${@}