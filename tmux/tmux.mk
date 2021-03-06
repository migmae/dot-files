TMUX := $(shell command -v tmux 2>/dev/null)

ifdef TMUX
INSTALLERS += tmux
CLEANERS   += clean_tmux

TMUX_SRC         := $(DOTFILES)/tmux/tmux.conf
TMUX_CONFIG      := $(DST_DIR)/.tmux.conf
TMUX_PM_URL      := https://github.com/tmux-plugins/tpm
TMUX_PLUGINS_DIR := $(DST_DIR)/.tmux/plugins
TMUX_PM_DIR      := $(TMUX_PLUGINS_DIR)/tpm

.PHONY: tmux clean_tmux

tmux: banner_install_tmux $(TMUX_CONFIG) $(TMUX_PM_DIR)

$(TMUX_CONFIG):
	$(LINK) $(TMUX_SRC) $@

$(TMUX_PM_DIR): $(TMUX_PLUGINS_DIR)
	$(CLONE) $(TMUX_PM_URL) $@

$(TMUX_PLUGINS_DIR):
	$(MKDIR) $@

clean_tmux: banner_clean_tmux
	$(RM) $(TMUX_CONFIG)
	$(RM) $(TMUX_PM_DIR)

endif
