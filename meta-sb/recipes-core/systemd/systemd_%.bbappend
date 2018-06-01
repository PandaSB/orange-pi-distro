FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://mjpg-streamer.service \
    file://mjpg-streamer.rules \
"

FILES_${PN} += " \
    ${sysconfdir}/systemd/system/mjpg-streamer.service \
    ${sysconfdir}/udev/rules.d/mjpg-streamer.rules \
"

do_install_append() {
        install -d ${D}${sysconfdir}/systemd/system/
        install -d ${D}${sysconfdir}/udev/rules.d/

	install -m 0755 ${WORKDIR}/mjpg-streamer.service ${D}${sysconfdir}/systemd/system
	install -m 0755 ${WORKDIR}/mjpg-streamer.rules   ${D}${sysconfdir}/udev/rules.d
}
