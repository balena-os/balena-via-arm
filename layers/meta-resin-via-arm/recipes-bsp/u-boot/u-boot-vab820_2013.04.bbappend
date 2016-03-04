FILESEXTRAPATHS_append_vab820-quad := ":${THISDIR}/files"

SRC_URI_append_vab820-quad = " \
    file://add_env_is_nowhere.patch \
    file://change_bootcmd.patch \
    file://0001-uboot-support-gcc5.patch \
    file://0002-use-gcc-inline-version.patch \
    file://gcc5_no-unalligned-access.patch \
    "
