################################################################################
#
# $DIR
#
################################################################################

# Mandatory
${DIR_UP}_VERSION = undefined$CURSOR
${DIR_UP}_SOURCE = ${DIR}-\$(${DIR_UP}_VERSION).tar.gz
${DIR_UP}_SITE =
${DIR_UP}_DEPENDENCIES =
${DIR_UP}_LICENSE =
${DIR_UP}_LICENSE_FILES =
${DIR_UP}_REDISTRIBUTE = YES
${DIR_UP}_INSTALL_STAGING = NO

# Usefull variables for build
${DIR_UP}_CONFIGURE_CMDS =
${DIR_UP}_BUILD_CMDS =
${DIR_UP}_INSTALL_CMDS =
${DIR_UP}_INSTALL_STAGING_CMDS =
${DIR_UP}_INSTALL_TARGET_CMDS =
${DIR_UP}_INSTALL_INIT_SYSTEMD =
${DIR_UP}_INSTALL_INIT_SYSV =

# Specific variables for autotools projects
${DIR_UP}_AUTORECONF = NO
${DIR_UP}_AUTORECONF_OPT =
${DIR_UP}_CONF_ENV =
${DIR_UP}_CONF_OPT =
${DIR_UP}_MAKE_ENV =
${DIR_UP}_MAKE_OPT =
${DIR_UP}_AUTORECONF_OPT =
${DIR_UP}_INSTALL_OPT = install
${DIR_UP}_INSTALL_STAGING_OPT = DESTDIR=\$(STAGING_DIR) install
${DIR_UP}_INSTALL_TARGET_OPT = DESTDIR=\$(TARGET_DIR) install

# s/autotools/generic/ if needed
\$(eval \$(autotools-package))
\$(eval \$(host-autotools-package))
