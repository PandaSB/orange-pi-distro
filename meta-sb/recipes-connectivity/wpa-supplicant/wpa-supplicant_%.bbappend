FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://wpa_supplicant.conf \
"

SYSTEMD_SERVICE_${PN} = "wpa_supplicant@.service"

do_install_append() {
  install -d ${D}${sysconfdir}/wpa_supplicant
  install -m 0600 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf
  install -m 0600 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant.conf


  install -d ${D}${sysconfdir}/systemd/system/multi-user.target.wants
  ln -sf ${systemd_unitdir}/system/wpa_supplicant@.service \
    ${D}${sysconfdir}/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service

  rm -f ${D}${sysconfdir}/wpa_supplicant.conf
  rm -f ${D}${systemd_unitdir}/system/wpa_supplicant.service
  rm -f ${D}${systemd_unitdir}/system/wpa_supplicant-nl80211@.service
  rm -f ${D}${systemd_unitdir}/system/wpa_supplicant-wired@.service
}
