# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 toolchain-funcs

DESCRIPTION="program for making large letters out of ordinary text"
HOMEPAGE="http://www.figlet.org/"
SRC_URI="ftp://ftp.figlet.org/pub/figlet/program/unix/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~mips ppc ppc64 ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"
IUSE="static"

PATCHES=( "${FILESDIR}"/${P}-musl.patch )

src_compile() {
	emake clean
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} $(usex static -static '')" \
		LD="$(tc-getCC)" \
		LDFLAGS="${LDFLAGS} $(usex static -static '')" \
		prefix="${EPREFIX}/usr" \
		all
}

src_install() {
	emake \
		BINDIR="${EPREFIX}/usr/bin" \
		DESTDIR="${D}" \
		MANDIR="${EPREFIX}/usr/share/man" \
		prefix="${EPREFIX}/usr" \
		install

	doman chkfont.6 figlet.6 figlist.6 showfigfonts.6
	dodoc README figfont.txt

	newbashcomp "${FILESDIR}"/figlet.bashcomp-r1 figlet
}
