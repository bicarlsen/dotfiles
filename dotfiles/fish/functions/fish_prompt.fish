function fish_prompt
set_color 5e8adb

# set user character
set -l user_char '>'
if fish_is_root_user
set -l user_char '#'
end

# set path 
#set -l p (basename (dirname (pwd)))
set -l p (pwd)

# output prompt
echo \n$p'/' $user_char\n(set_color normal)
end
