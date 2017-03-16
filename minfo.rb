#!/usr/bin/ruby
require 'mp3info'

def all_files(directory)
  Dir.glob File.join(directory, '**/*')
end

def music_info(file_addr, infos)
  Mp3Info.open file_addr do |file|
    file.tag.title = infos[0] if infos[0]
    file.tag.artist = infos[1] if infos[1]
    file.tag.album = infos[2] if infos[2]
    file.tag.tracknum = infos[3] if infos[3]
  end
end

def bulk_music_info(file_list, music_infos)
  if file_list.size == music_infos.lines.count
    file_list.each_with_index do |file, i|
      infos = music_infos.lines[i].split('-').each(&:chomp)
      music_info file, infos
    end
  else
    raise 'Number of files and infos is not equal!'
  end
end

def main
  file_list = all_files '.'
  music_infos = File.read 'music_infos.txt'
  bulk_music_info file_list, music_infos
end

main if __FILE__ == $PROGRAM_NAME
