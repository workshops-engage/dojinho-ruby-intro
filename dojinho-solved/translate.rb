class Translator
  include GoogleTranslate 
end

translator = Translator.new("pt","en")
puts translator.translate("Se essa foto ficar boa, cara, vou conseguir emprego no Jornal.") 

