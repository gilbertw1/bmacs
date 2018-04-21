;;; doom-nord-custom-theme.el --- inspired by Nord
(require 'doom-themes)

;;
(defgroup doom-nord-custom-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-nord-custom-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-nord-custom-theme
  :type 'boolean)

(defcustom doom-nord-custom-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-nord-custom-theme
  :type 'boolean)

(defcustom doom-nord-custom-comment-bg doom-nord-custom-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-nord-custom-theme
  :type 'boolean)

(defcustom doom-nord-custom-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-nord-custom-theme
  :type '(or integer boolean))

(defcustom doom-nord-custom-region-highlight t
  "Determines the selection highlight style. Can be 'frost, 'snowstorm or t
(default)."
  :group 'doom-nord-custom-theme
  :type 'symbol)

;;
(def-doom-theme doom-nord-custom
  "A dark theme inspired by Nord."

  ;; name        default   256       16
  ((bg         '("#2E3440" nil       nil            ))
   (bg-alt     '("#3B4252" nil       nil            ))
   (base0      '("#191C25" "black"   "black"        ))
   (base1      '("#242832" "#1e1e1e" "brightblack"  ))
   (base2      '("#2C333F" "#2e2e2e" "brightblack"  ))
   (base3      '("#373E4C" "#262626" "brightblack"  ))
   (base4      '("#434C5E" "#3f3f3f" "brightblack"  ))
   (base5      '("#4C566A" "#525252" "brightblack"  ))
   (base6      '("#9099AB" "#6b6b6b" "brightblack"  ))
   (base7      '("#D8DEE9" "#979797" "brightblack"  ))
   (base8      '("#F0F4FC" "#dfdfdf" "white"        ))

   (fg         '("#D8DEE9" "#2d2d2d" "white"        ))
   (fg-alt     '("#E5E9F0" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        '("#BF616A" "#ff6655" "red"          ))
   (orange     '("#D08770" "#dd8844" "brightred"    ))
   (green      '("#A3BE8C" "#99bb66" "green"        ))
   (teal       '("#8FBCBB" "#44b9b1" "brightgreen"  ))
   (yellow     '("#EBCB8B" "#ECBE7B" "yellow"       ))
   (blue       '("#81A1C1" "#51afef" "brightblue"   ))
   (dark-blue  '("#5E81AC" "#2257A0" "blue"         ))
   (magenta    '("#B48EAD" "#c678dd" "magenta"      ))
   (violet     '("#C995C0" "#c678dd" "violet"      ))
   (cyan       '("#88C0D0" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#80B5C4" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      dark-blue)
   (vertical-bar   (doom-darken base1 0.2))
   (selection      dark-blue)
   (builtin        teal)
   (comments       (if doom-nord-custom-brighter-comments dark-cyan (doom-lighten base5 0.2)))
   (doc-comments   (doom-lighten (if doom-nord-custom-brighter-comments dark-cyan base5) 0.25))
   (constants      cyan)
   (functions      teal)
   (keywords       dark-blue)
   (methods        teal)
   (operators      dark-blue)
   (type           blue)
   (strings        green)
   (variables      teal)
   (numbers        magenta)
   (region         (pcase doom-nord-custom-region-highlight
                     (`frost teal)
                     (`snowstorm base7)
                     (_ base4)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-nord-custom-brighter-modeline)
   (-modeline-pad
    (when doom-nord-custom-padded-modeline
      (if (integerp doom-nord-custom-padded-modeline) doom-nord-padded-modeline 4)))

   (region-fg
    (when (memq doom-nord-custom-region-highlight '(frost snowstorm))
      bg-alt))

   (modeline-fg     nil)
   (modeline-fg-alt base6)

   (modeline-bg
    (if -modeline-bright
        (doom-blend bg base5 0.2)
      `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-blend bg base5 0.2)
      `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  (((region &override) :foreground region-fg)

   ((line-number &override) :foreground (doom-lighten 'base5 0.2))
   ((line-number-current-line &override) :foreground base7)
   ((paren-face-match &override) :foreground red :background base3 :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base3 :background red :weight 'ultra-bold)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override)  :foreground teal)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-nord-custom-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (doom-modeline-project-root-dir :foreground base6)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; ediff
   (ediff-fine-diff-A    :background (doom-darken magenta 0.4) :weight 'bold)
   (ediff-current-diff-A :background (doom-darken base0 0.25))

   ;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground dark-blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()


  )

;;; doom-nord-custom-theme.el ends here
