# encoding: UTF-8


FILE = File.open('cidade_de_deus.srt').read
#raise File.inspect


def blocks
  blocks = FILE.split(/\r\n\r\n/)
  
  lista = Array.new
  blocks.each do |block|
    partials = block.split /\r\n/
    id = {index: partials.shift.chomp.to_i, period: partials.shift.chomp.split(" --> "), text: partials.join(" ")}
    
    lista << id
  end
  lista
end

def find_block_by_time time
  blocks.detect do |e|
    e[:period][0] <= time and e[:period][1] >= time
  end
end

def find_block_by_index index
  blocks.detect do |e|
    e[:index] == index
  end
end

def filter_profanity text
  list = {"caralho" => "caramba", "porra" => "poxa", "puta" => "mãe", "vagabunda" => "meretriz"}
  list.each do |key, value|
    text.gsub! key, value
  end
  text
end