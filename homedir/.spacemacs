;; - * -mode:emacs - lisp lexical - binding : t - *-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
    ;; Base distribution to use. This is a layer contained in the directory
    ;; `+distribution'. For now available distributions are `spacemacs-base'
    ;; or `spacemacs'. (default 'spacemacs)
    dotspacemacs-distribution 'spacemacs

    ;; Lazy installation of layers (i.e. layers are installed only when a file
    ;; with a supported type is opened). Possible values are `all', `unused'
    ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
    ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
    ;; lazy install any layer that support lazy installation even the layers
    ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
    ;; installation feature and you have to explicitly list a layer in the
    ;; variable `dotspacemacs-configuration-layers' to install it.
    ;; (default 'unused)
    dotspacemacs-enable-lazy-installation 'unused

    ;; If non-nil then Spacemacs will ask for confirmation before installing
    ;; a layer lazily. (default t)
    dotspacemacs-ask-for-lazy-installation t

    ;; If non-nil layers with lazy install support are lazy installed.
    ;; List of additional paths where to look for configuration layers.
    ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
    dotspacemacs-configuration-layer-path '()

    ;; List of configuration layers to load.
    dotspacemacs-configuration-layers
    '(markdown
       html
       ;; ----------------------------------------------------------------
       ;; Example of useful layers you may want to use right away.
       ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
       ;; `M-m f e R' (Emacs style) to install them.
       ;; ----------------------------------------------------------------
       auto-completion
       ;; better-defaults
       bibtex
       ;; (cmake :variables
         ;; cmake-enable-cmake-ide-support t)
       ;; (c-c++ :variables c-c++-enable-clang-support t
         ;; c-c++-default-mode-for-headers 'c++-mode)
       git
       helm
       ;; ipython-notebook
       ;; javascript
       ;; (julia :variables julia-backend 'lsp)
       (latex :variables latex-enable-folding t
         latex-build-command "LatexMk"
         )
       ;; (markdown :variables markdown-live-preview-engine 'vmd)
       (multiple-cursors :variables multiple-cursors-backend 'evil-mc)
       org
       pdf
       python
       ;; (shell :variables
         ;; shell-default-height 30
         ;; shell-default-position 'bottom)
       ;; spacemacs-navigation
       ;; spell-checking
       ;; syntax-checking
       ;; theming
       themes-megapack
       ;; treemacs
       ;; version-control
       ;; yaml
       )

    ;; List of additional packages that will be installed without being
    ;; wrapped in a layer. If you need some configuration for these
    ;; packages, then consider creating a layer. You can also put the
    ;; configuration in `dotspacemacs/user-config'.
    ;; To use a local version of a package, use the `:location' property:
    ;; '(your-package :location "~/path/to/your-package/")
    ;; Also include the dependencies as they will not be resolved automatically.
    dotspacemacs-additional-packages '(
                                        ;; color-theme-sanityinc-tomorrow
                                        auctex-latexmk
                                        writeroom-mode
                                        (languagetool :variables
                                          langtool-java-classpath "/usr/share/languagetool:/usr/share/java/languagetool/*"
                                          langtool-language-tool-jar "/Applications/TeX/LanguageTool-3.6/languagetool-commandline.jar"
                                          langtool-language-tool-server-jar "/Applications/TeX/LanguageTool-3.6/languagetool-server.jar"
                                          langtool-server-user-arguments '("-p" "8082"))
                                        ;; elpy
                                        exec-path-from-shell
                                        helm-bibtex
                                        posframe
                                        ;; processing-mode
                                        ;; zotxt
                                        xwidget
                                        )

    ;; A list of packages that cannot be updated.
    dotspacemacs-frozen-packages '()

    ;; A list of packages that will not be installed and loaded.
    dotspacemacs-excluded-packages '()

    ;; Defines the behaviour of Spacemacs when installing packages.
    ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
    ;; `used-only' installs only explicitly used packages and deletes any unused
    ;; packages as well as their unused dependencies. `used-but-keep-unused'
    ;; installs only the used packages but won't delete unused ones. `all'
    ;; installs *all* packages supported by Spacemacs and never uninstalls them.
    ;; (default is `used-only')
    dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
    ;; If non-nil then enable support for the portable dumper. You'll need
    ;; to compile Emacs 27 from source following the instructions in file
    ;; EXPERIMENTAL.org at to root of the git repository.
    ;; (default nil)
    dotspacemacs-enable-emacs-pdumper nil

    ;; File path pointing to emacs 27.1 executable compiled with support
    ;; for the portable dumper (this is currently the branch pdumper).
    ;; (default "emacs-27.0.50")
    dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

    ;; Name of the Spacemacs dump file. This is the file will be created by the
    ;; portable dumper in the cache directory under dumps sub-directory.
    ;; To load it when starting Emacs add the parameter `--dump-file'
    ;; when invoking Emacs 27.1 executable on the command line, for instance:
    ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
    ;; (default spacemacs.pdmp)
    dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

    ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
    ;; possible. Set it to nil if you have no way to use HTTPS in your
    ;; environment, otherwise it is strongly recommended to let it set to t.
    ;; This variable has no effect if Emacs is launched with the parameter
    ;; `--insecure' which forces the value of this variable to nil.
    ;; (default t)
    dotspacemacs-elpa-https t

    ;; Maximum allowed time in seconds to contact an ELPA repository.
    ;; (default 5)
    dotspacemacs-elpa-timeout 5

    ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
    ;; This is an advanced option and should not be changed unless you suspect
    ;; performance issues due to garbage collection operations.
    ;; (default '(100000000 0.1))
    dotspacemacs-gc-cons '(100000000 0.1)

    ;; If non-nil then Spacelpa repository is the primary source to install
    ;; a locked version of packages. If nil then Spacemacs will install the
    ;; latest version of packages from MELPA. (default nil)
    dotspacemacs-use-spacelpa nil

    ;; If non-nil then verify the signature for downloaded Spacelpa archives.
    ;; (default nil)
    dotspacemacs-verify-spacelpa-archives nil

    ;; If non-nil then spacemacs will check for updates at startup
    ;; when the current branch is not `develop'. Note that checking for
    ;; new versions works via git commands, thus it calls GitHub services
    ;; whenever you start Emacs. (default nil)
    dotspacemacs-check-for-update t

    ;; If non-nil, a form that evaluates to a package directory. For example, to
    ;; use different package directories for different Emacs versions, set this
    ;; to `emacs-version'. (default 'emacs-version)
    dotspacemacs-elpa-subdirectory 'emacs-version

    ;; One of `vim', `emacs' or `hybrid'.
    ;; `hybrid' is like `vim' except that `insert state' is replaced by the
    ;; `hybrid state' with `emacs' key bindings. The value can also be a list
    ;; with `:variables' keyword (similar to layers). Check the editing styles
    ;; section of the documentation for details on available variables.
    ;; (default 'vim)
    dotspacemacs-editing-style 'vim

    ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
    dotspacemacs-verbose-loading nil

    ;; Specify the startup banner. Default value is `official', it displays
    ;; the official spacemacs logo. An integer value is the index of text
    ;; banner, `random' chooses a random text banner in `core/banners'
    ;; directory. A string value must be a path to an image format supported
    ;; by your Emacs build.
    ;; If the value is nil then no banner is displayed. (default 'official)
    dotspacemacs-startup-banner 'official

    ;; List of items to show in startup buffer or an association list of
    ;; the form `(list-type . list-size)`. If nil then it is disabled.
    ;; Possible values for list-type are:
    ;; `recents' `bookmarks' `projects' `agenda' `todos'.
    ;; List sizes may be nil, in which case
    ;; `spacemacs-buffer-startup-lists-length' takes effect.
    dotspacemacs-startup-lists '((agenda . 5)
                                  (recents . 5)
                                  (projects . 7))

    ;; True if the home buffer should respond to resize events. (default t)
    dotspacemacs-startup-buffer-responsive t

    ;; Default major mode of the scratch buffer (default `text-mode')
    dotspacemacs-scratch-mode 'text-mode

    ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
    ;; (default nil)
    dotspacemacs-initial-scratch-message nil

    ;; List of themes, the first of the list is loaded when spacemacs starts.
    ;; Press `SPC T n' to cycle to the next theme in the list (works great
    ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(sanityinc-tomorrow-eighties
                           spacemacs-dark
                           spacemacs-light)

    ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
    ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
    ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
    ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
    ;; refer to the DOCUMENTATION.org for more info on how to create your own
    ;; spaceline theme. Value can be a symbol or list with additional properties.
    ;; (default '(spacemacs :separator wave :separator-scale 1.5))
    dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

    ;; If non-nil the cursor color matches the state color in GUI Emacs.
    ;; (default t)
    dotspacemacs-colorize-cursor-according-to-state t

    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Hack Nerd Font"
                                 :size 14
                                 :weight normal
                                 :width normal)

    ;; The leader key (default "SPC")
    dotspacemacs-leader-key "SPC"

    ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
    ;; (default "SPC")
    dotspacemacs-emacs-command-key "SPC"

    ;; The key used for Vim Ex commands (default ":")
    dotspacemacs-ex-command-key ":"

    ;; The leader key accessible in `emacs state' and `insert state'
    ;; (default "M-m")
    dotspacemacs-emacs-leader-key "M-m"

    ;; Major mode leader key is a shortcut key which is the equivalent of
    ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
    dotspacemacs-major-mode-leader-key ","

    ;; Major mode leader key accessible in `emacs state' and `insert state'.
    ;; (default "C-M-m")
    dotspacemacs-major-mode-emacs-leader-key "C-M-m"

    ;; These variables control whether separate commands are bound in the GUI to
    ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
    ;; Setting it to a non-nil value, allows for separate commands under `C-i'
    ;; and TAB or `C-m' and `RET'.
    ;; In the terminal, these pairs are generally indistinguishable, so this only
    ;; works in the GUI. (default nil)
    dotspacemacs-distinguish-gui-tab nil

    ;; Name of the default layout (default "Default")
    dotspacemacs-default-layout-name "Default"

    ;; If non-nil the default layout name is displayed in the mode-line.
    ;; (default nil)
    dotspacemacs-display-default-layout nil

    ;; If non-nil then the last auto saved layouts are resumed automatically upon
    ;; start. (default nil)
    dotspacemacs-auto-resume-layouts nil

    ;; If non-nil, auto-generate layout name when creating new layouts. Only has
    ;; effect when using the "jump to layout by number" commands. (default nil)
    dotspacemacs-auto-generate-layout-names nil

    ;; Size (in MB) above which spacemacs will prompt to open the large file
    ;; literally to avoid performance issues. Opening a file literally means that
    ;; no major mode or minor modes are active. (default is 1)
    dotspacemacs-large-file-size 1

    ;; Location where to auto-save files. Possible values are `original' to
    ;; auto-save the file in-place, `cache' to auto-save the file to another
    ;; file stored in the cache directory and `nil' to disable auto-saving.
    ;; (default 'cache)
    dotspacemacs-auto-save-file-location 'cache

    ;; Maximum number of rollback slots to keep in the cache. (default 5)
    dotspacemacs-max-rollback-slots 5

    ;; If non-nil, the paste transient-state is enabled. While enabled, after you
    ;; paste something, pressing `C-j' and `C-k' several times cycles through the
    ;; elements in the `kill-ring'. (default nil)
    dotspacemacs-enable-paste-transient-state t

    ;; Which-key delay in seconds. The which-key buffer is the popup listing
    ;; the commands bound to the current keystroke sequence. (default 0.4)
    dotspacemacs-which-key-delay 0.4

    ;; Which-key frame position. Possible values are `right', `bottom' and
    ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
    ;; right; if there is insufficient space it displays it at the bottom.
    ;; (default 'bottom)
    dotspacemacs-which-key-position 'bottom

    ;; Control where `switch-to-buffer' displays the buffer. If nil,
    ;; `switch-to-buffer' displays the buffer in the current window even if
    ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
    ;; displays the buffer in a same-purpose window even if the buffer can be
    ;; displayed in the current window. (default nil)
    dotspacemacs-switch-to-buffer-prefers-purpose nil

    ;; If non-nil a progress bar is displayed when spacemacs is loading. This
    ;; may increase the boot time on some systems and emacs builds, set it to
    ;; nil to boost the loading time. (default t)
    dotspacemacs-loading-progress-bar t

    ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
    ;; (Emacs 24.4+ only)
    dotspacemacs-fullscreen-at-startup nil

    ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
    ;; Use to disable fullscreen animations in OSX. (default nil)
    dotspacemacs-fullscreen-use-non-native nil

    ;; If non-nil the frame is maximized when Emacs starts up.
    ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
    ;; (default nil) (Emacs 24.4+ only)
    dotspacemacs-maximized-at-startup t

    ;; A value from the range (0..100), in increasing opacity, which describes
    ;; the transparency level of a frame when it's active or selected.
    ;; Transparency can be toggled through `toggle-transparency'. (default 90)
    dotspacemacs-active-transparency 90

    ;; A value from the range (0..100), in increasing opacity, which describes
    ;; the transparency level of a frame when it's inactive or deselected.
    ;; Transparency can be toggled through `toggle-transparency'. (default 90)
    dotspacemacs-inactive-transparency 90

    ;; If non-nil show the titles of transient states. (default t)
    dotspacemacs-show-transient-state-title t

    ;; If non-nil show the color guide hint for transient state keys. (default t)
    dotspacemacs-show-transient-state-color-guide t

    ;; If non-nil unicode symbols are displayed in the mode line.
    ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
    ;; the value to quoted `display-graphic-p'. (default t)
    dotspacemacs-mode-line-unicode-symbols t

    ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
    ;; scrolling overrides the default behavior of Emacs which recenters point
    ;; when it reaches the top or bottom of the screen. (default t)
    dotspacemacs-smooth-scrolling t

    ;; Control line numbers activation.
    ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
    ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
    ;; This variable can also be set to a property list for finer control:
    ;; '(:relative nil
    ;;   :disabled-for-modes dired-mode
    ;;                       doc-view-mode
    ;;                       markdown-mode
    ;;                       org-mode
    ;;                       pdf-view-mode
    ;;                       text-mode
    ;;   :size-limit-kb 1000)
    ;; (default nil)
    dotspacemacs-line-numbers t

    ;; Code folding method. Possible values are `evil' and `origami'.
    ;; (default 'evil)
    dotspacemacs-folding-method 'origami

    ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
    ;; (default nil)
    dotspacemacs-smartparens-strict-mode nil

    ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
    ;; over any automatically added closing parenthesis, bracket, quote, etc…
    ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
    dotspacemacs-smart-closing-parenthesis nil

    ;; Select a scope to highlight delimiters. Possible values are `any',
    ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
    ;; emphasis the current one). (default 'all)
    dotspacemacs-highlight-delimiters 'all

    ;; If non-nil, start an Emacs server if one is not already running.
    ;; (default nil)
    dotspacemacs-enable-server t

    ;; Set the emacs server socket location.
    ;; If nil, uses whatever the Emacs default is, otherwise a directory path
    ;; like \"~/.emacs.d/server\". It has no effect if
    ;; `dotspacemacs-enable-server' is nil.
    ;; (default nil)
    dotspacemacs-server-socket-dir nil

    ;; If non-nil, advise quit functions to keep server open when quitting.
    ;; (default nil)
    dotspacemacs-persistent-server t

    ;; List of search tool executable names. Spacemacs uses the first installed
    ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
    ;; (default '("rg" "ag" "pt" "ack" "grep"))
    dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

    ;; Format specification for setting the frame title.
    ;; %a - the `abbreviated-file-name', or `buffer-name'
    ;; %t - `projectile-project-name'
    ;; %I - `invocation-name'
    ;; %S - `system-name'
    ;; %U - contents of $USER
    ;; %b - buffer name
    ;; %f - visited file name
    ;; %F - frame name
    ;; %s - process status
    ;; %p - percent of buffer above top of window, or Top, Bot or All
    ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
    ;; %m - mode name
    ;; %n - Narrow if appropriate
    ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
    ;; %Z - like %z, but including the end-of-line format
    ;; (default "%I@%S")
    dotspacemacs-frame-title-format "%I@%S"

    ;; Format specification for setting the icon title format
    ;; (default nil - same as frame-title-format)
    dotspacemacs-icon-title-format nil

    ;; Delete whitespace while saving buffer. Possible values are `all'
    ;; to aggressively delete empty line and long sequences of whitespace,
    ;; `trailing' to delete only the whitespace at end of lines, `changed' to
    ;; delete only whitespace for changed lines or `nil' to disable cleanup.
    ;; (default nil)
    dotspacemacs-whitespace-cleanup 'trailing

  ;; Either nil or a number of seconds. If non-nil zone out after the specified
  ;; number of seconds. (default nil)
  dotspacemacs-zone-out-when-idle nil

  ;; Run `spacemacs/prettify-org-buffer' when
  ;; visiting README.org files of Spacemacs.
  ;; (default nil)
  dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
)

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; (evil-leader/set-key
  ;;   “q Q” ‘spacemacs/frame-killer)

  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file)

  ;; Load PATH variables
  (use-package exec-path-from-shell
    :custom
    (shell-file-name "/usr/local/bin/zsh" "This is necessary because some Emacs install overwrite this variable")
    (exec-path-from-shell-variables '("PATH" "MANPATH" "PKG_CONFIG_PATH") "This adds PKG_CONFIG_PATH to the list of variables to grab. I prefer to set the list explicitly so I know exactly what is getting pulled in.")
    :init
    (if (string-equal system-type "darwin")
      (exec-path-from-shell-initialize)))

  (setenv "LANG" "en_US.UTF-8")

  ;; Enable mouse support
  (unless window-system
    (require 'mouse)
    (xterm-mouse-mode t)
    (global-set-key [mouse-4] (lambda ()
                                (interactive)
                                (scroll-down 1)))
    (global-set-key [mouse-5] (lambda ()
                                (interactive)
                                (scroll-up 1)))
    (defun track-mouse (e))
    (setq mouse-sel-mode t))

  ;; (spacemacs/declare-prefix-for-mode 'org-mode "o" "custom")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "p" 'org-latex-export-to-pdf)


  (setq org-startup-indented t
    org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
    org-ellipsis "  " ;; folding symbol
    org-pretty-entities t
    org-hide-emphasis-markers t
    ;; show actually italicized text instead of /italicized text/
    org-agenda-block-separator ""
    org-fontify-whole-heading-line t
    org-fontify-done-headline t
    org-fontify-quote-and-verse-blocks t)

  (setq org-babel-latex-htlatex "htlatex")
  (defmacro by-backend (&rest body)
    `(case (if (boundp 'backend) (org-export-backend-name backend) nil) ,@body))


  ;; (load-file "~/.emacs.d/plugins/emacs-grammarly/emacs-grammarly.el")
  (load-file "~/.emacs.d/plugins/academic-phrases/academic-phrases.el")
  (load-file "~/.emacs.d/plugins/calctex/calctex/calctex.el")

  ;; (require 'calc-sels)
  ;; ;; langtool
  ;; (setq langtool-language-tool-jar "/Applications/TeX/LanguageTool-3.6/languagetool-commandline.jar")
  ;; (setq langtool-language-tool-server-jar "/Applications/TeX/LanguageTool-3.6/languagetool-server.jar")
  ;; (setq langtool-server-user-arguments '("-p" "8082"))
  ;; (require 'langtool)
  ;; (global-set-key "\C-x4w" 'langtool-check)
  ;; (global-set-key "\C-x4W" 'langtool-check-done)
  ;; (global-set-key "\C-x4l" 'langtool-switch-default-language)
  ;; (global-set-key "\C-x44" 'langtool-show-message-at-point)
  ;; (global-set-key "\C-x4c" 'langtool-correct-buffer)


  ;; (setq-default 'preview-scale-function 1.2)
  ;; (setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))
  ;; (setq org-format-latex-options
  ;; (plist-put org-format-latex-options :html-scale 2.5))

  ;; AucTex
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (setq reftex-toc-split-windows-horizontally t)

  (cond
    ((string-equal system-type "darwin")
      (progn (setq TeX-view-program-selection '((output-pdf "Skim")))))
    ((string-equal system-type "gnu/linux")
      (progn (setq TeX-view-program-selection '((output-pdf "Okular"))))))

  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-view-program-list
    '(("Okular" "okular --unique %o#src:%n`pwd`/./%b")
       ("Skim" "displayline -b -g %n %o %b")
       ("Zathura"
         ("zathura %o"
           (mode-io-correlate
             " --synctex-forward %n:0:%b -x \"emacsclient +%{line} %{input}\"")))))


  ;; (autoload 'helm-bibtex "helm-bibtex" "" t)
  ;; setup pdf tool
  ;; (use-package pdf-tools
  ;;   :pin manual ;; manually update
  ;;   :config
  ;;   ;; initialise
  ;;   (pdf-tools-install)
  ;;   ;; open pdfs scaled to fit width
  ;;   (setq-default pdf-view-display-size 'fit-width)
  ;;   ;; use normal isearch
  ;;   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  ;;   :custom
  ;;   (pdf-annot-activate-created-annotations t "automatically annotate highlights"))

  ;; (setq helm-bibtex-bibliography '("/Users/mag/Documents/_org/bib/graph_learning.bib"))
  (setq bibtex-completion-bibliography '("/Users/mag/Documents/_org/bib/graph_learning.bib"))

  ;; open pdf with system pdf viewer (works on mac)
  (setq bibtex-completion-pdf-open-function
    (lambda (fpath)
      (start-process "open" "*open*" "open" fpath)))
  ;; alternative
  ;; (setq bibtex-completion-pdf-open-function 'org-open-file)


  ;; (add-hook 'text-mode-hook
  ;; (lambda () (variable-pitch-mode 1)))

  ;;   (defconst zotxt-url-base "http://localhost:23119/zotxt")
  (eval-after-load 'org
    ;; (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
    ;; (setq org-startup-indented t) ; Enable `org-indent-mode' by default
    '(progn
       (custom-theme-set-faces
         'user
         '(variable-pitch ((t (:family "ETBembo" :height 180 :weight light))))
         ;; '(fixed-pitch ((t ( :family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal))))
         '(fixed-pitch ((t ( :family "Hack Nerd Font" :slant normal :weight normal :height 1.0 :width normal)))))

       (require 'org-bullets)
       (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
       (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
       ;; Activate org-zotxt-mode in org-mode buffers
       (add-hook 'org-mode-hook
         'variable-pitch-mode
         'visual-line-mode)
         ;; lambda () (org-zotxt-mode 1))
       (require 'ox)
       (setq header-line-format " ")
       (lambda () (progn
                    (setq left-margin-width 2)
                    (setq right-margin-width 2)
                    (set-window-buffer nil (current-buffer))))
       (setq org-ref-default-bibliography "~/Documents/_org/bib/graph_learning.bib"
         bibtex-completion-pdf-field "file"
         org-ref-bibliography-notes "~/Documents/_org/paper_notes.org"
         org-ref-get-pdf-filename-function 'org-ref-get-zotero-pdf-filename)

       ;; (setq org-latex-pdf-process
       ;;   '("pdflatex -interaction nonstopmode -output-directory %o %f"
       ;;      "bibtex %b"
       ;;      "pdflatex -interaction nonstopmode -output-directory %o %f"
       ;;      "pdflatex -interaction nonstopmode -output-directory %o %f"))
       ))

  (eval-after-load 'writeroom
    '(progn
       (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
       (add-to-list 'default-frame-alist '(ns-appearance . dark)) ;; assuming you are using a dark theme
       (setq ns-use-proxy-icon nil)
       (setq frame-title-format nil)))

    ;; ;; Bind something to replace the awkward C-u C-c " i
    ;; (define-key org-mode-map
    ;;   (kbd "C-c \" \"") (lambda () (interactive)
    ;;                       (org-zotxt-insert-reference-link '(4))))
    ;; ;; Change citation format to be less cumbersome in files.
    ;; ;; You'll need to install mkbehr-short into your style manager first.
    ;; (eval-after-load "zotxt"
    ;;   '(setq zotxt-default-bibliography-style "mkbehr-short"))




  ;;   ;; Bind something to replace the awkward C-u C-c " i
  ;;   (use-package org
  ;;     :bind (:map org-mode-map
  ;;             ("C-c \" \"" . (lambda () (interactive) (org-zotxt-insert-reference-link '(4)))))

  ;;     :config (progn
  ;;               (org-add-link-type "mycite"
  ;;                 (defun follow-cite (name)
  ;;                   "Open bibliography and jump to appropriate entry.
  ;;         The document must contain \bibliography{filename} somewhere
  ;;         for this to work"
  ;;                   (find-file-other-window
  ;;                     (save-excursion
  ;;                       (beginning-of-buffer)
  ;;                       (save-match-data
  ;;                         (re-search-forward "\\\\bibliography{\\([^}]+\\)}")
  ;;                         (concat (match-string 1) ".bib"))))
  ;;                   (beginning-of-buffer)
  ;;                   (search-forward name))
  ;;                 (defun export-cite (path desc format)
  ;;                   "Export [[cite:cohen93]] as \cite{cohen93} in LaTeX."
  ;;                   (if (eq format 'latex)
  ;;                     (if (or (not desc) (equal 0 (search "cite:" desc)))
  ;;                       (format "\\cite{%s}" path)
  ;;                       (format "\\cite[%s]{%s}" desc path)))))

  ;;               (defun org-ref-get-zotero-pdf-filename (key)
  ;;                 "Return the pdf filename indicated by zotero file field.
  ;; Argument KEY is the bibtex key."
  ;;                 (let* ((results (org-ref-get-bibtex-key-and-file key))
  ;;                         (bibfile (cdr results))
  ;;                         entry)
  ;;                   (with-temp-buffer
  ;;                     (insert-file-contents bibfile)
  ;;                     (bibtex-set-dialect (parsebib-find-bibtex-dialect) t)
  ;;                     (bibtex-search-entry key nil 0)
  ;;                     (setq entry (bibtex-parse-entry))
  ;;                     (let ((e (org-ref-reftex-get-bib-field "file" entry)))
  ;;                       (if (> (length e) 4)
  ;;                         (let ((clean-field (replace-regexp-in-string "/+" "/" e)))
  ;;                           (let ((first-file (car (split-string clean-field ";" t))))
  ;;                             (concat org-ref-pdf-directory first-file)))
  ;;                         (message "PDF filename not found.")
  ;;                         )))))

  ;;               ;; Override this function.
  ;;               (defun org-ref-open-bibtex-pdf ()
  ;;                 "Open pdf for a bibtex entry, if it exists.
  ;; assumes point is in the entry of interest in the bibfile.  but does not check that."
  ;;                 (interactive)
  ;;                 (save-excursion
  ;;                   (bibtex-beginning-of-entry)
  ;;                   (let* ((bibtex-expand-strings t)
  ;;                           (entry (bibtex-parse-entry t))
  ;;                           (key (reftex-get-bib-field "=key=" entry))
  ;;                           (pdf (org-ref-get-zotero-pdf-filename key)))
  ;;                     (message "%s" pdf)
  ;;                     (if (file-exists-p pdf)
  ;;                       (org-open-link-from-string (format "[[file:%s]]" pdf))
  ;;                       (ding)))))
  ;;               ))

  ;; time mode

  (display-time-mode)

  ;; browser eww
  ;; (setq helm-dash-browser-func 'eww)

  ;; ;; elpy
  ;; (elpy-enable)

  ;; processing
  (setq processing-location "/usr/local/bin/processing-java")
  (setq processing-application-dir "/Applications/Processing.app")
  (setq processing-sketchbook-dir "~/Documents/Processing")

  ;; (find-file "~/todo.org")

  ;; https://raw.githubusercontent.com/emacksnotes/emacsnotes.wordpress.com/master/my-xwidget-menu.el


  (custom-set-faces
    '(company-tooltip-common
       ((t (:inherit company-tooltip :weight bold :underline nil))))
    '(company-tooltip-common-selection
       ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))


  (require 'xwidget)
  (when
    (featurep 'xwidget-internal)
    (easy-menu-define my-xwidget-tools-menu nil "Menu for Xwidget Webkit."
      `("Xwidget Webkit" :visible
         (featurep 'xwidget-internal)
         ["Browse Url ..." xwidget-webkit-browse-url :help "Ask xwidget-webkit to browse URL"]
         ["End Edit Textarea" xwidget-webkit-end-edit-textarea :help "End editing of a webkit text area"]))
    (easy-menu-add-item menu-bar-tools-menu nil my-xwidget-tools-menu 'separator-net)
    (easy-menu-define my-xwidget-menu xwidget-webkit-mode-map "Menu for Xwidget Webkit."
      '("Xwidget Webkit"
         ["Browse Url" xwidget-webkit-browse-url :help "Ask xwidget-webkit to browse URL"]
         ["Reload" xwidget-webkit-reload :help "Reload current url"]
         ["Back" xwidget-webkit-back :help "Go back in history"]
         "--"
         ["Insert String" xwidget-webkit-insert-string :help "current webkit widget"]
         ["End Edit Textarea" xwidget-webkit-end-edit-textarea :help "End editing of a webkit text area"]
         "--"
         ["Scroll Forward" xwidget-webkit-scroll-forward :help "Scroll webkit forwards"]
         ["Scroll Backward" xwidget-webkit-scroll-backward :help "Scroll webkit backwards"]
         "--"
         ["Scroll Up" xwidget-webkit-scroll-up :help "Scroll webkit up"]
         ["Scroll Down" xwidget-webkit-scroll-down :help "Scroll webkit down"]
         "--"
         ["Scroll Top" xwidget-webkit-scroll-top :help "Scroll webkit to the very top"]
         ["Scroll Bottom" xwidget-webkit-scroll-bottom :help "Scroll webkit to the very bottom"]
         "--"
         ["Zoom In" xwidget-webkit-zoom-in :help "Increase webkit view zoom factor"]
         ["Zoom Out" xwidget-webkit-zoom-out :help "Decrease webkit view zoom factor"]
         "--"
         ["Fit Width" xwidget-webkit-fit-width :help "Adjust width of webkit to window width"]
         ["Adjust Size" xwidget-webkit-adjust-size :help "Manually set webkit size to width W, height H"]
         ["Adjust Size Dispatch" xwidget-webkit-adjust-size-dispatch :help "Adjust size according to mode"]
         ["Adjust Size To Content" xwidget-webkit-adjust-size-to-content :help "Adjust webkit to content size"]
         "--"
         ["Copy Selection As Kill" xwidget-webkit-copy-selection-as-kill :help "Get the webkit selection and put it on the kill-ring"]
         ["Current Url" xwidget-webkit-current-url :help "Get the webkit url and place it on the kill-ring"]
         "--"
         ["Show Element" xwidget-webkit-show-element :help "Make webkit xwidget XW show a named element ELEMENT-SELECTOR"]
         ["Show Id Element" xwidget-webkit-show-id-element :help "Make webkit xwidget XW show an id-element ELEMENT-ID"]
         ["Show Id Or Named Element" xwidget-webkit-show-id-or-named-element :help "Make webkit xwidget XW show a name or element id ELEMENT-ID"]
         ["Show Named Element" xwidget-webkit-show-named-element :help "Make webkit xwidget XW show a named element ELEMENT-NAME"]
         "--"
         ["Cleanup" xwidget-cleanup :help "Delete zombie xwidgets"]
         ["Event Handler" xwidget-event-handler :help "Receive xwidget event"]
         "--"
         ["Xwidget Webkit Mode" xwidget-webkit-mode :style toggle :selected xwidget-webkit-mode :help "Xwidget webkit view mode"])))

  (load-file "/Users/mag/.emacs.d/plugins/emacs-webkit-katex-render/webkit-katex-render.el")
  (require 'webkit-katex-render
    :commands (webkit-katex-render-mode)
    ;; :init
    ;; ;; if you use doom-emacs
    ;; (setq webkit-katex-render--background-color (doom-color 'bg))
    ;; ;; if you want to set a different path to the html client
    ;; (setq webkit-katex-render--client-path "PATH/TO/CLIENT.html")
    ;; ;; if you want to add your customized ~math-at-point~ function
    ;; (setq webkit-katex-render--math-at-point-function 'function)
    ;; :config
    ;; (setq we
    ;; bkit-katex-render--background-color (doom-color 'bg))
    )

  (require 'auctex-latexmk)
  (auctex-latexmk-setup)

  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(safe-local-variable-values '((org-confirm-babel-evaluate))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
)
