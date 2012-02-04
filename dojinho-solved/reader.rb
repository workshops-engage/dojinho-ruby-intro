# encoding: UTF-8

def blocks
  blocks = []
  lines = File.read("cidade_de_deus.srt").lines
  while true
    begin
      index = lines.next.strip.to_i
      period = lines.next.strip.split(' --> ')
      text = []
      text << line while line = lines.next.strip and ! line.empty?
      blocks << {index: index, period: period, text: text.join(" ")}
    rescue StopIteration => e
      break
    end
  end
  blocks
end

def find_block_by_time time
  blocks.detect{|block| time.between? *block[:period] }
end

def find_block_by_index index
  blocks.detect{|block| index == block[:index] }
end

PROFANITY_MAP = {
  /filho da puta/ => "filho da mãe",
  /caralho/ => "caramba",
  /porra/ => "poxa",
  /vagabunda/ => "meretriz"
}

def filter_profanity txt
  PROFANITY_MAP.each{|pattern, replacement| txt.gsub! pattern, replacement }
  txt
end