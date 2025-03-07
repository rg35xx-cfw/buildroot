################################################################################
#
# atftp
#
################################################################################

ATFTP_VERSION = 0.8.0
ATFTP_SITE = http://sourceforge.net/projects/atftp/files
ATFTP_LICENSE = GPL-2.0+
ATFTP_LICENSE_FILES = LICENSE
ATFTP_CPE_ID_VALID = YES
ATFTP_SELINUX_MODULES = tftp
# No configure in tarball
ATFTP_AUTORECONF = YES
ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
# For static we need to explicitly link against libpthread
ATFTP_LIBS = -lpthread
# -fgnu89-inline is needed to avoid multiple definition error with gcc 5. See
# https://gcc.gnu.org/gcc-5/porting_to.html.
ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)" \
	CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline"

# batocera : 0004-Fix-for-DoS-issue-CVE-2020-6097.patch
ATFTP_IGNORE_CVES += CVE-2020-6097

ifeq ($(BR2_PACKAGE_READLINE),y)
ATFTP_DEPENDENCIES += readline
ATFTP_CONF_OPTS += --enable-libreadline
# For static, readline links with ncurses
ATFTP_LIBS += -lncurses
else
ATFTP_CONF_OPTS += --disable-libreadline
endif

ifeq ($(BR2_PACKAGE_PCRE2),y)
ATFTP_DEPENDENCIES += pcre2
ATFTP_CONF_OPTS += --enable-libpcre
else
ATFTP_CONF_OPTS += --disable-libpcre
endif

$(eval $(autotools-package))
