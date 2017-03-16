#!/usr/bin/ruby
require 'mp3info'

def all_files(directory)
  Dir.glob File.join(directory, '**/*')
end

def music_info(file_addr, *infos)
  Mp3Info.open file_addr do |file|
    file.tag.title = infos[0] if infos[0]
    file.tag.artist = infos[1] if infos[1]
    file.tag.album = infos[2] if infos[2]
    file.tag.tracknum = infos[3] if infos[3]
  end
end

def main
  file_list = all_files '/home/sci/Workspace'
end

main if __FILE__ == $PROGRAM_NAME
