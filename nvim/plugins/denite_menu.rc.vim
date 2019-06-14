let s:menus = {}

let s:menus.dein = { 'description': '⚔️  Plugin management' }
let s:menus.dein.command_candidates = [
  \   ['🐬 Dein: Plugins update       🔸', 'call dein#update()'],
  \   ['🐬 Dein: Plugins List         🔸', 'Denite dein'],
  \   ['🐬 Dein: RecacheRuntimePath   🔸', 'call dein#recache_runtimepath()'],
  \   ['🐬 Dein: Update log           🔸', 'echo dein#get_updates_log()'],
  \   ['🐬 Dein: Log                  🔸', 'echo dein#get_log()'],
  \ ]

let s:menus.project = { 'description': '🛠  Project & Structure' }
let s:menus.project.command_candidates = [
  \   ['🐳 File Explorer        🔸<SPACE>ftf',        'Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>'],
  \   ['🐳 Outline              🔸<SPACE>tcc',   'TagbarToggle'],
  \   ['🐳 Git Status           🔸<SPACE>gs',  'Denite gitstatus'],
  \   ['🐳 Undo Tree           🔸<SPACE>udt',  'UndotreeToggle'],
  \ ]

let s:menus.files = { 'description': '📁 File tools' }
let s:menus.files.command_candidates = [
  \   ['📂 Denite: Find in files…    🔹 ',  'Denite grep:.'],
  \   ['📂 Denite: Find files        🔹 ',  'Denite file/rec'],
  \   ['📂 Denite: Buffers           🔹 ',  'Denite buffer'],
  \   ['📂 Denite: MRU               🔹 ',  'Denite file/old'],
  \   ['📂 Denite: Line              🔹 ',  'Denite line'],
  \ ]

let s:menus.tools = { 'description': '⚙️  Dev Tools' }
let s:menus.tools.command_candidates = [
  \   ['🐠 Git grep           🔹', 'Gina grep'],
  \   ['🐠 Git log            🔹', 'Denite gitlog:all'],
  \   ['🐠 Goyo               🔹', 'Goyo'],
  \   ['🐠 Tagbar             🔹', 'TagbarToggle'],
  \   ['🐠 File explorer      🔹', 'Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>'],
  \ ]

let s:menus.todoapp = { 'description': '🗓  Todo List' }
let s:menus.todoapp.command_candidates = [
  \   ['📝 TodoAdd            🔸', 'TodoAdd '],
  \   ['📝 TodoList           🔸', 'Denite todo'],
  \   ['📝 TodoDone           🔸', 'Denite todo:done'],
  \ ]

let s:menus.config = { 'description': '🔧 Zsh Tmux Configuration' }
let s:menus.config.file_candidates = [
  \   ['🐠 Zsh Configurationfile            🔸', '~/.zshrc'],
  \   ['🐠 Tmux Configurationfile           🔸', '~/.tmux.conf'],
  \ ]

let s:menus.gitcommand = {'description': '💎 Gina commands'}
let s:menus.gitcommand.command_candidates = [
  \   ['🐠 Git status           🔹', 'Gina status'],
  \   ['🐠 Git commit           🔹', 'Gina commit'],
  \   ['🐠 Git blame            🔹', 'Gina blame'],
  \   ['🐠 Git grep             🔹', 'Gina grep'],
  \   ['🐠 Git branch           🔹', 'Gina branch'],
  \   ['🐠 Git show             🔹', 'Gina show'],
  \   ['🐠 Git changes          🔹', 'Gina changes'],
  \   ['🐠 Git compare          🔹', 'Gina compare'],
  \   ['🐠 Git diff             🔹', 'Gina diff'],
  \   ['🐠 Git stash            🔹', 'Gina stash'],
  \   ['🐠 Git tag              🔹', 'Gina tag'],
  \ ]

call denite#custom#var('menu', 'menus', s:menus)
