export SHELL := bash
export SHELLOPTS := errexit:nounset:pipefail

DESTDIR ?=

.DEFAULT_GOAL: all

install_files := \
    .bash_completion \
    .bash_completion.d/40-git.bash \
    .bash_completion.d/40-repo.bash \
    .bash_completion.d/40-todo.bash \
    .bash_completion.d/50-todo-intel.bash \
    .bash_completion.d/50-todo-kiwi.bash \
    .bash_profile \
    .bashrc \
    .config/awesome/rc.lua \
    .config/dmenu/environment.bash \
    .config/dmenu/list \
    .config/git/config \
    .config/git/excludes \
    .config/gnome-session/sessions/null.session \
    .config/openbox/rc.xml \
    .config/redshift/default.conf \
    .config/redshift/portland.conf \
    .config/redshift/taipei.conf \
    .config/systemd/user/default.target \
    .config/systemd/user/fehbg.service \
    .config/systemd/user/gnome-openbox.target \
    .config/systemd/user/gnome-session.service \
    .config/systemd/user/gnome.target \
    .config/systemd/user/gtk-redshift.service \
    .config/systemd/user/nm-applet.service \
    .config/systemd/user/notification-daemon.service \
    .config/systemd/user/openbox.service \
    .config/systemd/user/openbox.target \
    .config/systemd/user/openbox.target.wants/openbox.service \
    .config/systemd/user/openbox.target.wants/panel.service \
    .config/systemd/user/panel.service \
    .config/systemd/user/tint2.service \
    .config/systemd/user/wm.target \
    .config/systemd/user/xcompmgr.service \
    .config/systemd/user/xorg.target \
    .config/systemd/user/xorg.target.wants/fehbg.service \
    .config/systemd/user/xorg.target.wants/gtk-redshift.service \
    .config/systemd/user/xorg.target.wants/notification-daemon.service \
    .config/systemd/user/xorg.target.wants/xcompmgr.service \
    .config/systemd/user/xorg.target.wants/xscreensaver.service \
    .config/systemd/user/xscreensaver.service \
    .config/tint2/dark-grey.tint2rc \
    .config/tint2/soft-translucent.tint2rc \
    .config/tint2/tint2rc \
    .ctags \
    .gvimrc \
    .hgignore \
    .hgrc \
    .inputrc \
    .mailcap \
    .profile.d/10-colors.sh \
    .profile.d/10-profile-functions.sh \
    .profile.d/20-macports.sh \
    .profile.d/40-android-sdk.sh \
    .profile.d/40-ccache.sh \
    .profile.d/40-cdargs.sh \
    .profile.d/40-depot_tools.sh \
    .profile.d/40-eclipse.sh \
    .profile.d/40-editor.sh \
    .profile.d/40-go.sh \
    .profile.d/40-gpg.sh \
    .profile.d/40-home-git.sh \
    .profile.d/40-intellij.sh \
    .profile.d/40-java.sh \
    .profile.d/40-less.sh \
    .profile.d/40-ls.sh \
    .profile.d/40-notmuch.sh \
    .profile.d/40-pager.sh \
    .profile.d/40-scala.sh \
    .profile.d/40-ssh.sh \
    .profile.d/40-taro.sh \
    .profile.d/90-home-bin.sh \
    .rpmmacros \
    .tmux.conf \
    .vim/after/ftplugin/c.vim \
    .vim/after/ftplugin/xml.vim \
    .vim/after/syntax/muttrc.vim \
    .vim/autoload/pathogen.vim \
    .vim/bundle/align/autoload/Align.vim \
    .vim/bundle/align/autoload/AlignMaps.vim \
    .vim/bundle/align/doc/Align.txt \
    .vim/bundle/align/doc/tags \
    .vim/bundle/align/plugin/AlignMapsPlugin.vim \
    .vim/bundle/align/plugin/AlignPlugin.vim \
    .vim/bundle/align/plugin/cecutil.vim \
    .vim/bundle/alternate/README.md \
    .vim/bundle/alternate/doc/alternate.txt \
    .vim/bundle/alternate/plugin/a.vim \
    .vim/bundle/ctrlp/.gitignore \
    .vim/bundle/ctrlp/autoload/ctrlp.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/bookmarkdir.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/buffertag.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/changes.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/dir.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/line.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/mixed.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/mrufiles.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/quickfix.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/rtscript.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/tag.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/undo.vim \
    .vim/bundle/ctrlp/autoload/ctrlp/utils.vim \
    .vim/bundle/ctrlp/doc/ctrlp.txt \
    .vim/bundle/ctrlp/plugin/ctrlp.vim \
    .vim/bundle/ctrlp/readme.md \
    .vim/bundle/dispatch/.gitignore \
    .vim/bundle/dispatch/CONTRIBUTING.markdown \
    .vim/bundle/dispatch/README.markdown \
    .vim/bundle/dispatch/autoload/dispatch.vim \
    .vim/bundle/dispatch/autoload/dispatch/headless.vim \
    .vim/bundle/dispatch/autoload/dispatch/iterm.vim \
    .vim/bundle/dispatch/autoload/dispatch/screen.vim \
    .vim/bundle/dispatch/autoload/dispatch/tmux.vim \
    .vim/bundle/dispatch/autoload/dispatch/windows.vim \
    .vim/bundle/dispatch/autoload/dispatch/x11.vim \
    .vim/bundle/dispatch/doc/dispatch.txt \
    .vim/bundle/dispatch/plugin/dispatch.vim \
    .vim/bundle/fugitive/.gitignore \
    .vim/bundle/fugitive/CONTRIBUTING.markdown \
    .vim/bundle/fugitive/README.markdown \
    .vim/bundle/fugitive/doc/fugitive.txt \
    .vim/bundle/fugitive/plugin/fugitive.vim \
    .vim/bundle/git/.gitignore \
    .vim/bundle/git/doc/ft-gitcommit-plugin.txt \
    .vim/bundle/git/ftdetect/git.vim \
    .vim/bundle/git/ftplugin/git.vim \
    .vim/bundle/git/ftplugin/gitcommit.vim \
    .vim/bundle/git/ftplugin/gitconfig.vim \
    .vim/bundle/git/ftplugin/gitrebase.vim \
    .vim/bundle/git/ftplugin/gitsendemail.vim \
    .vim/bundle/git/indent/gitconfig.vim \
    .vim/bundle/git/syntax/git.vim \
    .vim/bundle/git/syntax/gitcommit.vim \
    .vim/bundle/git/syntax/gitconfig.vim \
    .vim/bundle/git/syntax/gitrebase.vim \
    .vim/bundle/git/syntax/gitsendemail.vim \
    .vim/bundle/glsl/LICENSE \
    .vim/bundle/glsl/README.md \
    .vim/bundle/glsl/ftdetect/glsl.vim \
    .vim/bundle/glsl/indent/glsl.vim \
    .vim/bundle/glsl/syntax/glsl.vim \
    .vim/bundle/pathogen/CONTRIBUTING.markdown \
    .vim/bundle/pathogen/README.markdown \
    .vim/bundle/pathogen/autoload/pathogen.vim \
    .vim/bundle/tagbar/.gitattributes \
    .vim/bundle/tagbar/.gitignore \
    .vim/bundle/tagbar/.info \
    .vim/bundle/tagbar/README.md \
    .vim/bundle/tagbar/autoload/tagbar.vim \
    .vim/bundle/tagbar/doc/tagbar.txt \
    .vim/bundle/tagbar/plugin/tagbar.vim \
    .vim/bundle/tagbar/syntax/tagbar.vim \
    .vim/colors/default_explicit.vim \
    .vim/colors/kiwi_dark.vim \
    .vim/colors/kiwi_tango.vim \
    .vim/colors/tango.vim \
    .vim/colors/tools/tango-color-map.text \
    .vim/colors/tools/tr_template.py \
    .vim/plugin/projects/mesa.vim \
    .vim/plugin/projects/notmuch.vim \
    .vim/plugin/projects/piglit.vim \
    .vim/vimrc \
    bin/battery \
    bin/btrfs-snapshot-home \
    bin/btrfs-snapshot-rootfs \
    bin/dmenu-run \
    bin/ebuild-git-commit-patches \
    bin/ebuild-rm-patches \
    bin/git-archive-ref \
    bin/git-branch-delete-regex \
    bin/git-home \
    bin/git-remote-bzr \
    bin/git-remote-hg \
    bin/git-show-hash \
    bin/git-subtree \
    bin/gnome-shell-restart \
    bin/gvimclient \
    bin/kw-calibre-open-technical-library \
    bin/kw-eclipse-linux-gfx \
    bin/kw-find-rcs \
    bin/kw-find-src \
    bin/kw-preup-rm-snapshots \
    bin/kw-preup-snapshot \
    bin/kw-whitespace-eof-nl \
    bin/kw-whitespace-trim \
    bin/mail-sync \
    bin/mbox-mv-to-maildir \
    bin/mutt-view-patch \
    bin/mvimclient \
    bin/notmuch-cleanup-db \
    bin/notmuch-list-all-tags \
    bin/notmuch-rm-duplicates \
    bin/notmuch-rm-trash \
    bin/notmuch-save-patches \
    bin/notmuch-sort-archive \
    bin/notmuch-tag-lists \
    bin/pwclient \
    bin/repo \
    bin/running-x \
    bin/term-256color-test \
    bin/tmux-open-home \
    bin/vimclient \
    lib/bash/kiwi/gpg.bash \
    lib/bash/kiwi/log.bash \
    lib/bash/kiwi/ssh.bash \
    opt/battery/LICENSE \
    opt/battery/README.md \
    opt/battery/bin/battery \
    $@

.PHONY: all
all:

.PHONY: install
install:
	install -d "$(DESTDIR)$(HOME)"
	for x in $(install_files); do \
	    install -d "$(DESTDIR)$(HOME)/$$(dirname $$x)"; \
	    cp -av "$$x" "$(DESTDIR)$(HOME)/$$x"; \
	done

# Target pull is the inverse of install. It pull installed files from $HOME
# into the git directory so that changes can be committed.
.PHONY: pull
pull:
	@if ! git diff --no-ext-diff --quiet --exit-code; then \
	    echo "error: git tree is dirty"; \
	    exit 1; \
	fi; \
	for x in $(install_files); do \
	    cp -av "$(DESTDIR)$(HOME)/$${x}" "$${x}"; \
	done

