#!/usr/bin/ruby
require 'mp3info'

def all_files(directory)
  Dir.glob File.join(directory, '**', '*')
end

def music_info(file_addr, *infos)
  Mp3Info.open file_addr do |file|
    file.tag.title = infos[0] if infos[0]
    file.tag.artist = infos[1] if infos[1]
    file.tag.album = infos[2] if infos[2]
    file.tag.tracknum = infos[3] if infos[3]
  end
end

def filenames_to_tag(file_list)
  file_list.each do |file|
    music_info file, File.basename(file, '.*')
  end
end

def bulk_music_info(file_list, music_infos)
  unless file_list.size == music_infos.lines.count
    raise 'Number of files and info lines are not equal!'
  end
  file_list.each_with_index do |file, i|
    infos = music_infos.lines[i].split('-').each(&:strip!)
    music_info file, *infos
  end
end

def main
  file_list = all_files 'musics'
  music_infos = File.read 'music_infos.txt'
  # bulk_music_info file_list, music_infos
  # filenames_to_tag file_list 
end

main if __FILE__ == $PROGRAM_NAME
