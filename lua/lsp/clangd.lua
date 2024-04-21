return {
  clangd = {
    cmd = 'clangd -std=c++20 -stdlib=libstdc++ -I/usr/include/gismo/',
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' }, -- , 'proto'

    -- root_dir = root_pattern(
    --   '.clangd',
    --   '.clang-tidy',
    --   '.clang-format',
    --   'compile_commands.json',
    --   'compile_flags.txt',
    --   'configure.ac',
    --   '.git'
    -- ),
    single_file_support = true,
  },
}
