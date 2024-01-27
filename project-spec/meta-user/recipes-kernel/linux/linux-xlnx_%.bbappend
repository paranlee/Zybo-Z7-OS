FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bsp.cfg"
SRC_URI += "file://devtool-fragment.cfg \
            file://user_2024-01-27-14-09-00.cfg \
            "
SRC_URI += "file://user_2021-09-16-08-08-00.cfg \
            file://user_2024-01-11-17-52-00.cfg \
            file://user_2024-01-11-17-56-00.cfg \
           "

KERNEL_FEATURES:append = " bsp.cfg"
