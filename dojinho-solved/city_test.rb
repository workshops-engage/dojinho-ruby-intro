# encoding: UTF-8
require "test/unit"
require File.expand_path('../reader',  __FILE__)

class CityTest < Test::Unit::TestCase

  def test_blocks
    assert_equal({index: 1, period: ["00:00:46,480", "00:00:48,198"], text: "CIDADE DE DEUS"}, blocks.first)
    assert_equal({index: 1493, period: ["02:00:00,600", "02:00:03,433"], text: "Ele promete prender as duas quadrilhas da Cidade de Deus."}, blocks.last)
  end

  def test_find_block_by_time
    assert_equal({index: 479, period: ["00:38:34,440", "00:38:37,591"], text: "Dadinho é o caralho. Meu nome agora é Zé Pequeno, porra."}, find_block_by_time("00:38:34,440"))
    assert_equal({:index=>1221, :period=>["01:36:07,360", "01:36:09,715"], :text=>"Só sei ler as figuras."} , find_block_by_time("01:36:07,360"))
  end

  def test_find_block_by_index
    assert_equal({index: 479, period: ["00:38:34,440", "00:38:37,591"], text: "Dadinho é o caralho. Meu nome agora é Zé Pequeno, porra."}, find_block_by_index(479))
    assert_equal({:index=>1221, :period=>["01:36:07,360", "01:36:09,715"], :text=>"Só sei ler as figuras."} , find_block_by_index(1221))
  end

  def test_filter_profanity
    assert_equal "Dadinho é o caramba. Meu nome agora é Zé Pequeno, poxa.", filter_profanity("Dadinho é o caralho. Meu nome agora é Zé Pequeno, porra.")
    assert_equal "Volta aqui, filho da mãe.", filter_profanity("Volta aqui, filho da puta.")
    assert_equal "É meretriz, cara.", filter_profanity("É vagabunda, cara.")
  end

end